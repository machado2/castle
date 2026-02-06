#!/usr/bin/env python3
"""Z80 recursive-descent disassembler for MSX ROMs."""

import sys
from collections import defaultdict

BASE = 0x4000
ROM_SIZE = 0x8000

BIOS = {
    0x0006:'RDSLT',0x000C:'WRSLT',0x0014:'CALSLT',0x001C:'ENASLT',
    0x0024:'RDVRM',0x002B:'RDVRM2',0x0030:'CHRGTR',0x0038:'SYNCHR',
    0x0041:'OUTDO',0x0044:'LDIRVM',0x0047:'WRTVRM',0x004A:'LDIRMV',
    0x004D:'CHGMOD',0x0050:'CHGCLR',0x0053:'NMI',0x0056:'CLRSPR',
    0x0059:'INITXT',0x005C:'INIT32',0x005F:'INIGRP',0x0062:'INIMLT',
    0x0069:'SETTXT',0x006C:'SETT32',0x006F:'SETGRP',0x0072:'SETMLT',
    0x0075:'CALPAT',0x0078:'CALATR',0x007B:'GSPSIZ',0x007E:'GRPPRT',
    0x0090:'GICINI',0x0093:'WRTPSG',0x0096:'RDPSG',0x0099:'STRTMS',
    0x009C:'CHSNS',0x009F:'CHGET',0x00A2:'CHPUT',0x00A5:'LPTOUT',
    0x00CC:'BEEP',0x00CF:'CLS',0x00D2:'POSIT',0x00D5:'FNKSB',
    0x00D8:'ERAFNK',0x00DB:'DSPFNK',0x00DE:'TOTEXT',
    0x00E1:'GTSTCK',0x00E4:'GTTRIG',0x00E7:'GTPAD',0x00EA:'GTPDL',
}

SYSVARS = {
    0xF3B0:'FORCLR',0xF3B1:'BAKCLR',0xF3B2:'BDRCLR',0xF3DC:'JIFFY',
    0xF3E9:'EXPTBL',0xFBB0:'STATFL',0xFBB1:'TRGFLG',
    0xFC48:'OLDKEY',0xFC9A:'NEWKEY',
}

R8 = ['B','C','D','E','H','L','(HL)','A']
R16 = ['BC','DE','HL','SP']
R16AF = ['BC','DE','HL','AF']
CC = ['NZ','Z','NC','C','PO','PE','P','M']
ALU = ['ADD A,','ADC A,','SUB ','SBC A,','AND ','XOR ','OR ','CP ']
ROT = ['RLC','RRC','RL','RR','SLA','SRA','SLL','SRL']

def s8(b):
    return b - 256 if b > 127 else b

def hex8(v):
    return f'${v:02X}'

def hex16(v):
    return f'${v:04X}'

def addr_name(v):
    if v in BIOS:
        return BIOS[v]
    if v in SYSVARS:
        return SYSVARS[v]
    return None

class Disassembler:
    def __init__(self, data, base):
        self.data = data
        self.base = base
        self.size = len(data)
        self.code = {}  # addr -> (mnemonic, length, is_end, targets)
        self.labels = {}
        self.visited = set()
        self.queue = []

    def rb(self, addr):
        off = addr - self.base
        if 0 <= off < self.size:
            return self.data[off]
        return None

    def rw(self, addr):
        lo = self.rb(addr)
        hi = self.rb(addr+1)
        if lo is None or hi is None:
            return None
        return lo | (hi << 8)

    def in_rom(self, addr):
        return self.base <= addr < self.base + self.size

    def add_label(self, addr, prefix='L'):
        if addr not in self.labels:
            n = addr_name(addr)
            if n:
                self.labels[addr] = n
            else:
                self.labels[addr] = f'{prefix}{addr:04X}'

    def enqueue(self, addr):
        if addr not in self.visited and self.in_rom(addr):
            self.queue.append(addr)

    def decode_cb(self, pc):
        op = self.rb(pc+1)
        if op is None:
            return None
        r = op & 7
        bit = (op >> 3) & 7
        grp = op >> 6
        if grp == 0:
            return (f'{ROT[bit]} {R8[r]}', 2, False, [])
        elif grp == 1:
            return (f'BIT {bit},{R8[r]}', 2, False, [])
        elif grp == 2:
            return (f'RES {bit},{R8[r]}', 2, False, [])
        else:
            return (f'SET {bit},{R8[r]}', 2, False, [])

    def decode_ix_cb(self, pc, reg):
        d = s8(self.rb(pc+2))
        op = self.rb(pc+3)
        if op is None:
            return None
        ds = f'+{d}' if d >= 0 else str(d)
        mem = f'({reg}{ds})'
        r = op & 7
        bit = (op >> 3) & 7
        grp = op >> 6
        if grp == 0:
            mn = f'{ROT[bit]} {mem}'
            if r != 6:
                mn += f',{R8[r]}'
        elif grp == 1:
            mn = f'BIT {bit},{mem}'
        elif grp == 2:
            mn = f'RES {bit},{mem}'
            if r != 6:
                mn += f',{R8[r]}'
        else:
            mn = f'SET {bit},{mem}'
            if r != 6:
                mn += f',{R8[r]}'
        return (mn, 4, False, [])

    def decode_ed(self, pc):
        op = self.rb(pc+1)
        if op is None:
            return None
        ed_map = {
            0x44:('NEG',2,False),0x4C:('NEG',2,False),0x54:('NEG',2,False),0x5C:('NEG',2,False),
            0x64:('NEG',2,False),0x6C:('NEG',2,False),0x74:('NEG',2,False),0x7C:('NEG',2,False),
            0x45:('RETN',2,True),0x55:('RETN',2,True),0x65:('RETN',2,True),0x75:('RETN',2,True),
            0x4D:('RETI',2,True),0x5D:('RETI',2,True),0x6D:('RETI',2,True),0x7D:('RETI',2,True),
            0x46:('IM 0',2,False),0x56:('IM 1',2,False),0x5E:('IM 2',2,False),
            0x47:('LD I,A',2,False),0x4F:('LD R,A',2,False),
            0x57:('LD A,I',2,False),0x5F:('LD A,R',2,False),
            0x67:('RRD',2,False),0x6F:('RLD',2,False),
            0xA0:('LDI',2,False),0xB0:('LDIR',2,False),
            0xA8:('LDD',2,False),0xB8:('LDDR',2,False),
            0xA1:('CPI',2,False),0xB1:('CPIR',2,False),
            0xA9:('CPD',2,False),0xB9:('CPDR',2,False),
            0xA2:('INI',2,False),0xB2:('INIR',2,False),
            0xAA:('IND',2,False),0xBA:('INDR',2,False),
            0xA3:('OUTI',2,False),0xB3:('OTIR',2,False),
            0xAB:('OUTD',2,False),0xBB:('OTDR',2,False),
        }
        if op in ed_map:
            mn, sz, end = ed_map[op]
            return (mn, sz, end, [])
        p = (op >> 4) & 3
        q = op & 0x0F
        if q == 0x0B:
            nn = self.rw(pc+2)
            return (f'LD {R16[p]},({hex16(nn)})', 4, False, [])
        if q == 0x03:
            nn = self.rw(pc+2)
            return (f'LD ({hex16(nn)}),{R16[p]}', 4, False, [])
        if q == 0x0A:
            return (f'ADC HL,{R16[p]}', 2, False, [])
        if q == 0x02:
            return (f'SBC HL,{R16[p]}', 2, False, [])
        if q == 0x00 and 0x40 <= op <= 0x78:
            r = (op >> 3) & 7
            rn = R8[r] if r != 6 else '(C)'
            return (f'IN {rn},(C)', 2, False, [])
        if q == 0x01 and 0x41 <= op <= 0x79:
            r = (op >> 3) & 7
            rn = R8[r] if r != 6 else '0'
            return (f'OUT (C),{rn}', 2, False, [])
        return (f'DB ${0xED:02X},${op:02X}', 2, False, [])

    def decode_ix(self, pc, prefix, reg):
        op = self.rb(pc+1)
        if op is None:
            return None
        if op == 0xCB:
            return self.decode_ix_cb(pc, reg)
        hl_r8 = ['B','C','D','E',f'{reg}H',f'{reg}L',None,'A']
        if op == 0x21:
            nn = self.rw(pc+2)
            return (f'LD {reg},{hex16(nn)}', 4, False, [])
        if op == 0x22:
            nn = self.rw(pc+2)
            return (f'LD ({hex16(nn)}),{reg}', 4, False, [])
        if op == 0x2A:
            nn = self.rw(pc+2)
            return (f'LD {reg},({hex16(nn)})', 4, False, [])
        if op == 0x23:
            return (f'INC {reg}', 2, False, [])
        if op == 0x2B:
            return (f'DEC {reg}', 2, False, [])
        if op == 0x09:
            return (f'ADD {reg},BC', 2, False, [])
        if op == 0x19:
            return (f'ADD {reg},DE', 2, False, [])
        if op == 0x29:
            return (f'ADD {reg},{reg}', 2, False, [])
        if op == 0x39:
            return (f'ADD {reg},SP', 2, False, [])
        if op == 0xE1:
            return (f'POP {reg}', 2, False, [])
        if op == 0xE5:
            return (f'PUSH {reg}', 2, False, [])
        if op == 0xE3:
            return (f'EX (SP),{reg}', 2, False, [])
        if op == 0xE9:
            return (f'JP ({reg})', 2, True, [])
        if op == 0xF9:
            return (f'LD SP,{reg}', 2, False, [])
        if op == 0x36:
            d = s8(self.rb(pc+2))
            n = self.rb(pc+3)
            ds = f'+{d}' if d >= 0 else str(d)
            return (f'LD ({reg}{ds}),{hex8(n)}', 4, False, [])
        if op == 0x34:
            d = s8(self.rb(pc+2))
            ds = f'+{d}' if d >= 0 else str(d)
            return (f'INC ({reg}{ds})', 3, False, [])
        if op == 0x35:
            d = s8(self.rb(pc+2))
            ds = f'+{d}' if d >= 0 else str(d)
            return (f'DEC ({reg}{ds})', 3, False, [])
        if op == 0x46 or op == 0x4E or op == 0x56 or op == 0x5E or op == 0x66 or op == 0x6E or op == 0x7E:
            d = s8(self.rb(pc+2))
            ds = f'+{d}' if d >= 0 else str(d)
            r = (op >> 3) & 7
            return (f'LD {R8[r]},({reg}{ds})', 3, False, [])
        if op in (0x70,0x71,0x72,0x73,0x74,0x75,0x77):
            d = s8(self.rb(pc+2))
            ds = f'+{d}' if d >= 0 else str(d)
            r = op & 7
            return (f'LD ({reg}{ds}),{R8[r]}', 3, False, [])
        if 0x80 <= op <= 0xBF and (op & 7) == 6:
            d = s8(self.rb(pc+2))
            ds = f'+{d}' if d >= 0 else str(d)
            alu_idx = (op >> 3) & 7
            return (f'{ALU[alu_idx]}({reg}{ds})', 3, False, [])
        if op == 0xBE:
            d = s8(self.rb(pc+2))
            ds = f'+{d}' if d >= 0 else str(d)
            return (f'CP ({reg}{ds})', 3, False, [])
        # IXH/IXL operations
        for base_op in range(0x40, 0x80):
            if base_op == op:
                dst = (op >> 3) & 7
                src = op & 7
                if dst == 6 or src == 6:
                    break
                if dst in (4,5) or src in (4,5):
                    dn = hl_r8[dst] if hl_r8[dst] else R8[dst]
                    sn = hl_r8[src] if hl_r8[src] else R8[src]
                    return (f'LD {dn},{sn}', 2, False, [])
        if op in (0x24,0x25,0x2C,0x2D):
            r = (op >> 3) & 7 if op < 0x2C else (op & 7)
            is_inc = (op & 1) == 0
            rn = hl_r8[4] if op < 0x2C else hl_r8[5]
            return (f'{"INC" if is_inc else "DEC"} {rn}', 2, False, [])
        if op == 0x26:
            n = self.rb(pc+2)
            return (f'LD {reg}H,{hex8(n)}', 3, False, [])
        if op == 0x2E:
            n = self.rb(pc+2)
            return (f'LD {reg}L,{hex8(n)}', 3, False, [])
        return (f'DB ${prefix:02X},${op:02X}', 2, False, [])

    def decode(self, pc):
        op = self.rb(pc)
        if op is None:
            return None

        # Main decode
        if op == 0x00: return ('NOP', 1, False, [])
        if op == 0x76: return ('HALT', 1, True, [])
        if op == 0xF3: return ('DI', 1, False, [])
        if op == 0xFB: return ('EI', 1, False, [])
        if op == 0x37: return ('SCF', 1, False, [])
        if op == 0x3F: return ('CCF', 1, False, [])
        if op == 0x2F: return ('CPL', 1, False, [])
        if op == 0x27: return ('DAA', 1, False, [])
        if op == 0x07: return ('RLCA', 1, False, [])
        if op == 0x0F: return ('RRCA', 1, False, [])
        if op == 0x17: return ('RLA', 1, False, [])
        if op == 0x1F: return ('RRA', 1, False, [])
        if op == 0x08: return ('EX AF,AF\'', 1, False, [])
        if op == 0xD9: return ('EXX', 1, False, [])
        if op == 0xEB: return ('EX DE,HL', 1, False, [])
        if op == 0xE3: return ('EX (SP),HL', 1, False, [])
        if op == 0x10:
            d = s8(self.rb(pc+1))
            t = pc + 2 + d
            self.add_label(t)
            return (f'DJNZ {self.labels.get(t, hex16(t))}', 2, False, [t, pc+2])
        if op == 0x18:
            d = s8(self.rb(pc+1))
            t = pc + 2 + d
            self.add_label(t)
            return (f'JR {self.labels.get(t, hex16(t))}', 2, True, [t])
        if op in (0x20, 0x28, 0x30, 0x38):
            cc_idx = (op >> 3) & 3
            cc = ['NZ','Z','NC','C'][cc_idx]
            d = s8(self.rb(pc+1))
            t = pc + 2 + d
            self.add_label(t)
            return (f'JR {cc},{self.labels.get(t, hex16(t))}', 2, False, [t, pc+2])

        # 16-bit load immediate
        if op & 0xCF == 0x01:
            p = (op >> 4) & 3
            nn = self.rw(pc+1)
            return (f'LD {R16[p]},{hex16(nn)}', 3, False, [])
        # 16-bit INC/DEC
        if op & 0xCF == 0x03:
            p = (op >> 4) & 3
            return (f'INC {R16[p]}', 1, False, [])
        if op & 0xCF == 0x0B:
            p = (op >> 4) & 3
            return (f'DEC {R16[p]}', 1, False, [])
        # ADD HL,rr
        if op & 0xCF == 0x09:
            p = (op >> 4) & 3
            return (f'ADD HL,{R16[p]}', 1, False, [])
        # 8-bit INC
        if op & 0xC7 == 0x04:
            r = (op >> 3) & 7
            return (f'INC {R8[r]}', 1, False, [])
        # 8-bit DEC
        if op & 0xC7 == 0x05:
            r = (op >> 3) & 7
            return (f'DEC {R8[r]}', 1, False, [])
        # LD r,n
        if op & 0xC7 == 0x06:
            r = (op >> 3) & 7
            n = self.rb(pc+1)
            return (f'LD {R8[r]},{hex8(n)}', 2, False, [])
        # LD r,r'
        if 0x40 <= op <= 0x7F and op != 0x76:
            dst = (op >> 3) & 7
            src = op & 7
            return (f'LD {R8[dst]},{R8[src]}', 1, False, [])
        # ALU A,r
        if 0x80 <= op <= 0xBF:
            alu_idx = (op >> 3) & 7
            src = op & 7
            return (f'{ALU[alu_idx]}{R8[src]}', 1, False, [])
        # ALU A,n
        if op & 0xC7 == 0xC6:
            alu_idx = (op >> 3) & 7
            n = self.rb(pc+1)
            return (f'{ALU[alu_idx]}{hex8(n)}', 2, False, [])
        # PUSH/POP
        if op & 0xCF == 0xC5:
            p = (op >> 4) & 3
            return (f'PUSH {R16AF[p]}', 1, False, [])
        if op & 0xCF == 0xC1:
            p = (op >> 4) & 3
            return (f'POP {R16AF[p]}', 1, False, [])
        # RET
        if op == 0xC9:
            return ('RET', 1, True, [])
        # RET cc
        if op & 0xC7 == 0xC0:
            cc_idx = (op >> 3) & 7
            return (f'RET {CC[cc_idx]}', 1, False, [])
        # JP nn
        if op == 0xC3:
            nn = self.rw(pc+1)
            self.add_label(nn)
            return (f'JP {self.labels.get(nn, hex16(nn))}', 3, True, [nn])
        # JP cc,nn
        if op & 0xC7 == 0xC2:
            cc_idx = (op >> 3) & 7
            nn = self.rw(pc+1)
            self.add_label(nn)
            return (f'JP {CC[cc_idx]},{self.labels.get(nn, hex16(nn))}', 3, False, [nn, pc+3])
        # CALL nn
        if op == 0xCD:
            nn = self.rw(pc+1)
            self.add_label(nn)
            return (f'CALL {self.labels.get(nn, hex16(nn))}', 3, False, [nn, pc+3])
        # CALL cc,nn
        if op & 0xC7 == 0xC4:
            cc_idx = (op >> 3) & 7
            nn = self.rw(pc+1)
            self.add_label(nn)
            return (f'CALL {CC[cc_idx]},{self.labels.get(nn, hex16(nn))}', 3, False, [nn, pc+3])
        # RST
        if op & 0xC7 == 0xC7:
            t = op & 0x38
            return (f'RST {hex8(t)}', 1, False, [pc+1])
        # JP (HL)
        if op == 0xE9:
            return ('JP (HL)', 1, True, [])
        # LD SP,HL
        if op == 0xF9:
            return ('LD SP,HL', 1, False, [])
        # LD (nn),A / LD A,(nn)
        if op == 0x32:
            nn = self.rw(pc+1)
            return (f'LD ({hex16(nn)}),A', 3, False, [])
        if op == 0x3A:
            nn = self.rw(pc+1)
            return (f'LD A,({hex16(nn)})', 3, False, [])
        # LD (nn),HL / LD HL,(nn)
        if op == 0x22:
            nn = self.rw(pc+1)
            return (f'LD ({hex16(nn)}),HL', 3, False, [])
        if op == 0x2A:
            nn = self.rw(pc+1)
            return (f'LD HL,({hex16(nn)})', 3, False, [])
        # LD (BC/DE),A and LD A,(BC/DE)
        if op == 0x02: return ('LD (BC),A', 1, False, [])
        if op == 0x12: return ('LD (DE),A', 1, False, [])
        if op == 0x0A: return ('LD A,(BC)', 1, False, [])
        if op == 0x1A: return ('LD A,(DE)', 1, False, [])
        # OUT (n),A / IN A,(n)
        if op == 0xD3:
            n = self.rb(pc+1)
            return (f'OUT ({hex8(n)}),A', 2, False, [])
        if op == 0xDB:
            n = self.rb(pc+1)
            return (f'IN A,({hex8(n)})', 2, False, [])

        # Prefixes
        if op == 0xCB:
            return self.decode_cb(pc)
        if op == 0xDD:
            return self.decode_ix(pc, 0xDD, 'IX')
        if op == 0xFD:
            return self.decode_ix(pc, 0xFD, 'IY')
        if op == 0xED:
            return self.decode_ed(pc)

        return (f'DB {hex8(op)}', 1, False, [])

    def disassemble(self, entry):
        self.add_label(entry, 'ENTRY_')
        self.enqueue(entry)

        while self.queue:
            pc = self.queue.pop(0)
            if pc in self.visited:
                continue
            if not self.in_rom(pc):
                continue
            self.visited.add(pc)

            result = self.decode(pc)
            if result is None:
                continue

            mn, sz, is_end, targets = result
            self.code[pc] = (mn, sz)

            # Mark all bytes of this instruction
            for i in range(1, sz):
                self.visited.add(pc + i)

            if not is_end:
                # If instruction doesn't end flow, continue to next
                if pc + sz not in targets:
                    targets.append(pc + sz)

            for t in targets:
                if self.in_rom(t):
                    self.enqueue(t)
                    if t != pc + sz:
                        self.add_label(t)

    def output(self, f):
        f.write('; Castle Excellent (The Castle II)\n')
        f.write('; (C) 1985 Isao Yoshida / 1986 Keisuke Iwakura\n')
        f.write('; Published by ASCII Corporation\n')
        f.write('; MSX1 ROM - 32KB\n')
        f.write('; Disassembled by z80disasm.py\n')
        f.write(';\n\n')

        # Re-resolve labels in mnemonics (since labels may have been added after decode)
        resolved = {}
        for pc, (mn, sz) in self.code.items():
            # Re-decode to get fresh label references
            result = self.decode(pc)
            if result:
                resolved[pc] = (result[0], result[1])
            else:
                resolved[pc] = (mn, sz)

        f.write(f'        ORG {hex16(BASE)}\n\n')

        addr = BASE
        end = BASE + self.size
        while addr < end:
            # Label
            if addr in self.labels:
                f.write(f'\n{self.labels[addr]}:\n')

            if addr in resolved:
                mn, sz = resolved[addr]
                f.write(f'        {mn:40s} ; {hex16(addr)}\n')
                addr += sz
            else:
                # Data byte
                b = self.rb(addr)
                if b is not None:
                    # Try to group data bytes
                    data_bytes = []
                    da = addr
                    while da < end and da not in resolved and da not in self.labels or da == addr:
                        if da != addr and da in self.labels:
                            break
                        bb = self.rb(da)
                        if bb is None:
                            break
                        data_bytes.append(bb)
                        da += 1
                        if len(data_bytes) >= 16:
                            break
                    db_str = ','.join(f'${b:02X}' for b in data_bytes)
                    # Check if printable ASCII
                    asc = ''.join(chr(b) if 0x20 <= b < 0x7F else '.' for b in data_bytes)
                    f.write(f'        DB {db_str:40s} ; {hex16(addr)} | {asc}\n')
                    addr += len(data_bytes)
                else:
                    addr += 1


def main():
    rom_path = sys.argv[1] if len(sys.argv) > 1 else '/home/fabio/src/c2/rom.MX1'
    with open(rom_path, 'rb') as f:
        data = f.read()

    print(f'ROM size: {len(data)} bytes', file=sys.stderr)

    # Parse MSX header
    if data[0:2] == b'AB':
        init = data[2] | (data[3] << 8)
        print(f'MSX ROM detected, init addr: ${init:04X}', file=sys.stderr)
    else:
        init = BASE
        print(f'No MSX header, using base ${init:04X}', file=sys.stderr)

    dis = Disassembler(data, BASE)
    dis.disassemble(init)

    # Also try to find additional entry points from jump tables
    # Scan for addresses that look like they point into code
    for off in range(0, len(data)-1, 2):
        addr = data[off] | (data[off+1] << 8)
        if BASE <= addr < BASE + len(data):
            if addr not in dis.visited:
                # Could be a data pointer, try to disassemble
                pass

    print(f'Disassembled {len(dis.code)} instructions', file=sys.stderr)
    print(f'Labels: {len(dis.labels)}', file=sys.stderr)

    out_path = '/home/fabio/src/c2/castle_excellent.asm'
    with open(out_path, 'w') as f:
        dis.output(f)
    print(f'Output written to {out_path}', file=sys.stderr)


if __name__ == '__main__':
    main()
