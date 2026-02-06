; Castle Excellent (The Castle II)
; (C) 1985 Isao Yoshida / 1986 Keisuke Iwakura
; Published by ASCII Corporation
; MSX1 ROM - 32KB
; Disassembled by z80disasm.py
;

        ORG $4000

        DB $41,$42,$10,$40,$00,$00,$00,$00,$00,$00,$00,$39,$00,$39,$00,$39 ; $4000 | AB.@.......9.9.9

ENTRY_4010:
        LD SP,$F000                              ; $4010
        CALL L4CA2                               ; $4013

L4016:
        CALL L6383                               ; $4016
        CALL L4D52                               ; $4019

L401C:
        CALL L4A4A                               ; $401C
        CALL L4D52                               ; $401F
        JR C,L4016                               ; $4022
        CALL L4029                               ; $4024
        JR L401C                                 ; $4027

L4029:
        XOR A                                    ; $4029
        LD ($EAF1),A                             ; $402A
        LD ($EAF2),A                             ; $402D
        LD ($EAF5),A                             ; $4030
        LD ($EAF4),A                             ; $4033

L4036:
        CALL L64DD                               ; $4036
        CALL L404B                               ; $4039
        LD A,($EAE3)                             ; $403C
        OR A                                     ; $403F
        RET NZ                                   ; $4040
        LD A,($E324)                             ; $4041
        OR A                                     ; $4044
        JR NZ,L4036                              ; $4045
        CALL L4F16                               ; $4047
        RET                                      ; $404A

L404B:
        XOR A                                    ; $404B
        LD ($EAC9),A                             ; $404C
        LD ($EAD6),A                             ; $404F
        LD ($EAE0),A                             ; $4052
        LD ($EAE1),A                             ; $4055
        LD ($EAE2),A                             ; $4058
        LD ($EAE3),A                             ; $405B
        LD ($EAE8),A                             ; $405E
        CALL L6358                               ; $4061

L4064:
        CALL L5D5D                               ; $4064
        JR NZ,L4070                              ; $4067
        XOR A                                    ; $4069
        LD ($EACB),A                             ; $406A
        LD ($EACC),A                             ; $406D

L4070:
        CALL L6383                               ; $4070
        LD A,$01                                 ; $4073
        LD ($EAE8),A                             ; $4075
        CALL L5128                               ; $4078
        XOR A                                    ; $407B
        LD ($EAE8),A                             ; $407C
        CALL L62D8                               ; $407F
        CALL L5B96                               ; $4082
        LD A,($EAE3)                             ; $4085
        OR A                                     ; $4088
        RET NZ                                   ; $4089
        CALL L442D                               ; $408A
        CALL L434A                               ; $408D
        CALL L40BB                               ; $4090
        CALL L6F5C                               ; $4093
        CALL L4406                               ; $4096
        CALL L438D                               ; $4099
        CALL L4499                               ; $409C
        CALL L5A2D                               ; $409F
        LD A,($EAE0)                             ; $40A2
        OR A                                     ; $40A5
        RET NZ                                   ; $40A6
        LD A,($EAE1)                             ; $40A7
        CALL L5053                               ; $40AA
        OR A                                     ; $40AD
        RET NZ                                   ; $40AE
        LD A,($EAC9)                             ; $40AF
        INC A                                    ; $40B2
        LD ($EAC9),A                             ; $40B3
        CALL L623C                               ; $40B6
        JR L4064                                 ; $40B9

L40BB:
        LD HL,$0000                              ; $40BB
        LD DE,$00FF                              ; $40BE
        LD A,($E334)                             ; $40C1
        LD B,A                                   ; $40C4
        LD A,($E335)                             ; $40C5
        LD C,A                                   ; $40C8
        INC C                                    ; $40C9
        INC C                                    ; $40CA
        CALL L4515                               ; $40CB
        OR A                                     ; $40CE
        LD A,($EAD6)                             ; $40CF
        JR Z,L40DB                               ; $40D2
        CP $11                                   ; $40D4
        JR C,L40E0                               ; $40D6
        XOR A                                    ; $40D8
        JR L40E0                                 ; $40D9

L40DB:
        OR A                                     ; $40DB
        JR NZ,L40E0                              ; $40DC
        LD A,$11                                 ; $40DE

L40E0:
        LD ($EAD6),A                             ; $40E0
        LD A,($EACB)                             ; $40E3
        CP $02                                   ; $40E6
        JR C,L40F4                               ; $40E8
        CP $05                                   ; $40EA
        JR NC,L40F4                              ; $40EC
        LD D,$01                                 ; $40EE
        LD L,$03                                 ; $40F0
        JR L40FC                                 ; $40F2

L40F4:
        CP $06                                   ; $40F4
        JR C,L40FC                               ; $40F6
        LD D,$FF                                 ; $40F8
        LD L,$01                                 ; $40FA

L40FC:
        LD A,($EACC)                             ; $40FC
        OR A                                     ; $40FF
        LD A,($EAD6)                             ; $4100
        JR NZ,L410F                              ; $4103
        OR A                                     ; $4105
        JR Z,L4121                               ; $4106
        LD A,$11                                 ; $4108
        LD ($EAD6),A                             ; $410A
        JR L4121                                 ; $410D

L410F:
        INC A                                    ; $410F
        LD ($EAD6),A                             ; $4110
        CP $11                                   ; $4113
        JR NC,L4121                              ; $4115
        CP $09                                   ; $4117
        JR NC,L411F                              ; $4119
        LD E,$01                                 ; $411B
        JR L4121                                 ; $411D

L411F:
        LD E,$00                                 ; $411F

L4121:
        OR A                                     ; $4121
        JR Z,L4127                               ; $4122
        LD A,D                                   ; $4124
        JR L412B                                 ; $4125

L4127:
        CALL L47F5                               ; $4127
        ADD A,D                                  ; $412A

L412B:
        CALL L41F6                               ; $412B
        LD A,E                                   ; $412E
        CP $01                                   ; $412F
        JR NZ,L4135                              ; $4131
        SET 2,H                                  ; $4133

L4135:
        CP $FF                                   ; $4135
        JR NZ,L413B                              ; $4137
        SET 3,H                                  ; $4139

L413B:
        CALL L4515                               ; $413B
        OR A                                     ; $413E
        JR Z,L4143                               ; $413F
        RES 3,H                                  ; $4141

L4143:
        BIT 3,H                                  ; $4143
        JR Z,L414B                               ; $4145
        XOR A                                    ; $4147
        CALL L41DF                               ; $4148

L414B:
        DEC C                                    ; $414B
        DEC C                                    ; $414C
        INC B                                    ; $414D
        INC B                                    ; $414E
        XOR A                                    ; $414F
        CALL L44EF                               ; $4150
        JR Z,L4157                               ; $4153
        RES 4,H                                  ; $4155

L4157:
        DEC B                                    ; $4157
        DEC B                                    ; $4158
        DEC B                                    ; $4159
        XOR A                                    ; $415A
        CALL L44EF                               ; $415B
        JR Z,L4162                               ; $415E
        RES 5,H                                  ; $4160

L4162:
        INC B                                    ; $4162
        BIT 3,H                                  ; $4163
        JR NZ,L41AA                              ; $4165
        CALL L4235                               ; $4167
        DEC C                                    ; $416A
        BIT 0,H                                  ; $416B
        JR NZ,L4189                              ; $416D
        CALL L4A05                               ; $416F
        JR Z,L4176                               ; $4172
        RES 2,H                                  ; $4174

L4176:
        DEC B                                    ; $4176
        BIT 1,H                                  ; $4177
        JR Z,L4188                               ; $4179
        BIT 2,H                                  ; $417B
        JR Z,L4188                               ; $417D
        CALL L4A05                               ; $417F
        JR Z,L4188                               ; $4182
        RES 2,H                                  ; $4184
        RES 1,H                                  ; $4186

L4188:
        INC B                                    ; $4188

L4189:
        BIT 1,H                                  ; $4189
        JR NZ,L41A9                              ; $418B
        INC B                                    ; $418D
        CALL L4A05                               ; $418E
        JR Z,L4195                               ; $4191
        RES 2,H                                  ; $4193

L4195:
        INC B                                    ; $4195
        BIT 0,H                                  ; $4196
        JR Z,L41A7                               ; $4198
        BIT 2,H                                  ; $419A
        JR Z,L41A7                               ; $419C
        CALL L4A05                               ; $419E
        JR Z,L41A7                               ; $41A1
        RES 2,H                                  ; $41A3
        RES 0,H                                  ; $41A5

L41A7:
        DEC B                                    ; $41A7
        DEC B                                    ; $41A8

L41A9:
        INC C                                    ; $41A9

L41AA:
        INC C                                    ; $41AA
        BIT 2,H                                  ; $41AB
        JR NZ,L41B2                              ; $41AD
        CALL L4235                               ; $41AF

L41B2:
        DEC C                                    ; $41B2
        LD A,($EAD6)                             ; $41B3
        OR A                                     ; $41B6
        JR Z,L41BD                               ; $41B7
        SET 2,L                                  ; $41B9
        JR L41DB                                 ; $41BB

L41BD:
        BIT 3,H                                  ; $41BD
        JR Z,L41C5                               ; $41BF
        SET 2,L                                  ; $41C1
        JR L41DB                                 ; $41C3

L41C5:
        BIT 0,H                                  ; $41C5
        JR Z,L41D0                               ; $41C7
        CALL L4248                               ; $41C9
        JR NZ,L41D0                              ; $41CC
        RES 0,H                                  ; $41CE

L41D0:
        BIT 1,H                                  ; $41D0
        JR Z,L41DB                               ; $41D2
        CALL L425A                               ; $41D4
        JR NZ,L41DB                              ; $41D7
        RES 1,H                                  ; $41D9

L41DB:
        CALL L4210                               ; $41DB
        RET                                      ; $41DE

L41DF:
        PUSH AF                                  ; $41DF
        DEC B                                    ; $41E0
        CALL L4A06                               ; $41E1
        JR Z,L41E8                               ; $41E4
        RES 1,H                                  ; $41E6

L41E8:
        POP AF                                   ; $41E8
        INC B                                    ; $41E9
        INC B                                    ; $41EA
        INC B                                    ; $41EB
        CALL L4A06                               ; $41EC
        JR Z,L41F3                               ; $41EF
        RES 0,H                                  ; $41F1

L41F3:
        DEC B                                    ; $41F3
        DEC B                                    ; $41F4
        RET                                      ; $41F5

L41F6:
        CP $FE                                   ; $41F6
        JR NZ,L41FD                              ; $41F8
        SET 5,H                                  ; $41FA
        INC A                                    ; $41FC

L41FD:
        CP $FF                                   ; $41FD
        JR NZ,L4203                              ; $41FF
        SET 1,H                                  ; $4201

L4203:
        CP $02                                   ; $4203
        JR NZ,L420A                              ; $4205
        SET 4,H                                  ; $4207
        DEC A                                    ; $4209

L420A:
        CP $01                                   ; $420A
        RET NZ                                   ; $420C
        SET 0,H                                  ; $420D
        RET                                      ; $420F

L4210:
        LD A,H                                   ; $4210
        LD C,H                                   ; $4211
        LD H,$00                                 ; $4212
        AND $30                                  ; $4214
        JR Z,L421A                               ; $4216
        SET 4,H                                  ; $4218

L421A:
        LD A,C                                   ; $421A
        AND $0C                                  ; $421B
        JR Z,L4227                               ; $421D
        SET 2,H                                  ; $421F
        AND $04                                  ; $4221
        JR Z,L4227                               ; $4223
        SET 3,H                                  ; $4225

L4227:
        LD A,C                                   ; $4227
        AND $03                                  ; $4228
        JR Z,L4234                               ; $422A
        SET 0,H                                  ; $422C
        AND $01                                  ; $422E
        JR Z,L4234                               ; $4230
        SET 1,H                                  ; $4232

L4234:
        RET                                      ; $4234

L4235:
        LD A,($EAD6)                             ; $4235
        OR A                                     ; $4238
        JR Z,L423E                               ; $4239

L423B:
        XOR A                                    ; $423B
        JR L4244                                 ; $423C

L423E:
        BIT 3,H                                  ; $423E
        JR NZ,L423B                              ; $4240
        LD A,$01                                 ; $4242

L4244:
        CALL L41DF                               ; $4244
        RET                                      ; $4247

L4248:
        PUSH HL                                  ; $4248
        LD HL,$426E                              ; $4249
        LD A,$03                                 ; $424C

L424E:
        CALL L4262                               ; $424E
        POP HL                                   ; $4251
        CALL L42FF                               ; $4252
        RET Z                                    ; $4255
        CALL L4273                               ; $4256
        RET                                      ; $4259

L425A:
        PUSH HL                                  ; $425A
        LD HL,$4271                              ; $425B
        LD A,$01                                 ; $425E
        JR L424E                                 ; $4260

L4262:
        LD ($EAFD),A                             ; $4262
        LD A,$C3                                 ; $4265
        LD ($EAFA),A                             ; $4267
        LD ($EAFB),HL                            ; $426A
        RET                                      ; $426D
        DB $04,$04,$C9,$05,$C9                      ; $426E | .....

L4273:
        PUSH HL                                  ; $4273
        PUSH DE                                  ; $4274
        PUSH BC                                  ; $4275
        CALL L5D5D                               ; $4276
        JR NZ,L42E7                              ; $4279
        CALL LEAFA                               ; $427B
        LD A,$02                                 ; $427E
        CALL L468A                               ; $4280
        PUSH HL                                  ; $4283
        POP IX                                   ; $4284
        LD D,A                                   ; $4286
        JR NZ,L428B                              ; $4287
        LD D,$FF                                 ; $4289

L428B:
        INC C                                    ; $428B
        LD A,$02                                 ; $428C
        CALL L468A                               ; $428E
        LD E,A                                   ; $4291
        JR NZ,L4296                              ; $4292
        LD E,$FF                                 ; $4294

L4296:
        LD A,E                                   ; $4296
        AND D                                    ; $4297
        CP $FF                                   ; $4298
        JR Z,L42E7                               ; $429A
        LD A,E                                   ; $429C
        OR D                                     ; $429D
        CP $FF                                   ; $429E
        JR Z,L42A6                               ; $42A0
        LD A,E                                   ; $42A2
        CP D                                     ; $42A3
        JR NZ,L42F2                              ; $42A4

L42A6:
        LD A,E                                   ; $42A6
        CP $FF                                   ; $42A7
        JR NZ,L42AF                              ; $42A9
        LD A,D                                   ; $42AB
        PUSH IX                                  ; $42AC
        POP HL                                   ; $42AE

L42AF:
        LD C,A                                   ; $42AF
        PUSH HL                                  ; $42B0
        POP IX                                   ; $42B1
        LD A,(IX+4)                              ; $42B3
        BIT 2,A                                  ; $42B6
        JR NZ,L42F2                              ; $42B8
        BIT 0,A                                  ; $42BA
        JR NZ,L42E7                              ; $42BC
        PUSH HL                                  ; $42BE
        PUSH BC                                  ; $42BF
        PUSH IX                                  ; $42C0
        CALL L431C                               ; $42C2
        CALL LEAFA                               ; $42C5
        CALL L49DC                               ; $42C8
        JR NZ,L42EE                              ; $42CB
        INC C                                    ; $42CD
        CALL L49DC                               ; $42CE
        JR NZ,L42EE                              ; $42D1
        CALL L42F5                               ; $42D3
        DEC C                                    ; $42D6
        CALL L42F5                               ; $42D7
        POP IX                                   ; $42DA
        POP BC                                   ; $42DC
        POP HL                                   ; $42DD
        LD A,($EAFD)                             ; $42DE
        LD (IX+4),A                              ; $42E1
        CALL L710B                               ; $42E4

L42E7:
        LD A,$01                                 ; $42E7
        OR A                                     ; $42E9

L42EA:
        POP BC                                   ; $42EA
        POP DE                                   ; $42EB
        POP HL                                   ; $42EC
        RET                                      ; $42ED

L42EE:
        POP IX                                   ; $42EE
        POP BC                                   ; $42F0
        POP HL                                   ; $42F1

L42F2:
        XOR A                                    ; $42F2
        JR L42EA                                 ; $42F3

L42F5:
        LD A,$04                                 ; $42F5
        CALL L468A                               ; $42F7
        RET Z                                    ; $42FA
        CALL L5D47                               ; $42FB
        RET                                      ; $42FE

L42FF:
        PUSH HL                                  ; $42FF
        PUSH DE                                  ; $4300
        PUSH BC                                  ; $4301
        CALL L5D5D                               ; $4302
        JR NZ,L4317                              ; $4305
        CALL LEAFA                               ; $4307
        CALL L4325                               ; $430A
        JR Z,L4317                               ; $430D
        CALL L758C                               ; $430F
        XOR A                                    ; $4312

L4313:
        POP BC                                   ; $4313
        POP DE                                   ; $4314
        POP HL                                   ; $4315
        RET                                      ; $4316

L4317:
        LD A,$01                                 ; $4317
        OR A                                     ; $4319
        JR L4313                                 ; $431A

L431C:
        PUSH HL                                  ; $431C
        INC HL                                   ; $431D
        LD A,(HL)                                ; $431E
        INC HL                                   ; $431F
        LD B,(HL)                                ; $4320
        INC HL                                   ; $4321
        LD C,(HL)                                ; $4322
        POP HL                                   ; $4323
        RET                                      ; $4324

L4325:
        CALL L49C7                               ; $4325
        AND $02                                  ; $4328
        JR Z,L4348                               ; $432A
        INC C                                    ; $432C
        CALL L49C7                               ; $432D
        AND $02                                  ; $4330
        JR Z,L4348                               ; $4332
        LD DE,$E6EE                              ; $4334
        ADD HL,DE                                ; $4337
        LD E,(HL)                                ; $4338
        LD D,$00                                 ; $4339
        LD HL,$0004                              ; $433B
        LD BC,$E346                              ; $433E
        CALL L5D24                               ; $4341
        LD A,$01                                 ; $4344
        OR A                                     ; $4346
        RET                                      ; $4347

L4348:
        XOR A                                    ; $4348
        RET                                      ; $4349

L434A:
        LD HL,$E386                              ; $434A
        LD DE,$0005                              ; $434D
        LD B,$10                                 ; $4350
        LD C,$00                                 ; $4352

L4354:
        LD A,(HL)                                ; $4354
        OR A                                     ; $4355
        JR Z,L4371                               ; $4356
        PUSH HL                                  ; $4358
        PUSH DE                                  ; $4359
        PUSH BC                                  ; $435A
        INC HL                                   ; $435B
        INC HL                                   ; $435C
        LD B,(HL)                                ; $435D
        INC HL                                   ; $435E
        LD C,(HL)                                ; $435F
        INC HL                                   ; $4360
        LD A,(HL)                                ; $4361
        CALL L4820                               ; $4362
        LD (HL),A                                ; $4365
        POP BC                                   ; $4366
        POP DE                                   ; $4367
        POP HL                                   ; $4368
        INC HL                                   ; $4369
        LD A,(HL)                                ; $436A
        DEC HL                                   ; $436B
        CP $34                                   ; $436C
        CALL NZ,L710B                            ; $436E

L4371:
        ADD HL,DE                                ; $4371
        INC C                                    ; $4372
        DJNZ L4354                               ; $4373
        LD HL,$E386                              ; $4375
        LD B,$10                                 ; $4378
        LD C,$00                                 ; $437A

L437C:
        LD A,(HL)                                ; $437C
        OR A                                     ; $437D
        JR Z,L4388                               ; $437E
        INC HL                                   ; $4380
        LD A,(HL)                                ; $4381
        DEC HL                                   ; $4382
        CP $34                                   ; $4383
        CALL Z,L710B                             ; $4385

L4388:
        ADD HL,DE                                ; $4388
        INC C                                    ; $4389
        DJNZ L437C                               ; $438A
        RET                                      ; $438C

L438D:
        LD HL,$E416                              ; $438D
        LD DE,$0005                              ; $4390
        LD B,$08                                 ; $4393

L4395:
        LD A,(HL)                                ; $4395
        OR A                                     ; $4396
        JR Z,L439C                               ; $4397
        CALL L43BF                               ; $4399

L439C:
        ADD HL,DE                                ; $439C
        DJNZ L4395                               ; $439D
        LD HL,$E416                              ; $439F
        LD B,$08                                 ; $43A2
        LD C,$00                                 ; $43A4

L43A6:
        LD A,(HL)                                ; $43A6
        OR A                                     ; $43A7
        JR Z,L43BA                               ; $43A8
        PUSH HL                                  ; $43AA
        POP IX                                   ; $43AB
        LD A,(IX+4)                              ; $43AD
        AND $05                                  ; $43B0
        JR Z,L43B7                               ; $43B2
        CALL L43BF                               ; $43B4

L43B7:
        CALL L719D                               ; $43B7

L43BA:
        ADD HL,DE                                ; $43BA
        INC C                                    ; $43BB
        DJNZ L43A6                               ; $43BC
        RET                                      ; $43BE

L43BF:
        CALL L5D5D                               ; $43BF
        RET NZ                                   ; $43C2
        PUSH HL                                  ; $43C3
        PUSH DE                                  ; $43C4
        PUSH BC                                  ; $43C5
        INC HL                                   ; $43C6
        LD A,(HL)                                ; $43C7
        INC HL                                   ; $43C8
        LD B,(HL)                                ; $43C9
        INC HL                                   ; $43CA
        LD C,(HL)                                ; $43CB
        INC HL                                   ; $43CC
        LD D,(HL)                                ; $43CD
        CP $36                                   ; $43CE
        JR NZ,L43D5                              ; $43D0
        LD A,D                                   ; $43D2
        JR L4401                                 ; $43D3

L43D5:
        CP $37                                   ; $43D5
        JR NZ,L43DF                              ; $43D7
        LD A,D                                   ; $43D9
        CALL L4901                               ; $43DA
        JR L4401                                 ; $43DD

L43DF:
        CP $38                                   ; $43DF
        JR NZ,L43E9                              ; $43E1
        LD A,D                                   ; $43E3
        CALL L48AD                               ; $43E4
        JR L4401                                 ; $43E7

L43E9:
        CP $39                                   ; $43E9
        JR NZ,L43F3                              ; $43EB
        LD A,D                                   ; $43ED
        CALL L4882                               ; $43EE
        JR L4401                                 ; $43F1

L43F3:
        CP $3A                                   ; $43F3
        JR NZ,L43FD                              ; $43F5
        LD A,D                                   ; $43F7
        CALL L487A                               ; $43F8
        JR L4401                                 ; $43FB

L43FD:
        LD A,D                                   ; $43FD
        CALL L4872                               ; $43FE

L4401:
        LD (HL),A                                ; $4401
        POP BC                                   ; $4402
        POP DE                                   ; $4403
        POP HL                                   ; $4404
        RET                                      ; $4405

L4406:
        CALL L4490                               ; $4406

L4409:
        PUSH HL                                  ; $4409
        PUSH DE                                  ; $440A
        PUSH BC                                  ; $440B
        LD A,(HL)                                ; $440C
        CP $1F                                   ; $440D
        JR NZ,L4418                              ; $440F
        CALL L4488                               ; $4411
        CALL L47B8                               ; $4414
        LD (HL),A                                ; $4417

L4418:
        POP BC                                   ; $4418
        POP DE                                   ; $4419
        POP HL                                   ; $441A
        ADD HL,DE                                ; $441B
        DJNZ L4409                               ; $441C
        CALL L4490                               ; $441E

L4421:
        LD A,(HL)                                ; $4421
        CP $1F                                   ; $4422
        JR NZ,L4429                              ; $4424
        CALL L7494                               ; $4426

L4429:
        ADD HL,DE                                ; $4429
        DJNZ L4421                               ; $442A
        RET                                      ; $442C

L442D:
        CALL L4490                               ; $442D

L4430:
        PUSH HL                                  ; $4430
        PUSH DE                                  ; $4431
        PUSH BC                                  ; $4432
        LD A,(HL)                                ; $4433
        CP $0C                                   ; $4434
        JR NZ,L443D                              ; $4436
        CALL L72CA                               ; $4438
        JR L4481                                 ; $443B

L443D:
        CP $0D                                   ; $443D
        JR NZ,L4446                              ; $443F
        CALL L72DD                               ; $4441
        JR L4481                                 ; $4444

L4446:
        CP $0F                                   ; $4446
        JR NZ,L444F                              ; $4448
        CALL L7326                               ; $444A
        JR L4481                                 ; $444D

L444F:
        CP $1C                                   ; $444F
        JR NZ,L4468                              ; $4451
        LD A,($EAC9)                             ; $4453
        AND $07                                  ; $4456
        JR NZ,L4481                              ; $4458
        PUSH HL                                  ; $445A
        CALL L4488                               ; $445B
        CALL L4601                               ; $445E
        LD (HL),A                                ; $4461
        POP HL                                   ; $4462
        CALL L73FB                               ; $4463
        JR L4481                                 ; $4466

L4468:
        CP $1D                                   ; $4468
        JR NZ,L4481                              ; $446A
        LD A,($EAC9)                             ; $446C
        AND $07                                  ; $446F
        JR NZ,L4481                              ; $4471
        PUSH HL                                  ; $4473
        CALL L4488                               ; $4474
        CALL L4609                               ; $4477
        LD (HL),A                                ; $447A
        POP HL                                   ; $447B
        CALL L743D                               ; $447C
        JR L4481                                 ; $447F

L4481:
        POP BC                                   ; $4481
        POP DE                                   ; $4482
        POP HL                                   ; $4483
        ADD HL,DE                                ; $4484
        DJNZ L4430                               ; $4485
        RET                                      ; $4487

L4488:
        INC HL                                   ; $4488
        LD B,(HL)                                ; $4489
        INC HL                                   ; $448A
        LD C,(HL)                                ; $448B
        INC HL                                   ; $448C
        INC HL                                   ; $448D
        LD A,(HL)                                ; $448E
        RET                                      ; $448F

L4490:
        LD HL,$E43E                              ; $4490
        LD DE,$0005                              ; $4493
        LD B,$10                                 ; $4496
        RET                                      ; $4498

L4499:
        LD HL,$E3D6                              ; $4499
        LD DE,$0004                              ; $449C
        LD B,$10                                 ; $449F

L44A1:
        PUSH HL                                  ; $44A1
        PUSH DE                                  ; $44A2
        PUSH BC                                  ; $44A3
        LD A,(HL)                                ; $44A4
        OR A                                     ; $44A5
        JR Z,L44BB                               ; $44A6
        INC HL                                   ; $44A8
        LD A,(HL)                                ; $44A9
        DEC HL                                   ; $44AA
        CP $21                                   ; $44AB
        JR NZ,L44B4                              ; $44AD
        CALL L74E9                               ; $44AF
        JR L44BB                                 ; $44B2

L44B4:
        CP $23                                   ; $44B4
        JR NZ,L44BB                              ; $44B6
        CALL L7510                               ; $44B8

L44BB:
        POP BC                                   ; $44BB
        POP DE                                   ; $44BC
        POP HL                                   ; $44BD
        ADD HL,DE                                ; $44BE
        DJNZ L44A1                               ; $44BF
        RET                                      ; $44C1

L44C2:
        PUSH BC                                  ; $44C2
        EX AF,AF'                                ; $44C3
        LD A,$1D                                 ; $44C4
        CP B                                     ; $44C6
        JR C,L44EA                               ; $44C7
        CALL L49D4                               ; $44C9
        JR NZ,L44EA                              ; $44CC
        INC C                                    ; $44CE
        CALL L49D4                               ; $44CF
        JR NZ,L44EA                              ; $44D2
        INC C                                    ; $44D4
        EX AF,AF'                                ; $44D5
        CP $02                                   ; $44D6
        JR Z,L44E7                               ; $44D8
        OR A                                     ; $44DA
        JR NZ,L44E2                              ; $44DB
        CALL L4A30                               ; $44DD
        JR L44E5                                 ; $44E0

L44E2:
        CALL L4A28                               ; $44E2

L44E5:
        JR Z,L44EA                               ; $44E5

L44E7:
        XOR A                                    ; $44E7
        POP BC                                   ; $44E8
        RET                                      ; $44E9

L44EA:
        LD A,$01                                 ; $44EA
        OR A                                     ; $44EC
        POP BC                                   ; $44ED
        RET                                      ; $44EE

L44EF:
        PUSH BC                                  ; $44EF
        PUSH AF                                  ; $44F0
        CALL L4A06                               ; $44F1
        JR Z,L44F9                               ; $44F4
        POP AF                                   ; $44F6
        JR L44EA                                 ; $44F7

L44F9:
        POP AF                                   ; $44F9
        INC C                                    ; $44FA
        CALL L4A06                               ; $44FB
        JR NZ,L44EA                              ; $44FE
        JR L44E7                                 ; $4500

L4502:
        PUSH BC                                  ; $4502
        LD A,$13                                 ; $4503
        CP C                                     ; $4505
        JR C,L44E7                               ; $4506
        CALL L4A28                               ; $4508
        JR NZ,L44EA                              ; $450B
        INC B                                    ; $450D
        CALL L4A28                               ; $450E
        JR NZ,L44EA                              ; $4511
        JR L44E7                                 ; $4513

L4515:
        PUSH BC                                  ; $4515
        LD A,C                                   ; $4516
        CP $FF                                   ; $4517
        JR Z,L44EA                               ; $4519
        LD A,$13                                 ; $451B
        CP C                                     ; $451D
        JR C,L44E7                               ; $451E
        CALL L49FD                               ; $4520
        JR NZ,L44EA                              ; $4523
        INC B                                    ; $4525
        CALL L49FD                               ; $4526
        JR NZ,L44EA                              ; $4529
        JR L44E7                                 ; $452B

L452D:
        PUSH BC                                  ; $452D
        LD A,$13                                 ; $452E
        CP C                                     ; $4530
        JR C,L44EA                               ; $4531
        CALL L4A30                               ; $4533
        JR NZ,L44EA                              ; $4536
        INC B                                    ; $4538
        CALL L4A30                               ; $4539
        JR NZ,L44EA                              ; $453C
        JP L44E7                                 ; $453E

L4541:
        PUSH HL                                  ; $4541
        PUSH DE                                  ; $4542
        PUSH BC                                  ; $4543
        LD A,$13                                 ; $4544
        CP C                                     ; $4546
        JR C,L4561                               ; $4547
        LD E,$02                                 ; $4549

L454B:
        CALL L49C7                               ; $454B
        LD D,A                                   ; $454E
        AND $08                                  ; $454F
        JR NZ,L4558                              ; $4551
        LD A,D                                   ; $4553
        AND $30                                  ; $4554
        JR NZ,L4561                              ; $4556

L4558:
        INC B                                    ; $4558
        DEC E                                    ; $4559
        JR NZ,L454B                              ; $455A
        XOR A                                    ; $455C

L455D:
        POP BC                                   ; $455D
        POP DE                                   ; $455E
        POP HL                                   ; $455F
        RET                                      ; $4560

L4561:
        LD A,$FF                                 ; $4561
        OR A                                     ; $4563
        JR L455D                                 ; $4564

L4566:
        PUSH BC                                  ; $4566
        EX AF,AF'                                ; $4567
        LD A,$13                                 ; $4568
        CP C                                     ; $456A
        JR NC,L4573                              ; $456B
        EX AF,AF'                                ; $456D
        OR A                                     ; $456E
        JR Z,L4581                               ; $456F
        JR L457E                                 ; $4571

L4573:
        CALL L49D4                               ; $4573
        JR NZ,L4581                              ; $4576
        INC B                                    ; $4578
        CALL L49D4                               ; $4579
        JR NZ,L4581                              ; $457C

L457E:
        XOR A                                    ; $457E
        POP BC                                   ; $457F
        RET                                      ; $4580

L4581:
        LD A,$01                                 ; $4581
        OR A                                     ; $4583
        POP BC                                   ; $4584
        RET                                      ; $4585

L4586:
        PUSH HL                                  ; $4586
        LD L,A                                   ; $4587
        INC C                                    ; $4588
        INC C                                    ; $4589
        CALL L4566                               ; $458A
        LD D,A                                   ; $458D
        DEC C                                    ; $458E
        DEC C                                    ; $458F
        DEC C                                    ; $4590
        LD A,L                                   ; $4591
        CALL L4566                               ; $4592
        LD E,A                                   ; $4595
        INC C                                    ; $4596
        POP HL                                   ; $4597
        RET                                      ; $4598

L4599:
        PUSH HL                                  ; $4599
        LD L,A                                   ; $459A
        PUSH BC                                  ; $459B
        INC B                                    ; $459C
        INC B                                    ; $459D
        LD A,L                                   ; $459E
        CALL L44C2                               ; $459F
        LD D,A                                   ; $45A2
        POP BC                                   ; $45A3
        DEC B                                    ; $45A4
        LD A,L                                   ; $45A5
        CALL L44C2                               ; $45A6
        LD E,A                                   ; $45A9
        INC B                                    ; $45AA
        POP HL                                   ; $45AB
        RET                                      ; $45AC

L45AD:
        PUSH HL                                  ; $45AD
        PUSH DE                                  ; $45AE
        PUSH BC                                  ; $45AF
        LD H,A                                   ; $45B0
        LD A,D                                   ; $45B1
        CALL L4599                               ; $45B2
        LD A,D                                   ; $45B5
        OR A                                     ; $45B6
        JR NZ,L45C1                              ; $45B7
        LD A,E                                   ; $45B9
        OR A                                     ; $45BA
        JR Z,L45CB                               ; $45BB
        SET 1,H                                  ; $45BD
        JR L45CB                                 ; $45BF

L45C1:
        LD A,E                                   ; $45C1
        OR A                                     ; $45C2
        JR NZ,L45C9                              ; $45C3
        RES 1,H                                  ; $45C5
        JR L45CB                                 ; $45C7

L45C9:
        RES 0,H                                  ; $45C9

L45CB:
        LD A,H                                   ; $45CB
        POP BC                                   ; $45CC
        POP DE                                   ; $45CD
        POP HL                                   ; $45CE
        RET                                      ; $45CF

L45D0:
        LD A,($E334)                             ; $45D0
        CP B                                     ; $45D3
        RET Z                                    ; $45D4
        PUSH DE                                  ; $45D5
        LD D,A                                   ; $45D6
        LD A,B                                   ; $45D7
        ADD A,$08                                ; $45D8
        CP D                                     ; $45DA
        JR C,L45ED                               ; $45DB
        LD A,B                                   ; $45DD
        SUB $08                                  ; $45DE
        JR NC,L45E5                              ; $45E0
        CCF                                      ; $45E2
        JR L45ED                                 ; $45E3

L45E5:
        LD E,A                                   ; $45E5
        LD A,D                                   ; $45E6
        CP E                                     ; $45E7
        JR C,L45ED                               ; $45E8
        LD A,$01                                 ; $45EA
        OR A                                     ; $45EC

L45ED:
        POP DE                                   ; $45ED
        RET                                      ; $45EE

L45EF:
        PUSH DE                                  ; $45EF
        LD A,($E334)                             ; $45F0
        LD D,A                                   ; $45F3
        LD A,B                                   ; $45F4
        CP D                                     ; $45F5
        POP DE                                   ; $45F6
        RET                                      ; $45F7

L45F8:
        PUSH DE                                  ; $45F8
        LD A,($E335)                             ; $45F9
        LD D,A                                   ; $45FC
        LD A,C                                   ; $45FD
        CP D                                     ; $45FE
        POP DE                                   ; $45FF
        RET                                      ; $4600

L4601:
        PUSH DE                                  ; $4601
        LD D,$01                                 ; $4602
        CALL L4611                               ; $4604
        POP DE                                   ; $4607
        RET                                      ; $4608

L4609:
        PUSH DE                                  ; $4609
        LD D,$02                                 ; $460A
        CALL L4611                               ; $460C
        POP DE                                   ; $460F
        RET                                      ; $4610

L4611:
        PUSH HL                                  ; $4611
        PUSH DE                                  ; $4612
        PUSH BC                                  ; $4613
        BIT 3,A                                  ; $4614
        JR NZ,L4648                              ; $4616

L4618:
        PUSH DE                                  ; $4618
        PUSH BC                                  ; $4619
        LD H,A                                   ; $461A
        INC C                                    ; $461B

L461C:
        CALL L452D                               ; $461C
        OR A                                     ; $461F
        JR NZ,L4643                              ; $4620
        INC B                                    ; $4622
        INC B                                    ; $4623
        DEC D                                    ; $4624
        JR NZ,L461C                              ; $4625
        POP BC                                   ; $4627
        POP DE                                   ; $4628
        PUSH HL                                  ; $4629
        INC C                                    ; $462A
        LD A,D                                   ; $462B
        ADD A,A                                  ; $462C
        LD D,A                                   ; $462D

L462E:
        PUSH DE                                  ; $462E
        PUSH BC                                  ; $462F
        LD A,$06                                 ; $4630
        CALL L468A                               ; $4632
        JR Z,L463A                               ; $4635
        CALL L5D47                               ; $4637

L463A:
        POP BC                                   ; $463A
        POP DE                                   ; $463B
        INC B                                    ; $463C
        DEC D                                    ; $463D
        JR NZ,L462E                              ; $463E
        POP HL                                   ; $4640
        JR L4682                                 ; $4641

L4643:
        POP BC                                   ; $4643
        POP DE                                   ; $4644
        SET 3,H                                  ; $4645
        LD A,H                                   ; $4647

L4648:
        PUSH DE                                  ; $4648
        PUSH BC                                  ; $4649
        LD H,A                                   ; $464A
        DEC C                                    ; $464B

L464C:
        CALL L4541                               ; $464C
        OR A                                     ; $464F
        JR NZ,L467B                              ; $4650
        INC B                                    ; $4652
        INC B                                    ; $4653
        DEC D                                    ; $4654
        JR NZ,L464C                              ; $4655
        POP BC                                   ; $4657
        POP DE                                   ; $4658
        PUSH HL                                  ; $4659
        DEC C                                    ; $465A
        LD A,D                                   ; $465B
        ADD A,A                                  ; $465C
        LD D,A                                   ; $465D

L465E:
        PUSH DE                                  ; $465E

L465F:
        PUSH BC                                  ; $465F
        LD A,$07                                 ; $4660
        CALL L468A                               ; $4662
        POP BC                                   ; $4665
        JR Z,L4673                               ; $4666
        CALL L4701                               ; $4668
        LD DE,$E334                              ; $466B
        CALL L5D1E                               ; $466E
        JR Z,L465F                               ; $4671

L4673:
        POP DE                                   ; $4673
        INC B                                    ; $4674
        DEC D                                    ; $4675
        JR NZ,L465E                              ; $4676
        POP HL                                   ; $4678
        JR L4682                                 ; $4679

L467B:
        POP BC                                   ; $467B
        POP DE                                   ; $467C
        RES 3,H                                  ; $467D
        LD A,H                                   ; $467F
        JR L4618                                 ; $4680

L4682:
        LD A,H                                   ; $4682
        POP BC                                   ; $4683
        POP DE                                   ; $4684
        POP HL                                   ; $4685
        RET                                      ; $4686

L4687:
        POP AF                                   ; $4687
        XOR A                                    ; $4688
        RET                                      ; $4689

L468A:
        PUSH AF                                  ; $468A
        LD A,B                                   ; $468B
        CP $1E                                   ; $468C
        JR NC,L4687                              ; $468E
        LD A,C                                   ; $4690
        CP $14                                   ; $4691
        JR NC,L4687                              ; $4693
        POP AF                                   ; $4695
        PUSH DE                                  ; $4696
        PUSH BC                                  ; $4697
        PUSH AF                                  ; $4698
        BIT 0,A                                  ; $4699
        JR Z,L46BC                               ; $469B
        LD D,B                                   ; $469D
        LD E,C                                   ; $469E
        DEC E                                    ; $469F
        LD A,($E334)                             ; $46A0
        LD H,A                                   ; $46A3
        LD A,($E335)                             ; $46A4
        LD L,A                                   ; $46A7
        CALL L5D1E                               ; $46A8
        JR Z,L46B3                               ; $46AB
        DEC D                                    ; $46AD
        CALL L5D1E                               ; $46AE
        JR NZ,L46BC                              ; $46B1

L46B3:
        LD HL,$E334                              ; $46B3
        POP AF                                   ; $46B6
        LD A,$01                                 ; $46B7
        OR A                                     ; $46B9
        JR L46FE                                 ; $46BA

L46BC:
        POP AF                                   ; $46BC
        EX AF,AF'                                ; $46BD
        CALL L49C7                               ; $46BE
        AND $08                                  ; $46C1
        JR Z,L46FE                               ; $46C3
        LD DE,$E6EE                              ; $46C5
        ADD HL,DE                                ; $46C8
        LD A,(HL)                                ; $46C9
        SRL A                                    ; $46CA
        SRL A                                    ; $46CC
        SRL A                                    ; $46CE
        LD C,A                                   ; $46D0
        EX AF,AF'                                ; $46D1
        BIT 4,C                                  ; $46D2
        JR NZ,L46E6                              ; $46D4
        BIT 1,A                                  ; $46D6
        JR Z,L46FE                               ; $46D8
        PUSH BC                                  ; $46DA
        LD L,C                                   ; $46DB
        LD H,$00                                 ; $46DC
        LD DE,$0005                              ; $46DE
        LD BC,$E386                              ; $46E1
        JR L46F6                                 ; $46E4

L46E6:
        BIT 2,A                                  ; $46E6
        JR Z,L46FE                               ; $46E8
        RES 4,C                                  ; $46EA
        PUSH BC                                  ; $46EC
        LD L,C                                   ; $46ED
        LD H,$00                                 ; $46EE
        LD DE,$0005                              ; $46F0
        LD BC,$E416                              ; $46F3

L46F6:
        CALL L5D24                               ; $46F6
        LD A,$01                                 ; $46F9
        OR A                                     ; $46FB
        POP BC                                   ; $46FC
        LD A,C                                   ; $46FD

L46FE:
        POP BC                                   ; $46FE
        POP DE                                   ; $46FF
        RET                                      ; $4700

L4701:
        PUSH HL                                  ; $4701
        PUSH BC                                  ; $4702
        PUSH AF                                  ; $4703
        LD DE,$E334                              ; $4704
        CALL L5D1E                               ; $4707
        JR NZ,L471E                              ; $470A
        LD A,($E335)                             ; $470C
        DEC A                                    ; $470F
        LD ($E335),A                             ; $4710
        CALL L6F45                               ; $4713
        LD A,$FF                                 ; $4716
        CALL L6F27                               ; $4718
        POP AF                                   ; $471B
        JR L4741                                 ; $471C

L471E:
        PUSH HL                                  ; $471E
        POP IX                                   ; $471F
        LD B,(IX+2)                              ; $4721
        LD C,(IX+3)                              ; $4724
        DEC C                                    ; $4727
        CALL L4541                               ; $4728
        OR A                                     ; $472B
        JR Z,L4734                               ; $472C
        CALL L5D47                               ; $472E
        POP AF                                   ; $4731
        JR L4741                                 ; $4732

L4734:
        PUSH HL                                  ; $4734
        CALL L4744                               ; $4735
        INC B                                    ; $4738
        CALL L4744                               ; $4739
        POP HL                                   ; $473C
        POP AF                                   ; $473D
        CALL L7575                               ; $473E

L4741:
        POP BC                                   ; $4741
        POP HL                                   ; $4742
        RET                                      ; $4743

L4744:
        LD A,$07                                 ; $4744
        CALL L468A                               ; $4746
        RET Z                                    ; $4749
        CALL L4701                               ; $474A
        RET                                      ; $474D

L474E:
        PUSH HL                                  ; $474E
        PUSH BC                                  ; $474F
        PUSH IX                                  ; $4750
        LD H,A                                   ; $4752
        BIT 3,H                                  ; $4753
        JR Z,L477B                               ; $4755
        DEC C                                    ; $4757
        CALL L4515                               ; $4758
        OR A                                     ; $475B
        JR Z,L4762                               ; $475C
        RES 2,H                                  ; $475E
        JR L479B                                 ; $4760

L4762:
        INC C                                    ; $4762
        INC C                                    ; $4763
        INC C                                    ; $4764
        INC C                                    ; $4765
        CALL L4541                               ; $4766
        OR A                                     ; $4769
        JR Z,L4770                               ; $476A
        RES 2,H                                  ; $476C
        JR L479B                                 ; $476E

L4770:
        PUSH HL                                  ; $4770
        CALL L4744                               ; $4771
        INC B                                    ; $4774
        CALL L4744                               ; $4775
        POP HL                                   ; $4778
        JR L479B                                 ; $4779

L477B:
        INC C                                    ; $477B
        CALL L4541                               ; $477C
        OR A                                     ; $477F
        JR Z,L4786                               ; $4780
        RES 2,H                                  ; $4782
        JR L479B                                 ; $4784

L4786:
        CALL L47A1                               ; $4786
        INC B                                    ; $4789
        CALL L47A1                               ; $478A
        DEC B                                    ; $478D
        INC C                                    ; $478E
        INC C                                    ; $478F
        INC C                                    ; $4790
        INC C                                    ; $4791
        XOR A                                    ; $4792
        CALL L4566                               ; $4793
        OR A                                     ; $4796
        JR Z,L479B                               ; $4797
        RES 2,H                                  ; $4799

L479B:
        LD A,H                                   ; $479B
        POP IX                                   ; $479C
        POP BC                                   ; $479E
        POP HL                                   ; $479F
        RET                                      ; $47A0

L47A1:
        PUSH HL                                  ; $47A1
        LD A,$06                                 ; $47A2
        CALL L468A                               ; $47A4
        JR Z,L47B6                               ; $47A7
        INC HL                                   ; $47A9
        INC HL                                   ; $47AA
        INC HL                                   ; $47AB
        INC HL                                   ; $47AC
        LD A,(HL)                                ; $47AD
        BIT 2,A                                  ; $47AE
        JR NZ,L47B6                              ; $47B0
        POP HL                                   ; $47B2
        RES 2,H                                  ; $47B3
        RET                                      ; $47B5

L47B6:
        POP HL                                   ; $47B6
        RET                                      ; $47B7

L47B8:
        BIT 0,A                                  ; $47B8
        RET Z                                    ; $47BA
        PUSH HL                                  ; $47BB
        PUSH DE                                  ; $47BC
        PUSH BC                                  ; $47BD
        LD H,A                                   ; $47BE
        CALL L5D5D                               ; $47BF
        JR NZ,L47E5                              ; $47C2
        INC B                                    ; $47C4
        INC B                                    ; $47C5
        CALL L47EA                               ; $47C6
        JR NZ,L47D7                              ; $47C9
        DEC B                                    ; $47CB
        DEC B                                    ; $47CC
        DEC B                                    ; $47CD
        CALL L47EA                               ; $47CE
        JR Z,L47E5                               ; $47D1
        SET 1,H                                  ; $47D3
        JR L47E5                                 ; $47D5

L47D7:
        DEC B                                    ; $47D7
        DEC B                                    ; $47D8
        DEC B                                    ; $47D9
        CALL L47EA                               ; $47DA
        JR NZ,L47E3                              ; $47DD
        RES 1,H                                  ; $47DF
        JR L47E5                                 ; $47E1

L47E3:
        RES 0,H                                  ; $47E3

L47E5:
        LD A,H                                   ; $47E5
        POP BC                                   ; $47E6
        POP DE                                   ; $47E7
        POP HL                                   ; $47E8
        RET                                      ; $47E9

L47EA:
        LD A,$1D                                 ; $47EA
        CP B                                     ; $47EC
        JR NC,L47F1                              ; $47ED
        OR A                                     ; $47EF
        RET                                      ; $47F0

L47F1:
        CALL L49D4                               ; $47F1
        RET                                      ; $47F4

L47F5:
        PUSH HL                                  ; $47F5
        PUSH DE                                  ; $47F6
        PUSH BC                                  ; $47F7
        LD H,$00                                 ; $47F8
        LD A,$02                                 ; $47FA

L47FC:
        PUSH AF                                  ; $47FC
        CALL L4A38                               ; $47FD
        AND $03                                  ; $4800
        JR Z,L480C                               ; $4802
        AND $01                                  ; $4804
        JR Z,L480B                               ; $4806
        INC H                                    ; $4808
        JR L480C                                 ; $4809

L480B:
        DEC H                                    ; $480B

L480C:
        INC B                                    ; $480C
        POP AF                                   ; $480D
        DEC A                                    ; $480E
        JR NZ,L47FC                              ; $480F
        LD A,H                                   ; $4811
        CP $02                                   ; $4812
        JR NZ,L4817                              ; $4814
        DEC A                                    ; $4816

L4817:
        CP $FE                                   ; $4817
        JR NZ,L481C                              ; $4819
        INC A                                    ; $481B

L481C:
        POP BC                                   ; $481C
        POP DE                                   ; $481D
        POP HL                                   ; $481E
        RET                                      ; $481F

L4820:
        PUSH HL                                  ; $4820
        PUSH DE                                  ; $4821
        PUSH BC                                  ; $4822
        LD H,A                                   ; $4823
        CALL L5D5D                               ; $4824
        JR NZ,L486D                              ; $4827
        INC C                                    ; $4829
        INC C                                    ; $482A
        CALL L49DC                               ; $482B
        JR NZ,L4847                              ; $482E
        PUSH BC                                  ; $4830
        INC B                                    ; $4831
        CALL L49DC                               ; $4832
        POP BC                                   ; $4835
        JR NZ,L4847                              ; $4836
        CALL L42F5                               ; $4838
        INC B                                    ; $483B
        CALL L42F5                               ; $483C
        RES 0,H                                  ; $483F
        SET 2,H                                  ; $4841
        RES 3,H                                  ; $4843
        JR L486D                                 ; $4845

L4847:
        CALL L47F5                               ; $4847
        LD H,$00                                 ; $484A
        CALL L41F6                               ; $484C
        DEC C                                    ; $484F
        DEC C                                    ; $4850
        INC B                                    ; $4851
        INC B                                    ; $4852
        LD A,$02                                 ; $4853
        CALL L44C2                               ; $4855
        OR A                                     ; $4858
        JR Z,L485D                               ; $4859
        RES 0,H                                  ; $485B

L485D:
        DEC B                                    ; $485D
        DEC B                                    ; $485E
        DEC B                                    ; $485F
        LD A,$02                                 ; $4860
        CALL L44C2                               ; $4862
        OR A                                     ; $4865
        JR Z,L486A                               ; $4866
        RES 1,H                                  ; $4868

L486A:
        CALL L4210                               ; $486A

L486D:
        LD A,H                                   ; $486D
        POP BC                                   ; $486E
        POP DE                                   ; $486F
        POP HL                                   ; $4870
        RET                                      ; $4871

L4872:
        PUSH DE                                  ; $4872
        LD D,$00                                 ; $4873
        CALL L45AD                               ; $4875
        POP DE                                   ; $4878
        RET                                      ; $4879

L487A:
        PUSH DE                                  ; $487A
        LD D,$00                                 ; $487B
        CALL L45AD                               ; $487D
        POP DE                                   ; $4880
        RET                                      ; $4881

L4882:
        PUSH DE                                  ; $4882
        PUSH BC                                  ; $4883
        LD E,A                                   ; $4884
        INC C                                    ; $4885
        INC C                                    ; $4886
        CALL L4502                               ; $4887
        JR NZ,L4895                              ; $488A
        LD A,E                                   ; $488C
        RES 0,A                                  ; $488D
        SET 2,A                                  ; $488F
        RES 3,A                                  ; $4891
        JR L48AA                                 ; $4893

L4895:
        RES 2,E                                  ; $4895
        DEC C                                    ; $4897
        DEC C                                    ; $4898
        CALL L45D0                               ; $4899
        JR C,L48A4                               ; $489C
        SET 0,E                                  ; $489E
        LD D,$01                                 ; $48A0
        JR L48A6                                 ; $48A2

L48A4:
        LD D,$00                                 ; $48A4

L48A6:
        LD A,E                                   ; $48A6
        CALL L45AD                               ; $48A7

L48AA:
        POP BC                                   ; $48AA
        POP DE                                   ; $48AB
        RET                                      ; $48AC

L48AD:
        PUSH HL                                  ; $48AD
        PUSH DE                                  ; $48AE
        PUSH BC                                  ; $48AF
        LD H,A                                   ; $48B0
        INC C                                    ; $48B1
        INC C                                    ; $48B2
        CALL L4502                               ; $48B3
        JR NZ,L48C0                              ; $48B6
        RES 0,H                                  ; $48B8
        SET 2,H                                  ; $48BA
        RES 3,H                                  ; $48BC
        JR L48FC                                 ; $48BE

L48C0:
        DEC C                                    ; $48C0
        DEC C                                    ; $48C1
        BIT 2,H                                  ; $48C2
        JR NZ,L48E1                              ; $48C4
        BIT 0,H                                  ; $48C6
        JR Z,L48E1                               ; $48C8
        LD D,$00                                 ; $48CA
        CALL L45D0                               ; $48CC
        JR C,L48DA                               ; $48CF

L48D1:
        LD D,$01                                 ; $48D1
        CALL L45F8                               ; $48D3
        JR NC,L48DA                              ; $48D6
        LD D,$02                                 ; $48D8

L48DA:
        LD A,H                                   ; $48DA
        CALL L45AD                               ; $48DB
        LD H,A                                   ; $48DE
        JR L48FC                                 ; $48DF

L48E1:
        CALL L45D0                               ; $48E1
        JR NZ,L48F4                              ; $48E4
        SET 2,H                                  ; $48E6
        SET 3,H                                  ; $48E8
        DEC C                                    ; $48EA
        CALL L4502                               ; $48EB
        JR Z,L48FC                               ; $48EE
        RES 2,H                                  ; $48F0
        JR L48FC                                 ; $48F2

L48F4:
        RES 2,H                                  ; $48F4
        SET 0,H                                  ; $48F6
        JR NC,L48D1                              ; $48F8
        RES 0,H                                  ; $48FA

L48FC:
        LD A,H                                   ; $48FC
        POP BC                                   ; $48FD
        POP DE                                   ; $48FE
        POP HL                                   ; $48FF
        RET                                      ; $4900

L4901:
        PUSH HL                                  ; $4901
        PUSH DE                                  ; $4902
        PUSH BC                                  ; $4903
        LD H,A                                   ; $4904
        LD L,$00                                 ; $4905
        BIT 2,H                                  ; $4907
        JR NZ,L495F                              ; $4909

L490B:
        RES 2,H                                  ; $490B
        SET 0,H                                  ; $490D
        RES 3,H                                  ; $490F
        CALL L45F8                               ; $4911
        JR C,L4918                               ; $4914
        SET 3,H                                  ; $4916

L4918:
        LD A,$02                                 ; $4918
        CALL L4599                               ; $491A
        LD A,D                                   ; $491D
        OR A                                     ; $491E
        JR NZ,L493C                              ; $491F
        LD A,E                                   ; $4921
        OR A                                     ; $4922
        JP Z,L49B1                               ; $4923
        LD A,L                                   ; $4926
        OR A                                     ; $4927
        JR NZ,L4934                              ; $4928
        CALL L45D0                               ; $492A
        JR NC,L495E                              ; $492D

L492F:
        SET 1,H                                  ; $492F
        JP L49B1                                 ; $4931

L4934:
        CALL L45EF                               ; $4934
        JR C,L492F                               ; $4937
        JP L49AD                                 ; $4939

L493C:
        LD A,E                                   ; $493C
        OR A                                     ; $493D
        JR Z,L4946                               ; $493E
        LD A,L                                   ; $4940
        OR A                                     ; $4941
        JR Z,L495E                               ; $4942
        JR L49AD                                 ; $4944

L4946:
        LD A,L                                   ; $4946
        OR A                                     ; $4947
        JR NZ,L4954                              ; $4948
        CALL L45D0                               ; $494A
        JR NC,L495E                              ; $494D

L494F:
        RES 1,H                                  ; $494F
        JP L49B1                                 ; $4951

L4954:
        CALL L45EF                               ; $4954
        JR Z,L495B                               ; $4957
        JR NC,L494F                              ; $4959

L495B:
        JP L49AD                                 ; $495B

L495E:
        INC L                                    ; $495E

L495F:
        RES 0,H                                  ; $495F
        SET 2,H                                  ; $4961
        RES 1,H                                  ; $4963
        CALL L45EF                               ; $4965
        JR NC,L496C                              ; $4968
        SET 1,H                                  ; $496A

L496C:
        XOR A                                    ; $496C
        CALL L4586                               ; $496D
        LD A,D                                   ; $4970
        OR A                                     ; $4971
        JR NZ,L4994                              ; $4972
        LD A,E                                   ; $4974
        OR A                                     ; $4975
        JR NZ,L4984                              ; $4976
        CALL L45D0                               ; $4978
        JR C,L49B1                               ; $497B
        CALL L45F8                               ; $497D
        JR NZ,L49B1                              ; $4980
        JR L490B                                 ; $4982

L4984:
        CALL L45D0                               ; $4984
        JR C,L498F                               ; $4987
        CALL L45F8                               ; $4989
        JP NC,L490B                              ; $498C

L498F:
        RES 3,H                                  ; $498F
        JP L49B1                                 ; $4991

L4994:
        LD A,E                                   ; $4994
        OR A                                     ; $4995
        JP NZ,L490B                              ; $4996
        CALL L45D0                               ; $4999
        JP C,L49A8                               ; $499C
        CALL L45F8                               ; $499F
        JP Z,L490B                               ; $49A2
        JP C,L490B                               ; $49A5

L49A8:
        SET 3,H                                  ; $49A8
        JP L49B1                                 ; $49AA

L49AD:
        RES 0,H                                  ; $49AD
        RES 2,H                                  ; $49AF

L49B1:
        LD A,H                                   ; $49B1
        POP BC                                   ; $49B2
        POP DE                                   ; $49B3
        POP HL                                   ; $49B4
        RET                                      ; $49B5

L49B6:
        PUSH DE                                  ; $49B6
        PUSH BC                                  ; $49B7
        LD L,C                                   ; $49B8
        LD H,$00                                 ; $49B9
        LD C,B                                   ; $49BB
        LD B,$00                                 ; $49BC
        LD DE,$001E                              ; $49BE
        CALL L5D24                               ; $49C1
        POP BC                                   ; $49C4
        POP DE                                   ; $49C5
        RET                                      ; $49C6

L49C7:
        CALL L49B6                               ; $49C7
        PUSH HL                                  ; $49CA
        PUSH DE                                  ; $49CB
        LD DE,$E496                              ; $49CC
        ADD HL,DE                                ; $49CF
        LD A,(HL)                                ; $49D0
        POP DE                                   ; $49D1
        POP HL                                   ; $49D2
        RET                                      ; $49D3

L49D4:
        PUSH HL                                  ; $49D4
        CALL L49C7                               ; $49D5
        AND $30                                  ; $49D8
        POP HL                                   ; $49DA
        RET                                      ; $49DB

L49DC:
        PUSH HL                                  ; $49DC
        LD A,B                                   ; $49DD
        CP $1E                                   ; $49DE
        JR C,L49E7                               ; $49E0
        LD A,$01                                 ; $49E2
        OR A                                     ; $49E4
        JR L49FB                                 ; $49E5

L49E7:
        LD A,C                                   ; $49E7
        CP $14                                   ; $49E8
        JR NC,L49F3                              ; $49EA
        LD A,$04                                 ; $49EC
        CALL L468A                               ; $49EE
        JR Z,L49F6                               ; $49F1

L49F3:
        XOR A                                    ; $49F3
        JR L49FB                                 ; $49F4

L49F6:
        CALL L49C7                               ; $49F6
        AND $30                                  ; $49F9

L49FB:
        POP HL                                   ; $49FB
        RET                                      ; $49FC

L49FD:
        PUSH HL                                  ; $49FD
        CALL L49C7                               ; $49FE
        AND $80                                  ; $4A01
        POP HL                                   ; $4A03
        RET                                      ; $4A04

L4A05:
        XOR A                                    ; $4A05

L4A06:
        EX AF,AF'                                ; $4A06
        LD A,$1D                                 ; $4A07
        CP B                                     ; $4A09
        JR C,L4A24                               ; $4A0A
        LD A,$13                                 ; $4A0C
        CP C                                     ; $4A0E
        JR C,L4A24                               ; $4A0F
        EX AF,AF'                                ; $4A11
        OR A                                     ; $4A12
        JR Z,L4A1E                               ; $4A13
        PUSH HL                                  ; $4A15
        CALL L49C7                               ; $4A16
        POP HL                                   ; $4A19
        AND $0A                                  ; $4A1A
        JR NZ,L4A22                              ; $4A1C

L4A1E:
        CALL L49FD                               ; $4A1E
        RET                                      ; $4A21

L4A22:
        XOR A                                    ; $4A22
        RET                                      ; $4A23

L4A24:
        LD A,$01                                 ; $4A24
        OR A                                     ; $4A26
        RET                                      ; $4A27

L4A28:
        PUSH HL                                  ; $4A28
        CALL L49C7                               ; $4A29
        AND $20                                  ; $4A2C
        POP HL                                   ; $4A2E
        RET                                      ; $4A2F

L4A30:
        PUSH HL                                  ; $4A30
        CALL L49C7                               ; $4A31
        AND $40                                  ; $4A34
        POP HL                                   ; $4A36
        RET                                      ; $4A37

L4A38:
        PUSH HL                                  ; $4A38
        PUSH DE                                  ; $4A39
        CALL L49C7                               ; $4A3A
        AND $01                                  ; $4A3D
        JR Z,L4A47                               ; $4A3F
        LD DE,$E6EE                              ; $4A41
        ADD HL,DE                                ; $4A44
        LD A,(HL)                                ; $4A45
        OR A                                     ; $4A46

L4A47:
        POP DE                                   ; $4A47
        POP HL                                   ; $4A48
        RET                                      ; $4A49

L4A4A:
        LD A,$01                                 ; $4A4A
        LD ($EAE4),A                             ; $4A4C
        CALL L6383                               ; $4A4F
        CALL L4AE2                               ; $4A52
        LD HL,$7BC2                              ; $4A55
        LD DE,$0073                              ; $4A58
        LD B,$23                                 ; $4A5B
        CALL L64AB                               ; $4A5D
        CALL L64AB                               ; $4A60
        LD HL,$7BC2                              ; $4A63
        LD DE,$0173                              ; $4A66
        CALL L64AB                               ; $4A69
        CALL L64AB                               ; $4A6C
        LD HL,$7BC2                              ; $4A6F
        LD DE,$0273                              ; $4A72
        CALL L64AB                               ; $4A75
        CALL L64AB                               ; $4A78
        CALL L4E8E                               ; $4A7B
        LD DE,$0201                              ; $4A7E
        CALL L4E91                               ; $4A81
        LD B,$03                                 ; $4A84

L4A86:
        PUSH BC                                  ; $4A86
        CALL L4B4C                               ; $4A87
        LD A,($EAE4)                             ; $4A8A
        OR A                                     ; $4A8D
        JR Z,L4AC8                               ; $4A8E
        CALL L4C0B                               ; $4A90
        LD A,($EAE4)                             ; $4A93
        OR A                                     ; $4A96
        JR Z,L4AC8                               ; $4A97
        CALL L4AD7                               ; $4A99
        JR NZ,L4AC8                              ; $4A9C
        CALL L4B13                               ; $4A9E
        POP BC                                   ; $4AA1
        DJNZ L4A86                               ; $4AA2
        PUSH BC                                  ; $4AA4
        CALL L4D52                               ; $4AA5
        LD HL,$7ABE                              ; $4AA8
        LD ($EAE5),HL                            ; $4AAB
        XOR A                                    ; $4AAE
        LD ($EAE7),A                             ; $4AAF
        LD A,$70                                 ; $4AB2
        LD ($EACA),A                             ; $4AB4
        CALL L4029                               ; $4AB7
        LD A,($EAE4)                             ; $4ABA
        OR A                                     ; $4ABD
        JR Z,L4AC8                               ; $4ABE
        XOR A                                    ; $4AC0
        LD ($EAF3),A                             ; $4AC1
        POP BC                                   ; $4AC4
        JP L4A4A                                 ; $4AC5

L4AC8:
        POP BC                                   ; $4AC8
        XOR A                                    ; $4AC9
        LD ($EAE4),A                             ; $4ACA
        LD ($EAF3),A                             ; $4ACD
        CALL L5327                               ; $4AD0
        CALL L4B13                               ; $4AD3
        RET                                      ; $4AD6

L4AD7:
        LD B,$80                                 ; $4AD7

L4AD9:
        CALL L5128                               ; $4AD9
        JR NZ,L4AE1                              ; $4ADC
        DJNZ L4AD9                               ; $4ADE
        XOR A                                    ; $4AE0

L4AE1:
        RET                                      ; $4AE1

L4AE2:
        CALL L4B13                               ; $4AE2
        LD HL,($F3CB)                            ; $4AE5
        LD DE,$0400                              ; $4AE8
        ADD HL,DE                                ; $4AEB
        LD BC,$1400                              ; $4AEC
        XOR A                                    ; $4AEF
        CALL CLRSPR                              ; $4AF0
        LD HL,($F3C9)                            ; $4AF3
        LD DE,$0400                              ; $4AF6
        ADD HL,DE                                ; $4AF9
        LD BC,$1400                              ; $4AFA
        LD A,$11                                 ; $4AFD
        CALL CLRSPR                              ; $4AFF
        LD B,$08                                 ; $4B02
        LD HL,$0000                              ; $4B04

L4B07:
        LD A,$3F                                 ; $4B07
        CALL L6EE1                               ; $4B09
        INC B                                    ; $4B0C
        LD A,B                                   ; $4B0D
        CP $0E                                   ; $4B0E
        RET Z                                    ; $4B10
        JR L4B07                                 ; $4B11

L4B13:
        LD L,$04                                 ; $4B13
        LD E,$17                                 ; $4B15

L4B17:
        CALL L4B2C                               ; $4B17
        EX DE,HL                                 ; $4B1A
        CALL L4B2C                               ; $4B1B
        EX DE,HL                                 ; $4B1E
        CALL L5128                               ; $4B1F
        INC L                                    ; $4B22
        INC L                                    ; $4B23
        DEC E                                    ; $4B24
        DEC E                                    ; $4B25
        LD A,L                                   ; $4B26
        CP $18                                   ; $4B27
        JR NZ,L4B17                              ; $4B29
        RET                                      ; $4B2B

L4B2C:
        PUSH HL                                  ; $4B2C
        PUSH DE                                  ; $4B2D
        PUSH BC                                  ; $4B2E
        CALL L4B3F                               ; $4B2F
        LD B,$20                                 ; $4B32

L4B34:
        XOR A                                    ; $4B34
        CALL CHGMOD                              ; $4B35
        INC HL                                   ; $4B38
        DJNZ L4B34                               ; $4B39
        POP BC                                   ; $4B3B
        POP DE                                   ; $4B3C
        POP HL                                   ; $4B3D
        RET                                      ; $4B3E

L4B3F:
        LD H,$00                                 ; $4B3F
        ADD HL,HL                                ; $4B41
        ADD HL,HL                                ; $4B42
        ADD HL,HL                                ; $4B43
        ADD HL,HL                                ; $4B44
        ADD HL,HL                                ; $4B45
        LD DE,($F3C7)                            ; $4B46
        ADD HL,DE                                ; $4B4A
        RET                                      ; $4B4B

L4B4C:
        LD A,$02                                 ; $4B4C
        LD ($EACA),A                             ; $4B4E
        LD HL,$56D4                              ; $4B51

L4B54:
        CALL L4BA6                               ; $4B54
        JR Z,L4B68                               ; $4B57
        EX DE,HL                                 ; $4B59
        CALL L4BAF                               ; $4B5A
        EX DE,HL                                 ; $4B5D
        CALL L5128                               ; $4B5E
        JR Z,L4B54                               ; $4B61
        XOR A                                    ; $4B63
        LD ($EAE4),A                             ; $4B64
        RET                                      ; $4B67

L4B68:
        LD HL,$56D4                              ; $4B68
        LD C,$00                                 ; $4B6B
        CALL L4B7F                               ; $4B6D
        RET Z                                    ; $4B70
        LD A,$20                                 ; $4B71
        LD ($EACA),A                             ; $4B73
        LD HL,$5738                              ; $4B76
        LD C,$01                                 ; $4B79
        CALL L4B7F                               ; $4B7B
        RET                                      ; $4B7E

L4B7F:
        CALL L4BA6                               ; $4B7F
        JR Z,L4B93                               ; $4B82
        EX DE,HL                                 ; $4B84
        CALL L4BAF                               ; $4B85
        CALL L5128                               ; $4B88
        JR NZ,L4BA1                              ; $4B8B
        CALL L4BC4                               ; $4B8D
        EX DE,HL                                 ; $4B90
        JR L4B7F                                 ; $4B91

L4B93:
        DEC HL                                   ; $4B93
        DEC HL                                   ; $4B94
        CALL L4BA6                               ; $4B95
        EX DE,HL                                 ; $4B98
        CALL L4BAF                               ; $4B99
        EX DE,HL                                 ; $4B9C
        LD A,$01                                 ; $4B9D
        OR A                                     ; $4B9F
        RET                                      ; $4BA0

L4BA1:
        XOR A                                    ; $4BA1
        LD ($EAE4),A                             ; $4BA2
        RET                                      ; $4BA5

L4BA6:
        LD A,(HL)                                ; $4BA6
        CP $80                                   ; $4BA7
        RET Z                                    ; $4BA9
        LD D,(HL)                                ; $4BAA
        INC HL                                   ; $4BAB
        LD E,(HL)                                ; $4BAC
        INC HL                                   ; $4BAD
        RET                                      ; $4BAE

L4BAF:
        PUSH BC                                  ; $4BAF
        PUSH DE                                  ; $4BB0
        LD D,$73                                 ; $4BB1

L4BB3:
        PUSH HL                                  ; $4BB3
        PUSH HL                                  ; $4BB4
        CALL L4BDC                               ; $4BB5
        POP HL                                   ; $4BB8
        LD A,$07                                 ; $4BB9
        ADD A,H                                  ; $4BBB
        LD H,A                                   ; $4BBC
        CALL L4BDC                               ; $4BBD
        POP HL                                   ; $4BC0
        POP DE                                   ; $4BC1
        POP BC                                   ; $4BC2
        RET                                      ; $4BC3

L4BC4:
        LD A,C                                   ; $4BC4
        OR A                                     ; $4BC5
        JR NZ,L4BCE                              ; $4BC6
        PUSH BC                                  ; $4BC8
        PUSH DE                                  ; $4BC9
        LD D,$00                                 ; $4BCA
        JR L4BB3                                 ; $4BCC

L4BCE:
        PUSH HL                                  ; $4BCE
        PUSH BC                                  ; $4BCF
        LD A,$04                                 ; $4BD0
        ADD A,L                                  ; $4BD2
        LD L,A                                   ; $4BD3
        LD B,$0E                                 ; $4BD4
        CALL L628C                               ; $4BD6
        POP BC                                   ; $4BD9
        POP HL                                   ; $4BDA
        RET                                      ; $4BDB

L4BDC:
        LD BC,$0705                              ; $4BDC

L4BDF:
        PUSH HL                                  ; $4BDF
        PUSH BC                                  ; $4BE0

L4BE1:
        PUSH HL                                  ; $4BE1
        PUSH BC                                  ; $4BE2
        LD A,L                                   ; $4BE3
        CP $04                                   ; $4BE4
        JR C,L4BFA                               ; $4BE6
        CP $18                                   ; $4BE8
        JR NC,L4BFA                              ; $4BEA
        LD A,H                                   ; $4BEC
        CP $20                                   ; $4BED
        JR NC,L4BFA                              ; $4BEF
        PUSH DE                                  ; $4BF1
        CALL L6AEF                               ; $4BF2
        POP DE                                   ; $4BF5
        LD A,D                                   ; $4BF6
        CALL CHGMOD                              ; $4BF7

L4BFA:
        POP BC                                   ; $4BFA
        POP HL                                   ; $4BFB
        LD A,D                                   ; $4BFC
        OR A                                     ; $4BFD
        JR Z,L4C01                               ; $4BFE
        INC D                                    ; $4C00

L4C01:
        INC H                                    ; $4C01
        DJNZ L4BE1                               ; $4C02
        POP BC                                   ; $4C04
        POP HL                                   ; $4C05
        INC L                                    ; $4C06
        DEC C                                    ; $4C07
        JR NZ,L4BDF                              ; $4C08
        RET                                      ; $4C0A

L4C0B:
        LD BC,$060E                              ; $4C0B
        LD DE,$567F                              ; $4C0E
        CALL L4C3D                               ; $4C11
        RET Z                                    ; $4C14
        LD BC,$0510                              ; $4C15
        LD DE,$5694                              ; $4C18
        CALL L4C3D                               ; $4C1B
        RET Z                                    ; $4C1E
        LD BC,$0C12                              ; $4C1F
        LD DE,$56AB                              ; $4C22
        CALL L4C3D                               ; $4C25
        RET Z                                    ; $4C28
        LD BC,$0F14                              ; $4C29
        LD DE,$56B5                              ; $4C2C
        CALL L4C3D                               ; $4C2F
        RET Z                                    ; $4C32
        LD BC,$0816                              ; $4C33
        LD DE,$56B8                              ; $4C36
        CALL L4C3D                               ; $4C39
        RET                                      ; $4C3C

L4C3D:
        LD H,$1D                                 ; $4C3D
        LD L,C                                   ; $4C3F

L4C40:
        CALL L4C5C                               ; $4C40
        CALL L5128                               ; $4C43
        JR NZ,L4C57                              ; $4C46
        CALL L4C81                               ; $4C48
        DEC H                                    ; $4C4B
        LD A,H                                   ; $4C4C
        CP B                                     ; $4C4D
        JR NZ,L4C40                              ; $4C4E
        CALL L4C5C                               ; $4C50
        LD A,$01                                 ; $4C53
        OR A                                     ; $4C55
        RET                                      ; $4C56

L4C57:
        XOR A                                    ; $4C57
        LD ($EAE4),A                             ; $4C58
        RET                                      ; $4C5B

L4C5C:
        PUSH HL                                  ; $4C5C
        PUSH DE                                  ; $4C5D
        PUSH BC                                  ; $4C5E
        LD C,$01                                 ; $4C5F

L4C61:
        LD B,$00                                 ; $4C61

L4C63:
        LD A,(DE)                                ; $4C63
        CP $40                                   ; $4C64
        JR Z,L4C7D                               ; $4C66
        LD A,H                                   ; $4C68
        CP $20                                   ; $4C69
        JR NC,L4C79                              ; $4C6B
        LD A,C                                   ; $4C6D
        OR A                                     ; $4C6E
        JR Z,L4C74                               ; $4C6F
        LD A,(DE)                                ; $4C71
        JR L4C76                                 ; $4C72

L4C74:
        LD A,$20                                 ; $4C74

L4C76:
        CALL L62B0                               ; $4C76

L4C79:
        INC DE                                   ; $4C79
        INC H                                    ; $4C7A
        JR L4C63                                 ; $4C7B

L4C7D:
        POP BC                                   ; $4C7D
        POP DE                                   ; $4C7E
        POP HL                                   ; $4C7F
        RET                                      ; $4C80

L4C81:
        PUSH HL                                  ; $4C81
        PUSH DE                                  ; $4C82
        PUSH BC                                  ; $4C83
        LD C,$00                                 ; $4C84
        JR L4C61                                 ; $4C86

L4C88:
        CALL L0138                               ; $4C88
        RRCA                                     ; $4C8B
        RRCA                                     ; $4C8C
        AND $03                                  ; $4C8D
        LD C,A                                   ; $4C8F
        LD B,$00                                 ; $4C90
        LD HL,$FCC1                              ; $4C92
        ADD HL,BC                                ; $4C95
        OR (HL)                                  ; $4C96
        RET P                                    ; $4C97
        LD C,A                                   ; $4C98
        INC HL                                   ; $4C99
        INC HL                                   ; $4C9A
        INC HL                                   ; $4C9B
        INC HL                                   ; $4C9C
        LD A,(HL)                                ; $4C9D
        AND $0C                                  ; $4C9E
        OR C                                     ; $4CA0
        RET                                      ; $4CA1

L4CA2:
        CALL L4C88                               ; $4CA2
        LD H,$80                                 ; $4CA5
        CALL RDVRM                               ; $4CA7
        EI                                       ; $4CAA
        CALL L003B                               ; $4CAB
        LD A,$0F                                 ; $4CAE
        LD ($F3E9),A                             ; $4CB0
        LD A,$01                                 ; $4CB3
        LD ($F3EA),A                             ; $4CB5
        LD ($F3EB),A                             ; $4CB8
        CALL INIMLT                              ; $4CBB
        LD HL,$1800                              ; $4CBE
        LD ($F3C7),HL                            ; $4CC1
        LD HL,$2000                              ; $4CC4
        LD ($F3C9),HL                            ; $4CC7
        LD HL,$0000                              ; $4CCA
        LD ($F3CB),HL                            ; $4CCD
        LD HL,$1B00                              ; $4CD0
        LD ($F3CD),HL                            ; $4CD3
        LD HL,$3800                              ; $4CD6
        LD ($F3CF),HL                            ; $4CD9
        CALL SETMLT                              ; $4CDC
        CALL SETTXT                              ; $4CDF
        CALL GICINI                              ; $4CE2
        LD C,$01                                 ; $4CE5
        LD B,$E2                                 ; $4CE7
        CALL WRTVRM                              ; $4CE9
        LD HL,$7CF2                              ; $4CEC
        LD ($EAD7),HL                            ; $4CEF
        LD HL,($F3C7)                            ; $4CF2
        LD BC,$0300                              ; $4CF5

L4CF8:
        XOR A                                    ; $4CF8
        CALL CHGMOD                              ; $4CF9
        INC HL                                   ; $4CFC
        DEC BC                                   ; $4CFD
        LD A,B                                   ; $4CFE
        OR C                                     ; $4CFF
        JR NZ,L4CF8                              ; $4D00
        LD DE,($7CEE)                            ; $4D02
        LD HL,($7CF0)                            ; $4D06
        OR A                                     ; $4D09
        SBC HL,DE                                ; $4D0A
        LD B,H                                   ; $4D0C
        LD C,L                                   ; $4D0D
        EX DE,HL                                 ; $4D0E
        LD DE,($F3CF)                            ; $4D0F
        CALL INIT32                              ; $4D13
        LD B,$03                                 ; $4D16
        XOR A                                    ; $4D18
        LD HL,$E32E                              ; $4D19

L4D1C:
        LD (HL),A                                ; $4D1C
        INC HL                                   ; $4D1D
        DJNZ L4D1C                               ; $4D1E
        LD A,$07                                 ; $4D20
        LD E,$98                                 ; $4D22
        CALL WRTPSG                              ; $4D24
        LD A,$0C                                 ; $4D27
        LD E,$1C                                 ; $4D29
        CALL WRTPSG                              ; $4D2B
        LD A,$0D                                 ; $4D2E
        LD E,$00                                 ; $4D30
        CALL WRTPSG                              ; $4D32
        XOR A                                    ; $4D35
        LD ($EAF3),A                             ; $4D36
        LD ($F3DB),A                             ; $4D39
        LD ($EAE4),A                             ; $4D3C
        DI                                       ; $4D3F
        LD A,$C3                                 ; $4D40
        LD ($FD9F),A                             ; $4D42
        LD HL,$75D4                              ; $4D45
        LD ($FDA0),HL                            ; $4D48
        LD A,$C9                                 ; $4D4B
        LD ($FDA2),A                             ; $4D4D
        EI                                       ; $4D50
        RET                                      ; $4D51

L4D52:
        LD A,$05                                 ; $4D52
        LD ($E324),A                             ; $4D54
        LD A,$70                                 ; $4D57
        LD ($E320),A                             ; $4D59
        LD A,$06                                 ; $4D5C
        LD ($E333),A                             ; $4D5E
        LD A,$01                                 ; $4D61
        LD ($E321),A                             ; $4D63
        LD A,$70                                 ; $4D66
        LD ($EACA),A                             ; $4D68
        LD A,$00                                 ; $4D6B
        LD ($E322),A                             ; $4D6D
        LD A,$11                                 ; $4D70
        LD ($E323),A                             ; $4D72
        LD B,$09                                 ; $4D75
        XOR A                                    ; $4D77
        LD HL,$E325                              ; $4D78

L4D7B:
        LD (HL),A                                ; $4D7B
        INC HL                                   ; $4D7C
        DJNZ L4D7B                               ; $4D7D
        LD ($E331),A                             ; $4D7F
        LD ($E332),A                             ; $4D82
        LD ($EAE8),A                             ; $4D85
        LD HL,$E000                              ; $4D88
        LD DE,$E001                              ; $4D8B
        LD BC,$000C                              ; $4D8E
        LD (HL),$00                              ; $4D91
        LDIR                                     ; $4D93
        LD HL,$E00D                              ; $4D95
        LD DE,$E00E                              ; $4D98
        LD BC,$02C5                              ; $4D9B
        LD (HL),$FF                              ; $4D9E
        LDIR                                     ; $4DA0
        LD A,($EAD3)                             ; $4DA2
        BIT 7,A                                  ; $4DA5
        JR NZ,L4DAD                              ; $4DA7
        CALL L4F40                               ; $4DA9
        RET C                                    ; $4DAC

L4DAD:
        LD B,$00                                 ; $4DAD

L4DAF:
        LD HL,$00FF                              ; $4DAF
        LD A,$3F                                 ; $4DB2
        CALL L6EE1                               ; $4DB4
        INC B                                    ; $4DB7
        LD A,B                                   ; $4DB8
        CP $03                                   ; $4DB9
        JR NZ,L4DAF                              ; $4DBB

L4DBD:
        LD HL,$000F                              ; $4DBD
        LD A,$3F                                 ; $4DC0
        CALL L6EE1                               ; $4DC2
        INC B                                    ; $4DC5
        LD A,B                                   ; $4DC6
        CP $06                                   ; $4DC7
        JR NZ,L4DBD                              ; $4DC9
        CALL L4EA2                               ; $4DCB
        LD HL,$7BD4                              ; $4DCE
        LD DE,$000D                              ; $4DD1
        LD B,$01                                 ; $4DD4
        CALL L64AB                               ; $4DD6
        LD HL,$7BC6                              ; $4DD9
        LD B,$1C                                 ; $4DDC
        CALL L64AB                               ; $4DDE
        LD HL,$7BC0                              ; $4DE1
        CALL L64AB                               ; $4DE4
        LD HL,$7BD6                              ; $4DE7
        LD B,$01                                 ; $4DEA
        CALL L64AB                               ; $4DEC
        LD HL,$7BCE                              ; $4DEF
        LD B,$0A                                 ; $4DF2
        CALL L64AB                               ; $4DF4
        LD HL,$7BC8                              ; $4DF7
        LD B,$04                                 ; $4DFA
        CALL L64AB                               ; $4DFC
        LD B,$02                                 ; $4DFF
        CALL L64AB                               ; $4E01
        CALL L64AB                               ; $4E04
        LD HL,$7BD0                              ; $4E07
        LD B,$1A                                 ; $4E0A
        CALL L64AB                               ; $4E0C
        CALL L4E8E                               ; $4E0F
        LD HL,$1100                              ; $4E12
        LD BC,$0704                              ; $4E15
        LD A,$0E                                 ; $4E18
        CALL L64C3                               ; $4E1A
        LD A,$2A                                 ; $4E1D
        CALL L4ECA                               ; $4E1F
        LD HL,$0100                              ; $4E22
        LD BC,$0301                              ; $4E25
        LD A,$52                                 ; $4E28
        CALL L64C3                               ; $4E2A
        LD HL,$0900                              ; $4E2D
        LD BC,$0401                              ; $4E30
        LD A,$51                                 ; $4E33
        CALL L64C3                               ; $4E35
        LD HL,$0102                              ; $4E38
        LD BC,$0201                              ; $4E3B
        LD A,$55                                 ; $4E3E
        CALL L64C3                               ; $4E40
        LD HL,$0103                              ; $4E43
        LD BC,$0201                              ; $4E46
        LD A,$57                                 ; $4E49
        CALL L64C3                               ; $4E4B
        LD A,($EAE4)                             ; $4E4E
        OR A                                     ; $4E51
        JR NZ,L4E76                              ; $4E52
        LD A,($E321)                             ; $4E54
        BIT 3,A                                  ; $4E57
        JR Z,L4E60                               ; $4E59
        CALL L638E                               ; $4E5B
        OR A                                     ; $4E5E
        RET                                      ; $4E5F

L4E60:
        LD HL,$1301                              ; $4E60
        LD DE,$6472                              ; $4E63
        LD C,$59                                 ; $4E66
        LD B,$01                                 ; $4E68
        CALL L629D                               ; $4E6A
        INC L                                    ; $4E6D
        LD DE,$6476                              ; $4E6E
        CALL L629D                               ; $4E71
        OR A                                     ; $4E74
        RET                                      ; $4E75

L4E76:
        LD HL,$1201                              ; $4E76
        LD DE,$56CA                              ; $4E79
        LD C,$59                                 ; $4E7C
        LD B,$01                                 ; $4E7E
        CALL L629D                               ; $4E80
        LD HL,$1302                              ; $4E83
        LD DE,$56CF                              ; $4E86
        CALL L629D                               ; $4E89
        OR A                                     ; $4E8C
        RET                                      ; $4E8D

L4E8E:
        LD DE,$0101                              ; $4E8E

L4E91:
        LD HL,$7BD0                              ; $4E91
        LD B,$1C                                 ; $4E94
        CALL L64AB                               ; $4E96
        LD HL,$7BCE                              ; $4E99
        LD B,$0A                                 ; $4E9C
        CALL L64AB                               ; $4E9E
        RET                                      ; $4EA1

L4EA2:
        LD HL,$7BD2                              ; $4EA2
        LD E,(HL)                                ; $4EA5
        INC HL                                   ; $4EA6
        LD D,(HL)                                ; $4EA7
        LD HL,$0001                              ; $4EA8
        LD B,$06                                 ; $4EAB
        LD IX,$6DC9                              ; $4EAD

L4EB1:
        PUSH HL                                  ; $4EB1
        PUSH DE                                  ; $4EB2
        PUSH BC                                  ; $4EB3
        ADD HL,HL                                ; $4EB4
        ADD HL,HL                                ; $4EB5
        ADD HL,HL                                ; $4EB6
        LD A,(IX+0)                              ; $4EB7
        CALL L4F0C                               ; $4EBA
        CALL L4F0C                               ; $4EBD
        POP BC                                   ; $4EC0
        POP DE                                   ; $4EC1
        POP HL                                   ; $4EC2
        INC IX                                   ; $4EC3
        INC HL                                   ; $4EC5
        INC HL                                   ; $4EC6
        DJNZ L4EB1                               ; $4EC7
        RET                                      ; $4EC9

L4ECA:
        PUSH AF                                  ; $4ECA
        LD C,$33                                 ; $4ECB
        OR A                                     ; $4ECD
        JR NZ,L4ED2                              ; $4ECE
        LD C,$3F                                 ; $4ED0

L4ED2:
        LD A,C                                   ; $4ED2
        LD HL,$C0FF                              ; $4ED3
        LD B,$06                                 ; $4ED6
        CALL L6EE1                               ; $4ED8
        LD A,C                                   ; $4EDB
        LD HL,$C00F                              ; $4EDC
        INC B                                    ; $4EDF
        CALL L6EE1                               ; $4EE0
        POP AF                                   ; $4EE3
        PUSH AF                                  ; $4EE4
        LD C,$46                                 ; $4EE5
        OR A                                     ; $4EE7
        JR NZ,L4EEC                              ; $4EE8
        LD C,$00                                 ; $4EEA

L4EEC:
        LD A,C                                   ; $4EEC
        LD HL,$1F00                              ; $4EED
        LD B,$04                                 ; $4EF0

L4EF2:
        PUSH AF                                  ; $4EF2
        PUSH HL                                  ; $4EF3
        PUSH BC                                  ; $4EF4
        CALL L6AEF                               ; $4EF5
        CALL CHGMOD                              ; $4EF8
        POP BC                                   ; $4EFB
        POP HL                                   ; $4EFC
        POP AF                                   ; $4EFD
        INC L                                    ; $4EFE
        DJNZ L4EF2                               ; $4EFF
        POP AF                                   ; $4F01
        LD HL,$1800                              ; $4F02
        LD BC,$0704                              ; $4F05
        CALL L64C3                               ; $4F08
        RET                                      ; $4F0B

L4F0C:
        LD B,$08                                 ; $4F0C

L4F0E:
        PUSH AF                                  ; $4F0E
        CALL L6CCA                               ; $4F0F
        POP AF                                   ; $4F12
        DJNZ L4F0E                               ; $4F13
        RET                                      ; $4F15

L4F16:
        LD A,($E324)                             ; $4F16
        LD ($E336),A                             ; $4F19
        CALL L5E5C                               ; $4F1C
        LD HL,$090D                              ; $4F1F
        LD BC,$0E03                              ; $4F22

L4F25:
        CALL L628C                               ; $4F25
        INC L                                    ; $4F28
        DEC C                                    ; $4F29
        JR NZ,L4F25                              ; $4F2A
        LD HL,$0B0E                              ; $4F2C
        LD DE,$6467                              ; $4F2F
        LD BC,$0201                              ; $4F32
        CALL L629D                               ; $4F35
        LD B,$10                                 ; $4F38

L4F3A:
        CALL L5128                               ; $4F3A
        DJNZ L4F3A                               ; $4F3D
        RET                                      ; $4F3F

L4F40:
        LD DE,$647A                              ; $4F40
        CALL L500A                               ; $4F43
        JP NZ,L4FF1                              ; $4F46
        DI                                       ; $4F49
        CALL GTSTCK                              ; $4F4A
        JR C,L4F7B                               ; $4F4D

L4F4F:
        CALL GTTRIG                              ; $4F4F
        JR C,L4F7B                               ; $4F52
        CP $01                                   ; $4F54
        JR Z,L4F5D                               ; $4F56
        OR A                                     ; $4F58
        JR Z,L4F81                               ; $4F59
        JR L4F7B                                 ; $4F5B

L4F5D:
        CALL L4F87                               ; $4F5D
        JR C,L4F7B                               ; $4F60
        PUSH BC                                  ; $4F62
        CALL L4F87                               ; $4F63
        POP HL                                   ; $4F66
        JR C,L4F7B                               ; $4F67

L4F69:
        PUSH HL                                  ; $4F69
        PUSH BC                                  ; $4F6A
        CALL GTTRIG                              ; $4F6B
        POP BC                                   ; $4F6E
        POP HL                                   ; $4F6F
        JR C,L4F7B                               ; $4F70
        LD (HL),A                                ; $4F72
        INC HL                                   ; $4F73
        DEC BC                                   ; $4F74
        LD A,B                                   ; $4F75
        OR C                                     ; $4F76
        JR NZ,L4F69                              ; $4F77
        JR L4F4F                                 ; $4F79

L4F7B:
        CALL GTPAD                               ; $4F7B
        EI                                       ; $4F7E
        SCF                                      ; $4F7F
        RET                                      ; $4F80

L4F81:
        CALL GTPAD                               ; $4F81
        EI                                       ; $4F84
        OR A                                     ; $4F85
        RET                                      ; $4F86

L4F87:
        CALL GTTRIG                              ; $4F87
        RET C                                    ; $4F8A
        LD C,A                                   ; $4F8B
        PUSH BC                                  ; $4F8C
        CALL GTTRIG                              ; $4F8D
        POP BC                                   ; $4F90
        LD B,A                                   ; $4F91
        RET                                      ; $4F92

L4F93:
        LD A,($E336)                             ; $4F93
        CP $02                                   ; $4F96
        RET C                                    ; $4F98
        LD DE,$647F                              ; $4F99
        CALL L500A                               ; $4F9C
        JR NZ,L4FF1                              ; $4F9F
        LD HL,$E336                              ; $4FA1
        DEC (HL)                                 ; $4FA4
        CALL L5E5C                               ; $4FA5
        CALL L6134                               ; $4FA8
        LD HL,$E336                              ; $4FAB
        LD DE,$E324                              ; $4FAE
        LD BC,$000D                              ; $4FB1
        LDIR                                     ; $4FB4
        DI                                       ; $4FB6
        LD A,$01                                 ; $4FB7
        CALL GTPDL                               ; $4FB9
        JR C,L4FEC                               ; $4FBC
        LD A,$01                                 ; $4FBE
        CALL L00ED                               ; $4FC0
        JR C,L4FEC                               ; $4FC3
        LD BC,$E000                              ; $4FC5
        CALL L4FFC                               ; $4FC8
        JR C,L4FEC                               ; $4FCB
        LD BC,$0334                              ; $4FCD
        CALL L4FFC                               ; $4FD0
        JR C,L4FEC                               ; $4FD3
        LD HL,$E000                              ; $4FD5

L4FD8:
        PUSH HL                                  ; $4FD8
        PUSH BC                                  ; $4FD9
        LD A,(HL)                                ; $4FDA
        CALL L00ED                               ; $4FDB
        POP BC                                   ; $4FDE
        POP HL                                   ; $4FDF
        JR C,L4FEC                               ; $4FE0
        INC HL                                   ; $4FE2
        DEC BC                                   ; $4FE3
        LD A,B                                   ; $4FE4
        OR C                                     ; $4FE5
        JR NZ,L4FD8                              ; $4FE6
        XOR A                                    ; $4FE8
        CALL L00ED                               ; $4FE9

L4FEC:
        CALL L00F0                               ; $4FEC
        EI                                       ; $4FEF
        XOR A                                    ; $4FF0

L4FF1:
        PUSH AF                                  ; $4FF1
        LD A,$2A                                 ; $4FF2
        CALL L4ECA                               ; $4FF4
        POP AF                                   ; $4FF7
        CALL Z,L6358                             ; $4FF8
        RET                                      ; $4FFB

L4FFC:
        PUSH BC                                  ; $4FFC
        LD A,C                                   ; $4FFD
        CALL L00ED                               ; $4FFE
        POP BC                                   ; $5001
        RET C                                    ; $5002
        PUSH BC                                  ; $5003
        LD A,B                                   ; $5004
        CALL L00ED                               ; $5005
        POP BC                                   ; $5008
        RET                                      ; $5009

L500A:
        PUSH DE                                  ; $500A
        XOR A                                    ; $500B
        LD ($EAF3),A                             ; $500C
        CALL L4ECA                               ; $500F
        POP DE                                   ; $5012
        LD HL,$1800                              ; $5013
        LD C,$59                                 ; $5016
        LD B,$01                                 ; $5018
        CALL L629D                               ; $501A
        LD HL,$1B01                              ; $501D
        LD DE,$6484                              ; $5020
        CALL L629D                               ; $5023
        LD HL,$1803                              ; $5026
        LD DE,$6489                              ; $5029
        CALL L629D                               ; $502C

L502F:
        CALL L6358                               ; $502F
        LD A,($EAD2)                             ; $5032
        BIT 6,A                                  ; $5035
        RET Z                                    ; $5037
        LD A,($EAD1)                             ; $5038
        BIT 3,A                                  ; $503B
        JR NZ,L502F                              ; $503D
        LD A,$01                                 ; $503F
        OR A                                     ; $5041
        RET                                      ; $5042
        DB $3E,$01,$CD,$F3,$00,$06,$40,$C5,$06,$00,$10,$FE,$C1,$10,$F8,$C9 ; $5043 | >.....@.........

L5053:
        OR A                                     ; $5053
        RET Z                                    ; $5054
        PUSH AF                                  ; $5055
        CALL L6134                               ; $5056
        LD A,($E321)                             ; $5059
        BIT 3,A                                  ; $505C
        JR Z,L506B                               ; $505E
        CALL L61E8                               ; $5060
        LD C,$07                                 ; $5063
        LD A,($E320)                             ; $5065
        CALL L63FD                               ; $5068

L506B:
        LD A,($EAE2)                             ; $506B
        OR A                                     ; $506E
        JR Z,L507E                               ; $506F
        LD HL,$E00D                              ; $5071
        LD DE,$E00E                              ; $5074
        LD BC,$00D1                              ; $5077
        LD (HL),$00                              ; $507A
        LDIR                                     ; $507C

L507E:
        POP AF                                   ; $507E
        PUSH AF                                  ; $507F
        CP $01                                   ; $5080
        JR NZ,L5094                              ; $5082
        LD A,($E320)                             ; $5084
        SUB $10                                  ; $5087
        DAA                                      ; $5089
        LD ($E320),A                             ; $508A
        LD A,$11                                 ; $508D
        LD ($E335),A                             ; $508F
        JR L50CC                                 ; $5092

L5094:
        CP $03                                   ; $5094
        JR NZ,L50A7                              ; $5096
        LD A,($E320)                             ; $5098
        ADD A,$01                                ; $509B
        DAA                                      ; $509D
        LD ($E320),A                             ; $509E
        XOR A                                    ; $50A1
        LD ($E334),A                             ; $50A2
        JR L50CC                                 ; $50A5

L50A7:
        CP $05                                   ; $50A7
        JR NZ,L50BA                              ; $50A9
        LD A,($E320)                             ; $50AB
        ADD A,$10                                ; $50AE
        DAA                                      ; $50B0
        LD ($E320),A                             ; $50B1
        XOR A                                    ; $50B4
        LD ($E335),A                             ; $50B5
        JR L50CC                                 ; $50B8

L50BA:
        CP $07                                   ; $50BA
        JR NZ,L50CC                              ; $50BC
        LD A,($E320)                             ; $50BE
        SUB $01                                  ; $50C1
        DAA                                      ; $50C3
        LD ($E320),A                             ; $50C4
        LD A,$1C                                 ; $50C7
        LD ($E334),A                             ; $50C9

L50CC:
        LD HL,$E334                              ; $50CC
        LD DE,$E322                              ; $50CF
        LD BC,$0012                              ; $50D2
        LDIR                                     ; $50D5
        LD A,($E321)                             ; $50D7
        BIT 3,A                                  ; $50DA
        JR Z,L50E6                               ; $50DC
        LD C,$0F                                 ; $50DE
        LD A,($E320)                             ; $50E0
        CALL L63FD                               ; $50E3

L50E6:
        POP AF                                   ; $50E6
        RET                                      ; $50E7

L50E8:
        PUSH BC                                  ; $50E8
        LD A,($EAC9)                             ; $50E9
        LD C,A                                   ; $50EC
        LD B,$03                                 ; $50ED

L50EF:
        PUSH BC                                  ; $50EF
        LD A,B                                   ; $50F0
        DEC A                                    ; $50F1
        CALL ERAFNK                              ; $50F2
        OR A                                     ; $50F5
        JR Z,L50FF                               ; $50F6
        BIT 0,C                                  ; $50F8
        JR NZ,L50FF                              ; $50FA
        LD ($EACC),A                             ; $50FC

L50FF:
        LD A,B                                   ; $50FF
        DEC A                                    ; $5100
        PUSH BC                                  ; $5101
        CALL FNKSB                               ; $5102
        POP BC                                   ; $5105
        OR A                                     ; $5106
        JR Z,L5110                               ; $5107
        BIT 0,C                                  ; $5109
        JR NZ,L5110                              ; $510B
        LD ($EACB),A                             ; $510D

L5110:
        POP BC                                   ; $5110
        DJNZ L50EF                               ; $5111
        LD BC,$0900                              ; $5113
        LD HL,$EACD                              ; $5116

L5119:
        PUSH BC                                  ; $5119
        LD A,C                                   ; $511A
        CALL L0141                               ; $511B
        LD C,(HL)                                ; $511E
        AND C                                    ; $511F
        LD (HL),A                                ; $5120
        INC HL                                   ; $5121
        POP BC                                   ; $5122
        INC C                                    ; $5123
        DJNZ L5119                               ; $5124
        POP BC                                   ; $5126
        RET                                      ; $5127

L5128:
        PUSH HL                                  ; $5128
        PUSH DE                                  ; $5129
        PUSH BC                                  ; $512A
        LD A,($EACA)                             ; $512B
        LD B,A                                   ; $512E

L512F:
        CALL L50E8                               ; $512F
        DJNZ L512F                               ; $5132
        LD A,($EAE4)                             ; $5134
        OR A                                     ; $5137
        JR Z,L517C                               ; $5138
        LD A,($EAE8)                             ; $513A
        OR A                                     ; $513D
        JR Z,L517C                               ; $513E
        CALL L5D5D                               ; $5140
        JR NZ,L517C                              ; $5143
        LD HL,($EAE5)                            ; $5145
        LD A,($EAE7)                             ; $5148
        OR A                                     ; $514B
        JR NZ,L5156                              ; $514C
        INC HL                                   ; $514E
        INC HL                                   ; $514F
        LD ($EAE5),HL                            ; $5150
        INC HL                                   ; $5153
        LD A,(HL)                                ; $5154
        DEC HL                                   ; $5155

L5156:
        DEC A                                    ; $5156
        LD ($EAE7),A                             ; $5157
        LD A,(HL)                                ; $515A
        AND $0F                                  ; $515B
        LD ($EACB),A                             ; $515D
        LD A,(HL)                                ; $5160
        BIT 4,A                                  ; $5161
        JR Z,L5169                               ; $5163
        LD A,$FF                                 ; $5165
        JR L516A                                 ; $5167

L5169:
        XOR A                                    ; $5169

L516A:
        LD ($EACC),A                             ; $516A
        PUSH DE                                  ; $516D
        LD DE,$7BC0                              ; $516E
        CALL L5D1E                               ; $5171
        POP DE                                   ; $5174
        JR C,L517C                               ; $5175
        LD A,$01                                 ; $5177
        LD ($EAE3),A                             ; $5179

L517C:
        LD HL,$EACD                              ; $517C
        LD B,$09                                 ; $517F

L5181:
        LD A,(HL)                                ; $5181
        CP $FF                                   ; $5182
        JR NZ,L518A                              ; $5184
        INC HL                                   ; $5186
        DJNZ L5181                               ; $5187
        XOR A                                    ; $5189

L518A:
        POP BC                                   ; $518A
        POP DE                                   ; $518B
        POP HL                                   ; $518C
        RET                                      ; $518D

L518E:
        CALL L5382                               ; $518E
        LD HL,$0013                              ; $5191
        LD C,$01                                 ; $5194

L5196:
        LD D,$00                                 ; $5196
        CALL L6A7C                               ; $5198
        INC H                                    ; $519B
        LD A,H                                   ; $519C
        CP $1E                                   ; $519D
        JR NZ,L5196                              ; $519F
        LD IX,$5748                              ; $51A1

L51A5:
        LD C,(IX+0)                              ; $51A5
        LD A,$FF                                 ; $51A8
        CP C                                     ; $51AA
        JR Z,L51C5                               ; $51AB
        LD A,($E320)                             ; $51AD
        CP C                                     ; $51B0
        JR NZ,L51D2                              ; $51B1
        LD A,($E334)                             ; $51B3
        LD C,(IX+1)                              ; $51B6
        CP C                                     ; $51B9
        JR NZ,L51D2                              ; $51BA
        LD A,($E335)                             ; $51BC
        LD C,(IX+2)                              ; $51BF
        CP C                                     ; $51C2
        JR NZ,L51D2                              ; $51C3

L51C5:
        LD L,(IX+3)                              ; $51C5
        LD H,(IX+4)                              ; $51C8
        CALL L4262                               ; $51CB
        CALL LEAFA                               ; $51CE
        RET                                      ; $51D1

L51D2:
        LD BC,$0005                              ; $51D2
        ADD IX,BC                                ; $51D5
        JR L51A5                                 ; $51D7

L51D9:
        LD HL,$E336                              ; $51D9
        INC (HL)                                 ; $51DC
        CALL L5382                               ; $51DD
        LD HL,$0000                              ; $51E0
        LD C,$02                                 ; $51E3
        CALL L52DC                               ; $51E5
        LD HL,$0001                              ; $51E8
        LD DE,$0012                              ; $51EB
        CALL L52F2                               ; $51EE
        LD HL,$1C01                              ; $51F1
        LD DE,$000D                              ; $51F4
        CALL L52F2                               ; $51F7
        LD HL,$140E                              ; $51FA

L51FD:
        PUSH HL                                  ; $51FD
        LD C,$02                                 ; $51FE
        CALL L52DC                               ; $5200
        POP HL                                   ; $5203
        INC L                                    ; $5204
        DEC H                                    ; $5205
        DEC H                                    ; $5206
        DEC H                                    ; $5207
        DEC H                                    ; $5208
        LD A,L                                   ; $5209
        CP $14                                   ; $520A
        JR NZ,L51FD                              ; $520C
        LD HL,$190C                              ; $520E
        LD C,$20                                 ; $5211
        LD D,$00                                 ; $5213
        CALL L70B6                               ; $5215
        LD A,$02                                 ; $5218
        LD ($E334),A                             ; $521A
        LD A,$11                                 ; $521D
        LD ($E335),A                             ; $521F
        CALL L6F45                               ; $5222
        LD A,$06                                 ; $5225
        CALL L6F27                               ; $5227
        LD HL,$592D                              ; $522A
        LD ($EAFE),HL                            ; $522D
        LD HL,$5887                              ; $5230
        LD ($EB05),HL                            ; $5233
        XOR A                                    ; $5236
        LD ($EB07),A                             ; $5237
        LD ($EAE3),A                             ; $523A
        LD HL,$5A02                              ; $523D
        LD ($EB08),HL                            ; $5240

L5243:
        CALL L5128                               ; $5243
        CALL L5503                               ; $5246
        CALL L55F6                               ; $5249
        LD HL,$EAC9                              ; $524C
        INC (HL)                                 ; $524F
        LD A,($EAE3)                             ; $5250
        OR A                                     ; $5253
        JR Z,L5243                               ; $5254

L5256:
        CALL L5128                               ; $5256
        CALL L5503                               ; $5259
        LD HL,$EAC9                              ; $525C
        INC (HL)                                 ; $525F
        LD A,(HL)                                ; $5260
        CP $53                                   ; $5261
        JR C,L5256                               ; $5263
        CALL L5327                               ; $5265
        LD HL,$190C                              ; $5268
        LD C,$00                                 ; $526B
        LD D,$00                                 ; $526D
        CALL L70A6                               ; $526F
        LD A,$2C                                 ; $5272
        CALL L5318                               ; $5274
        CALL L5128                               ; $5277
        LD A,$2D                                 ; $527A
        CALL L5318                               ; $527C
        CALL L5128                               ; $527F
        LD A,$2E                                 ; $5282
        CALL L5318                               ; $5284
        LD HL,$170A                              ; $5287
        LD A,$3B                                 ; $528A
        LD B,$08                                 ; $528C
        CALL L5309                               ; $528E
        INC H                                    ; $5291
        INC H                                    ; $5292
        CALL L5309                               ; $5293
        INC L                                    ; $5296
        INC L                                    ; $5297
        DEC H                                    ; $5298
        DEC H                                    ; $5299
        CALL L5309                               ; $529A
        INC H                                    ; $529D
        INC H                                    ; $529E
        CALL L5309                               ; $529F
        LD HL,$180E                              ; $52A2
        LD BC,$0404                              ; $52A5
        LD A,$9F                                 ; $52A8
        CALL L64C3                               ; $52AA
        CALL L5128                               ; $52AD
        LD A,$3F                                 ; $52B0
        LD HL,$0000                              ; $52B2
        CALL L531B                               ; $52B5
        CALL L5338                               ; $52B8
        LD B,$40                                 ; $52BB

L52BD:
        CALL L5128                               ; $52BD
        DJNZ L52BD                               ; $52C0
        CALL L65C4                               ; $52C2
        XOR A                                    ; $52C5
        LD ($EAE3),A                             ; $52C6
        LD HL,$598D                              ; $52C9
        LD ($EAFE),HL                            ; $52CC

L52CF:
        CALL L5128                               ; $52CF
        CALL L55F6                               ; $52D2
        LD A,($EAE3)                             ; $52D5
        OR A                                     ; $52D8
        JR Z,L52CF                               ; $52D9
        RET                                      ; $52DB

L52DC:
        LD A,L                                   ; $52DC
        AND $01                                  ; $52DD
        LD D,A                                   ; $52DF
        CALL L6A7C                               ; $52E0
        INC H                                    ; $52E3
        LD A,D                                   ; $52E4
        XOR $01                                  ; $52E5
        LD D,A                                   ; $52E7
        CALL L6A7C                               ; $52E8
        INC H                                    ; $52EB
        LD A,H                                   ; $52EC
        CP $1E                                   ; $52ED
        JR NZ,L52DC                              ; $52EF
        RET                                      ; $52F1

L52F2:
        LD ($EADD),DE                            ; $52F2
        LD C,$06                                 ; $52F6

L52F8:
        PUSH HL                                  ; $52F8
        PUSH DE                                  ; $52F9
        CALL L686C                               ; $52FA
        CALL L689A                               ; $52FD
        POP DE                                   ; $5300
        POP HL                                   ; $5301
        INC L                                    ; $5302
        DEC DE                                   ; $5303
        LD A,D                                   ; $5304
        OR E                                     ; $5305
        JR NZ,L52F8                              ; $5306
        RET                                      ; $5308

L5309:
        PUSH HL                                  ; $5309
        PUSH AF                                  ; $530A
        PUSH BC                                  ; $530B
        CALL L6F4D                               ; $530C
        POP BC                                   ; $530F
        POP AF                                   ; $5310
        CALL L6EE1                               ; $5311
        POP HL                                   ; $5314
        INC A                                    ; $5315
        INC B                                    ; $5316
        RET                                      ; $5317

L5318:
        LD HL,$170C                              ; $5318

L531B:
        LD B,$0C                                 ; $531B
        CALL L5309                               ; $531D
        DEC A                                    ; $5320
        INC H                                    ; $5321
        INC H                                    ; $5322
        CALL L5309                               ; $5323
        RET                                      ; $5326

L5327:
        LD HL,$0000                              ; $5327
        LD B,$08                                 ; $532A

L532C:
        LD A,$3F                                 ; $532C
        CALL L6EE1                               ; $532E
        INC B                                    ; $5331
        LD A,B                                   ; $5332
        CP $0B                                   ; $5333
        JR NZ,L532C                              ; $5335
        RET                                      ; $5337

L5338:
        LD HL,$1807                              ; $5338
        LD A,$AF                                 ; $533B
        LD ($EAFD),A                             ; $533D

L5340:
        CALL L5367                               ; $5340
        DEC L                                    ; $5343
        LD A,L                                   ; $5344
        CP $03                                   ; $5345
        JR NZ,L5340                              ; $5347
        LD HL,$1807                              ; $5349
        XOR A                                    ; $534C
        LD ($EAFD),A                             ; $534D

L5350:
        CALL L5367                               ; $5350
        DEC L                                    ; $5353
        LD A,L                                   ; $5354
        CP $04                                   ; $5355
        JR NZ,L5350                              ; $5357
        LD B,$03                                 ; $5359

L535B:
        CALL L5128                               ; $535B
        DJNZ L535B                               ; $535E
        LD HL,$1804                              ; $5360
        CALL L5367                               ; $5363
        RET                                      ; $5366

L5367:
        PUSH HL                                  ; $5367
        PUSH HL                                  ; $5368
        CALL L5376                               ; $5369
        POP HL                                   ; $536C
        INC H                                    ; $536D
        CALL L5376                               ; $536E
        CALL L5128                               ; $5371
        POP HL                                   ; $5374
        RET                                      ; $5375

L5376:
        LD B,H                                   ; $5376
        LD C,L                                   ; $5377
        CALL L6ADF                               ; $5378
        LD A,($EAFD)                             ; $537B
        CALL CHGMOD                              ; $537E
        RET                                      ; $5381

L5382:
        CALL L659B                               ; $5382
        CALL L65C4                               ; $5385
        CALL L4E8E                               ; $5388
        LD DE,$0127                              ; $538B
        CALL L549D                               ; $538E
        LD DE,$0201                              ; $5391
        CALL L4E91                               ; $5394
        LD DE,$0227                              ; $5397
        CALL L549D                               ; $539A
        LD HL,$7BD8                              ; $539D
        LD DE,$019F                              ; $53A0
        LD B,$10                                 ; $53A3
        CALL L64AB                               ; $53A5
        LD HL,$7BD4                              ; $53A8
        LD B,$01                                 ; $53AB
        CALL L64AB                               ; $53AD
        LD HL,$7BD8                              ; $53B0
        LD DE,$029F                              ; $53B3
        LD B,$10                                 ; $53B6
        CALL L64AB                               ; $53B8
        LD A,$AF                                 ; $53BB
        LD ($EA67),A                             ; $53BD
        LD ($EA68),A                             ; $53C0
        XOR A                                    ; $53C3
        LD ($EAC9),A                             ; $53C4
        LD ($EAD6),A                             ; $53C7
        LD ($EAE3),A                             ; $53CA
        LD ($E344),A                             ; $53CD
        LD ($E343),A                             ; $53D0
        RET                                      ; $53D3
        DB $3E,$05,$32,$34,$E3,$3E,$11,$32,$35,$E3,$CD,$45,$6F,$3E,$06,$CD ; $53D4 | >.24.>.25..Eo>..
        DB $27,$6F,$21,$58,$57,$22,$03,$EB,$21,$8D,$58,$22,$FE,$EA,$21,$87 ; $53E4 | 'o!XW"..!.X"..!.
        DB $58,$22,$05,$EB,$AF,$32,$07,$EB,$21,$E2,$59,$22,$08,$EB,$CD,$28 ; $53F4 | X"...2..!.Y"...(
        DB $51,$CD,$D7,$54,$CD,$69,$55,$CD,$F6,$55,$21,$C9,$EA,$34,$3A,$E3 ; $5404 | Q..T.iU..U!..4:.
        DB $EA,$B7,$28,$EA,$AF,$32,$E3,$EA,$CD,$28,$51,$CD,$D7,$54,$CD,$03 ; $5414 | ..(..2...(Q..T..
        DB $55,$21,$C9,$EA,$34,$3A,$C9,$EA,$FE,$7F,$38,$EC,$C9,$3A,$21,$E3 ; $5424 | U!..4:....8..:!.
        DB $CB,$5F,$28,$9C,$CB,$CF,$32,$21,$E3,$3E,$05,$32,$34,$E3,$3E,$11 ; $5434 | ._(...2!.>.24.>.
        DB $32,$35,$E3,$CD,$45,$6F,$3E,$06,$CD,$27,$6F,$21,$DE,$57,$22,$03 ; $5444 | 25..Eo>..'o!.W".
        DB $EB,$21,$D1,$58,$22,$FE,$EA,$21,$8A,$58,$22,$05,$EB,$AF,$32,$07 ; $5454 | .!.X"..!.X"...2.
        DB $EB,$21,$E2,$59,$22,$08,$EB,$CD,$28,$51,$CD,$D7,$54,$CD,$69,$55 ; $5464 | .!.Y"...(Q..T.iU
        DB $CD,$A7,$55,$CD,$F6,$55,$21,$C9,$EA,$34,$3A,$E3,$EA,$B7,$28,$E7 ; $5474 | ..U..U!..4:...(.
        DB $AF,$32,$E3,$EA,$CD,$28,$51,$CD,$D7,$54,$CD,$03,$55,$21,$C9,$EA ; $5484 | .2...(Q..T..U!..
        DB $34,$3A,$C9,$EA,$FE,$7F,$38,$EC,$C9      ; $5494 | 4:....8..

L549D:
        PUSH DE                                  ; $549D
        LD A,($F91F)                             ; $549E
        LD C,A                                   ; $54A1
        LD DE,($F920)                            ; $54A2
        LD HL,$0086                              ; $54A6
        ADD HL,HL                                ; $54A9
        ADD HL,HL                                ; $54AA
        ADD HL,HL                                ; $54AB
        ADD HL,DE                                ; $54AC
        EX DE,HL                                 ; $54AD
        POP HL                                   ; $54AE
        ADD HL,HL                                ; $54AF
        ADD HL,HL                                ; $54B0
        ADD HL,HL                                ; $54B1
        LD B,$78                                 ; $54B2

L54B4:
        CALL L54BA                               ; $54B4
        DJNZ L54B4                               ; $54B7
        RET                                      ; $54B9

L54BA:
        PUSH BC                                  ; $54BA
        LD B,$08                                 ; $54BB

L54BD:
        PUSH DE                                  ; $54BD
        PUSH BC                                  ; $54BE
        PUSH HL                                  ; $54BF
        EX DE,HL                                 ; $54C0
        LD A,C                                   ; $54C1
        CALL WRSLT                               ; $54C2
        EI                                       ; $54C5
        POP HL                                   ; $54C6
        CALL L6CED                               ; $54C7
        LD A,$F0                                 ; $54CA
        CALL L6CF5                               ; $54CC
        POP BC                                   ; $54CF
        POP DE                                   ; $54D0
        INC HL                                   ; $54D1
        INC DE                                   ; $54D2
        DJNZ L54BD                               ; $54D3
        POP BC                                   ; $54D5
        RET                                      ; $54D6
        DB $CD,$EC,$54,$ED,$53,$03,$EB,$0E,$00,$16,$00,$CD,$A6,$70,$CD,$EC ; $54D7 | ..T.S........p..
        DB $54,$CD,$FD,$54,$C9,$2A,$03,$EB,$CD,$A6,$4B,$20,$07,$23,$5E,$23 ; $54E7 | T..T.*....K .#^#
        DB $56,$EB,$18,$F4,$EB,$C9,$E5,$D5,$C5,$C3,$EF,$74 ; $54F7 | V..........t

L5503:
        LD HL,($EB08)                            ; $5503
        LD A,(HL)                                ; $5506
        CP $FF                                   ; $5507
        JR NZ,L5515                              ; $5509
        INC HL                                   ; $550B
        LD E,(HL)                                ; $550C
        INC HL                                   ; $550D
        LD D,(HL)                                ; $550E
        LD ($EB08),DE                            ; $550F
        JR L5503                                 ; $5513

L5515:
        CP $FE                                   ; $5515
        JR NZ,L5522                              ; $5517
        CALL L6F45                               ; $5519
        LD A,$06                                 ; $551C
        CALL L6F27                               ; $551E
        RET                                      ; $5521

L5522:
        CALL L5D5D                               ; $5522
        JR NZ,L5534                              ; $5525
        LD A,(HL)                                ; $5527
        LD ($EACB),A                             ; $5528
        INC HL                                   ; $552B
        LD A,(HL)                                ; $552C
        LD ($EACC),A                             ; $552D
        INC HL                                   ; $5530
        LD ($EB08),HL                            ; $5531

L5534:
        CALL L40BB                               ; $5534
        CALL L6F5C                               ; $5537
        LD A,($E334)                             ; $553A
        LD B,A                                   ; $553D
        LD A,($E335)                             ; $553E
        LD C,A                                   ; $5541
        CALL L49C7                               ; $5542
        AND $04                                  ; $5545
        RET Z                                    ; $5547
        CALL L5D5D                               ; $5548
        RET NZ                                   ; $554B
        LD H,B                                   ; $554C
        LD L,C                                   ; $554D
        LD C,$00                                 ; $554E
        LD D,$00                                 ; $5550
        CALL L70A6                               ; $5552
        LD A,$10                                 ; $5555
        LD ($EAF7),A                             ; $5557
        LD HL,$E338                              ; $555A
        INC (HL)                                 ; $555D
        LD HL,$E326                              ; $555E
        INC (HL)                                 ; $5561
        CALL L5E01                               ; $5562
        CALL L5128                               ; $5565
        RET                                      ; $5568
        DB $3A,$07,$EB,$3C,$32,$07,$EB,$2A,$05,$EB,$4E,$B9,$D8,$91,$FE,$04 ; $5569 | :..<2..*..N.....
        DB $D0,$23,$56,$23,$5E,$EB,$FE,$03,$28,$10,$F5,$CD,$4D,$6F,$F1,$4F ; $5579 | .#V#^...(...Mo.O
        DB $3E,$2E,$91,$06,$0C,$CD,$E1,$6E,$18,$13,$E5,$21,$00,$00,$3E,$3F ; $5589 | >......n...!..>?
        DB $06,$0C,$CD,$E1,$6E,$E1,$0E,$2B,$16,$00,$CD,$B6,$70,$C9,$3A,$07 ; $5599 | ....n..+....p.:.
        DB $EB,$21,$57,$57,$4E,$B9,$C0,$3E,$99,$F5,$0E,$09,$CD,$FD,$63,$CD ; $55A9 | .!WWN..>......c.
        DB $EA,$55,$F1,$D6,$10,$30,$F2,$0E,$63,$06,$99,$C5,$C5,$79,$21,$00 ; $55B9 | .U...0..c....y!.
        DB $E0,$CD,$EB,$60,$C1,$0E,$04,$B7,$28,$02,$0E,$07,$78,$CD,$FD,$63 ; $55C9 | ...`....(...x..c
        DB $CD,$EA,$55,$C1,$78,$D6,$10,$47,$79,$D6,$0A,$4F,$FE,$09,$20,$DB ; $55D9 | ..U.x..Gy..O.. .
        DB $C9,$C5,$0E,$20,$06,$00,$10,$FE,$0D,$20,$F9,$C1,$C9 ; $55E9 | ... ..... ...

L55F6:
        LD HL,($EAFE)                            ; $55F6
        LD A,(HL)                                ; $55F9
        INC HL                                   ; $55FA
        LD ($EAFE),HL                            ; $55FB
        CP $40                                   ; $55FE
        JR NZ,L5609                              ; $5600
        LD A,$01                                 ; $5602
        LD ($EAE3),A                             ; $5604
        JR L567E                                 ; $5607

L5609:
        CP $3D                                   ; $5609
        JR NZ,L561A                              ; $560B
        LD D,(HL)                                ; $560D
        INC HL                                   ; $560E
        LD E,(HL)                                ; $560F
        LD ($EB00),DE                            ; $5610
        INC HL                                   ; $5614
        LD ($EAFE),HL                            ; $5615
        JR L55F6                                 ; $5618

L561A:
        CP $28                                   ; $561A
        JR NZ,L5625                              ; $561C
        LD A,$01                                 ; $561E

L5620:
        LD ($EB02),A                             ; $5620
        JR L55F6                                 ; $5623

L5625:
        CP $29                                   ; $5625
        JR NZ,L562C                              ; $5627
        XOR A                                    ; $5629
        JR L5620                                 ; $562A

L562C:
        CP $21                                   ; $562C
        JR Z,L567E                               ; $562E
        CP $20                                   ; $5630
        JR NZ,L5637                              ; $5632
        XOR A                                    ; $5634
        JR L566E                                 ; $5635

L5637:
        CP $3A                                   ; $5637
        JR NC,L5641                              ; $5639
        SUB $30                                  ; $563B
        ADD A,$5D                                ; $563D
        JR L5645                                 ; $563F

L5641:
        CP $5D                                   ; $5641
        JR NC,L5649                              ; $5643

L5645:
        SUB $40                                  ; $5645
        JR L566E                                 ; $5647

L5649:
        EX AF,AF'                                ; $5649
        LD A,($EB02)                             ; $564A
        OR A                                     ; $564D
        JR NZ,L5657                              ; $564E
        EX AF,AF'                                ; $5650

L5651:
        SUB $A1                                  ; $5651
        ADD A,$42                                ; $5653
        JR L566E                                 ; $5655

L5657:
        EX AF,AF'                                ; $5657
        CP $A6                                   ; $5658
        JR C,L5651                               ; $565A
        CP $DE                                   ; $565C
        JR NC,L5651                              ; $565E
        CP $C0                                   ; $5660
        JR NC,L566A                              ; $5662
        SUB $A6                                  ; $5664
        ADD A,$27                                ; $5666
        JR L566E                                 ; $5668

L566A:
        SUB $C0                                  ; $566A
        ADD A,$81                                ; $566C

L566E:
        PUSH AF                                  ; $566E
        LD HL,($EB00)                            ; $566F
        INC H                                    ; $5672
        LD ($EB00),HL                            ; $5673
        DEC H                                    ; $5676
        CALL L6AEF                               ; $5677
        POP AF                                   ; $567A
        CALL CHGMOD                              ; $567B

L567E:
        RET                                      ; $567E
        DB $5B,$20,$31,$39,$38,$35,$20,$20,$49,$53,$41,$4F,$20,$59,$4F,$53 ; $567F | [ 1985  ISAO YOS
        DB $48,$49,$44,$41,$40,$5B,$20,$31,$39,$38,$36,$20,$4B,$45,$49,$53 ; $568F | HIDA@[ 1986 KEIS
        DB $55,$4B,$45,$20,$49,$57,$41,$4B,$55,$52,$41,$40,$50,$52,$45,$53 ; $569F | UKE IWAKURA@PRES
        DB $45,$4E,$54,$45,$44,$40,$42,$59,$40,$41,$53,$43,$49,$49,$20,$43 ; $56AF | ENTED@BY@ASCII C
        DB $4F,$52,$50,$4F,$52,$41,$54,$49,$4F,$4E,$40,$44,$45,$4D,$4F,$40 ; $56BF | ORPORATION@DEMO@
        DB $47,$41,$4D,$45,$40,$FD,$00,$15,$00,$15,$18,$FD,$18,$FE,$01,$14 ; $56CF | GAME@...........
        DB $01,$14,$17,$FE,$17,$FF,$02,$13,$02,$13,$16,$FF,$16,$00,$03,$12 ; $56DF | ................
        DB $03,$12,$15,$00,$15,$01,$04,$11,$04,$11,$14,$01,$14,$02,$05,$10 ; $56EF | ................
        DB $05,$10,$13,$02,$13,$03,$06,$0F,$06,$0F,$12,$03,$12,$04,$07,$0E ; $56FF | ................
        DB $07,$0E,$11,$04,$11,$05,$08,$0D,$08,$0D,$10,$05,$10,$06,$09,$0C ; $570F | ................
        DB $09,$0C,$0F,$06,$0F,$07,$0A,$0B,$0A,$0B,$0E,$07,$0E,$08,$0B,$0A ; $571F | ................
        DB $0B,$0A,$0D,$08,$0D,$09,$0C,$80,$80,$09,$0C,$09,$0B,$09,$0A,$09 ; $572F | ................
        DB $09,$09,$08,$09,$07,$09,$06,$80,$80,$99,$18,$0E,$D4,$53,$50,$0C ; $573F | .............SP.
        DB $06,$31,$54,$FF,$FF,$FF,$D4,$53,$09,$1A,$03,$19,$03,$18,$03,$17 ; $574F | .1T....S........
        DB $03,$16,$03,$15,$04,$15,$05,$16,$06,$17,$07,$18,$07,$19,$07,$1A ; $575F | ................
        DB $06,$1B,$05,$1B,$04,$1A,$03,$19,$03,$18,$04,$18,$05,$17,$06,$16 ; $576F | ................
        DB $07,$15,$08,$14,$09,$13,$0A,$12,$0B,$11,$0C,$10,$0D,$0F,$0E,$0E ; $577F | ................
        DB $0E,$0D,$0E,$0C,$0E,$0B,$0E,$0A,$0E,$0A,$0E,$0A,$0E,$0A,$0E,$0B ; $578F | ................
        DB $0E,$0C,$0E,$0D,$0E,$0E,$0E,$0F,$0E,$10,$0D,$11,$0C,$12,$0B,$13 ; $579F | ................
        DB $0A,$14,$09,$15,$08,$16,$07,$17,$06,$18,$05,$18,$04,$80,$BF,$57 ; $57AF | ...............W
        DB $17,$03,$16,$03,$15,$04,$15,$05,$16,$06,$17,$07,$18,$07,$19,$07 ; $57BF | ................
        DB $1A,$06,$1B,$05,$1B,$04,$1A,$03,$19,$03,$18,$03,$80,$BF,$57,$1B ; $57CF | ..............W.
        DB $03,$1A,$03,$19,$03,$18,$03,$17,$02,$16,$01,$15,$00,$15,$00,$15 ; $57DF | ................
        DB $00,$15,$00,$14,$00,$13,$01,$13,$02,$13,$03,$14,$04,$15,$05,$16 ; $57EF | ................
        DB $05,$17,$05,$18,$05,$19,$05,$19,$05,$1A,$05,$1A,$05,$1B,$04,$1A ; $57FF | ................
        DB $04,$19,$04,$19,$04,$18,$04,$18,$04,$17,$04,$17,$04,$16,$04,$16 ; $580F | ................
        DB $04,$15,$04,$16,$05,$17,$05,$17,$05,$18,$04,$19,$03,$1A,$03,$1B ; $581F | ................
        DB $04,$1B,$05,$1B,$05,$1A,$06,$1A,$06,$19,$07,$18,$08,$17,$09,$16 ; $582F | ................
        DB $0A,$15,$0B,$14,$0C,$13,$0C,$12,$0D,$11,$0D,$10,$0D,$0F,$0E,$0E ; $583F | ................
        DB $0E,$0D,$0E,$0C,$0E,$0B,$0E,$0A,$0E,$0A,$0E,$0A,$0E,$0A,$0E,$0B ; $584F | ................
        DB $0E,$0C,$0E,$0D,$0E,$0E,$0E,$0F,$0E,$10,$0D,$11,$0D,$12,$0D,$13 ; $585F | ................
        DB $0C,$14,$0C,$15,$0B,$16,$0A,$17,$09,$18,$08,$18,$07,$19,$06,$19 ; $586F | ................
        DB $05,$19,$04,$18,$03,$80,$BF,$57,$20,$08,$0E,$3D,$08,$0E,$3D,$03 ; $587F | .......W ..=..=.
        DB $08,$28,$B1,$D8,$B6,$DE,$C4,$B3,$A1,$21,$21,$3D,$03,$09,$B5,$DA ; $588F | .(.......!!=....
        DB $B2,$C6,$20,$B1,$B6,$B2,$29,$B6,$B7,$DE,$28,$A6,$21,$21,$3D,$03 ; $589F | .. ...)...(.!!=.
        DB $0A,$BB,$BC,$B1,$B9,$DE,$CF,$BD,$A1,$21,$21,$21,$21,$3D,$03,$0B ; $58AF | .........!!!!=..
        DB $C0,$B2,$BE,$C2,$C6,$20,$C2,$B6,$AF,$C3,$20,$B8,$C0,$DE,$BB,$B2 ; $58BF | ..... .... .....
        DB $A1,$40,$3D,$03,$08,$28,$B5,$CB,$D2,$BB,$CF,$CA,$A4,$21,$21,$C1 ; $58CF | .@=..(.......!!.
        DB $BD,$DE,$C9,$20,$B1,$B6,$B2,$3D,$03,$09,$BC,$D9,$BC,$C9,$20,$CD ; $58DF | ... ...=...... .
        DB $D4,$C6,$A4,$21,$C4,$D7,$DC,$DA,$C3,$B2,$CF,$BD,$A1,$21,$21,$21 ; $58EF | ...!.........!!!
        DB $3D,$03,$0A,$CA,$D4,$B8,$A4,$C0,$BD,$B9,$C3,$B1,$B9,$DE,$C3,$B8 ; $58FF | =...............
        DB $C0,$DE,$BB,$B2,$A1,$21,$21,$21,$21,$21,$3D,$03,$0B,$B1,$B6,$B2 ; $590F | .....!!!!!=.....
        DB $29,$B6,$B7,$DE,$28,$D3,$20,$C4,$DE,$B3,$BF,$DE,$A1,$40,$3D,$04 ; $591F | )...(. ......@=.
        DB $0A,$29,$CF,$D9,$B6,$DE,$D8,$B0,$C0,$28,$CB,$D2,$21,$21,$3D,$04 ; $592F | .).......(..!!=.
        DB $0B,$29,$D7,$CC,$A7,$B4,$DB,$28,$B6,$DE,$3D,$04,$0C,$C0,$BD,$B9 ; $593F | .).....(..=.....
        DB $C6,$3D,$04,$0D,$CF,$B2,$D8,$CF,$BC,$C0,$A1,$21,$21,$21,$21,$3D ; $594F | .=.........!!!!=
        DB $0F,$08,$B1,$B1,$20,$B5,$B3,$BC,$DE,$BB,$CF,$A4,$21,$21,$3D,$0F ; $595F | .... .......!!=.
        DB $09,$BA,$C9,$CB,$B6,$DE,$B8,$D9,$C9,$A6,$3D,$0F,$0A,$CF,$C1,$BA ; $596F | ..........=.....
        DB $B6,$DE,$DA,$C3,$3D,$0F,$0B,$B5,$D8,$CF,$BC,$C0,$A1,$40,$3D,$05 ; $597F | ....=........@=.
        DB $08,$28,$BF,$BC,$C3,$20,$CC,$C0,$D8,$CA,$A4,$21,$BC,$B1,$DC,$BE ; $598F | .(... .....!....
        DB $C6,$20,$B8,$D7,$BC,$CF,$BC,$C0,$A1,$21,$21,$21,$3D,$0C,$0F,$54 ; $599F | . .......!!!=..T
        DB $21,$48,$21,$45,$21,$20,$21,$45,$21,$4E,$21,$44,$20,$21,$21,$21 ; $59AF | !H!E! !E!N!D !!!
        DB $21,$21,$21,$21,$21,$21,$21,$21,$21,$21,$5C,$21,$21,$3D,$08,$13 ; $59BF | !!!!!!!!!!\!!=..
        DB $29,$CA,$DF,$BD,$DC,$B0,$C4,$DE,$20,$4D,$4F,$4F,$4E,$4C,$49,$47 ; $59CF | )....... MOONLIG
        DB $48,$54,$40,$03,$01,$03,$01,$03,$01,$03,$00,$03,$00,$03,$00,$07 ; $59DF | HT@.............
        DB $00,$07,$00,$07,$00,$07,$00,$07,$00,$07,$00,$FF,$FD,$59,$00,$00 ; $59EF | .............Y..
        DB $FF,$FD,$59,$03,$01,$03,$01,$03,$00,$03,$01,$03,$01,$03,$00,$03 ; $59FF | ..Y.............
        DB $00,$03,$01,$03,$01,$03,$00,$03,$00,$03,$01,$03,$01,$03,$00,$03 ; $5A0F | ................
        DB $00,$03,$01,$03,$01,$03,$01,$03,$00,$03,$00,$03,$00,$FE ; $5A1F | ..............

L5A2D:
        PUSH HL                                  ; $5A2D
        PUSH DE                                  ; $5A2E
        PUSH BC                                  ; $5A2F
        CALL L5D5D                               ; $5A30
        JP Z,L5AF4                               ; $5A33
        LD A,($EAE0)                             ; $5A36
        OR A                                     ; $5A39
        JR NZ,L5A63                              ; $5A3A
        LD A,($E343)                             ; $5A3C
        OR A                                     ; $5A3F
        JP NZ,L5AF4                              ; $5A40
        LD A,($E334)                             ; $5A43
        LD B,A                                   ; $5A46
        LD A,($E335)                             ; $5A47
        LD C,A                                   ; $5A4A
        CALL L5AF8                               ; $5A4B
        JR NZ,L5A63                              ; $5A4E
        INC B                                    ; $5A50
        CALL L5AF8                               ; $5A51
        JR NZ,L5A63                              ; $5A54
        INC C                                    ; $5A56
        CALL L5AF8                               ; $5A57
        JR NZ,L5A63                              ; $5A5A
        DEC B                                    ; $5A5C
        CALL L5AF8                               ; $5A5D
        JP Z,L5AF4                               ; $5A60

L5A63:
        LD HL,$7A73                              ; $5A63
        LD DE,$7A8F                              ; $5A66
        CALL L5B2F                               ; $5A69
        XOR A                                    ; $5A6C
        LD ($EAC9),A                             ; $5A6D
        LD B,$10                                 ; $5A70

L5A72:
        PUSH BC                                  ; $5A72
        CALL L5128                               ; $5A73
        LD H,$00                                 ; $5A76
        CALL L5B5F                               ; $5A78
        LD HL,$EAC9                              ; $5A7B
        INC (HL)                                 ; $5A7E
        POP BC                                   ; $5A7F
        DJNZ L5A72                               ; $5A80

L5A82:
        CALL L5128                               ; $5A82
        XOR A                                    ; $5A85
        LD ($EACB),A                             ; $5A86
        LD ($EACC),A                             ; $5A89
        CALL L40BB                               ; $5A8C
        LD A,H                                   ; $5A8F
        BIT 2,A                                  ; $5A90
        JR Z,L5AA4                               ; $5A92
        LD A,($E335)                             ; $5A94
        CP $12                                   ; $5A97
        JR NC,L5AA4                              ; $5A99
        CALL L5B5F                               ; $5A9B
        LD HL,$EAC9                              ; $5A9E
        INC (HL)                                 ; $5AA1
        JR L5A82                                 ; $5AA2

L5AA4:
        CALL L6F45                               ; $5AA4
        LD A,$0D                                 ; $5AA7
        CALL L6F27                               ; $5AA9
        LD B,$20                                 ; $5AAC

L5AAE:
        CALL L5128                               ; $5AAE
        DJNZ L5AAE                               ; $5AB1
        LD HL,$E324                              ; $5AB3
        DEC (HL)                                 ; $5AB6
        LD HL,$E336                              ; $5AB7
        DEC (HL)                                 ; $5ABA
        LD A,($EAE0)                             ; $5ABB
        OR A                                     ; $5ABE
        JR NZ,L5AF4                              ; $5ABF
        INC A                                    ; $5AC1
        LD ($EAE0),A                             ; $5AC2
        LD A,($EAE4)                             ; $5AC5
        OR A                                     ; $5AC8
        JR Z,L5AD0                               ; $5AC9
        LD A,$01                                 ; $5ACB
        LD ($EAE3),A                             ; $5ACD

L5AD0:
        LD HL,$E336                              ; $5AD0
        LD DE,$E324                              ; $5AD3
        LD BC,$000D                              ; $5AD6
        LDIR                                     ; $5AD9
        LD A,($E331)                             ; $5ADB
        OR A                                     ; $5ADE
        JR Z,L5AE6                               ; $5ADF
        ADD A,$04                                ; $5AE1
        LD ($E331),A                             ; $5AE3

L5AE6:
        LD A,($E332)                             ; $5AE6
        OR A                                     ; $5AE9
        JR Z,L5AF1                               ; $5AEA
        ADD A,$04                                ; $5AEC
        LD ($E332),A                             ; $5AEE

L5AF1:
        CALL L6134                               ; $5AF1

L5AF4:
        POP BC                                   ; $5AF4
        POP DE                                   ; $5AF5
        POP HL                                   ; $5AF6
        RET                                      ; $5AF7

L5AF8:
        PUSH BC                                  ; $5AF8
        LD A,C                                   ; $5AF9
        CP $14                                   ; $5AFA
        JR C,L5B01                               ; $5AFC
        XOR A                                    ; $5AFE
        JR L5B2D                                 ; $5AFF

L5B01:
        CALL L49C7                               ; $5B01
        LD D,A                                   ; $5B04
        AND $80                                  ; $5B05
        JR NZ,L5B2D                              ; $5B07
        LD A,D                                   ; $5B09
        AND $10                                  ; $5B0A
        JR Z,L5B2D                               ; $5B0C
        LD DE,$E6EE                              ; $5B0E
        ADD HL,DE                                ; $5B11
        LD A,(HL)                                ; $5B12
        AND $07                                  ; $5B13
        LD D,A                                   ; $5B15
        LD A,($EAD6)                             ; $5B16
        CP $02                                   ; $5B19
        JR C,L5B23                               ; $5B1B
        CP $11                                   ; $5B1D
        JR NC,L5B23                              ; $5B1F
        RES 2,D                                  ; $5B21

L5B23:
        LD A,($E344)                             ; $5B23
        OR A                                     ; $5B26
        JR Z,L5B2B                               ; $5B27
        RES 1,D                                  ; $5B29

L5B2B:
        LD A,D                                   ; $5B2B
        OR A                                     ; $5B2C

L5B2D:
        POP BC                                   ; $5B2D
        RET                                      ; $5B2E

L5B2F:
        PUSH HL                                  ; $5B2F
        PUSH DE                                  ; $5B30
        LD A,($EAF3)                             ; $5B31
        LD C,A                                   ; $5B34
        XOR A                                    ; $5B35
        LD ($EAF3),A                             ; $5B36
        LD ($EAF4),A                             ; $5B39
        LD ($EAF2),A                             ; $5B3C
        LD ($EAF6),A                             ; $5B3F
        LD ($EAF7),A                             ; $5B42
        LD A,$70                                 ; $5B45
        LD ($EACA),A                             ; $5B47
        LD B,$03                                 ; $5B4A

L5B4C:
        CALL L5128                               ; $5B4C
        DJNZ L5B4C                               ; $5B4F
        POP DE                                   ; $5B51
        POP HL                                   ; $5B52
        CALL L7769                               ; $5B53
        LD A,C                                   ; $5B56
        OR A                                     ; $5B57
        RET Z                                    ; $5B58
        LD A,$06                                 ; $5B59
        LD ($EAF3),A                             ; $5B5B
        RET                                      ; $5B5E

L5B5F:
        BIT 2,H                                  ; $5B5F
        JR NZ,L5B78                              ; $5B61

L5B63:
        CALL L6F45                               ; $5B63

L5B66:
        LD A,($EAC9)                             ; $5B66
        AND $03                                  ; $5B69
        JR NZ,L5B71                              ; $5B6B
        LD A,$07                                 ; $5B6D
        JR L5B74                                 ; $5B6F

L5B71:
        LD B,$09                                 ; $5B71
        ADD A,B                                  ; $5B73

L5B74:
        CALL L6F27                               ; $5B74
        RET                                      ; $5B77

L5B78:
        CALL L5D5D                               ; $5B78
        JR NZ,L5B63                              ; $5B7B
        LD A,($E334)                             ; $5B7D
        INC A                                    ; $5B80
        ADD A,A                                  ; $5B81
        ADD A,A                                  ; $5B82
        ADD A,A                                  ; $5B83
        LD H,A                                   ; $5B84
        LD A,($E335)                             ; $5B85
        INC A                                    ; $5B88
        LD ($E335),A                             ; $5B89
        ADD A,$03                                ; $5B8C
        ADD A,A                                  ; $5B8E
        INC A                                    ; $5B8F
        ADD A,A                                  ; $5B90
        ADD A,A                                  ; $5B91
        DEC A                                    ; $5B92
        LD L,A                                   ; $5B93
        JR L5B66                                 ; $5B94

L5B96:
        CALL L5D5D                               ; $5B96
        RET NZ                                   ; $5B99
        LD A,($E334)                             ; $5B9A
        LD B,A                                   ; $5B9D
        LD A,($E335)                             ; $5B9E
        LD C,A                                   ; $5BA1
        CALL L49C7                               ; $5BA2
        AND $04                                  ; $5BA5
        RET Z                                    ; $5BA7
        LD IX,$E3D6                              ; $5BA8
        LD D,B                                   ; $5BAC
        LD E,C                                   ; $5BAD
        LD B,$10                                 ; $5BAE

L5BB0:
        PUSH DE                                  ; $5BB0
        PUSH BC                                  ; $5BB1
        PUSH IX                                  ; $5BB2
        LD H,(IX+2)                              ; $5BB4
        LD L,(IX+3)                              ; $5BB7
        CALL L5D1E                               ; $5BBA
        JP NZ,L5CA7                              ; $5BBD
        LD A,(IX+1)                              ; $5BC0
        CP $23                                   ; $5BC3
        JR Z,L5BCA                               ; $5BC5
        CALL L5CD4                               ; $5BC7

L5BCA:
        CP $20                                   ; $5BCA
        JR NZ,L5BEA                              ; $5BCC
        CALL L5CB5                               ; $5BCE
        CALL L51D9                               ; $5BD1
        LD HL,$E321                              ; $5BD4
        SET 2,(HL)                               ; $5BD7
        LD A,$01                                 ; $5BD9
        LD ($EAE3),A                             ; $5BDB
        CALL L4F93                               ; $5BDE
        CALL L4B13                               ; $5BE1
        CALL L4E8E                               ; $5BE4
        JP L5CA7                                 ; $5BE7

L5BEA:
        CP $21                                   ; $5BEA
        JR NZ,L5C00                              ; $5BEC
        CALL L5CB5                               ; $5BEE
        CALL L518E                               ; $5BF1
        CALL L4B13                               ; $5BF4
        CALL L4E8E                               ; $5BF7
        CALL L64DD                               ; $5BFA
        JP L5CA7                                 ; $5BFD

L5C00:
        CP $22                                   ; $5C00
        JR NZ,L5C1A                              ; $5C02
        LD HL,$E321                              ; $5C04
        SET 3,(HL)                               ; $5C07
        LD HL,$1100                              ; $5C09
        LD BC,$0704                              ; $5C0C
        LD A,$0E                                 ; $5C0F
        CALL L64C3                               ; $5C11
        CALL L638E                               ; $5C14
        JP L5CA7                                 ; $5C17

L5C1A:
        CP $23                                   ; $5C1A
        JR NZ,L5C3A                              ; $5C1C
        LD A,($E343)                             ; $5C1E
        CP $0A                                   ; $5C21
        JP Z,L5CA7                               ; $5C23
        LD A,$0A                                 ; $5C26
        LD ($E343),A                             ; $5C28
        XOR A                                    ; $5C2B
        LD ($E344),A                             ; $5C2C
        LD HL,$79B7                              ; $5C2F
        LD DE,$79DE                              ; $5C32
        CALL L6281                               ; $5C35
        JR L5CA7                                 ; $5C38

L5C3A:
        CP $24                                   ; $5C3A
        JR NZ,L5C52                              ; $5C3C
        LD A,$10                                 ; $5C3E
        LD ($E344),A                             ; $5C40
        XOR A                                    ; $5C43
        LD ($E343),A                             ; $5C44
        LD HL,$7964                              ; $5C47
        LD DE,$7993                              ; $5C4A
        CALL L6281                               ; $5C4D
        JR L5CA7                                 ; $5C50

L5C52:
        CP $25                                   ; $5C52
        JR NZ,L5C5D                              ; $5C54
        LD A,$01                                 ; $5C56
        LD ($EAE2),A                             ; $5C58
        JR L5CA7                                 ; $5C5B

L5C5D:
        CP $26                                   ; $5C5D
        JR NZ,L5C66                              ; $5C5F
        CALL L5E4B                               ; $5C61
        JR L5CA7                                 ; $5C64

L5C66:
        LD C,A                                   ; $5C66
        SUB $27                                  ; $5C67
        PUSH AF                                  ; $5C69
        LD E,A                                   ; $5C6A
        LD D,$00                                 ; $5C6B
        CALL L6F4D                               ; $5C6D
        PUSH HL                                  ; $5C70
        LD HL,$64A2                              ; $5C71
        ADD HL,DE                                ; $5C74
        LD A,(HL)                                ; $5C75
        POP HL                                   ; $5C76
        LD B,$0D                                 ; $5C77
        CALL L6EE1                               ; $5C79
        LD A,$10                                 ; $5C7C
        LD ($EAF9),A                             ; $5C7E
        POP AF                                   ; $5C81
        ADD A,A                                  ; $5C82
        LD E,A                                   ; $5C83
        LD D,$00                                 ; $5C84
        LD HL,$6490                              ; $5C86
        ADD HL,DE                                ; $5C89
        LD E,(HL)                                ; $5C8A
        INC HL                                   ; $5C8B
        LD D,(HL)                                ; $5C8C
        CALL L5D87                               ; $5C8D
        LD A,C                                   ; $5C90
        CP $2A                                   ; $5C91
        JR C,L5CA7                               ; $5C93
        SUB $2A                                  ; $5C95
        LD E,A                                   ; $5C97
        LD D,$00                                 ; $5C98
        LD HL,$E337                              ; $5C9A
        ADD HL,DE                                ; $5C9D
        LD A,(HL)                                ; $5C9E
        CP $FF                                   ; $5C9F
        JR Z,L5CA7                               ; $5CA1
        INC (HL)                                 ; $5CA3
        CALL L5E01                               ; $5CA4

L5CA7:
        POP IX                                   ; $5CA7
        LD BC,$0004                              ; $5CA9
        ADD IX,BC                                ; $5CAC
        POP BC                                   ; $5CAE
        POP DE                                   ; $5CAF
        DEC B                                    ; $5CB0
        JP NZ,L5BB0                              ; $5CB1
        RET                                      ; $5CB4

L5CB5:
        XOR A                                    ; $5CB5
        LD ($EAF8),A                             ; $5CB6
        LD HL,$7A03                              ; $5CB9
        LD DE,$7A3C                              ; $5CBC
        CALL L5B2F                               ; $5CBF
        CALL L4AE2                               ; $5CC2
        LD HL,$E334                              ; $5CC5
        LD DE,$E322                              ; $5CC8
        LD BC,$0012                              ; $5CCB
        LDIR                                     ; $5CCE
        CALL L6134                               ; $5CD0
        RET                                      ; $5CD3

L5CD4:
        PUSH AF                                  ; $5CD4
        PUSH HL                                  ; $5CD5
        PUSH AF                                  ; $5CD6
        XOR A                                    ; $5CD7
        LD (IX+0),A                              ; $5CD8
        LD C,$00                                 ; $5CDB
        LD D,$00                                 ; $5CDD
        CALL L70A6                               ; $5CDF
        POP AF                                   ; $5CE2
        CP $21                                   ; $5CE3
        JR NZ,L5CF1                              ; $5CE5
        LD HL,$0000                              ; $5CE7
        LD A,$3F                                 ; $5CEA
        LD B,$0B                                 ; $5CEC
        CALL L6EE1                               ; $5CEE

L5CF1:
        LD A,$10                                 ; $5CF1
        LD ($EAF7),A                             ; $5CF3
        CALL L5128                               ; $5CF6
        POP HL                                   ; $5CF9
        POP AF                                   ; $5CFA
        RET                                      ; $5CFB

L5CFC:
        PUSH HL                                  ; $5CFC
        POP IX                                   ; $5CFD
        LD HL,$0000                              ; $5CFF
        LD IY,$0000                              ; $5D02
        LD B,$10                                 ; $5D06

L5D08:
        ADD IX,IX                                ; $5D08
        ADC HL,HL                                ; $5D0A
        ADD IY,IY                                ; $5D0C
        CALL L5D1E                               ; $5D0E
        JR C,L5D17                               ; $5D11
        SBC HL,DE                                ; $5D13
        INC IY                                   ; $5D15

L5D17:
        DJNZ L5D08                               ; $5D17
        EX DE,HL                                 ; $5D19
        PUSH IY                                  ; $5D1A
        POP HL                                   ; $5D1C
        RET                                      ; $5D1D

L5D1E:
        LD A,H                                   ; $5D1E
        CP D                                     ; $5D1F
        RET NZ                                   ; $5D20
        LD A,L                                   ; $5D21
        CP E                                     ; $5D22
        RET                                      ; $5D23

L5D24:
        PUSH BC                                  ; $5D24
        LD A,$10                                 ; $5D25
        LD B,H                                   ; $5D27
        LD C,L                                   ; $5D28
        LD HL,$0000                              ; $5D29

L5D2C:
        SLA E                                    ; $5D2C
        RL D                                     ; $5D2E
        JR C,L5D41                               ; $5D30
        DEC A                                    ; $5D32
        JR Z,L5D44                               ; $5D33
        JR L5D2C                                 ; $5D35

L5D37:
        DEC A                                    ; $5D37
        JR Z,L5D44                               ; $5D38
        ADD HL,HL                                ; $5D3A
        SLA E                                    ; $5D3B
        RL D                                     ; $5D3D
        JR NC,L5D37                              ; $5D3F

L5D41:
        ADD HL,BC                                ; $5D41
        JR L5D37                                 ; $5D42

L5D44:
        POP BC                                   ; $5D44
        ADD HL,BC                                ; $5D45
        RET                                      ; $5D46

L5D47:
        PUSH HL                                  ; $5D47
        PUSH BC                                  ; $5D48
        CALL L7096                               ; $5D49
        PUSH HL                                  ; $5D4C
        XOR A                                    ; $5D4D
        LD (IX+0),A                              ; $5D4E
        LD C,A                                   ; $5D51
        LD D,A                                   ; $5D52
        CALL L70A6                               ; $5D53
        POP HL                                   ; $5D56
        CALL L5D63                               ; $5D57
        POP BC                                   ; $5D5A
        POP HL                                   ; $5D5B
        RET                                      ; $5D5C

L5D5D:
        LD A,($EAC9)                             ; $5D5D
        BIT 0,A                                  ; $5D60
        RET                                      ; $5D62

L5D63:
        LD A,$32                                 ; $5D63
        LD ($EAF6),A                             ; $5D65
        CALL L6F4D                               ; $5D68
        LD A,$2C                                 ; $5D6B

L5D6D:
        PUSH AF                                  ; $5D6D
        LD B,$0C                                 ; $5D6E
        CALL L6EE1                               ; $5D70
        CALL L5128                               ; $5D73
        POP AF                                   ; $5D76
        INC A                                    ; $5D77
        CP $2F                                   ; $5D78
        JR NZ,L5D6D                              ; $5D7A
        LD A,$3F                                 ; $5D7C
        LD B,$0C                                 ; $5D7E
        LD HL,$0000                              ; $5D80
        CALL L6EE1                               ; $5D83
        RET                                      ; $5D86

L5D87:
        PUSH BC                                  ; $5D87
        LD HL,$E33F                              ; $5D88
        LD A,(HL)                                ; $5D8B
        ADD A,E                                  ; $5D8C
        DAA                                      ; $5D8D
        LD (HL),A                                ; $5D8E
        DEC HL                                   ; $5D8F
        LD A,(HL)                                ; $5D90
        ADC A,D                                  ; $5D91
        DAA                                      ; $5D92
        LD (HL),A                                ; $5D93
        DEC HL                                   ; $5D94
        CALL C,L5E4B                             ; $5D95
        LD A,(HL)                                ; $5D98
        ADC A,$00                                ; $5D99
        DAA                                      ; $5D9B
        LD (HL),A                                ; $5D9C
        LD DE,$E340                              ; $5D9D
        LD HL,$E33D                              ; $5DA0
        LD B,$03                                 ; $5DA3

L5DA5:
        LD A,(DE)                                ; $5DA5
        LD C,(HL)                                ; $5DA6
        CP C                                     ; $5DA7
        JR C,L5DB0                               ; $5DA8
        JR NZ,L5DBB                              ; $5DAA
        INC DE                                   ; $5DAC
        INC HL                                   ; $5DAD
        DJNZ L5DA5                               ; $5DAE

L5DB0:
        LD HL,$E33D                              ; $5DB0
        LD DE,$E340                              ; $5DB3
        LD BC,$0003                              ; $5DB6
        LDIR                                     ; $5DB9

L5DBB:
        CALL L5DC0                               ; $5DBB
        POP BC                                   ; $5DBE
        RET                                      ; $5DBF

L5DC0:
        LD HL,$E33D                              ; $5DC0
        LD DE,$0022                              ; $5DC3
        CALL L5DD3                               ; $5DC6
        LD HL,$E340                              ; $5DC9
        LD DE,$002A                              ; $5DCC
        CALL L5DD3                               ; $5DCF
        RET                                      ; $5DD2

L5DD3:
        LD B,$03                                 ; $5DD3

L5DD5:
        CALL L5DDE                               ; $5DD5
        INC DE                                   ; $5DD8
        INC DE                                   ; $5DD9
        INC HL                                   ; $5DDA
        DJNZ L5DD5                               ; $5DDB
        RET                                      ; $5DDD

L5DDE:
        PUSH HL                                  ; $5DDE
        PUSH DE                                  ; $5DDF
        PUSH BC                                  ; $5DE0
        XOR A                                    ; $5DE1
        RLD                                      ; $5DE2
        LD B,A                                   ; $5DE4
        RLD                                      ; $5DE5
        LD C,A                                   ; $5DE7
        RLD                                      ; $5DE8
        EX DE,HL                                 ; $5DEA
        LD DE,($F3C7)                            ; $5DEB
        ADD HL,DE                                ; $5DEF
        LD A,B                                   ; $5DF0
        ADD A,$47                                ; $5DF1
        CALL CHGMOD                              ; $5DF3
        INC HL                                   ; $5DF6
        LD A,C                                   ; $5DF7
        ADD A,$47                                ; $5DF8
        CALL CHGMOD                              ; $5DFA
        POP BC                                   ; $5DFD
        POP DE                                   ; $5DFE
        POP HL                                   ; $5DFF
        RET                                      ; $5E00

L5E01:
        LD DE,($F3C7)                            ; $5E01
        LD HL,$0043                              ; $5E05
        ADD HL,DE                                ; $5E08
        LD DE,$E337                              ; $5E09
        LD C,$01                                 ; $5E0C
        LD B,$0E                                 ; $5E0E

L5E10:
        LD A,(DE)                                ; $5E10
        PUSH DE                                  ; $5E11
        PUSH HL                                  ; $5E12
        PUSH BC                                  ; $5E13
        LD L,A                                   ; $5E14
        LD H,$00                                 ; $5E15
        LD DE,$0005                              ; $5E17
        CALL L5CFC                               ; $5E1A
        POP BC                                   ; $5E1D
        LD D,L                                   ; $5E1E
        INC D                                    ; $5E1F
        INC E                                    ; $5E20
        POP HL                                   ; $5E21

L5E22:
        DEC D                                    ; $5E22
        JR Z,L5E2E                               ; $5E23
        LD A,C                                   ; $5E25
        CALL CHGMOD                              ; $5E26
        INC HL                                   ; $5E29
        DJNZ L5E22                               ; $5E2A
        JR L5E39                                 ; $5E2C

L5E2E:
        INC C                                    ; $5E2E

L5E2F:
        DEC E                                    ; $5E2F
        JR Z,L5E3B                               ; $5E30
        LD A,C                                   ; $5E32
        CALL CHGMOD                              ; $5E33
        INC HL                                   ; $5E36
        DJNZ L5E2F                               ; $5E37

L5E39:
        POP DE                                   ; $5E39
        RET                                      ; $5E3A

L5E3B:
        POP DE                                   ; $5E3B
        INC C                                    ; $5E3C
        INC DE                                   ; $5E3D
        LD A,C                                   ; $5E3E
        CP $0D                                   ; $5E3F
        JR NZ,L5E10                              ; $5E41

L5E43:
        XOR A                                    ; $5E43
        CALL CHGMOD                              ; $5E44
        INC HL                                   ; $5E47
        DJNZ L5E43                               ; $5E48
        RET                                      ; $5E4A

L5E4B:
        PUSH AF                                  ; $5E4B
        PUSH HL                                  ; $5E4C
        LD HL,$E336                              ; $5E4D
        LD A,(HL)                                ; $5E50
        CP $FF                                   ; $5E51
        JR Z,L5E59                               ; $5E53
        INC (HL)                                 ; $5E55
        CALL L5E5C                               ; $5E56

L5E59:
        POP HL                                   ; $5E59
        POP AF                                   ; $5E5A
        RET                                      ; $5E5B

L5E5C:
        LD DE,($F3C7)                            ; $5E5C
        LD HL,$0063                              ; $5E60
        ADD HL,DE                                ; $5E63
        LD A,($E336)                             ; $5E64
        OR A                                     ; $5E67
        RET Z                                    ; $5E68
        DEC A                                    ; $5E69
        CP $0E                                   ; $5E6A
        JR C,L5E70                               ; $5E6C
        LD A,$0E                                 ; $5E6E

L5E70:
        LD C,A                                   ; $5E70
        INC C                                    ; $5E71
        LD B,$0E                                 ; $5E72

L5E74:
        DEC C                                    ; $5E74
        JR Z,L5E43                               ; $5E75
        LD A,$0D                                 ; $5E77
        CALL CHGMOD                              ; $5E79
        INC HL                                   ; $5E7C
        DJNZ L5E74                               ; $5E7D
        RET                                      ; $5E7F

L5E80:
        PUSH HL                                  ; $5E80
        LD A,C                                   ; $5E81
        CP $1B                                   ; $5E82
        JR NC,L5EA3                              ; $5E84

L5E86:
        PUSH HL                                  ; $5E86
        ADD A,A                                  ; $5E87
        LD C,A                                   ; $5E88
        LD B,$00                                 ; $5E89
        LD HL,$7780                              ; $5E8B
        ADD HL,BC                                ; $5E8E

L5E8F:
        LD D,(HL)                                ; $5E8F
        INC HL                                   ; $5E90
        LD E,(HL)                                ; $5E91

L5E92:
        POP BC                                   ; $5E92
        CALL L49B6                               ; $5E93
        LD BC,$E496                              ; $5E96
        ADD HL,BC                                ; $5E99
        LD (HL),D                                ; $5E9A
        LD BC,$0258                              ; $5E9B
        ADD HL,BC                                ; $5E9E
        LD (HL),E                                ; $5E9F
        JP L5F18                                 ; $5EA0

L5EA3:
        CP $1F                                   ; $5EA3
        JR NC,L5EBF                              ; $5EA5
        SUB $1B                                  ; $5EA7

L5EA9:
        PUSH HL                                  ; $5EA9
        ADD A,A                                  ; $5EAA
        LD C,A                                   ; $5EAB
        LD B,$00                                 ; $5EAC
        LD HL,$77B6                              ; $5EAE
        ADD HL,BC                                ; $5EB1
        LD A,D                                   ; $5EB2
        LD E,(HL)                                ; $5EB3
        INC HL                                   ; $5EB4
        LD D,(HL)                                ; $5EB5
        EX DE,HL                                 ; $5EB6
        ADD A,A                                  ; $5EB7
        LD C,A                                   ; $5EB8
        LD B,$00                                 ; $5EB9
        ADD HL,BC                                ; $5EBB
        JP L5E8F                                 ; $5EBC

L5EBF:
        JR NZ,L5EC5                              ; $5EBF
        SUB $06                                  ; $5EC1
        JR L5E86                                 ; $5EC3

L5EC5:
        CP $30                                   ; $5EC5
        JR NC,L5ECE                              ; $5EC7
        LD A,$04                                 ; $5EC9
        JP L5EA9                                 ; $5ECB

L5ECE:
        CP $40                                   ; $5ECE
        JR NC,L5F0C                              ; $5ED0
        LD A,E                                   ; $5ED2
        ADD A,A                                  ; $5ED3
        ADD A,A                                  ; $5ED4
        ADD A,A                                  ; $5ED5
        LD E,A                                   ; $5ED6
        RES 7,E                                  ; $5ED7
        LD A,C                                   ; $5ED9
        CP $35                                   ; $5EDA
        JR NC,L5EE4                              ; $5EDC
        LD D,$A8                                 ; $5EDE

L5EE0:
        PUSH HL                                  ; $5EE0
        JP L5E92                                 ; $5EE1

L5EE4:
        JR NZ,L5EF5                              ; $5EE4
        LD A,D                                   ; $5EE6
        CP $02                                   ; $5EE7
        JR NC,L5EF1                              ; $5EE9
        SET 0,E                                  ; $5EEB
        LD D,$18                                 ; $5EED
        JR L5EE0                                 ; $5EEF

L5EF1:
        LD D,$A8                                 ; $5EF1
        JR L5EE0                                 ; $5EF3

L5EF5:
        SET 7,E                                  ; $5EF5
        CP $36                                   ; $5EF7
        JR NZ,L5F06                              ; $5EF9
        LD A,D                                   ; $5EFB
        CP $02                                   ; $5EFC
        JR NC,L5F06                              ; $5EFE
        SET 2,E                                  ; $5F00
        LD D,$38                                 ; $5F02
        JR L5EE0                                 ; $5F04

L5F06:
        SET 0,E                                  ; $5F06
        LD D,$38                                 ; $5F08
        JR L5EE0                                 ; $5F0A

L5F0C:
        CP $55                                   ; $5F0C
        JR NC,L5F14                              ; $5F0E
        LD D,$A0                                 ; $5F10
        JR L5EE0                                 ; $5F12

L5F14:
        LD D,$A2                                 ; $5F14
        JR L5EE0                                 ; $5F16

L5F18:
        POP HL                                   ; $5F18
        RET                                      ; $5F19

L5F1A:
        PUSH AF                                  ; $5F1A
        PUSH HL                                  ; $5F1B
        PUSH BC                                  ; $5F1C
        LD B,A                                   ; $5F1D
        CP $30                                   ; $5F1E
        JP C,L5FA6                               ; $5F20
        CP $36                                   ; $5F23
        JR NC,L5F62                              ; $5F25
        LD A,($E492)                             ; $5F27
        LD E,A                                   ; $5F2A
        INC A                                    ; $5F2B
        LD ($E492),A                             ; $5F2C
        LD D,$00                                 ; $5F2F
        PUSH HL                                  ; $5F31
        PUSH DE                                  ; $5F32
        PUSH BC                                  ; $5F33
        LD HL,$0005                              ; $5F34
        LD BC,$E386                              ; $5F37
        CALL L5D24                               ; $5F3A
        PUSH HL                                  ; $5F3D
        CALL L60AA                               ; $5F3E
        ADD HL,HL                                ; $5F41
        LD DE,$E0DF                              ; $5F42
        ADD HL,DE                                ; $5F45
        POP IX                                   ; $5F46
        POP BC                                   ; $5F48
        POP DE                                   ; $5F49
        LD A,E                                   ; $5F4A
        CALL L60EB                               ; $5F4B
        POP HL                                   ; $5F4E
        LD (IX+0),A                              ; $5F4F
        LD (IX+1),B                              ; $5F52
        LD (IX+2),H                              ; $5F55
        LD (IX+3),L                              ; $5F58
        LD (IX+4),$00                            ; $5F5B
        JP L5FDA                                 ; $5F5F

L5F62:
        LD A,($E494)                             ; $5F62
        LD E,A                                   ; $5F65
        INC A                                    ; $5F66
        LD ($E494),A                             ; $5F67
        LD D,$00                                 ; $5F6A
        PUSH HL                                  ; $5F6C
        PUSH DE                                  ; $5F6D
        PUSH BC                                  ; $5F6E
        LD HL,$0005                              ; $5F6F
        LD BC,$E416                              ; $5F72
        CALL L5D24                               ; $5F75
        PUSH HL                                  ; $5F78
        CALL L60AA                               ; $5F79
        LD DE,$E26F                              ; $5F7C
        ADD HL,DE                                ; $5F7F
        POP IX                                   ; $5F80
        POP BC                                   ; $5F82
        POP DE                                   ; $5F83
        LD A,E                                   ; $5F84
        CALL L60EB                               ; $5F85
        POP HL                                   ; $5F88
        LD (IX+0),A                              ; $5F89
        PUSH AF                                  ; $5F8C
        LD (IX+1),B                              ; $5F8D
        LD (IX+2),H                              ; $5F90
        LD (IX+3),L                              ; $5F93
        BIT 5,C                                  ; $5F96
        JR NZ,L5F9E                              ; $5F98
        LD A,$01                                 ; $5F9A
        JR L5FA0                                 ; $5F9C

L5F9E:
        LD A,$03                                 ; $5F9E

L5FA0:
        LD (IX+4),A                              ; $5FA0
        POP AF                                   ; $5FA3
        JR L5FDA                                 ; $5FA4

L5FA6:
        LD A,($E493)                             ; $5FA6
        LD E,A                                   ; $5FA9
        INC A                                    ; $5FAA
        LD ($E493),A                             ; $5FAB
        LD D,$00                                 ; $5FAE
        PUSH HL                                  ; $5FB0
        PUSH DE                                  ; $5FB1
        PUSH BC                                  ; $5FB2
        LD HL,$0004                              ; $5FB3
        LD BC,$E3D6                              ; $5FB6
        CALL L5D24                               ; $5FB9
        PUSH HL                                  ; $5FBC
        CALL L60AA                               ; $5FBD
        ADD HL,HL                                ; $5FC0
        LD DE,$E1A7                              ; $5FC1
        ADD HL,DE                                ; $5FC4
        POP IX                                   ; $5FC5
        POP BC                                   ; $5FC7
        POP DE                                   ; $5FC8
        LD A,E                                   ; $5FC9
        CALL L60EB                               ; $5FCA
        POP HL                                   ; $5FCD
        LD (IX+0),A                              ; $5FCE
        LD (IX+1),B                              ; $5FD1
        LD (IX+2),H                              ; $5FD4
        LD (IX+3),L                              ; $5FD7

L5FDA:
        POP BC                                   ; $5FDA
        POP HL                                   ; $5FDB
        LD B,A                                   ; $5FDC
        POP AF                                   ; $5FDD
        RET                                      ; $5FDE

L5FDF:
        PUSH HL                                  ; $5FDF
        PUSH DE                                  ; $5FE0
        PUSH DE                                  ; $5FE1
        LD A,($E491)                             ; $5FE2
        LD E,A                                   ; $5FE5
        INC A                                    ; $5FE6
        LD ($E491),A                             ; $5FE7
        LD D,$00                                 ; $5FEA
        PUSH HL                                  ; $5FEC
        PUSH HL                                  ; $5FED
        LD HL,$0004                              ; $5FEE
        LD BC,$E346                              ; $5FF1
        CALL L5D24                               ; $5FF4
        PUSH HL                                  ; $5FF7
        POP IX                                   ; $5FF8
        POP HL                                   ; $5FFA
        LD A,H                                   ; $5FFB
        CALL L601F                               ; $5FFC
        CALL L60EB                               ; $5FFF
        POP HL                                   ; $6002
        POP DE                                   ; $6003
        LD (IX+0),A                              ; $6004
        PUSH AF                                  ; $6007
        DEC E                                    ; $6008
        LD A,($EADF)                             ; $6009
        ADD A,A                                  ; $600C
        ADD A,A                                  ; $600D
        ADD A,A                                  ; $600E
        ADD A,A                                  ; $600F
        ADD A,E                                  ; $6010
        LD (IX+1),A                              ; $6011
        LD (IX+2),H                              ; $6014
        LD (IX+3),L                              ; $6017
        POP AF                                   ; $601A
        POP DE                                   ; $601B
        POP HL                                   ; $601C
        LD D,A                                   ; $601D
        RET                                      ; $601E

L601F:
        CP $00                                   ; $601F
        JR NZ,L602F                              ; $6021
        LD A,($E48E)                             ; $6023
        LD DE,$0000                              ; $6026
        INC A                                    ; $6029
        LD ($E48E),A                             ; $602A
        JR L6049                                 ; $602D

L602F:
        CP $1C                                   ; $602F
        JR NZ,L603F                              ; $6031
        LD A,($E48F)                             ; $6033
        LD DE,$0002                              ; $6036
        INC A                                    ; $6039
        LD ($E48F),A                             ; $603A
        JR L6049                                 ; $603D

L603F:
        LD A,($E490)                             ; $603F
        LD DE,$0001                              ; $6042
        INC A                                    ; $6045
        LD ($E490),A                             ; $6046

L6049:
        DEC A                                    ; $6049
        PUSH AF                                  ; $604A
        CALL L60CA                               ; $604B
        ADD HL,DE                                ; $604E
        LD DE,$E00D                              ; $604F
        ADD HL,DE                                ; $6052
        POP AF                                   ; $6053
        RET                                      ; $6054

L6055:
        PUSH AF                                  ; $6055
        PUSH HL                                  ; $6056
        PUSH DE                                  ; $6057
        PUSH BC                                  ; $6058
        PUSH AF                                  ; $6059
        PUSH DE                                  ; $605A
        LD A,($E495)                             ; $605B
        LD E,A                                   ; $605E
        INC A                                    ; $605F
        LD ($E495),A                             ; $6060
        LD D,$00                                 ; $6063
        PUSH HL                                  ; $6065
        LD HL,$0005                              ; $6066
        LD BC,$E43E                              ; $6069
        CALL L5D24                               ; $606C
        PUSH HL                                  ; $606F
        POP IX                                   ; $6070
        POP HL                                   ; $6072
        POP DE                                   ; $6073
        POP AF                                   ; $6074
        LD (IX+0),A                              ; $6075
        LD (IX+1),H                              ; $6078
        LD (IX+2),L                              ; $607B
        LD (IX+3),E                              ; $607E
        CP $0C                                   ; $6081
        JR NZ,L6089                              ; $6083
        LD A,$03                                 ; $6085
        JR L60A2                                 ; $6087

L6089:
        CP $0D                                   ; $6089
        JR NZ,L6091                              ; $608B
        LD A,$01                                 ; $608D
        JR L60A2                                 ; $608F

L6091:
        CP $1C                                   ; $6091
        JR NC,L6098                              ; $6093
        XOR A                                    ; $6095
        JR L60A2                                 ; $6096

L6098:
        CP $1F                                   ; $6098
        JR NC,L60A0                              ; $609A
        LD A,$04                                 ; $609C
        JR L60A2                                 ; $609E

L60A0:
        LD A,$01                                 ; $60A0

L60A2:
        LD (IX+4),A                              ; $60A2
        POP BC                                   ; $60A5
        POP DE                                   ; $60A6
        POP HL                                   ; $60A7
        POP AF                                   ; $60A8
        RET                                      ; $60A9

L60AA:
        PUSH DE                                  ; $60AA
        PUSH BC                                  ; $60AB
        LD A,($E320)                             ; $60AC
        LD C,A                                   ; $60AF
        SRL A                                    ; $60B0
        SRL A                                    ; $60B2
        SRL A                                    ; $60B4
        SRL A                                    ; $60B6
        LD E,A                                   ; $60B8
        LD D,$00                                 ; $60B9
        LD HL,$000A                              ; $60BB
        LD A,C                                   ; $60BE
        AND $0F                                  ; $60BF
        LD C,A                                   ; $60C1
        LD B,$00                                 ; $60C2
        CALL L5D24                               ; $60C4
        POP BC                                   ; $60C7
        POP DE                                   ; $60C8
        RET                                      ; $60C9

L60CA:
        PUSH DE                                  ; $60CA
        PUSH BC                                  ; $60CB
        LD A,($E320)                             ; $60CC
        LD C,A                                   ; $60CF
        SRL A                                    ; $60D0
        SRL A                                    ; $60D2
        SRL A                                    ; $60D4
        SRL A                                    ; $60D6
        LD L,A                                   ; $60D8
        LD H,$00                                 ; $60D9
        LD DE,$0015                              ; $60DB
        LD A,C                                   ; $60DE
        AND $0F                                  ; $60DF
        ADD A,A                                  ; $60E1
        LD C,A                                   ; $60E2
        LD B,$00                                 ; $60E3
        CALL L5D24                               ; $60E5
        POP BC                                   ; $60E8
        POP DE                                   ; $60E9
        RET                                      ; $60EA

L60EB:
        PUSH HL                                  ; $60EB
        PUSH DE                                  ; $60EC
        PUSH BC                                  ; $60ED
        CALL L6100                               ; $60EE
        INC B                                    ; $60F1
        LD A,(HL)                                ; $60F2

L60F3:
        RLA                                      ; $60F3
        DJNZ L60F3                               ; $60F4
        LD A,$00                                 ; $60F6
        JR NC,L60FC                              ; $60F8
        LD A,$01                                 ; $60FA

L60FC:
        POP BC                                   ; $60FC
        POP DE                                   ; $60FD
        POP HL                                   ; $60FE
        RET                                      ; $60FF

L6100:
        LD B,A                                   ; $6100
        SRL A                                    ; $6101
        SRL A                                    ; $6103
        SRL A                                    ; $6105
        LD E,A                                   ; $6107
        LD D,$00                                 ; $6108
        ADD HL,DE                                ; $610A
        LD A,B                                   ; $610B
        AND $07                                  ; $610C
        LD B,A                                   ; $610E
        RET                                      ; $610F

L6110:
        PUSH HL                                  ; $6110
        PUSH DE                                  ; $6111
        PUSH BC                                  ; $6112
        CALL L6100                               ; $6113
        LD A,$08                                 ; $6116
        SUB B                                    ; $6118
        LD B,A                                   ; $6119
        LD A,C                                   ; $611A
        OR A                                     ; $611B
        JR Z,L6127                               ; $611C
        RRA                                      ; $611E

L611F:
        RLA                                      ; $611F
        DJNZ L611F                               ; $6120
        LD C,(HL)                                ; $6122
        OR C                                     ; $6123
        LD (HL),A                                ; $6124
        JR L6130                                 ; $6125

L6127:
        LD A,$FE                                 ; $6127
        RRA                                      ; $6129

L612A:
        RLA                                      ; $612A
        DJNZ L612A                               ; $612B
        LD C,(HL)                                ; $612D
        AND C                                    ; $612E
        LD (HL),A                                ; $612F

L6130:
        POP BC                                   ; $6130
        POP DE                                   ; $6131
        POP HL                                   ; $6132
        RET                                      ; $6133

L6134:
        XOR A                                    ; $6134
        LD ($E48E),A                             ; $6135
        LD ($E48F),A                             ; $6138
        LD ($E490),A                             ; $613B
        LD HL,$E346                              ; $613E
        LD DE,$0004                              ; $6141
        LD A,($E491)                             ; $6144
        OR A                                     ; $6147
        JR Z,L615E                               ; $6148
        LD B,A                                   ; $614A

L614B:
        PUSH HL                                  ; $614B
        PUSH DE                                  ; $614C
        PUSH BC                                  ; $614D
        LD C,(HL)                                ; $614E
        INC HL                                   ; $614F
        INC HL                                   ; $6150
        LD A,(HL)                                ; $6151
        CALL L601F                               ; $6152
        CALL L6110                               ; $6155
        POP BC                                   ; $6158
        POP DE                                   ; $6159
        POP HL                                   ; $615A
        ADD HL,DE                                ; $615B
        DJNZ L614B                               ; $615C

L615E:
        LD HL,$E386                              ; $615E
        LD DE,$0005                              ; $6161
        LD A,($E492)                             ; $6164
        OR A                                     ; $6167
        JR Z,L618C                               ; $6168
        LD B,A                                   ; $616A
        XOR A                                    ; $616B
        LD ($E492),A                             ; $616C

L616F:
        PUSH HL                                  ; $616F
        PUSH DE                                  ; $6170
        PUSH BC                                  ; $6171
        LD C,(HL)                                ; $6172
        CALL L60AA                               ; $6173
        ADD HL,HL                                ; $6176
        LD DE,$E0DF                              ; $6177
        ADD HL,DE                                ; $617A
        LD A,($E492)                             ; $617B
        INC A                                    ; $617E
        LD ($E492),A                             ; $617F
        DEC A                                    ; $6182
        CALL L6110                               ; $6183
        POP BC                                   ; $6186
        POP DE                                   ; $6187
        POP HL                                   ; $6188
        ADD HL,DE                                ; $6189
        DJNZ L616F                               ; $618A

L618C:
        LD HL,$E3D6                              ; $618C
        LD DE,$0004                              ; $618F
        LD A,($E493)                             ; $6192
        OR A                                     ; $6195
        JR Z,L61BA                               ; $6196
        LD B,A                                   ; $6198
        XOR A                                    ; $6199
        LD ($E493),A                             ; $619A

L619D:
        PUSH HL                                  ; $619D
        PUSH DE                                  ; $619E
        PUSH BC                                  ; $619F
        LD C,(HL)                                ; $61A0
        CALL L60AA                               ; $61A1
        ADD HL,HL                                ; $61A4
        LD DE,$E1A7                              ; $61A5
        ADD HL,DE                                ; $61A8
        LD A,($E493)                             ; $61A9
        INC A                                    ; $61AC
        LD ($E493),A                             ; $61AD
        DEC A                                    ; $61B0
        CALL L6110                               ; $61B1
        POP BC                                   ; $61B4
        POP DE                                   ; $61B5
        POP HL                                   ; $61B6
        ADD HL,DE                                ; $61B7
        DJNZ L619D                               ; $61B8

L61BA:
        LD HL,$E416                              ; $61BA
        LD DE,$0005                              ; $61BD
        LD A,($E494)                             ; $61C0
        OR A                                     ; $61C3
        JR Z,L61E7                               ; $61C4
        LD B,A                                   ; $61C6
        XOR A                                    ; $61C7
        LD ($E494),A                             ; $61C8

L61CB:
        PUSH HL                                  ; $61CB
        PUSH DE                                  ; $61CC
        PUSH BC                                  ; $61CD
        LD C,(HL)                                ; $61CE
        CALL L60AA                               ; $61CF
        LD DE,$E26F                              ; $61D2
        ADD HL,DE                                ; $61D5
        LD A,($E494)                             ; $61D6
        INC A                                    ; $61D9
        LD ($E494),A                             ; $61DA
        DEC A                                    ; $61DD
        CALL L6110                               ; $61DE
        POP BC                                   ; $61E1
        POP DE                                   ; $61E2
        POP HL                                   ; $61E3
        ADD HL,DE                                ; $61E4
        DJNZ L61CB                               ; $61E5

L61E7:
        RET                                      ; $61E7

L61E8:
        CALL L60AA                               ; $61E8
        LD A,L                                   ; $61EB
        LD C,$01                                 ; $61EC
        LD HL,$E000                              ; $61EE
        CALL L6110                               ; $61F1
        RET                                      ; $61F4

L61F5:
        PUSH AF                                  ; $61F5
        PUSH HL                                  ; $61F6
        PUSH DE                                  ; $61F7
        PUSH BC                                  ; $61F8
        BIT 0,C                                  ; $61F9
        JR Z,L6237                               ; $61FB
        LD E,C                                   ; $61FD
        LD B,H                                   ; $61FE
        LD C,L                                   ; $61FF
        CALL L5D5D                               ; $6200
        JR NZ,L621B                              ; $6203
        DEC C                                    ; $6205
        CALL L4A38                               ; $6206
        JR Z,L6211                               ; $6209
        AND $10                                  ; $620B
        JR Z,L6211                               ; $620D
        JR L621B                                 ; $620F

L6211:
        INC B                                    ; $6211
        CALL L4A38                               ; $6212
        JR Z,L6237                               ; $6215
        AND $10                                  ; $6217
        JR Z,L6237                               ; $6219

L621B:
        LD C,$04                                 ; $621B
        BIT 1,E                                  ; $621D
        JR NZ,L6223                              ; $621F
        LD C,$0C                                 ; $6221

L6223:
        LD HL,$E43E                              ; $6223
        LD DE,$0005                              ; $6226
        LD B,$10                                 ; $6229

L622B:
        LD A,(HL)                                ; $622B
        CP $1B                                   ; $622C
        JR NZ,L6234                              ; $622E
        LD A,C                                   ; $6230
        CALL L735F                               ; $6231

L6234:
        ADD HL,DE                                ; $6234
        DJNZ L622B                               ; $6235

L6237:
        POP BC                                   ; $6237
        POP DE                                   ; $6238
        POP HL                                   ; $6239
        POP AF                                   ; $623A
        RET                                      ; $623B

L623C:
        LD HL,$EAF9                              ; $623C
        LD A,(HL)                                ; $623F
        OR A                                     ; $6240
        JR Z,L6252                               ; $6241
        DEC A                                    ; $6243
        LD (HL),A                                ; $6244
        OR A                                     ; $6245
        JR NZ,L6252                              ; $6246
        LD HL,$0000                              ; $6248
        LD A,$3F                                 ; $624B
        LD B,$0D                                 ; $624D
        CALL L6EE1                               ; $624F

L6252:
        LD A,($EAC9)                             ; $6252
        AND $0F                                  ; $6255
        RET NZ                                   ; $6257
        LD HL,$E343                              ; $6258
        CALL L6265                               ; $625B
        LD HL,$E344                              ; $625E
        CALL L6265                               ; $6261
        RET                                      ; $6264

L6265:
        LD A,(HL)                                ; $6265
        OR A                                     ; $6266
        RET Z                                    ; $6267
        DEC A                                    ; $6268
        LD (HL),A                                ; $6269
        CP $06                                   ; $626A
        RET NC                                   ; $626C
        OR A                                     ; $626D
        JR Z,L627B                               ; $626E
        LD A,$05                                 ; $6270
        LD ($EAF2),A                             ; $6272
        LD A,$FF                                 ; $6275
        LD ($EAF4),A                             ; $6277
        RET                                      ; $627A

L627B:
        LD HL,$78D2                              ; $627B
        LD DE,$7916                              ; $627E

L6281:
        XOR A                                    ; $6281
        LD ($EAF2),A                             ; $6282
        LD ($EAF4),A                             ; $6285
        CALL L7769                               ; $6288
        RET                                      ; $628B

L628C:
        PUSH HL                                  ; $628C
        PUSH BC                                  ; $628D

L628E:
        PUSH HL                                  ; $628E
        CALL L6AEF                               ; $628F
        XOR A                                    ; $6292
        CALL CHGMOD                              ; $6293
        POP HL                                   ; $6296
        INC H                                    ; $6297
        DJNZ L628E                               ; $6298
        POP BC                                   ; $629A
        POP HL                                   ; $629B
        RET                                      ; $629C

L629D:
        PUSH HL                                  ; $629D
        PUSH DE                                  ; $629E
        PUSH BC                                  ; $629F

L62A0:
        LD A,(DE)                                ; $62A0
        CP $40                                   ; $62A1
        JR Z,L62AC                               ; $62A3
        CALL L62B0                               ; $62A5
        INC DE                                   ; $62A8
        INC H                                    ; $62A9
        JR L62A0                                 ; $62AA

L62AC:
        POP BC                                   ; $62AC
        POP DE                                   ; $62AD
        POP HL                                   ; $62AE
        RET                                      ; $62AF

L62B0:
        CP $20                                   ; $62B0
        JR NZ,L62B7                              ; $62B2
        XOR A                                    ; $62B4
        JR L62C2                                 ; $62B5

L62B7:
        CP $3A                                   ; $62B7
        JR NC,L62BF                              ; $62B9
        SUB $30                                  ; $62BB
        ADD A,$5D                                ; $62BD

L62BF:
        SUB $41                                  ; $62BF
        ADD A,C                                  ; $62C1

L62C2:
        PUSH HL                                  ; $62C2
        PUSH DE                                  ; $62C3
        PUSH BC                                  ; $62C4
        CALL L6AEF                               ; $62C5
        CALL CHGMOD                              ; $62C8
        LD A,B                                   ; $62CB
        OR A                                     ; $62CC
        JR Z,L62D4                               ; $62CD

L62CF:
        CALL L5128                               ; $62CF
        DJNZ L62CF                               ; $62D2

L62D4:
        POP BC                                   ; $62D4
        POP DE                                   ; $62D5
        POP HL                                   ; $62D6
        RET                                      ; $62D7

L62D8:
        LD A,($EAE4)                             ; $62D8
        OR A                                     ; $62DB
        JR Z,L62FA                               ; $62DC
        LD A,$06                                 ; $62DE
        LD ($EAF3),A                             ; $62E0
        LD HL,$EACD                              ; $62E3
        LD B,$09                                 ; $62E6

L62E8:
        LD A,(HL)                                ; $62E8
        CP $FF                                   ; $62E9
        JR NZ,L62F1                              ; $62EB
        INC HL                                   ; $62ED
        DJNZ L62E8                               ; $62EE
        RET                                      ; $62F0

L62F1:
        XOR A                                    ; $62F1
        LD ($EAE4),A                             ; $62F2
        INC A                                    ; $62F5
        LD ($EAE3),A                             ; $62F6
        RET                                      ; $62F9

L62FA:
        LD A,($EAD3)                             ; $62FA
        LD C,A                                   ; $62FD
        CALL L5D5D                               ; $62FE
        JR Z,L6318                               ; $6301
        BIT 5,C                                  ; $6303
        JR NZ,L630C                              ; $6305
        LD A,$01                                 ; $6307
        LD ($EAE0),A                             ; $6309

L630C:
        BIT 6,C                                  ; $630C
        JR NZ,L6318                              ; $630E
        LD A,$01                                 ; $6310
        LD ($E324),A                             ; $6312
        LD ($EAE0),A                             ; $6315

L6318:
        BIT 1,C                                  ; $6318
        JR NZ,L6330                              ; $631A
        BIT 2,C                                  ; $631C
        JR NZ,L6328                              ; $631E
        LD A,$01                                 ; $6320
        LD D,$0C                                 ; $6322
        LD E,$02                                 ; $6324
        JR L6336                                 ; $6326

L6328:
        LD A,$30                                 ; $6328
        LD D,$07                                 ; $632A
        LD E,$04                                 ; $632C
        JR L6336                                 ; $632E

L6330:
        LD A,$70                                 ; $6330
        LD D,$00                                 ; $6332
        LD E,$06                                 ; $6334

L6336:
        BIT 3,C                                  ; $6336
        JR NZ,L633C                              ; $6338
        LD E,$00                                 ; $633A

L633C:
        LD ($EACA),A                             ; $633C
        LD A,D                                   ; $633F
        LD ($EAF1),A                             ; $6340
        LD A,E                                   ; $6343
        LD ($EAF3),A                             ; $6344
        LD A,($EAD4)                             ; $6347
        LD C,A                                   ; $634A
        PUSH BC                                  ; $634B
        BIT 0,C                                  ; $634C
        CALL Z,L4F93                             ; $634E
        POP BC                                   ; $6351
        BIT 1,C                                  ; $6352
        CALL Z,L6358                             ; $6354
        RET                                      ; $6357

L6358:
        PUSH BC                                  ; $6358
        LD A,($EAE4)                             ; $6359
        OR A                                     ; $635C
        JR NZ,L6381                              ; $635D
        XOR A                                    ; $635F
        LD ($EAF3),A                             ; $6360
        CALL L5128                               ; $6363
        XOR A                                    ; $6366
        LD ($EACB),A                             ; $6367
        LD ($EACC),A                             ; $636A
        CALL L6383                               ; $636D

L6370:
        CALL L5128                               ; $6370
        JR NZ,L6381                              ; $6373
        LD A,($EACB)                             ; $6375
        OR A                                     ; $6378
        JR NZ,L6381                              ; $6379
        LD A,($EACC)                             ; $637B
        OR A                                     ; $637E
        JR Z,L6370                               ; $637F

L6381:
        POP BC                                   ; $6381
        RET                                      ; $6382

L6383:
        LD HL,$EACD                              ; $6383
        LD B,$09                                 ; $6386

L6388:
        LD (HL),$FF                              ; $6388
        INC HL                                   ; $638A
        DJNZ L6388                               ; $638B
        RET                                      ; $638D

L638E:
        LD A,$02                                 ; $638E
        LD HL,$90FF                              ; $6390
        LD B,$00                                 ; $6393
        LD C,$2F                                 ; $6395

L6397:
        PUSH AF                                  ; $6397
        PUSH HL                                  ; $6398
        LD DE,$1000                              ; $6399
        LD A,C                                   ; $639C
        CALL L6EE1                               ; $639D
        ADD HL,DE                                ; $63A0
        LD A,C                                   ; $63A1
        INC B                                    ; $63A2
        CALL L6EE1                               ; $63A3
        ADD HL,DE                                ; $63A6
        INC C                                    ; $63A7
        LD A,C                                   ; $63A8
        INC B                                    ; $63A9
        CALL L6EE1                               ; $63AA
        POP HL                                   ; $63AD
        LD DE,$FF10                              ; $63AE
        ADD HL,DE                                ; $63B1
        INC B                                    ; $63B2
        INC C                                    ; $63B3
        POP AF                                   ; $63B4
        DEC A                                    ; $63B5
        JR NZ,L6397                              ; $63B6
        LD HL,$0000                              ; $63B8

L63BB:
        PUSH HL                                  ; $63BB

L63BC:
        PUSH HL                                  ; $63BC
        LD C,H                                   ; $63BD
        LD B,$00                                 ; $63BE
        LD H,$00                                 ; $63C0
        LD DE,$000A                              ; $63C2
        CALL L5D24                               ; $63C5
        LD A,L                                   ; $63C8
        LD HL,$E000                              ; $63C9
        CALL L60EB                               ; $63CC
        POP HL                                   ; $63CF
        LD C,$04                                 ; $63D0
        OR A                                     ; $63D2
        JR Z,L63D7                               ; $63D3
        LD C,$07                                 ; $63D5

L63D7:
        CALL L640F                               ; $63D7
        INC H                                    ; $63DA
        LD A,H                                   ; $63DB
        CP $0A                                   ; $63DC
        JR NZ,L63BC                              ; $63DE
        POP HL                                   ; $63E0
        INC L                                    ; $63E1
        LD A,L                                   ; $63E2
        CP $0A                                   ; $63E3
        JR NZ,L63BB                              ; $63E5
        LD A,($E320)                             ; $63E7
        LD C,$0F                                 ; $63EA
        CALL L63FD                               ; $63EC
        LD A,($E321)                             ; $63EF
        BIT 1,A                                  ; $63F2
        RET Z                                    ; $63F4
        LD A,$09                                 ; $63F5
        LD C,$09                                 ; $63F7
        CALL L63FD                               ; $63F9
        RET                                      ; $63FC

L63FD:
        PUSH HL                                  ; $63FD
        LD L,A                                   ; $63FE
        SRL L                                    ; $63FF
        SRL L                                    ; $6401
        SRL L                                    ; $6403
        SRL L                                    ; $6405
        AND $0F                                  ; $6407
        LD H,A                                   ; $6409
        CALL L640F                               ; $640A
        POP HL                                   ; $640D
        RET                                      ; $640E

L640F:
        PUSH HL                                  ; $640F
        PUSH BC                                  ; $6410
        LD A,L                                   ; $6411
        ADD A,A                                  ; $6412
        ADD A,L                                  ; $6413
        ADD A,$02                                ; $6414
        LD L,A                                   ; $6416
        LD B,$02                                 ; $6417

L6419:
        PUSH HL                                  ; $6419
        PUSH BC                                  ; $641A
        PUSH BC                                  ; $641B
        LD A,H                                   ; $641C
        LD C,A                                   ; $641D
        SRL A                                    ; $641E
        ADD A,$0F                                ; $6420
        LD H,A                                   ; $6422
        LD A,L                                   ; $6423
        AND $07                                  ; $6424
        LD E,A                                   ; $6426
        LD D,$00                                 ; $6427
        SRL L                                    ; $6429
        SRL L                                    ; $642B
        SRL L                                    ; $642D
        LD A,L                                   ; $642F
        ADD A,A                                  ; $6430
        ADD A,L                                  ; $6431
        ADD A,A                                  ; $6432
        ADD A,L                                  ; $6433
        ADD A,H                                  ; $6434
        LD L,A                                   ; $6435
        LD H,$00                                 ; $6436
        ADD HL,HL                                ; $6438
        ADD HL,HL                                ; $6439
        ADD HL,HL                                ; $643A
        ADD HL,DE                                ; $643B
        LD DE,($F3C9)                            ; $643C
        ADD HL,DE                                ; $6440
        LD A,C                                   ; $6441
        POP BC                                   ; $6442
        BIT 0,A                                  ; $6443
        JR NZ,L6456                              ; $6445
        SLA C                                    ; $6447
        SLA C                                    ; $6449
        SLA C                                    ; $644B
        SLA C                                    ; $644D
        CALL LDIRMV                              ; $644F
        AND $0F                                  ; $6452
        JR L645B                                 ; $6454

L6456:
        CALL LDIRMV                              ; $6456
        AND $F0                                  ; $6459

L645B:
        OR C                                     ; $645B
        CALL CHGMOD                              ; $645C
        POP BC                                   ; $645F
        POP HL                                   ; $6460
        INC L                                    ; $6461
        DJNZ L6419                               ; $6462
        POP BC                                   ; $6464
        POP HL                                   ; $6465
        RET                                      ; $6466
        DB $47,$41,$4D,$45,$20,$20,$4F,$56,$45,$52,$40,$4E,$20,$4F,$40,$4D ; $6467 | GAME  OVER@N O@M
        DB $41,$50,$40,$4C,$4F,$41,$44,$40,$53,$41,$56,$45,$40,$47,$41,$4D ; $6477 | AP@LOAD@SAVE@GAM
        DB $45,$40,$59,$20,$4F,$52,$20,$4E,$40,$00,$08,$00,$04,$00,$02,$00 ; $6487 | E@Y OR N@.......
        DB $04,$00,$02,$00,$01,$50,$00,$20,$00,$10,$00,$3A,$39,$38,$39,$38 ; $6497 | .....P. ...:9898
        DB $37,$36,$35,$34                          ; $64A7 | 7654

L64AB:
        PUSH HL                                  ; $64AB
        PUSH BC                                  ; $64AC
        PUSH DE                                  ; $64AD
        LD E,(HL)                                ; $64AE
        INC HL                                   ; $64AF
        LD D,(HL)                                ; $64B0
        POP HL                                   ; $64B1

L64B2:
        PUSH HL                                  ; $64B2
        ADD HL,HL                                ; $64B3
        ADD HL,HL                                ; $64B4
        ADD HL,HL                                ; $64B5
        CALL L6CD9                               ; $64B6
        POP HL                                   ; $64B9
        INC HL                                   ; $64BA
        DJNZ L64B2                               ; $64BB
        EX DE,HL                                 ; $64BD
        POP BC                                   ; $64BE
        POP HL                                   ; $64BF
        INC HL                                   ; $64C0
        INC HL                                   ; $64C1
        RET                                      ; $64C2

L64C3:
        PUSH BC                                  ; $64C3
        PUSH HL                                  ; $64C4

L64C5:
        PUSH AF                                  ; $64C5
        PUSH HL                                  ; $64C6
        CALL L6AEF                               ; $64C7
        CALL CHGMOD                              ; $64CA
        POP HL                                   ; $64CD
        POP AF                                   ; $64CE
        OR A                                     ; $64CF
        JR Z,L64D3                               ; $64D0
        INC A                                    ; $64D2

L64D3:
        INC H                                    ; $64D3
        DJNZ L64C5                               ; $64D4
        POP HL                                   ; $64D6
        POP BC                                   ; $64D7
        INC L                                    ; $64D8
        DEC C                                    ; $64D9
        JR NZ,L64C3                              ; $64DA
        RET                                      ; $64DC

L64DD:
        XOR A                                    ; $64DD
        LD ($EAF3),A                             ; $64DE
        CALL L5327                               ; $64E1
        CALL L659B                               ; $64E4
        LD HL,$7BDA                              ; $64E7
        LD E,(HL)                                ; $64EA
        INC HL                                   ; $64EB
        LD D,(HL)                                ; $64EC
        LD HL,$0000                              ; $64ED
        PUSH DE                                  ; $64F0
        CALL L6CD9                               ; $64F1
        POP DE                                   ; $64F4
        LD HL,$0800                              ; $64F5
        PUSH DE                                  ; $64F8
        CALL L6CD9                               ; $64F9
        POP DE                                   ; $64FC
        LD HL,$1000                              ; $64FD
        CALL L6CD9                               ; $6500
        CALL L65C4                               ; $6503
        LD HL,$0000                              ; $6506
        LD B,$0B                                 ; $6509
        LD A,$3F                                 ; $650B
        CALL L6EE1                               ; $650D
        LD B,$0D                                 ; $6510
        LD A,$3F                                 ; $6512
        CALL L6EE1                               ; $6514
        LD BC,$0011                              ; $6517
        LD HL,$E322                              ; $651A
        LD DE,$E334                              ; $651D
        LDIR                                     ; $6520
        CALL L5DC0                               ; $6522
        CALL L5E01                               ; $6525
        CALL L5E5C                               ; $6528
        LD A,($E320)                             ; $652B
        LD E,A                                   ; $652E
        AND $0F                                  ; $652F
        ADD A,A                                  ; $6531
        ADD A,A                                  ; $6532
        LD C,A                                   ; $6533
        LD B,$00                                 ; $6534
        SRL E                                    ; $6536
        SRL E                                    ; $6538
        SRL E                                    ; $653A
        SRL E                                    ; $653C
        LD D,$00                                 ; $653E
        LD HL,$002A                              ; $6540
        CALL L5D24                               ; $6543
        PUSH HL                                  ; $6546
        CALL L65E1                               ; $6547
        CALL L65FA                               ; $654A
        POP HL                                   ; $654D
        INC HL                                   ; $654E
        INC HL                                   ; $654F
        INC HL                                   ; $6550
        INC HL                                   ; $6551
        PUSH HL                                  ; $6552
        CALL L65E1                               ; $6553
        CALL L660E                               ; $6556
        POP HL                                   ; $6559
        DEC HL                                   ; $655A
        DEC HL                                   ; $655B
        CALL L65E1                               ; $655C
        CALL L6671                               ; $655F
        CALL L6F45                               ; $6562
        LD A,($E333)                             ; $6565
        CALL L6F27                               ; $6568
        LD A,($E343)                             ; $656B
        OR A                                     ; $656E
        JR Z,L6579                               ; $656F
        LD HL,$79B7                              ; $6571
        LD DE,$79DE                              ; $6574
        JR L658D                                 ; $6577

L6579:
        LD A,($E344)                             ; $6579
        OR A                                     ; $657C
        JR Z,L6587                               ; $657D
        LD HL,$7964                              ; $657F
        LD DE,$7993                              ; $6582
        JR L658D                                 ; $6585

L6587:
        LD HL,$78D2                              ; $6587
        LD DE,$7916                              ; $658A

L658D:
        CALL L7769                               ; $658D
        XOR A                                    ; $6590
        LD ($EAF6),A                             ; $6591
        LD ($EAF7),A                             ; $6594
        LD ($EAF8),A                             ; $6597
        RET                                      ; $659A

L659B:
        LD HL,$E946                              ; $659B
        LD DE,$E947                              ; $659E
        LD BC,$011F                              ; $65A1
        LD (HL),$00                              ; $65A4
        LDIR                                     ; $65A6
        LD HL,$E346                              ; $65A8
        LD DE,$E347                              ; $65AB
        LD BC,$014F                              ; $65AE
        LD (HL),$00                              ; $65B1
        LDIR                                     ; $65B3
        LD A,$72                                 ; $65B5
        LD ($EA66),A                             ; $65B7
        LD A,$1A                                 ; $65BA
        LD ($EA67),A                             ; $65BC
        XOR A                                    ; $65BF
        LD ($EA68),A                             ; $65C0
        RET                                      ; $65C3

L65C4:
        LD DE,($F3C7)                            ; $65C4
        LD HL,$0080                              ; $65C8
        ADD HL,DE                                ; $65CB
        XOR A                                    ; $65CC
        LD BC,$0280                              ; $65CD
        CALL CLRSPR                              ; $65D0
        LD HL,$E496                              ; $65D3
        LD DE,$E497                              ; $65D6
        LD BC,$04AF                              ; $65D9
        LD (HL),$00                              ; $65DC
        LDIR                                     ; $65DE
        RET                                      ; $65E0

L65E1:
        PUSH DE                                  ; $65E1
        PUSH HL                                  ; $65E2
        LD DE,($EAD7)                            ; $65E3
        ADD HL,DE                                ; $65E7
        LD E,(HL)                                ; $65E8
        INC HL                                   ; $65E9
        LD D,(HL)                                ; $65EA
        POP HL                                   ; $65EB
        LD A,D                                   ; $65EC
        OR E                                     ; $65ED
        JR NZ,L65F7                              ; $65EE
        LD DE,$7CF2                              ; $65F0
        ADD HL,DE                                ; $65F3
        LD E,(HL)                                ; $65F4
        INC HL                                   ; $65F5
        LD D,(HL)                                ; $65F6

L65F7:
        EX DE,HL                                 ; $65F7
        POP DE                                   ; $65F8
        RET                                      ; $65F9

L65FA:
        XOR A                                    ; $65FA
        LD ($EADB),A                             ; $65FB

L65FE:
        LD ($EADC),A                             ; $65FE
        LD ($EAD9),HL                            ; $6601
        LD HL,$0000                              ; $6604
        LD ($EADD),HL                            ; $6607
        CALL L6616                               ; $660A
        RET                                      ; $660D

L660E:
        LD A,$1C                                 ; $660E
        LD ($EADB),A                             ; $6610
        XOR A                                    ; $6613
        JR L65FE                                 ; $6614

L6616:
        LD HL,($EAD9)                            ; $6616
        LD A,(HL)                                ; $6619
        LD C,A                                   ; $661A
        AND $07                                  ; $661B
        INC A                                    ; $661D
        LD E,A                                   ; $661E
        LD D,$00                                 ; $661F
        CP $08                                   ; $6621
        CALL Z,L6998                             ; $6623
        LD ($EADD),DE                            ; $6626
        LD HL,($EAD9)                            ; $662A
        INC HL                                   ; $662D
        LD ($EAD9),HL                            ; $662E
        LD A,C                                   ; $6631
        SRL A                                    ; $6632
        SRL A                                    ; $6634
        SRL A                                    ; $6636
        LD C,A                                   ; $6638
        CP $07                                   ; $6639
        JR NZ,L6648                              ; $663B
        LD A,($EADB)                             ; $663D
        CP $1C                                   ; $6640
        JR NZ,L6655                              ; $6642
        LD C,$08                                 ; $6644
        JR L6655                                 ; $6646

L6648:
        CP $08                                   ; $6648
        JR NZ,L6655                              ; $664A
        LD A,($EADB)                             ; $664C
        CP $00                                   ; $664F
        JR NZ,L6655                              ; $6651
        LD C,$07                                 ; $6653

L6655:
        LD A,C                                   ; $6655
        CALL L6664                               ; $6656
        LD A,($EADB)                             ; $6659
        CP $02                                   ; $665C
        RET Z                                    ; $665E
        CP $1E                                   ; $665F
        RET Z                                    ; $6661
        JR L6616                                 ; $6662

L6664:
        OR A                                     ; $6664
        JR Z,L666C                               ; $6665
        CP $10                                   ; $6667
        JP C,L6774                               ; $6669

L666C:
        AND $0F                                  ; $666C
        JP L66B0                                 ; $666E

L6671:
        LD A,$02                                 ; $6671
        LD ($EADB),A                             ; $6673
        XOR A                                    ; $6676
        LD ($EADC),A                             ; $6677
        LD ($EAD9),HL                            ; $667A
        LD HL,$0000                              ; $667D
        LD ($EADD),HL                            ; $6680
        CALL L66A2                               ; $6683
        LD A,$02                                 ; $6686
        LD ($EADB),A                             ; $6688
        XOR A                                    ; $668B
        LD ($EADC),A                             ; $668C
        LD HL,$0000                              ; $668F
        LD ($EADD),HL                            ; $6692
        CALL L6766                               ; $6695
        LD HL,$0000                              ; $6698
        LD ($EADD),HL                            ; $669B
        CALL L69AA                               ; $669E
        RET                                      ; $66A1

L66A2:
        CALL L6973                               ; $66A2
        CALL L66B0                               ; $66A5
        LD A,($EADC)                             ; $66A8
        CP $14                                   ; $66AB
        RET Z                                    ; $66AD
        JR L66A2                                 ; $66AE

L66B0:
        LD C,A                                   ; $66B0
        LD A,($EADB)                             ; $66B1
        LD H,A                                   ; $66B4
        LD A,($EADC)                             ; $66B5
        LD L,A                                   ; $66B8
        LD DE,($EADD)                            ; $66B9
        LD A,C                                   ; $66BD
        CP $0C                                   ; $66BE
        JR C,L66C9                               ; $66C0
        CP $0E                                   ; $66C2
        JR Z,L66C9                               ; $66C4
        CALL L6055                               ; $66C6

L66C9:
        OR A                                     ; $66C9
        JR NZ,L66E0                              ; $66CA
        LD C,$00                                 ; $66CC

L66CE:
        PUSH DE                                  ; $66CE
        LD A,C                                   ; $66CF
        OR A                                     ; $66D0
        CALL NZ,L6888                            ; $66D1
        CALL L6A3A                               ; $66D4
        POP DE                                   ; $66D7
        DEC DE                                   ; $66D8
        LD A,D                                   ; $66D9
        OR E                                     ; $66DA
        JR NZ,L66CE                              ; $66DB
        JP L6765                                 ; $66DD

L66E0:
        CP $04                                   ; $66E0
        JR NC,L6705                              ; $66E2
        LD ($EADF),A                             ; $66E4

L66E7:
        PUSH DE                                  ; $66E7
        LD A,L                                   ; $66E8
        AND $01                                  ; $66E9
        LD D,A                                   ; $66EB
        CALL L6A7C                               ; $66EC
        INC H                                    ; $66EF
        LD A,L                                   ; $66F0
        AND $01                                  ; $66F1
        XOR $01                                  ; $66F3
        LD D,A                                   ; $66F5
        CALL L6A7C                               ; $66F6
        CALL L6A3A                               ; $66F9
        POP DE                                   ; $66FC
        DEC DE                                   ; $66FD
        LD A,D                                   ; $66FE
        OR E                                     ; $66FF
        JR NZ,L66E7                              ; $6700
        JP L6765                                 ; $6702

L6705:
        CP $07                                   ; $6705
        JR NC,L670E                              ; $6707
        SUB $03                                  ; $6709
        LD C,A                                   ; $670B
        JR L66CE                                 ; $670C

L670E:
        CP $09                                   ; $670E
        JR NC,L6728                              ; $6710
        SUB $07                                  ; $6712
        LD C,A                                   ; $6714

L6715:
        PUSH DE                                  ; $6715
        CALL L686C                               ; $6716
        CALL L689A                               ; $6719
        CALL L6A3A                               ; $671C
        POP DE                                   ; $671F
        DEC DE                                   ; $6720
        LD A,D                                   ; $6721
        OR E                                     ; $6722
        JR NZ,L6715                              ; $6723
        JP L6765                                 ; $6725

L6728:
        JR NZ,L6730                              ; $6728
        SUB $05                                  ; $672A
        LD C,A                                   ; $672C
        JP L66CE                                 ; $672D

L6730:
        CP $0C                                   ; $6730
        JR NC,L6755                              ; $6732

L6734:
        PUSH DE                                  ; $6734
        LD D,$00                                 ; $6735
        CALL L6A7C                               ; $6737
        INC H                                    ; $673A
        CALL L6A7C                               ; $673B
        DEC H                                    ; $673E
        INC L                                    ; $673F
        LD D,$01                                 ; $6740
        CALL L6A7C                               ; $6742
        INC H                                    ; $6745
        CALL L6A7C                               ; $6746
        CALL L6A3A                               ; $6749
        POP DE                                   ; $674C
        DEC DE                                   ; $674D
        LD A,D                                   ; $674E
        OR E                                     ; $674F
        JR NZ,L6734                              ; $6750
        JP L6765                                 ; $6752

L6755:
        CP $10                                   ; $6755
        JR NC,L675F                              ; $6757
        SUB $0A                                  ; $6759
        LD C,A                                   ; $675B
        JP L6715                                 ; $675C

L675F:
        SUB $0B                                  ; $675F
        LD C,A                                   ; $6761
        JP L66CE                                 ; $6762

L6765:
        RET                                      ; $6765

L6766:
        CALL L6973                               ; $6766
        CALL L6774                               ; $6769
        LD A,($EADB)                             ; $676C
        CP $1C                                   ; $676F
        RET Z                                    ; $6771
        JR L6766                                 ; $6772

L6774:
        LD C,A                                   ; $6774
        LD A,($EADB)                             ; $6775
        LD H,A                                   ; $6778
        LD A,($EADC)                             ; $6779
        LD L,A                                   ; $677C
        LD DE,($EADD)                            ; $677D
        LD A,C                                   ; $6781
        CP $0C                                   ; $6782
        JR C,L6791                               ; $6784
        CP $0E                                   ; $6786
        JR Z,L6791                               ; $6788
        ADD A,$10                                ; $678A
        CALL L6055                               ; $678C
        SUB $10                                  ; $678F

L6791:
        OR A                                     ; $6791
        JR NZ,L67A1                              ; $6792

L6794:
        PUSH DE                                  ; $6794
        CALL L6A63                               ; $6795
        POP DE                                   ; $6798
        DEC DE                                   ; $6799
        LD A,D                                   ; $679A
        OR E                                     ; $679B
        JR NZ,L6794                              ; $679C
        JP L686B                                 ; $679E

L67A1:
        CP $05                                   ; $67A1
        JR NC,L67B8                              ; $67A3
        ADD A,$04                                ; $67A5
        LD C,A                                   ; $67A7

L67A8:
        PUSH DE                                  ; $67A8
        CALL L6888                               ; $67A9
        CALL L6A63                               ; $67AC
        POP DE                                   ; $67AF
        DEC DE                                   ; $67B0
        LD A,D                                   ; $67B1
        OR E                                     ; $67B2
        JR NZ,L67A8                              ; $67B3
        JP L686B                                 ; $67B5

L67B8:
        CP $05                                   ; $67B8
        JR NZ,L67D1                              ; $67BA
        INC A                                    ; $67BC
        LD C,A                                   ; $67BD

L67BE:
        PUSH DE                                  ; $67BE
        CALL L686C                               ; $67BF
        CALL L689A                               ; $67C2
        CALL L6A63                               ; $67C5
        POP DE                                   ; $67C8
        DEC DE                                   ; $67C9
        LD A,D                                   ; $67CA
        OR E                                     ; $67CB
        JR NZ,L67BE                              ; $67CC
        JP L686B                                 ; $67CE

L67D1:
        CP $06                                   ; $67D1
        JR NZ,L6808                              ; $67D3
        LD A,E                                   ; $67D5
        CP $01                                   ; $67D6
        JR Z,L67FF                               ; $67D8
        CALL L68CF                               ; $67DA
        CALL L5FDF                               ; $67DD
        CALL L68EA                               ; $67E0
        CALL L6A63                               ; $67E3
        CALL L6918                               ; $67E6
        CALL L6A63                               ; $67E9
        CALL L6918                               ; $67EC
        CALL L6A63                               ; $67EF
        LD A,($EADB)                             ; $67F2
        OR A                                     ; $67F5
        JR Z,L67FF                               ; $67F6
        CP $1C                                   ; $67F8
        JR Z,L67FF                               ; $67FA
        JP L686B                                 ; $67FC

L67FF:
        CALL L692F                               ; $67FF
        CALL L6A63                               ; $6802
        JP L686B                                 ; $6805

L6808:
        CP $0B                                   ; $6808
        JR NC,L6812                              ; $680A
        ADD A,$02                                ; $680C
        LD C,A                                   ; $680E
        JP L67A8                                 ; $680F

L6812:
        JR NZ,L685B                              ; $6812
        PUSH HL                                  ; $6814
        PUSH DE                                  ; $6815
        LD B,E                                   ; $6816
        DEC B                                    ; $6817

L6818:
        INC L                                    ; $6818
        DJNZ L6818                               ; $6819
        PUSH HL                                  ; $681B
        LD B,H                                   ; $681C
        LD C,L                                   ; $681D
        CALL L6ADF                               ; $681E
        CALL LDIRMV                              ; $6821
        POP HL                                   ; $6824
        OR A                                     ; $6825
        JR NZ,L682F                              ; $6826
        PUSH AF                                  ; $6828
        LD A,$1B                                 ; $6829
        CALL L6055                               ; $682B
        POP AF                                   ; $682E

L682F:
        POP DE                                   ; $682F
        POP HL                                   ; $6830
        OR A                                     ; $6831
        JR Z,L6838                               ; $6832
        LD C,$0B                                 ; $6834
        JR L683A                                 ; $6836

L6838:
        LD C,$07                                 ; $6838

L683A:
        PUSH AF                                  ; $683A

L683B:
        PUSH DE                                  ; $683B
        CALL L686C                               ; $683C
        CALL L689A                               ; $683F
        CALL L6A63                               ; $6842
        POP DE                                   ; $6845
        DEC DE                                   ; $6846
        LD A,D                                   ; $6847
        OR E                                     ; $6848
        JR NZ,L683B                              ; $6849
        POP AF                                   ; $684B
        OR A                                     ; $684C
        JP NZ,L686B                              ; $684D
        INC L                                    ; $6850
        INC L                                    ; $6851
        INC L                                    ; $6852
        LD C,$0B                                 ; $6853
        CALL L6888                               ; $6855
        JP L686B                                 ; $6858

L685B:
        CP $0F                                   ; $685B
        JR NC,L6865                              ; $685D
        SUB $04                                  ; $685F
        LD C,A                                   ; $6861
        JP L67BE                                 ; $6862

L6865:
        SUB $03                                  ; $6865
        LD C,A                                   ; $6867
        JP L67A8                                 ; $6868

L686B:
        RET                                      ; $686B

L686C:
        PUSH HL                                  ; $686C
        LD HL,($EADD)                            ; $686D
        CALL L5D1E                               ; $6870
        JR NZ,L6878                              ; $6873
        XOR A                                    ; $6875
        JR L6886                                 ; $6876

L6878:
        LD HL,$0001                              ; $6878
        CALL L5D1E                               ; $687B
        JR NZ,L6884                              ; $687E
        LD A,$02                                 ; $6880
        JR L6886                                 ; $6882

L6884:
        LD A,$01                                 ; $6884

L6886:
        POP HL                                   ; $6886
        RET                                      ; $6887

L6888:
        PUSH BC                                  ; $6888
        PUSH HL                                  ; $6889
        LD L,C                                   ; $688A
        LD H,$00                                 ; $688B
        ADD HL,HL                                ; $688D
        ADD HL,HL                                ; $688E
        LD DE,$6DEA                              ; $688F
        ADD HL,DE                                ; $6892
        EX DE,HL                                 ; $6893
        POP HL                                   ; $6894
        CALL L68B7                               ; $6895
        POP BC                                   ; $6898
        RET                                      ; $6899

L689A:
        PUSH BC                                  ; $689A
        PUSH HL                                  ; $689B
        LD B,$00                                 ; $689C
        LD L,C                                   ; $689E
        LD H,$00                                 ; $689F
        ADD HL,HL                                ; $68A1
        ADD HL,BC                                ; $68A2
        ADD HL,HL                                ; $68A3
        ADD HL,HL                                ; $68A4
        LD DE,$6E1E                              ; $68A5
        ADD HL,DE                                ; $68A8
        EX DE,HL                                 ; $68A9
        LD H,$00                                 ; $68AA
        LD L,A                                   ; $68AC
        ADD HL,HL                                ; $68AD
        ADD HL,HL                                ; $68AE
        ADD HL,DE                                ; $68AF
        EX DE,HL                                 ; $68B0
        POP HL                                   ; $68B1
        CALL L68B7                               ; $68B2
        POP BC                                   ; $68B5
        RET                                      ; $68B6

L68B7:
        PUSH HL                                  ; $68B7
        EX DE,HL                                 ; $68B8
        LD C,(HL)                                ; $68B9
        INC HL                                   ; $68BA
        LD D,(HL)                                ; $68BB
        INC HL                                   ; $68BC
        LD B,(HL)                                ; $68BD
        INC HL                                   ; $68BE
        LD A,(HL)                                ; $68BF
        POP HL                                   ; $68C0
        CALL L68C5                               ; $68C1
        RET                                      ; $68C4

L68C5:
        CALL L6A7C                               ; $68C5
        INC H                                    ; $68C8
        LD C,B                                   ; $68C9
        LD D,A                                   ; $68CA
        CALL L6A7C                               ; $68CB
        RET                                      ; $68CE

L68CF:
        PUSH HL                                  ; $68CF
        PUSH DE                                  ; $68D0
        DEC L                                    ; $68D1
        CALL L693A                               ; $68D2
        CP $04                                   ; $68D5
        JR NC,L68DF                              ; $68D7

L68D9:
        LD ($EADF),A                             ; $68D9
        POP DE                                   ; $68DC
        POP HL                                   ; $68DD
        RET                                      ; $68DE

L68DF:
        LD A,($EADF)                             ; $68DF
        AND $03                                  ; $68E2
        JR NZ,L68D9                              ; $68E4
        LD A,$03                                 ; $68E6
        JR L68D9                                 ; $68E8

L68EA:
        PUSH DE                                  ; $68EA
        PUSH DE                                  ; $68EB
        LD A,($EADF)                             ; $68EC
        ADD A,$3F                                ; $68EF
        LD C,A                                   ; $68F1
        LD D,$00                                 ; $68F2
        CALL L6A7C                               ; $68F4
        CALL L70F7                               ; $68F7
        DEC H                                    ; $68FA
        POP DE                                   ; $68FB
        LD A,D                                   ; $68FC
        OR A                                     ; $68FD
        JR Z,L6916                               ; $68FE
        LD A,($EADF)                             ; $6900
        DEC A                                    ; $6903
        LD C,A                                   ; $6904
        ADD A,A                                  ; $6905
        ADD A,C                                  ; $6906
        ADD A,A                                  ; $6907
        LD C,A                                   ; $6908
        LD A,E                                   ; $6909
        ADD A,C                                  ; $690A
        ADD A,$41                                ; $690B
        LD C,A                                   ; $690D
        LD D,$00                                 ; $690E
        CALL L6A7C                               ; $6910
        CALL L70F7                               ; $6913

L6916:
        POP DE                                   ; $6916
        RET                                      ; $6917

L6918:
        LD A,D                                   ; $6918
        OR A                                     ; $6919
        RET Z                                    ; $691A
        PUSH DE                                  ; $691B
        LD A,E                                   ; $691C
        ADD A,$53                                ; $691D
        LD C,A                                   ; $691F
        LD D,$00                                 ; $6920
        LD A,($E491)                             ; $6922
        DEC A                                    ; $6925
        LD E,A                                   ; $6926
        CALL L6A7C                               ; $6927
        CALL L70F7                               ; $692A
        POP DE                                   ; $692D
        RET                                      ; $692E

L692F:
        LD C,$16                                 ; $692F
        LD D,$00                                 ; $6931
        CALL L6A7C                               ; $6933
        CALL L70F7                               ; $6936
        RET                                      ; $6939

L693A:
        PUSH HL                                  ; $693A
        PUSH DE                                  ; $693B
        PUSH BC                                  ; $693C
        LD A,L                                   ; $693D
        CP $04                                   ; $693E
        JR NC,L6947                              ; $6940
        LD DE,$E946                              ; $6942
        JR L6953                                 ; $6945

L6947:
        CP $0C                                   ; $6947
        JR NC,L6950                              ; $6949
        LD DE,$E9A6                              ; $694B
        JR L6953                                 ; $694E

L6950:
        LD DE,$EA06                              ; $6950

L6953:
        LD B,H                                   ; $6953
        LD C,L                                   ; $6954
        CALL L6ADF                               ; $6955
        CALL LDIRMV                              ; $6958
        LD B,$03                                 ; $695B
        LD C,A                                   ; $695D

L695E:
        INC DE                                   ; $695E
        LD A,(DE)                                ; $695F
        OR A                                     ; $6960
        JR Z,L696A                               ; $6961
        CP C                                     ; $6963
        JR Z,L696C                               ; $6964
        INC A                                    ; $6966
        CP C                                     ; $6967
        JR Z,L696C                               ; $6968

L696A:
        DJNZ L695E                               ; $696A

L696C:
        LD A,$04                                 ; $696C
        SUB B                                    ; $696E
        POP BC                                   ; $696F
        POP DE                                   ; $6970
        POP HL                                   ; $6971
        RET                                      ; $6972

L6973:
        LD HL,($EAD9)                            ; $6973
        LD A,(HL)                                ; $6976
        LD C,A                                   ; $6977
        AND $0F                                  ; $6978
        INC A                                    ; $697A
        LD E,A                                   ; $697B
        LD D,$00                                 ; $697C
        CP $10                                   ; $697E
        CALL Z,L6998                             ; $6980
        LD ($EADD),DE                            ; $6983
        LD HL,($EAD9)                            ; $6987
        INC HL                                   ; $698A
        LD ($EAD9),HL                            ; $698B
        LD A,C                                   ; $698E
        SRL A                                    ; $698F
        SRL A                                    ; $6991
        SRL A                                    ; $6993
        SRL A                                    ; $6995
        RET                                      ; $6997

L6998:
        LD HL,($EAD9)                            ; $6998
        INC HL                                   ; $699B
        LD ($EAD9),HL                            ; $699C
        LD A,(HL)                                ; $699F
        LD L,A                                   ; $69A0
        LD H,$00                                 ; $69A1
        ADD HL,DE                                ; $69A3
        EX DE,HL                                 ; $69A4
        CP $FF                                   ; $69A5
        JR Z,L6998                               ; $69A7
        RET                                      ; $69A9

L69AA:
        LD HL,($EAD9)                            ; $69AA
        LD A,(HL)                                ; $69AD
        OR A                                     ; $69AE
        RET Z                                    ; $69AF
        LD C,A                                   ; $69B0
        AND $0F                                  ; $69B1
        ADD A,A                                  ; $69B3
        LD ($EADB),A                             ; $69B4
        LD HL,($EAD9)                            ; $69B7
        INC HL                                   ; $69BA
        LD ($EAD9),HL                            ; $69BB
        LD A,(HL)                                ; $69BE
        LD B,A                                   ; $69BF
        AND $1F                                  ; $69C0
        LD ($EADC),A                             ; $69C2
        LD A,C                                   ; $69C5
        SRL A                                    ; $69C6
        SRL A                                    ; $69C8
        SRL A                                    ; $69CA
        SRL A                                    ; $69CC
        LD C,A                                   ; $69CE
        LD A,B                                   ; $69CF
        AND $E0                                  ; $69D0
        OR C                                     ; $69D2
        CALL L69DF                               ; $69D3
        LD HL,($EAD9)                            ; $69D6
        INC HL                                   ; $69D9
        LD ($EAD9),HL                            ; $69DA
        JR L69AA                                 ; $69DD

L69DF:
        LD C,A                                   ; $69DF
        LD A,($EADB)                             ; $69E0
        LD H,A                                   ; $69E3
        LD A,($EADC)                             ; $69E4
        LD L,A                                   ; $69E7
        LD A,C                                   ; $69E8
        AND $0F                                  ; $69E9
        BIT 6,C                                  ; $69EB
        JR Z,L69F3                               ; $69ED
        ADD A,$20                                ; $69EF
        JR L69F5                                 ; $69F1

L69F3:
        ADD A,$30                                ; $69F3

L69F5:
        CALL L5F1A                               ; $69F5
        EX AF,AF'                                ; $69F8
        LD A,B                                   ; $69F9
        OR A                                     ; $69FA
        RET Z                                    ; $69FB
        EX AF,AF'                                ; $69FC
        CP $36                                   ; $69FD
        JR Z,L6A28                               ; $69FF
        CP $23                                   ; $6A01
        JR Z,L6A33                               ; $6A03
        CP $21                                   ; $6A05
        JR NZ,L6A1B                              ; $6A07
        PUSH AF                                  ; $6A09
        PUSH HL                                  ; $6A0A
        PUSH DE                                  ; $6A0B
        PUSH BC                                  ; $6A0C
        CALL L6F4D                               ; $6A0D
        LD A,$2A                                 ; $6A10
        LD B,$0B                                 ; $6A12
        CALL L6EE1                               ; $6A14
        POP BC                                   ; $6A17
        POP DE                                   ; $6A18
        POP HL                                   ; $6A19
        POP AF                                   ; $6A1A

L6A1B:
        LD D,$00                                 ; $6A1B
        BIT 5,C                                  ; $6A1D
        JR Z,L6A23                               ; $6A1F
        LD D,$04                                 ; $6A21

L6A23:
        LD C,A                                   ; $6A23
        CALL L70B6                               ; $6A24
        RET                                      ; $6A27

L6A28:
        LD C,A                                   ; $6A28
        INC L                                    ; $6A29
        LD D,$00                                 ; $6A2A
        CALL L6A7C                               ; $6A2C
        CALL L70F7                               ; $6A2F
        RET                                      ; $6A32

L6A33:
        LD C,A                                   ; $6A33
        LD D,$00                                 ; $6A34
        CALL L70A6                               ; $6A36
        RET                                      ; $6A39

L6A3A:
        LD A,($EADB)                             ; $6A3A
        CP $00                                   ; $6A3D
        JR Z,L6A63                               ; $6A3F
        CP $1C                                   ; $6A41
        JR Z,L6A63                               ; $6A43
        INC A                                    ; $6A45
        INC A                                    ; $6A46
        LD ($EADB),A                             ; $6A47
        CP $1C                                   ; $6A4A
        JR NZ,L6A5A                              ; $6A4C
        LD A,$02                                 ; $6A4E
        LD ($EADB),A                             ; $6A50
        LD A,($EADC)                             ; $6A53
        INC A                                    ; $6A56
        LD ($EADC),A                             ; $6A57

L6A5A:
        LD A,($EADB)                             ; $6A5A
        LD H,A                                   ; $6A5D
        LD A,($EADC)                             ; $6A5E
        LD L,A                                   ; $6A61
        RET                                      ; $6A62

L6A63:
        LD A,($EADC)                             ; $6A63
        INC A                                    ; $6A66
        LD ($EADC),A                             ; $6A67
        CP $14                                   ; $6A6A
        JR NZ,L6A5A                              ; $6A6C
        XOR A                                    ; $6A6E
        LD ($EADC),A                             ; $6A6F
        LD A,($EADB)                             ; $6A72
        INC A                                    ; $6A75
        INC A                                    ; $6A76
        LD ($EADB),A                             ; $6A77
        JR L6A5A                                 ; $6A7A

L6A7C:
        PUSH AF                                  ; $6A7C
        PUSH HL                                  ; $6A7D
        PUSH BC                                  ; $6A7E
        PUSH DE                                  ; $6A7F
        LD A,L                                   ; $6A80
        CP $14                                   ; $6A81
        JR NC,L6ADA                              ; $6A83
        LD A,H                                   ; $6A85
        CP $1E                                   ; $6A86
        JR NC,L6ADA                              ; $6A88
        PUSH BC                                  ; $6A8A
        CALL L5E80                               ; $6A8B
        LD B,H                                   ; $6A8E
        LD C,L                                   ; $6A8F
        LD A,C                                   ; $6A90
        CP $04                                   ; $6A91
        JR NC,L6AA2                              ; $6A93
        LD HL,$E946                              ; $6A95
        LD IX,$EA66                              ; $6A98
        LD IY,$0000                              ; $6A9C
        JR L6ABE                                 ; $6AA0

L6AA2:
        CP $0C                                   ; $6AA2
        JR NC,L6AB3                              ; $6AA4
        LD HL,$E9A6                              ; $6AA6
        LD IX,$EA67                              ; $6AA9
        LD IY,$0100                              ; $6AAD
        JR L6ABE                                 ; $6AB1

L6AB3:
        LD HL,$EA06                              ; $6AB3
        LD IX,$EA68                              ; $6AB6
        LD IY,$0200                              ; $6ABA

L6ABE:
        POP DE                                   ; $6ABE
        LD A,E                                   ; $6ABF
        CP $0D                                   ; $6AC0
        JR NZ,L6AC6                              ; $6AC2
        LD E,$0C                                 ; $6AC4

L6AC6:
        LD D,$00                                 ; $6AC6
        ADD HL,DE                                ; $6AC8
        LD A,(HL)                                ; $6AC9
        OR A                                     ; $6ACA
        JR NZ,L6AD1                              ; $6ACB
        CALL L6B0B                               ; $6ACD
        LD A,(HL)                                ; $6AD0

L6AD1:
        POP DE                                   ; $6AD1
        PUSH DE                                  ; $6AD2
        ADD A,D                                  ; $6AD3
        CALL L6ADF                               ; $6AD4
        CALL CHGMOD                              ; $6AD7

L6ADA:
        POP DE                                   ; $6ADA
        POP BC                                   ; $6ADB
        POP HL                                   ; $6ADC
        POP AF                                   ; $6ADD
        RET                                      ; $6ADE

L6ADF:
        PUSH AF                                  ; $6ADF
        PUSH DE                                  ; $6AE0
        PUSH BC                                  ; $6AE1
        INC B                                    ; $6AE2
        LD H,B                                   ; $6AE3
        LD A,C                                   ; $6AE4
        ADD A,$04                                ; $6AE5
        LD L,A                                   ; $6AE7
        CALL L6AEF                               ; $6AE8
        POP BC                                   ; $6AEB
        POP DE                                   ; $6AEC
        POP AF                                   ; $6AED
        RET                                      ; $6AEE

L6AEF:
        PUSH DE                                  ; $6AEF
        LD E,H                                   ; $6AF0
        LD D,$00                                 ; $6AF1
        LD H,$00                                 ; $6AF3
        ADD HL,HL                                ; $6AF5
        ADD HL,HL                                ; $6AF6
        ADD HL,HL                                ; $6AF7
        ADD HL,HL                                ; $6AF8
        ADD HL,HL                                ; $6AF9
        ADD HL,DE                                ; $6AFA
        LD DE,($F3C7)                            ; $6AFB
        ADD HL,DE                                ; $6AFF
        POP DE                                   ; $6B00
        RET                                      ; $6B01

L6B02:
        LD A,(IX+0)                              ; $6B02
        ADD A,$01                                ; $6B05
        LD (IX+0),A                              ; $6B07
        RET                                      ; $6B0A

L6B0B:
        LD A,E                                   ; $6B0B
        OR A                                     ; $6B0C
        RET Z                                    ; $6B0D
        PUSH HL                                  ; $6B0E
        PUSH BC                                  ; $6B0F
        OR A                                     ; $6B10
        SBC HL,DE                                ; $6B11
        PUSH HL                                  ; $6B13
        PUSH IY                                  ; $6B14
        POP HL                                   ; $6B16
        PUSH DE                                  ; $6B17
        POP IY                                   ; $6B18
        ADD IY,IY                                ; $6B1A
        ADD IY,DE                                ; $6B1C
        LD BC,$7BDA                              ; $6B1E
        ADD IY,BC                                ; $6B21
        LD A,E                                   ; $6B23
        POP DE                                   ; $6B24
        CP $40                                   ; $6B25
        JP NC,L6B81                              ; $6B27
        CP $30                                   ; $6B2A
        JP NC,L6B98                              ; $6B2C
        CP $2A                                   ; $6B2F
        JP NC,L6B5B                              ; $6B31
        CP $1B                                   ; $6B34
        JP C,L6B3E                               ; $6B36
        CP $1F                                   ; $6B39
        JP C,L6B44                               ; $6B3B

L6B3E:
        CALL L6C9B                               ; $6B3E
        JP L6BB0                                 ; $6B41

L6B44:
        LD B,$03                                 ; $6B44
        LD HL,$0000                              ; $6B46
        LD DE,$E946                              ; $6B49
        LD IX,$EA66                              ; $6B4C

L6B50:
        CALL L6C9B                               ; $6B50
        CALL L6BB3                               ; $6B53
        DJNZ L6B50                               ; $6B56
        JP L6BB0                                 ; $6B58

L6B5B:
        CALL L6CB5                               ; $6B5B
        EX DE,HL                                 ; $6B5E
        LD HL,$6DC9                              ; $6B5F
        SUB $2A                                  ; $6B62
        LD C,A                                   ; $6B64
        LD B,$00                                 ; $6B65
        ADD HL,BC                                ; $6B67
        LD C,(HL)                                ; $6B68
        EX DE,HL                                 ; $6B69
        CALL L6C57                               ; $6B6A
        LD B,$04                                 ; $6B6D

L6B6F:
        CALL L6B02                               ; $6B6F
        PUSH BC                                  ; $6B72
        LD B,$08                                 ; $6B73

L6B75:
        LD A,C                                   ; $6B75
        CALL L6CCA                               ; $6B76
        DJNZ L6B75                               ; $6B79
        POP BC                                   ; $6B7B
        DJNZ L6B6F                               ; $6B7C
        JP L6BB0                                 ; $6B7E

L6B81:
        CALL L6CB5                               ; $6B81
        EX DE,HL                                 ; $6B84
        LD HL,$6DCF                              ; $6B85
        SUB $40                                  ; $6B88
        LD C,A                                   ; $6B8A
        LD B,$00                                 ; $6B8B
        ADD HL,BC                                ; $6B8D
        LD C,(HL)                                ; $6B8E
        EX DE,HL                                 ; $6B8F
        CALL L6C57                               ; $6B90
        LD B,$02                                 ; $6B93
        JP L6B6F                                 ; $6B95

L6B98:
        CP $36                                   ; $6B98
        JR Z,L6B3E                               ; $6B9A
        LD B,$03                                 ; $6B9C
        LD HL,$0000                              ; $6B9E
        LD DE,$E946                              ; $6BA1
        LD IX,$EA66                              ; $6BA4

L6BA8:
        CALL L6BC2                               ; $6BA8
        CALL L6BB3                               ; $6BAB
        DJNZ L6BA8                               ; $6BAE

L6BB0:
        POP BC                                   ; $6BB0
        POP HL                                   ; $6BB1
        RET                                      ; $6BB2

L6BB3:
        PUSH BC                                  ; $6BB3
        LD BC,$0100                              ; $6BB4
        ADD HL,BC                                ; $6BB7
        EX DE,HL                                 ; $6BB8
        LD BC,$0060                              ; $6BB9
        ADD HL,BC                                ; $6BBC
        EX DE,HL                                 ; $6BBD
        INC IX                                   ; $6BBE
        POP BC                                   ; $6BC0
        RET                                      ; $6BC1

L6BC2:
        PUSH AF                                  ; $6BC2
        PUSH HL                                  ; $6BC3
        PUSH DE                                  ; $6BC4
        PUSH BC                                  ; $6BC5
        CALL L6CB5                               ; $6BC6
        EX AF,AF'                                ; $6BC9
        CALL L6BFA                               ; $6BCA
        EX AF,AF'                                ; $6BCD
        CP $36                                   ; $6BCE
        JR C,L6BEF                               ; $6BD0
        EX AF,AF'                                ; $6BD2
        CALL L6C08                               ; $6BD3
        CALL L6C15                               ; $6BD6
        CALL L6C1D                               ; $6BD9
        CALL L6C27                               ; $6BDC
        CALL L6C2D                               ; $6BDF
        EX AF,AF'                                ; $6BE2
        CP $3A                                   ; $6BE3
        JR NC,L6BF5                              ; $6BE5
        CALL L6C36                               ; $6BE7
        CALL L6C3E                               ; $6BEA
        JR L6BF5                                 ; $6BED

L6BEF:
        CALL L6C47                               ; $6BEF
        CALL L6C4F                               ; $6BF2

L6BF5:
        POP BC                                   ; $6BF5
        POP DE                                   ; $6BF6
        POP HL                                   ; $6BF7
        POP AF                                   ; $6BF8
        RET                                      ; $6BF9

L6BFA:
        CALL L6C57                               ; $6BFA

L6BFD:
        LD B,$04                                 ; $6BFD

L6BFF:
        CALL L6B02                               ; $6BFF
        CALL L6CD9                               ; $6C02
        DJNZ L6BFF                               ; $6C05
        RET                                      ; $6C07

L6C08:
        CALL L6C57                               ; $6C08
        EX DE,HL                                 ; $6C0B
        CALL L6D04                               ; $6C0C
        EX DE,HL                                 ; $6C0F

L6C10:
        LD DE,$EA69                              ; $6C10
        JR L6BFD                                 ; $6C13

L6C15:
        CALL L6C57                               ; $6C15
        CALL L6C5E                               ; $6C18
        JR L6BFD                                 ; $6C1B

L6C1D:
        CALL L6C57                               ; $6C1D
        CALL L6C67                               ; $6C20

L6C23:
        LD B,$06                                 ; $6C23
        JR L6BFF                                 ; $6C25

L6C27:
        CALL L6C85                               ; $6C27
        EX DE,HL                                 ; $6C2A
        JR L6C10                                 ; $6C2B

L6C2D:
        CALL L6C90                               ; $6C2D
        EX DE,HL                                 ; $6C30

L6C31:
        LD DE,$EA69                              ; $6C31
        JR L6C23                                 ; $6C34

L6C36:
        CALL L6C6D                               ; $6C36
        CALL L6D75                               ; $6C39
        JR L6C31                                 ; $6C3C

L6C3E:
        CALL L6C85                               ; $6C3E
        CALL L6D75                               ; $6C41
        EX DE,HL                                 ; $6C44
        JR L6C31                                 ; $6C45

L6C47:
        CALL L6C57                               ; $6C47
        CALL L6C5E                               ; $6C4A
        JR L6C23                                 ; $6C4D

L6C4F:
        CALL L6C7F                               ; $6C4F
        CALL L6D75                               ; $6C52
        JR L6C31                                 ; $6C55

L6C57:
        LD E,(IY+0)                              ; $6C57
        LD D,(IY+1)                              ; $6C5A
        RET                                      ; $6C5D

L6C5E:
        PUSH BC                                  ; $6C5E
        LD BC,$0040                              ; $6C5F

L6C62:
        EX DE,HL                                 ; $6C62
        ADD HL,BC                                ; $6C63
        EX DE,HL                                 ; $6C64
        POP BC                                   ; $6C65
        RET                                      ; $6C66

L6C67:
        PUSH BC                                  ; $6C67
        LD BC,$0080                              ; $6C68
        JR L6C62                                 ; $6C6B

L6C6D:
        CALL L6C57                               ; $6C6D
        CALL L6C5E                               ; $6C70

L6C73:
        PUSH HL                                  ; $6C73
        EX DE,HL                                 ; $6C74
        LD DE,$EA69                              ; $6C75
        LD BC,$0040                              ; $6C78
        LDIR                                     ; $6C7B
        POP HL                                   ; $6C7D
        RET                                      ; $6C7E

L6C7F:
        CALL L6C57                               ; $6C7F
        JP L6C73                                 ; $6C82

L6C85:
        CALL L6C57                               ; $6C85
        CALL L6C5E                               ; $6C88
        EX DE,HL                                 ; $6C8B
        CALL L6D04                               ; $6C8C
        RET                                      ; $6C8F

L6C90:
        CALL L6C57                               ; $6C90
        CALL L6C67                               ; $6C93
        EX DE,HL                                 ; $6C96
        CALL L6D1B                               ; $6C97
        RET                                      ; $6C9A

L6C9B:
        PUSH AF                                  ; $6C9B
        PUSH HL                                  ; $6C9C
        PUSH DE                                  ; $6C9D
        PUSH BC                                  ; $6C9E
        CALL L6CB5                               ; $6C9F
        CALL L6C57                               ; $6CA2
        LD B,(IY+2)                              ; $6CA5

L6CA8:
        CALL L6B02                               ; $6CA8
        CALL L6CD9                               ; $6CAB
        DJNZ L6CA8                               ; $6CAE
        POP BC                                   ; $6CB0
        POP DE                                   ; $6CB1
        POP HL                                   ; $6CB2
        POP AF                                   ; $6CB3
        RET                                      ; $6CB4

L6CB5:
        PUSH AF                                  ; $6CB5
        EX DE,HL                                 ; $6CB6
        LD C,A                                   ; $6CB7
        LD B,$00                                 ; $6CB8
        ADD HL,BC                                ; $6CBA
        EX DE,HL                                 ; $6CBB
        LD A,(IX+0)                              ; $6CBC
        INC A                                    ; $6CBF
        LD (DE),A                                ; $6CC0
        LD C,A                                   ; $6CC1
        LD B,$00                                 ; $6CC2
        ADD HL,BC                                ; $6CC4
        ADD HL,HL                                ; $6CC5
        ADD HL,HL                                ; $6CC6
        ADD HL,HL                                ; $6CC7
        POP AF                                   ; $6CC8
        RET                                      ; $6CC9

L6CCA:
        PUSH BC                                  ; $6CCA
        EX AF,AF'                                ; $6CCB
        LD A,(DE)                                ; $6CCC
        CALL L6CED                               ; $6CCD
        INC DE                                   ; $6CD0
        EX AF,AF'                                ; $6CD1
        CALL L6CF5                               ; $6CD2
        INC HL                                   ; $6CD5
        INC DE                                   ; $6CD6
        POP BC                                   ; $6CD7
        RET                                      ; $6CD8

L6CD9:
        PUSH BC                                  ; $6CD9
        LD B,$08                                 ; $6CDA

L6CDC:
        PUSH BC                                  ; $6CDC
        LD A,(DE)                                ; $6CDD
        CALL L6CED                               ; $6CDE
        INC DE                                   ; $6CE1
        LD A,(DE)                                ; $6CE2
        CALL L6CF5                               ; $6CE3
        INC HL                                   ; $6CE6
        INC DE                                   ; $6CE7
        POP BC                                   ; $6CE8
        DJNZ L6CDC                               ; $6CE9
        POP BC                                   ; $6CEB
        RET                                      ; $6CEC

L6CED:
        LD BC,($F3CB)                            ; $6CED
        CALL L6CFD                               ; $6CF1
        RET                                      ; $6CF4

L6CF5:
        LD BC,($F3C9)                            ; $6CF5
        CALL L6CFD                               ; $6CF9
        RET                                      ; $6CFC

L6CFD:
        PUSH HL                                  ; $6CFD
        ADD HL,BC                                ; $6CFE
        CALL CHGMOD                              ; $6CFF
        POP HL                                   ; $6D02
        RET                                      ; $6D03

L6D04:
        PUSH HL                                  ; $6D04
        PUSH DE                                  ; $6D05
        PUSH BC                                  ; $6D06
        LD DE,$EA69                              ; $6D07
        CALL L6D32                               ; $6D0A
        LD BC,$0020                              ; $6D0D
        ADD HL,BC                                ; $6D10
        EX DE,HL                                 ; $6D11
        ADD HL,BC                                ; $6D12
        EX DE,HL                                 ; $6D13
        CALL L6D32                               ; $6D14
        POP BC                                   ; $6D17
        POP DE                                   ; $6D18
        POP HL                                   ; $6D19
        RET                                      ; $6D1A

L6D1B:
        PUSH HL                                  ; $6D1B
        PUSH DE                                  ; $6D1C
        PUSH BC                                  ; $6D1D
        LD DE,$EA69                              ; $6D1E
        CALL L6D4F                               ; $6D21
        LD BC,$0030                              ; $6D24
        ADD HL,BC                                ; $6D27
        EX DE,HL                                 ; $6D28
        ADD HL,BC                                ; $6D29
        EX DE,HL                                 ; $6D2A
        CALL L6D4F                               ; $6D2B
        POP BC                                   ; $6D2E
        POP DE                                   ; $6D2F
        POP HL                                   ; $6D30
        RET                                      ; $6D31

L6D32:
        PUSH DE                                  ; $6D32
        LD BC,$0010                              ; $6D33
        EX DE,HL                                 ; $6D36
        ADD HL,BC                                ; $6D37
        EX DE,HL                                 ; $6D38
        LD B,$02                                 ; $6D39

L6D3B:
        PUSH HL                                  ; $6D3B

L6D3C:
        PUSH BC                                  ; $6D3C
        CALL L6D5A                               ; $6D3D
        LD BC,$0010                              ; $6D40
        ADD HL,BC                                ; $6D43
        OR A                                     ; $6D44
        EX DE,HL                                 ; $6D45
        SBC HL,BC                                ; $6D46
        EX DE,HL                                 ; $6D48
        POP BC                                   ; $6D49
        DJNZ L6D3C                               ; $6D4A
        POP HL                                   ; $6D4C
        POP DE                                   ; $6D4D
        RET                                      ; $6D4E

L6D4F:
        PUSH DE                                  ; $6D4F
        LD BC,$0020                              ; $6D50
        EX DE,HL                                 ; $6D53
        ADD HL,BC                                ; $6D54
        EX DE,HL                                 ; $6D55
        LD B,$03                                 ; $6D56
        JR L6D3B                                 ; $6D58

L6D5A:
        PUSH HL                                  ; $6D5A
        PUSH DE                                  ; $6D5B
        LD B,$08                                 ; $6D5C

L6D5E:
        PUSH BC                                  ; $6D5E
        LD C,(HL)                                ; $6D5F
        XOR A                                    ; $6D60
        LD B,$08                                 ; $6D61

L6D63:
        SRL C                                    ; $6D63
        RLA                                      ; $6D65
        DJNZ L6D63                               ; $6D66
        LD (DE),A                                ; $6D68
        INC HL                                   ; $6D69
        INC DE                                   ; $6D6A
        LD A,(HL)                                ; $6D6B
        LD (DE),A                                ; $6D6C
        INC HL                                   ; $6D6D
        INC DE                                   ; $6D6E
        POP BC                                   ; $6D6F
        DJNZ L6D5E                               ; $6D70
        POP DE                                   ; $6D72
        POP HL                                   ; $6D73
        RET                                      ; $6D74

L6D75:
        PUSH HL                                  ; $6D75
        PUSH DE                                  ; $6D76
        LD HL,$EAB1                              ; $6D77
        CALL L6D98                               ; $6D7A
        LD B,$04                                 ; $6D7D
        LD HL,$EA99                              ; $6D7F

L6D82:
        PUSH BC                                  ; $6D82
        PUSH HL                                  ; $6D83
        CALL L6DAD                               ; $6D84
        POP HL                                   ; $6D87
        LD DE,$FFF0                              ; $6D88
        ADD HL,DE                                ; $6D8B
        POP BC                                   ; $6D8C
        DJNZ L6D82                               ; $6D8D
        LD HL,$EA69                              ; $6D8F
        CALL L6D98                               ; $6D92
        POP DE                                   ; $6D95
        POP HL                                   ; $6D96
        RET                                      ; $6D97

L6D98:
        LD DE,$0008                              ; $6D98
        LD C,$02                                 ; $6D9B

L6D9D:
        LD B,$04                                 ; $6D9D

L6D9F:
        XOR A                                    ; $6D9F
        LD (HL),A                                ; $6DA0
        INC HL                                   ; $6DA1
        LD A,$11                                 ; $6DA2
        LD (HL),A                                ; $6DA4
        INC HL                                   ; $6DA5
        DJNZ L6D9F                               ; $6DA6
        ADD HL,DE                                ; $6DA8
        DEC C                                    ; $6DA9
        JR NZ,L6D9D                              ; $6DAA
        RET                                      ; $6DAC

L6DAD:
        PUSH HL                                  ; $6DAD
        LD BC,$0008                              ; $6DAE
        ADD HL,BC                                ; $6DB1
        LD D,H                                   ; $6DB2
        LD E,L                                   ; $6DB3
        LD BC,$0018                              ; $6DB4
        ADD HL,BC                                ; $6DB7
        EX DE,HL                                 ; $6DB8
        LD BC,$0008                              ; $6DB9
        LDIR                                     ; $6DBC
        POP HL                                   ; $6DBE
        LD D,H                                   ; $6DBF
        LD E,L                                   ; $6DC0
        LD BC,$0008                              ; $6DC1
        ADD HL,BC                                ; $6DC4
        EX DE,HL                                 ; $6DC5
        LDIR                                     ; $6DC6
        RET                                      ; $6DC8
        DB $41,$81,$D1,$21,$71,$A1,$F1,$81,$71,$F4,$F8,$FD,$F2,$F7,$FA,$84 ; $6DC9 | A..!q...q.......
        DB $68,$8D,$82,$87,$8A,$74,$78,$7D,$72,$57,$7A,$41,$81,$D1,$21,$71 ; $6DD9 | h....tx}rWzA..!q
        DB $A1,$00,$00,$00,$00,$04,$00,$04,$01,$00,$00,$05,$00,$06,$00,$00 ; $6DE9 | ................
        DB $00,$09,$00,$09,$00,$11,$00,$01,$01,$00,$00,$11,$00,$01,$01,$13 ; $6DF9 | ................
        DB $00,$13,$00,$00,$00,$17,$00,$17,$01,$18,$00,$18,$01,$1B,$05,$1B ; $6E09 | ................
        DB $06,$1F,$00,$1F,$01,$07,$00,$07,$01,$07,$01,$07,$01,$07,$01,$07 ; $6E19 | ................
        DB $02,$00,$00,$08,$00,$08,$01,$08,$01,$08,$02,$00,$00,$0C,$00,$0C ; $6E29 | ................
        DB $01,$0C,$02,$0C,$01,$0C,$02,$0C,$00,$0D,$00,$0D,$02,$0D,$01,$0D ; $6E39 | ................
        DB $02,$0D,$01,$0D,$00,$0E,$00,$0E,$01,$0E,$01,$0E,$01,$0E,$01,$0E ; $6E49 | ................
        DB $02,$0F,$00,$0F,$01,$0F,$00,$0F,$01,$0F,$00,$0F,$01,$15,$00,$15 ; $6E59 | ................
        DB $01,$15,$02,$15,$03,$15,$04,$15,$05,$1B,$00,$1B,$01,$1B,$02,$1B ; $6E69 | ................
        DB $02,$1B,$03,$1B,$04,$1C,$00,$1C,$01,$1C,$02,$1C,$03,$1C,$02,$1C ; $6E79 | ................
        DB $03,$1D,$00,$1D,$01,$00,$00,$1D,$03,$00,$00,$1D,$03,$1D,$01,$1D ; $6E89 | ................
        DB $02,$1D,$04,$00,$00,$1D,$04,$00,$00,$1B,$00,$1B,$01,$1B,$02,$1B ; $6E99 | ................
        DB $02,$1B,$00,$1B,$01                      ; $6EA9 | .....

L6EAE:
        PUSH AF                                  ; $6EAE
        PUSH HL                                  ; $6EAF
        PUSH DE                                  ; $6EB0
        PUSH BC                                  ; $6EB1
        PUSH AF                                  ; $6EB2
        PUSH HL                                  ; $6EB3
        LD A,B                                   ; $6EB4
        ADD A,A                                  ; $6EB5
        ADD A,A                                  ; $6EB6
        LD E,A                                   ; $6EB7
        LD D,$00                                 ; $6EB8
        LD HL,($F3CD)                            ; $6EBA
        ADD HL,DE                                ; $6EBD
        POP DE                                   ; $6EBE
        LD A,E                                   ; $6EBF
        CALL CHGMOD                              ; $6EC0
        INC HL                                   ; $6EC3
        LD A,D                                   ; $6EC4
        CALL CHGMOD                              ; $6EC5
        INC HL                                   ; $6EC8
        POP AF                                   ; $6EC9
        CP $FF                                   ; $6ECA
        JR Z,L6ED3                               ; $6ECC
        ADD A,A                                  ; $6ECE
        ADD A,A                                  ; $6ECF
        CALL CHGMOD                              ; $6ED0

L6ED3:
        INC HL                                   ; $6ED3
        LD A,C                                   ; $6ED4
        CP $FF                                   ; $6ED5
        JR Z,L6EDC                               ; $6ED7
        CALL CHGMOD                              ; $6ED9

L6EDC:
        POP BC                                   ; $6EDC
        POP DE                                   ; $6EDD
        POP HL                                   ; $6EDE
        POP AF                                   ; $6EDF
        RET                                      ; $6EE0

L6EE1:
        PUSH DE                                  ; $6EE1
        PUSH BC                                  ; $6EE2
        CP $FF                                   ; $6EE3
        JR Z,L6F10                               ; $6EE5
        PUSH HL                                  ; $6EE7
        LD HL,($7CF0)                            ; $6EE8
        LD E,A                                   ; $6EEB
        LD D,$00                                 ; $6EEC
        ADD HL,DE                                ; $6EEE
        LD C,(HL)                                ; $6EEF
        PUSH AF                                  ; $6EF0
        LD A,C                                   ; $6EF1
        CP $08                                   ; $6EF2
        JR NZ,L6F0C                              ; $6EF4
        LD A,($E343)                             ; $6EF6
        CALL L6F17                               ; $6EF9
        JR Z,L6F02                               ; $6EFC
        LD C,$0F                                 ; $6EFE
        JR L6F0C                                 ; $6F00

L6F02:
        LD A,($E344)                             ; $6F02
        CALL L6F17                               ; $6F05
        JR Z,L6F0C                               ; $6F08
        LD C,$02                                 ; $6F0A

L6F0C:
        POP AF                                   ; $6F0C
        POP HL                                   ; $6F0D
        JR L6F11                                 ; $6F0E

L6F10:
        LD C,A                                   ; $6F10

L6F11:
        CALL L6EAE                               ; $6F11
        POP BC                                   ; $6F14
        POP DE                                   ; $6F15
        RET                                      ; $6F16

L6F17:
        OR A                                     ; $6F17
        RET Z                                    ; $6F18
        CP $03                                   ; $6F19
        JR NC,L6F21                              ; $6F1B
        CALL L5D5D                               ; $6F1D
        RET                                      ; $6F20

L6F21:
        LD A,($EAC9)                             ; $6F21
        BIT 2,A                                  ; $6F24
        RET                                      ; $6F26

L6F27:
        CP $FF                                   ; $6F27
        JR Z,L6F2E                               ; $6F29
        LD ($E345),A                             ; $6F2B

L6F2E:
        LD E,A                                   ; $6F2E
        ADD A,A                                  ; $6F2F
        ADD A,E                                  ; $6F30
        LD D,A                                   ; $6F31
        LD B,$08                                 ; $6F32

L6F34:
        LD A,E                                   ; $6F34
        CP $FF                                   ; $6F35
        JR Z,L6F3A                               ; $6F37
        LD A,D                                   ; $6F39

L6F3A:
        CALL L6EE1                               ; $6F3A
        INC D                                    ; $6F3D
        INC B                                    ; $6F3E
        LD A,B                                   ; $6F3F
        CP $0B                                   ; $6F40
        JR NZ,L6F34                              ; $6F42
        RET                                      ; $6F44

L6F45:
        LD A,($E334)                             ; $6F45
        LD H,A                                   ; $6F48
        LD A,($E335)                             ; $6F49
        LD L,A                                   ; $6F4C

L6F4D:
        LD A,H                                   ; $6F4D
        INC A                                    ; $6F4E
        ADD A,A                                  ; $6F4F
        ADD A,A                                  ; $6F50
        ADD A,A                                  ; $6F51
        LD H,A                                   ; $6F52
        LD A,L                                   ; $6F53
        ADD A,$04                                ; $6F54
        ADD A,A                                  ; $6F56
        ADD A,A                                  ; $6F57
        ADD A,A                                  ; $6F58
        DEC A                                    ; $6F59
        LD L,A                                   ; $6F5A
        RET                                      ; $6F5B

L6F5C:
        EX DE,HL                                 ; $6F5C
        LD A,($EAD6)                             ; $6F5D
        CP $01                                   ; $6F60
        JR NZ,L6F69                              ; $6F62
        LD A,$FF                                 ; $6F64
        LD ($EAF8),A                             ; $6F66

L6F69:
        OR A                                     ; $6F69
        JR NZ,L6F6F                              ; $6F6A
        LD ($EAF8),A                             ; $6F6C

L6F6F:
        CALL L5D5D                               ; $6F6F
        JP Z,L6FF0                               ; $6F72
        BIT 4,D                                  ; $6F75
        JR Z,L6F91                               ; $6F77
        BIT 0,D                                  ; $6F79
        JR Z,L6F91                               ; $6F7B
        BIT 1,D                                  ; $6F7D
        JR Z,L6F8A                               ; $6F7F
        LD A,($E334)                             ; $6F81
        INC A                                    ; $6F84
        LD ($E334),A                             ; $6F85
        JR L6F91                                 ; $6F88

L6F8A:
        LD A,($E334)                             ; $6F8A
        DEC A                                    ; $6F8D
        LD ($E334),A                             ; $6F8E

L6F91:
        CALL L6F45                               ; $6F91

L6F94:
        LD A,($EAD6)                             ; $6F94
        CP $01                                   ; $6F97
        JR Z,L6FA3                               ; $6F99
        BIT 4,E                                  ; $6F9B
        JR NZ,L6FDA                              ; $6F9D
        BIT 2,E                                  ; $6F9F
        JR NZ,L6FDA                              ; $6FA1

L6FA3:
        LD A,($EAC9)                             ; $6FA3
        BIT 0,E                                  ; $6FA6
        JR Z,L6FD6                               ; $6FA8
        BIT 1,E                                  ; $6FAA
        JR NZ,L6FC2                              ; $6FAC
        BIT 0,A                                  ; $6FAE
        JR Z,L6FB6                               ; $6FB0
        LD A,$01                                 ; $6FB2
        JR L6FEC                                 ; $6FB4

L6FB6:
        BIT 1,A                                  ; $6FB6
        JR NZ,L6FBE                              ; $6FB8
        LD A,$02                                 ; $6FBA
        JR L6FEC                                 ; $6FBC

L6FBE:
        LD A,$03                                 ; $6FBE
        JR L6FEC                                 ; $6FC0

L6FC2:
        BIT 0,A                                  ; $6FC2
        JR Z,L6FCA                               ; $6FC4
        LD A,$06                                 ; $6FC6
        JR L6FEC                                 ; $6FC8

L6FCA:
        BIT 1,A                                  ; $6FCA
        JR NZ,L6FD2                              ; $6FCC
        LD A,$07                                 ; $6FCE
        JR L6FEC                                 ; $6FD0

L6FD2:
        LD A,$08                                 ; $6FD2
        JR L6FEC                                 ; $6FD4

L6FD6:
        LD A,$00                                 ; $6FD6
        JR L6FEC                                 ; $6FD8

L6FDA:
        BIT 0,E                                  ; $6FDA
        JR Z,L6FEA                               ; $6FDC
        BIT 1,E                                  ; $6FDE
        JR NZ,L6FE6                              ; $6FE0
        LD A,$04                                 ; $6FE2
        JR L6FEC                                 ; $6FE4

L6FE6:
        LD A,$09                                 ; $6FE6
        JR L6FEC                                 ; $6FE8

L6FEA:
        LD A,$05                                 ; $6FEA

L6FEC:
        CALL L6F27                               ; $6FEC
        RET                                      ; $6FEF

L6FF0:
        LD A,($E334)                             ; $6FF0
        OR A                                     ; $6FF3
        JR NZ,L7013                              ; $6FF4
        BIT 0,E                                  ; $6FF6
        JR Z,L7013                               ; $6FF8
        BIT 1,E                                  ; $6FFA
        JR NZ,L7013                              ; $6FFC
        LD A,($E320)                             ; $6FFE
        AND $0F                                  ; $7001
        JR Z,L7013                               ; $7003
        CALL L6F45                               ; $7005
        LD A,$01                                 ; $7008
        CALL L6F27                               ; $700A
        LD A,$07                                 ; $700D
        LD ($EAE1),A                             ; $700F
        RET                                      ; $7012

L7013:
        LD A,($E334)                             ; $7013
        CP $1C                                   ; $7016
        JR NZ,L7039                              ; $7018
        BIT 0,E                                  ; $701A
        JR Z,L7039                               ; $701C
        BIT 1,E                                  ; $701E
        JR Z,L7039                               ; $7020
        LD A,($E320)                             ; $7022
        AND $0F                                  ; $7025
        CP $09                                   ; $7027
        JR Z,L7039                               ; $7029
        CALL L6F45                               ; $702B
        LD A,$06                                 ; $702E
        CALL L6F27                               ; $7030
        LD A,$03                                 ; $7033
        LD ($EAE1),A                             ; $7035
        RET                                      ; $7038

L7039:
        LD A,($E334)                             ; $7039
        LD B,A                                   ; $703C
        INC A                                    ; $703D
        ADD A,A                                  ; $703E
        LD H,A                                   ; $703F
        LD A,($E335)                             ; $7040
        CP $FE                                   ; $7043
        JR NZ,L704D                              ; $7045
        LD A,$01                                 ; $7047
        LD ($EAE1),A                             ; $7049
        RET                                      ; $704C

L704D:
        CP $14                                   ; $704D
        JR NZ,L7057                              ; $704F
        LD A,$05                                 ; $7051
        LD ($EAE1),A                             ; $7053
        RET                                      ; $7056

L7057:
        LD C,A                                   ; $7057
        ADD A,$04                                ; $7058
        ADD A,A                                  ; $705A
        LD L,A                                   ; $705B
        BIT 0,D                                  ; $705C
        JR Z,L7074                               ; $705E
        BIT 1,D                                  ; $7060
        JR NZ,L706D                              ; $7062
        DEC B                                    ; $7064
        DEC H                                    ; $7065
        BIT 4,D                                  ; $7066
        JR Z,L7074                               ; $7068
        DEC H                                    ; $706A
        JR L7074                                 ; $706B

L706D:
        INC B                                    ; $706D
        INC H                                    ; $706E
        BIT 4,D                                  ; $706F
        JR Z,L7074                               ; $7071
        INC H                                    ; $7073

L7074:
        BIT 2,D                                  ; $7074
        JR Z,L7082                               ; $7076
        BIT 3,D                                  ; $7078
        JR Z,L7080                               ; $707A
        DEC C                                    ; $707C
        DEC L                                    ; $707D
        JR L7082                                 ; $707E

L7080:
        INC C                                    ; $7080
        INC L                                    ; $7081

L7082:
        LD A,B                                   ; $7082
        LD ($E334),A                             ; $7083
        LD A,C                                   ; $7086
        LD ($E335),A                             ; $7087
        LD A,H                                   ; $708A
        ADD A,A                                  ; $708B
        ADD A,A                                  ; $708C
        LD H,A                                   ; $708D
        LD A,L                                   ; $708E
        ADD A,A                                  ; $708F
        ADD A,A                                  ; $7090
        DEC A                                    ; $7091
        LD L,A                                   ; $7092
        JP L6F94                                 ; $7093

L7096:
        PUSH HL                                  ; $7096
        POP IX                                   ; $7097
        LD A,(IX+1)                              ; $7099
        LD H,(IX+2)                              ; $709C
        LD L,(IX+3)                              ; $709F
        LD C,(IX+4)                              ; $70A2
        RET                                      ; $70A5

L70A6:
        CALL L6A7C                               ; $70A6
        INC H                                    ; $70A9
        CALL L6A7C                               ; $70AA
        INC L                                    ; $70AD
        CALL L6A7C                               ; $70AE
        DEC H                                    ; $70B1
        CALL L6A7C                               ; $70B2
        RET                                      ; $70B5

L70B6:
        CALL L70E9                               ; $70B6
        DEC H                                    ; $70B9
        INC L                                    ; $70BA
        CALL L70F8                               ; $70BB
        CALL L70F7                               ; $70BE
        RET                                      ; $70C1

L70C2:
        CALL L70E9                               ; $70C2
        CALL L70F7                               ; $70C5
        DEC H                                    ; $70C8
        DEC H                                    ; $70C9
        INC L                                    ; $70CA
        CALL L70F8                               ; $70CB
        CALL L70F7                               ; $70CE
        CALL L70F7                               ; $70D1
        RET                                      ; $70D4

L70D5:
        CALL L70E9                               ; $70D5
        DEC H                                    ; $70D8
        INC L                                    ; $70D9
        CALL L70F8                               ; $70DA
        CALL L70F7                               ; $70DD
        DEC H                                    ; $70E0
        INC L                                    ; $70E1
        CALL L70F8                               ; $70E2
        CALL L70F7                               ; $70E5
        RET                                      ; $70E8

L70E9:
        CALL L6A7C                               ; $70E9
        CALL L70F7                               ; $70EC
        RET                                      ; $70EF

L70F0:
        CALL L6A7C                               ; $70F0
        CALL L70FD                               ; $70F3
        RET                                      ; $70F6

L70F7:
        INC H                                    ; $70F7

L70F8:
        INC D                                    ; $70F8
        CALL L6A7C                               ; $70F9
        RET                                      ; $70FC

L70FD:
        DEC H                                    ; $70FD
        DEC D                                    ; $70FE
        CALL L6A7C                               ; $70FF
        RET                                      ; $7102

L7103:
        LD C,$00                                 ; $7103
        LD D,$00                                 ; $7105
        CALL L6A7C                               ; $7107
        RET                                      ; $710A

L710B:
        PUSH HL                                  ; $710B
        PUSH DE                                  ; $710C
        PUSH BC                                  ; $710D
        LD E,C                                   ; $710E
        CALL L7096                               ; $710F
        CP $34                                   ; $7112
        CALL Z,L61F5                             ; $7114
        EX AF,AF'                                ; $7117
        CALL L5D5D                               ; $7118
        JR Z,L716A                               ; $711B
        EX AF,AF'                                ; $711D
        BIT 0,C                                  ; $711E
        JR Z,L714E                               ; $7120
        BIT 1,C                                  ; $7122
        JR NZ,L7137                              ; $7124

L7126:
        LD C,A                                   ; $7126
        LD D,$00                                 ; $7127
        CALL L70B6                               ; $7129
        INC H                                    ; $712C
        CALL L7103                               ; $712D
        DEC L                                    ; $7130
        CALL L6A7C                               ; $7131
        JP L7199                                 ; $7134

L7137:
        LD D,$00                                 ; $7137

L7139:
        PUSH AF                                  ; $7139
        PUSH DE                                  ; $713A
        DEC H                                    ; $713B
        CALL L7103                               ; $713C
        INC L                                    ; $713F
        CALL L6A7C                               ; $7140
        POP DE                                   ; $7143
        POP AF                                   ; $7144
        DEC L                                    ; $7145
        INC H                                    ; $7146
        LD C,A                                   ; $7147
        CALL L70B6                               ; $7148
        JP L7199                                 ; $714B

L714E:
        BIT 2,C                                  ; $714E
        JP Z,L7199                               ; $7150
        LD D,$00                                 ; $7153

L7155:
        PUSH AF                                  ; $7155
        PUSH DE                                  ; $7156
        DEC L                                    ; $7157
        CALL L7103                               ; $7158
        INC H                                    ; $715B
        CALL L6A7C                               ; $715C
        POP DE                                   ; $715F
        POP AF                                   ; $7160
        INC L                                    ; $7161
        DEC H                                    ; $7162
        LD C,A                                   ; $7163
        CALL L70B6                               ; $7164
        JP L7199                                 ; $7167

L716A:
        EX AF,AF'                                ; $716A
        BIT 0,C                                  ; $716B
        JR Z,L7189                               ; $716D
        BIT 1,C                                  ; $716F
        JR NZ,L7180                              ; $7171
        LD D,$04                                 ; $7173

L7175:
        DEC H                                    ; $7175
        LD (IX+2),H                              ; $7176

L7179:
        LD C,A                                   ; $7179
        CALL L70C2                               ; $717A
        JP L7199                                 ; $717D

L7180:
        LD D,$04                                 ; $7180

L7182:
        INC H                                    ; $7182
        LD (IX+2),H                              ; $7183
        DEC H                                    ; $7186
        JR L7179                                 ; $7187

L7189:
        BIT 2,C                                  ; $7189
        JP Z,L7199                               ; $718B
        LD D,$0A                                 ; $718E

L7190:
        INC L                                    ; $7190
        LD (IX+3),L                              ; $7191
        DEC L                                    ; $7194
        LD C,A                                   ; $7195
        CALL L70D5                               ; $7196

L7199:
        POP BC                                   ; $7199
        POP DE                                   ; $719A
        POP HL                                   ; $719B
        RET                                      ; $719C

L719D:
        PUSH HL                                  ; $719D
        PUSH DE                                  ; $719E
        PUSH BC                                  ; $719F
        LD E,C                                   ; $71A0
        INC HL                                   ; $71A1
        LD A,(HL)                                ; $71A2
        DEC HL                                   ; $71A3
        CP $36                                   ; $71A4
        JP Z,L7279                               ; $71A6
        CALL L5D5D                               ; $71A9
        JR Z,L71F4                               ; $71AC
        CALL L7096                               ; $71AE
        BIT 0,C                                  ; $71B1
        JR Z,L71C1                               ; $71B3
        BIT 1,C                                  ; $71B5
        JR NZ,L71BC                              ; $71B7
        JP L7126                                 ; $71B9

L71BC:
        LD D,$04                                 ; $71BC
        JP L7139                                 ; $71BE

L71C1:
        BIT 2,C                                  ; $71C1
        JR Z,L71E3                               ; $71C3
        BIT 1,C                                  ; $71C5
        JR NZ,L71CD                              ; $71C7
        LD D,$00                                 ; $71C9
        JR L71CF                                 ; $71CB

L71CD:
        LD D,$04                                 ; $71CD

L71CF:
        BIT 3,C                                  ; $71CF
        JP Z,L7155                               ; $71D1
        LD C,A                                   ; $71D4
        CALL L70B6                               ; $71D5
        INC L                                    ; $71D8
        CALL L7103                               ; $71D9
        DEC H                                    ; $71DC
        CALL L6A7C                               ; $71DD
        JP L7199                                 ; $71E0

L71E3:
        BIT 1,C                                  ; $71E3
        JR NZ,L71EB                              ; $71E5
        LD D,$00                                 ; $71E7
        JR L71ED                                 ; $71E9

L71EB:
        LD D,$04                                 ; $71EB

L71ED:
        LD C,A                                   ; $71ED
        CALL L70B6                               ; $71EE
        JP L7199                                 ; $71F1

L71F4:
        CALL L7096                               ; $71F4
        BIT 0,C                                  ; $71F7
        JR Z,L7209                               ; $71F9
        BIT 1,C                                  ; $71FB
        JR NZ,L7204                              ; $71FD
        LD D,$0C                                 ; $71FF
        JP L7175                                 ; $7201

L7204:
        LD D,$16                                 ; $7204
        JP L7182                                 ; $7206

L7209:
        BIT 2,C                                  ; $7209
        JR Z,L7268                               ; $720B
        BIT 1,C                                  ; $720D
        JR NZ,L7215                              ; $720F
        LD D,$1C                                 ; $7211
        JR L7217                                 ; $7213

L7215:
        LD D,$22                                 ; $7215

L7217:
        BIT 3,C                                  ; $7217
        JR NZ,L723C                              ; $7219
        PUSH AF                                  ; $721B
        LD B,H                                   ; $721C
        LD C,L                                   ; $721D
        INC C                                    ; $721E
        INC C                                    ; $721F
        LD A,$01                                 ; $7220
        CALL L4566                               ; $7222
        OR A                                     ; $7225
        JR NZ,L722C                              ; $7226
        POP AF                                   ; $7228
        JP L7190                                 ; $7229

L722C:
        POP AF                                   ; $722C
        XOR A                                    ; $722D
        LD (IX+0),A                              ; $722E
        LD D,A                                   ; $7231
        LD C,A                                   ; $7232
        CALL L70A6                               ; $7233
        CALL L5D63                               ; $7236
        JP L7199                                 ; $7239

L723C:
        PUSH AF                                  ; $723C
        LD B,H                                   ; $723D
        LD C,L                                   ; $723E
        DEC C                                    ; $723F
        LD A,$01                                 ; $7240
        CALL L4566                               ; $7242
        OR A                                     ; $7245
        JR NZ,L724B                              ; $7246
        POP AF                                   ; $7248
        JR L725D                                 ; $7249

L724B:
        POP AF                                   ; $724B
        XOR A                                    ; $724C
        LD (IX+0),A                              ; $724D
        LD D,A                                   ; $7250
        LD C,A                                   ; $7251
        CALL L70A6                               ; $7252
        DEC L                                    ; $7255
        DEC L                                    ; $7256
        CALL L5D63                               ; $7257
        JP L7199                                 ; $725A

L725D:
        DEC L                                    ; $725D
        LD (IX+3),L                              ; $725E
        LD C,A                                   ; $7261
        CALL L70D5                               ; $7262
        JP L7199                                 ; $7265

L7268:
        BIT 1,C                                  ; $7268
        JR NZ,L7270                              ; $726A
        LD D,$08                                 ; $726C
        JR L7272                                 ; $726E

L7270:
        LD D,$12                                 ; $7270

L7272:
        LD C,A                                   ; $7272
        CALL L70B6                               ; $7273
        JP L7199                                 ; $7276

L7279:
        CALL L7096                               ; $7279
        LD A,($EAC9)                             ; $727C
        AND $3F                                  ; $727F
        CP $10                                   ; $7281
        JR NC,L7290                              ; $7283
        LD D,$00                                 ; $7285

L7287:
        INC L                                    ; $7287
        LD C,$36                                 ; $7288
        CALL L70E9                               ; $728A
        JP L7199                                 ; $728D

L7290:
        CP $18                                   ; $7290
        JR NC,L7298                              ; $7292

L7294:
        LD D,$02                                 ; $7294
        JR L7287                                 ; $7296

L7298:
        CP $38                                   ; $7298
        JR NC,L72AE                              ; $729A
        BIT 0,A                                  ; $729C
        JR NZ,L72A4                              ; $729E
        LD D,$04                                 ; $72A0
        JR L72A6                                 ; $72A2

L72A4:
        LD D,$08                                 ; $72A4

L72A6:
        LD C,$36                                 ; $72A6
        CALL L70B6                               ; $72A8
        JP L7199                                 ; $72AB

L72AE:
        JR NZ,L7294                              ; $72AE
        CALL L7103                               ; $72B0
        INC H                                    ; $72B3
        CALL L7103                               ; $72B4
        DEC H                                    ; $72B7
        JR L7294                                 ; $72B8

L72BA:
        PUSH HL                                  ; $72BA
        POP IX                                   ; $72BB
        LD H,(IX+1)                              ; $72BD
        LD L,(IX+2)                              ; $72C0
        LD B,(IX+3)                              ; $72C3
        LD C,(IX+4)                              ; $72C6
        RET                                      ; $72C9

L72CA:
        PUSH HL                                  ; $72CA
        PUSH DE                                  ; $72CB
        PUSH BC                                  ; $72CC
        CALL L72BA                               ; $72CD
        LD A,($EAC9)                             ; $72D0
        AND $03                                  ; $72D3
        LD C,$0C                                 ; $72D5
        CALL L72F4                               ; $72D7
        JP L7199                                 ; $72DA

L72DD:
        PUSH HL                                  ; $72DD
        PUSH DE                                  ; $72DE
        PUSH BC                                  ; $72DF
        CALL L72BA                               ; $72E0
        LD A,($EAC9)                             ; $72E3
        AND $03                                  ; $72E6
        LD C,A                                   ; $72E8
        LD A,$03                                 ; $72E9
        SUB C                                    ; $72EB
        LD C,$0D                                 ; $72EC
        CALL L72F4                               ; $72EE
        JP L7199                                 ; $72F1

L72F4:
        LD IX,$77F2                              ; $72F4

L72F8:
        ADD A,A                                  ; $72F8
        ADD A,A                                  ; $72F9
        LD E,A                                   ; $72FA
        LD D,$00                                 ; $72FB
        DEC B                                    ; $72FD
        ADD IX,DE                                ; $72FE
        LD D,(IX+0)                              ; $7300
        CALL L731E                               ; $7303

L7306:
        INC H                                    ; $7306
        LD D,(IX+1)                              ; $7307
        CALL L731E                               ; $730A
        INC H                                    ; $730D
        LD D,(IX+2)                              ; $730E
        CALL L731E                               ; $7311
        DJNZ L7306                               ; $7314
        INC H                                    ; $7316
        LD D,(IX+3)                              ; $7317
        CALL L6A7C                               ; $731A
        RET                                      ; $731D

L731E:
        PUSH IX                                  ; $731E
        CALL L6A7C                               ; $7320
        POP IX                                   ; $7323
        RET                                      ; $7325

L7326:
        PUSH HL                                  ; $7326
        PUSH DE                                  ; $7327
        PUSH BC                                  ; $7328
        CALL L72BA                               ; $7329
        LD A,($EAC9)                             ; $732C
        BIT 5,A                                  ; $732F
        JR NZ,L7341                              ; $7331
        AND $03                                  ; $7333
        LD IX,$7802                              ; $7335
        LD C,$0F                                 ; $7339
        CALL L72F8                               ; $733B
        JP L7199                                 ; $733E

L7341:
        LD A,B                                   ; $7341
        ADD A,A                                  ; $7342
        LD B,A                                   ; $7343

L7344:
        PUSH HL                                  ; $7344
        PUSH BC                                  ; $7345
        LD B,H                                   ; $7346
        LD C,L                                   ; $7347
        CALL L49B6                               ; $7348
        LD BC,$E496                              ; $734B
        ADD HL,BC                                ; $734E
        LD (HL),$10                              ; $734F
        LD BC,$0258                              ; $7351
        ADD HL,BC                                ; $7354
        LD (HL),$00                              ; $7355
        POP BC                                   ; $7357
        POP HL                                   ; $7358
        INC H                                    ; $7359
        DJNZ L7344                               ; $735A
        JP L7199                                 ; $735C

L735F:
        PUSH HL                                  ; $735F
        PUSH DE                                  ; $7360
        PUSH BC                                  ; $7361
        PUSH IX                                  ; $7362
        CALL L72BA                               ; $7364
        LD C,A                                   ; $7367
        CALL L5D5D                               ; $7368
        JR NZ,L739C                              ; $736B
        LD A,C                                   ; $736D
        LD B,H                                   ; $736E
        LD C,L                                   ; $736F
        CALL L474E                               ; $7370
        LD C,A                                   ; $7373
        LD (IX+4),C                              ; $7374
        BIT 2,C                                  ; $7377
        JP Z,L73F6                               ; $7379
        BIT 3,C                                  ; $737C
        JR NZ,L7387                              ; $737E
        INC L                                    ; $7380
        LD (IX+2),L                              ; $7381
        DEC L                                    ; $7384
        JR L738B                                 ; $7385

L7387:
        DEC L                                    ; $7387
        LD (IX+2),L                              ; $7388

L738B:
        LD C,$1B                                 ; $738B
        LD D,$07                                 ; $738D
        CALL L70B6                               ; $738F
        INC D                                    ; $7392
        DEC H                                    ; $7393
        INC L                                    ; $7394
        INC L                                    ; $7395
        INC L                                    ; $7396
        CALL L70B6                               ; $7397
        JR L73F6                                 ; $739A

L739C:
        PUSH IX                                  ; $739C
        LD C,(IX+4)                              ; $739E
        BIT 2,C                                  ; $73A1
        JR Z,L73F0                               ; $73A3
        BIT 3,C                                  ; $73A5
        JR Z,L73CC                               ; $73A7
        LD C,$1B                                 ; $73A9
        LD D,$03                                 ; $73AB
        CALL L70E9                               ; $73AD
        INC L                                    ; $73B0
        CALL L7103                               ; $73B1
        DEC H                                    ; $73B4
        CALL L6A7C                               ; $73B5
        INC L                                    ; $73B8
        INC L                                    ; $73B9
        INC L                                    ; $73BA
        LD C,$1B                                 ; $73BB
        LD D,$05                                 ; $73BD
        CALL L70E9                               ; $73BF
        INC L                                    ; $73C2
        CALL L7103                               ; $73C3
        DEC H                                    ; $73C6
        CALL L6A7C                               ; $73C7
        JR L73F0                                 ; $73CA

L73CC:
        DEC L                                    ; $73CC
        LD C,$1B                                 ; $73CD
        LD D,$02                                 ; $73CF
        CALL L6A7C                               ; $73D1
        INC H                                    ; $73D4
        CALL L6A7C                               ; $73D5
        INC L                                    ; $73D8
        LD D,$04                                 ; $73D9
        CALL L70F0                               ; $73DB
        INC L                                    ; $73DE
        INC L                                    ; $73DF
        INC L                                    ; $73E0
        CALL L7103                               ; $73E1
        INC H                                    ; $73E4
        CALL L6A7C                               ; $73E5
        INC L                                    ; $73E8
        LD C,$1B                                 ; $73E9
        LD D,$06                                 ; $73EB
        CALL L70F0                               ; $73ED

L73F0:
        POP IX                                   ; $73F0
        XOR A                                    ; $73F2
        LD (IX+4),A                              ; $73F3

L73F6:
        POP IX                                   ; $73F6
        JP L7199                                 ; $73F8

L73FB:
        PUSH HL                                  ; $73FB
        PUSH DE                                  ; $73FC
        PUSH BC                                  ; $73FD
        CALL L5D5D                               ; $73FE
        JR NZ,L7420                              ; $7401
        CALL L72BA                               ; $7403
        BIT 2,C                                  ; $7406
        JP Z,L7420                               ; $7408
        BIT 3,C                                  ; $740B
        JR Z,L7423                               ; $740D
        DEC L                                    ; $740F
        LD (IX+2),L                              ; $7410
        LD C,$1C                                 ; $7413
        LD D,$00                                 ; $7415
        CALL L70E9                               ; $7417
        INC L                                    ; $741A
        LD D,$03                                 ; $741B
        CALL L70F0                               ; $741D

L7420:
        JP L7199                                 ; $7420

L7423:
        INC L                                    ; $7423
        LD (IX+2),L                              ; $7424
        DEC L                                    ; $7427
        LD C,$00                                 ; $7428
        LD D,$00                                 ; $742A
        CALL L6A7C                               ; $742C
        INC H                                    ; $742F
        CALL L6A7C                               ; $7430
        INC L                                    ; $7433
        LD C,$1C                                 ; $7434
        LD D,$01                                 ; $7436
        CALL L70F0                               ; $7438
        JR L7420                                 ; $743B

L743D:
        PUSH HL                                  ; $743D
        PUSH DE                                  ; $743E
        PUSH BC                                  ; $743F
        CALL L5D5D                               ; $7440
        JR NZ,L746F                              ; $7443
        CALL L72BA                               ; $7445
        BIT 2,C                                  ; $7448
        JR Z,L746F                               ; $744A
        BIT 3,C                                  ; $744C
        JR Z,L7472                               ; $744E
        DEC L                                    ; $7450
        LD (IX+2),L                              ; $7451
        LD C,$1D                                 ; $7454
        LD D,$00                                 ; $7456
        CALL L70E9                               ; $7458
        INC H                                    ; $745B
        CALL L70E9                               ; $745C
        INC L                                    ; $745F
        CALL L7103                               ; $7460
        DEC H                                    ; $7463
        LD C,$1D                                 ; $7464
        LD D,$04                                 ; $7466
        CALL L70F0                               ; $7468
        DEC H                                    ; $746B
        CALL L7103                               ; $746C

L746F:
        JP L7199                                 ; $746F

L7472:
        INC L                                    ; $7472
        LD (IX+2),L                              ; $7473
        DEC L                                    ; $7476
        CALL L7103                               ; $7477
        INC H                                    ; $747A
        CALL L6A7C                               ; $747B
        INC H                                    ; $747E
        CALL L6A7C                               ; $747F
        INC H                                    ; $7482
        CALL L6A7C                               ; $7483
        INC L                                    ; $7486
        LD D,$02                                 ; $7487
        LD C,$1D                                 ; $7489
        CALL L70F0                               ; $748B
        DEC H                                    ; $748E
        CALL L70F0                               ; $748F
        JR L746F                                 ; $7492

L7494:
        PUSH HL                                  ; $7494
        PUSH DE                                  ; $7495
        PUSH BC                                  ; $7496
        CALL L72BA                               ; $7497
        BIT 0,C                                  ; $749A
        JP Z,L7199                               ; $749C
        BIT 1,C                                  ; $749F
        LD C,$1F                                 ; $74A1
        LD A,($EAC9)                             ; $74A3
        JR NZ,L74C6                              ; $74A6
        BIT 0,A                                  ; $74A8
        JR NZ,L74BA                              ; $74AA
        DEC H                                    ; $74AC
        LD (IX+1),H                              ; $74AD

L74B0:
        LD D,$02                                 ; $74B0
        CALL L70E9                               ; $74B2
        CALL L70F7                               ; $74B5
        JR L74C3                                 ; $74B8

L74BA:
        LD D,$00                                 ; $74BA
        CALL L70E9                               ; $74BC
        INC H                                    ; $74BF
        CALL L7103                               ; $74C0

L74C3:
        JP L7199                                 ; $74C3

L74C6:
        BIT 0,A                                  ; $74C6
        JR NZ,L74D1                              ; $74C8
        INC H                                    ; $74CA
        LD (IX+1),H                              ; $74CB
        DEC H                                    ; $74CE
        JR L74B0                                 ; $74CF

L74D1:
        DEC H                                    ; $74D1
        CALL L7103                               ; $74D2
        INC H                                    ; $74D5
        LD C,$1F                                 ; $74D6
        LD D,$00                                 ; $74D8
        CALL L70E9                               ; $74DA
        JR L74C3                                 ; $74DD

L74DF:
        PUSH HL                                  ; $74DF
        POP IX                                   ; $74E0
        LD H,(IX+2)                              ; $74E2
        LD L,(IX+3)                              ; $74E5
        RET                                      ; $74E8

L74E9:
        PUSH HL                                  ; $74E9
        PUSH DE                                  ; $74EA
        PUSH BC                                  ; $74EB
        CALL L74DF                               ; $74EC
        PUSH HL                                  ; $74EF
        CALL L6F4D                               ; $74F0
        LD A,($EAC9)                             ; $74F3
        AND $01                                  ; $74F6
        ADD A,$2A                                ; $74F8
        LD B,$0B                                 ; $74FA
        CALL L6EE1                               ; $74FC
        POP HL                                   ; $74FF
        LD A,($EAC9)                             ; $7500
        AND $01                                  ; $7503
        ADD A,A                                  ; $7505
        ADD A,A                                  ; $7506
        LD D,A                                   ; $7507
        LD C,$21                                 ; $7508
        CALL L70B6                               ; $750A
        JP L7199                                 ; $750D

L7510:
        PUSH HL                                  ; $7510
        PUSH DE                                  ; $7511
        PUSH BC                                  ; $7512
        CALL L74DF                               ; $7513
        LD A,($EAC9)                             ; $7516
        AND $7F                                  ; $7519
        CP $10                                   ; $751B
        JR Z,L7571                               ; $751D
        JP NC,L7199                              ; $751F
        PUSH HL                                  ; $7522
        LD B,$03                                 ; $7523
        LD HL,$E969                              ; $7525
        LD DE,$0000                              ; $7528

L752B:
        PUSH BC                                  ; $752B
        PUSH HL                                  ; $752C
        PUSH DE                                  ; $752D
        LD A,(HL)                                ; $752E
        OR A                                     ; $752F
        JR Z,L7557                               ; $7530
        LD H,$00                                 ; $7532
        LD L,A                                   ; $7534
        ADD HL,DE                                ; $7535
        ADD HL,HL                                ; $7536
        ADD HL,HL                                ; $7537
        ADD HL,HL                                ; $7538
        LD DE,($F3C9)                            ; $7539
        ADD HL,DE                                ; $753D
        LD DE,$0007                              ; $753E
        ADD HL,DE                                ; $7541
        CALL LDIRMV                              ; $7542
        LD C,A                                   ; $7545
        LD B,$07                                 ; $7546

L7548:
        DEC HL                                   ; $7548
        CALL LDIRMV                              ; $7549
        INC HL                                   ; $754C
        CALL CHGMOD                              ; $754D
        DEC HL                                   ; $7550
        DJNZ L7548                               ; $7551
        LD A,C                                   ; $7553
        CALL CHGMOD                              ; $7554

L7557:
        POP DE                                   ; $7557
        POP HL                                   ; $7558
        LD BC,$0060                              ; $7559
        ADD HL,BC                                ; $755C
        EX DE,HL                                 ; $755D
        LD BC,$0100                              ; $755E
        ADD HL,BC                                ; $7561
        EX DE,HL                                 ; $7562
        POP BC                                   ; $7563
        DJNZ L752B                               ; $7564
        POP HL                                   ; $7566
        LD C,$23                                 ; $7567

L7569:
        LD D,$00                                 ; $7569
        CALL L70A6                               ; $756B
        JP L7199                                 ; $756E

L7571:
        LD C,$00                                 ; $7571
        JR L7569                                 ; $7573

L7575:
        LD E,A                                   ; $7575
        CALL L7096                               ; $7576
        DEC L                                    ; $7579
        LD (IX+3),L                              ; $757A
        LD C,A                                   ; $757D
        LD D,$00                                 ; $757E
        CALL L70B6                               ; $7580
        INC L                                    ; $7583
        CALL L7103                               ; $7584
        DEC H                                    ; $7587
        CALL L6A7C                               ; $7588
        RET                                      ; $758B

L758C:
        PUSH HL                                  ; $758C
        POP IX                                   ; $758D
        LD A,(IX+1)                              ; $758F
        AND $0F                                  ; $7592
        DEC A                                    ; $7594
        LD E,A                                   ; $7595
        LD D,$00                                 ; $7596
        LD HL,$E337                              ; $7598
        ADD HL,DE                                ; $759B
        LD A,(HL)                                ; $759C
        OR A                                     ; $759D
        JR Z,L75D3                               ; $759E
        DEC (HL)                                 ; $75A0
        PUSH IX                                  ; $75A1
        CALL L5E01                               ; $75A3
        POP IX                                   ; $75A6
        XOR A                                    ; $75A8
        LD (IX+0),A                              ; $75A9
        LD H,(IX+2)                              ; $75AC
        LD L,(IX+3)                              ; $75AF
        LD A,(IX+1)                              ; $75B2
        AND $F0                                  ; $75B5
        SRL A                                    ; $75B7
        SRL A                                    ; $75B9
        SRL A                                    ; $75BB
        SRL A                                    ; $75BD
        ADD A,$3F                                ; $75BF
        LD C,A                                   ; $75C1
        LD D,$00                                 ; $75C2
        CALL L6A7C                               ; $75C4
        CALL L70F7                               ; $75C7
        DEC H                                    ; $75CA
        INC L                                    ; $75CB
        LD C,$00                                 ; $75CC
        LD D,$00                                 ; $75CE
        CALL L70A6                               ; $75D0

L75D3:
        RET                                      ; $75D3
        DB $F5,$E5,$D5,$C5,$DD,$E5,$3A,$F3,$EA,$B7,$20,$05,$CD,$AC,$76,$18 ; $75D4 | ......:... ...v.
        DB $29,$4F,$3A,$F4,$EA,$81,$4F,$CD,$BE,$76,$3A,$F5,$EA,$3C,$32,$F5 ; $75E4 | )O:...O..v:..<2.
        DB $EA,$B9,$38,$16,$AF,$32,$F5,$EA,$DD,$21,$E9,$EA,$0E,$00,$CD,$15 ; $75F4 | ..8..2...!......
        DB $76,$DD,$21,$ED,$EA,$0E,$02,$CD,$15,$76,$DD,$E1,$C1,$D1,$E1,$F1 ; $7604 | v.!......v......
        DB $C9,$DD,$46,$00,$DD,$7E,$01,$3C,$DD,$77,$01,$B8,$D8,$AF,$DD,$77 ; $7614 | ..F..~.<.w.....w
        DB $01,$DD,$6E,$02,$DD,$66,$03,$7E,$FE,$FF,$20,$04,$CD,$AC,$76,$C9 ; $7624 | ..n..f.~.. ...v.
        DB $FE,$FE,$20,$0C,$23,$5E,$23,$56,$DD,$73,$02,$DD,$72,$03,$18,$E1 ; $7634 | .. .#^#V.s..r...
        DB $47,$CB,$78,$28,$07,$23,$7E,$DD,$77,$00,$CB,$B8,$23,$DD,$75,$02 ; $7644 | G.x(.#~.w...#.u.
        DB $DD,$74,$03,$78,$CD,$5C,$76,$C9,$E5,$D5,$C5,$FE,$60,$28,$3B,$6F ; $7654 | .t.x.\v.....`(;o
        DB $3A,$F1,$EA,$85,$6F,$3A,$F2,$EA,$85,$6F,$26,$00,$29,$11,$12,$78 ; $7664 | :...o:...o&.)..x
        DB $19,$5E,$23,$56,$AF,$81,$CD,$93,$00,$5A,$3E,$01,$81,$CD,$93,$00 ; $7674 | .^#V.....Z>.....
        DB $3E,$10,$91,$CB,$39,$91,$5F,$3E,$08,$81,$CD,$93,$00,$79,$B7,$20 ; $7684 | >...9._>.....y. 
        DB $13,$3E,$0D,$1E,$00,$CD,$93,$00,$18,$0A,$CB,$39,$3E,$08,$81,$1E ; $7694 | .>.........9>...
        DB $00,$CD,$93,$00,$C1,$D1,$E1,$C9,$1E,$00,$3E,$08,$CD,$93,$00,$3E ; $76A4 | ..........>....>
        DB $09,$CD,$93,$00,$3E,$0A,$CD,$93,$00,$C9,$C5,$21,$F6,$EA,$06,$03 ; $76B4 | ....>......!....
        DB $7E,$B7,$28,$01,$35,$23,$10,$F8,$21,$F6,$EA,$7E,$B7,$28,$27,$4F ; $76C4 | ~.(.5#..!..~.('O
        DB $3E,$07,$1E,$98,$CD,$93,$00,$CB,$39,$3E,$03,$81,$5F,$3E,$06,$CD ; $76D4 | >.......9>.._>..
        DB $93,$00,$CB,$39,$3E,$03,$81,$5F,$3E,$05,$CD,$93,$00,$3E,$0A,$1E ; $76E4 | ...9>.._>....>..
        DB $0F,$CD,$93,$00,$18,$6D,$23,$7E,$B7,$28,$2C,$4F,$3E,$07,$1E,$B8 ; $76F4 | .....m#~.(,O>...
        DB $CD,$93,$00,$3E,$05,$1E,$01,$CD,$93,$00,$CB,$39,$CB,$39,$CB,$39 ; $7704 | ...>.......9.9.9
        DB $3E,$01,$91,$1E,$7D,$28,$02,$1E,$53,$3E,$04,$CD,$93,$00,$3E,$0A ; $7714 | >...}(..S>....>.
        DB $1E,$0F,$CD,$93,$00,$18,$3C,$23,$7E,$B7,$28,$30,$4F,$3E,$07,$1E ; $7724 | ......<#~.(0O>..
        DB $B8,$CD,$93,$00,$3E,$05,$1E,$00,$CD,$93,$00,$3E,$FF,$91,$4F,$CB ; $7734 | ....>......>..O.
        DB $39,$16,$00,$CB,$41,$28,$02,$16,$32,$3E,$1E,$82,$81,$5F,$3E,$04 ; $7744 | 9...A(..2>..._>.
        DB $CD,$93,$00,$3E,$0A,$1E,$0E,$CD,$93,$00,$18,$07,$3E,$0A,$1E,$00 ; $7754 | ...>........>...
        DB $CD,$93,$00,$C1,$C9                      ; $7764 | .....

L7769:
        DI                                       ; $7769
        LD ($EAEB),HL                            ; $776A
        LD ($EAEF),DE                            ; $776D
        XOR A                                    ; $7771
        LD ($EAE9),A                             ; $7772
        LD ($EAED),A                             ; $7775
        LD ($EAEA),A                             ; $7778
        LD ($EAEE),A                             ; $777B
        EI                                       ; $777E
        RET                                      ; $777F
        DB $00,$00,$E0,$00,$E0,$00,$E0,$00,$E0,$00,$E0,$00,$E0,$00,$A0,$00 ; $7780 | ................
        DB $A0,$00,$10,$02,$10,$01,$10,$01,$A1,$01,$A1,$02,$A1,$10,$A0,$00 ; $7790 | ................
        DB $00,$00,$E0,$00,$E0,$00,$E0,$00,$E0,$00,$A0,$00,$A0,$00,$10,$01 ; $77A0 | ................
        DB $10,$01,$A0,$00,$A0,$00,$C0,$77,$D0,$77,$D8,$77,$D8,$77,$E2,$77 ; $77B0 | .......w.w.w.w.w
        DB $A0,$00,$A0,$00,$20,$00,$A0,$00,$A0,$00,$A0,$00,$A0,$00,$A0,$00 ; $77C0 | .... ...........
        DB $A0,$00,$A0,$00,$A0,$00,$A0,$00,$A0,$00,$A0,$00,$A0,$00,$20,$00 ; $77D0 | .............. .
        DB $20,$00,$24,$00,$20,$00,$20,$00,$20,$00,$24,$00,$20,$00,$20,$00 ; $77E0 |  .$. . . .$. . .
        DB $20,$00,$03,$05,$04,$03,$00,$02,$01,$00,$03,$04,$05,$03,$00,$01 ; $77F0 |  ...............
        DB $02,$00,$02,$03,$02,$03,$01,$00,$01,$00,$03,$02,$03,$02,$00,$01 ; $7800 | ................
        DB $00,$01,$5D,$0D,$9C,$0C,$E7,$0B,$3C,$0B,$9B,$0A,$02,$0A,$73,$09 ; $7810 | ..].....<.....s.
        DB $EB,$08,$6B,$08,$F2,$07,$80,$07,$14,$07,$AF,$06,$4E,$06,$F4,$05 ; $7820 | ..k.........N...
        DB $9E,$05,$4E,$05,$01,$05,$BA,$04,$76,$04,$36,$04,$F9,$03,$C0,$03 ; $7830 | ..N.....v.6.....
        DB $8A,$03,$57,$03,$27,$03,$FA,$02,$CF,$02,$A7,$02,$81,$02,$5D,$02 ; $7840 | ..W.'.........].
        DB $3B,$02,$1B,$02,$FD,$01,$E0,$01,$C5,$01,$AC,$01,$94,$01,$7D,$01 ; $7850 | ;.............}.
        DB $68,$01,$53,$01,$40,$01,$2E,$01,$1D,$01,$0D,$01,$FE,$00,$F0,$00 ; $7860 | h.S.@...........
        DB $E3,$00,$D6,$00,$CA,$00,$BE,$00,$B4,$00,$AA,$00,$A0,$00,$97,$00 ; $7870 | ................
        DB $8F,$00,$87,$00,$7F,$00,$78,$00,$71,$00,$6B,$00,$65,$00,$5F,$00 ; $7880 | ......x.q.k.e._.
        DB $5A,$00,$55,$00,$50,$00,$4C,$00,$47,$00,$43,$00,$40,$00,$3C,$00 ; $7890 | Z.U.P.L.G.C.@.<.
        DB $39,$00,$35,$00,$32,$00,$30,$00,$2D,$00,$2A,$00,$28,$00,$26,$00 ; $78A0 | 9.5.2.0.-.*.(.&.
        DB $24,$00,$22,$00,$20,$00,$1E,$00,$1C,$00,$1B,$00,$19,$00,$18,$00 ; $78B0 | $.". ...........
        DB $16,$00,$15,$00,$14,$00,$13,$00,$12,$00,$11,$00,$10,$00,$0F,$00 ; $78C0 | ................
        DB $0E,$00,$B0,$02,$34,$37,$34,$35,$32,$37,$37,$30,$34,$37,$34,$35 ; $78D0 | ....474527704745
        DB $32,$37,$60,$30,$34,$37,$34,$35,$32,$37,$37,$30,$34,$37,$34,$35 ; $78E0 | 27`0474527704745
        DB $32,$30,$60,$3C,$3B,$39,$37,$39,$37,$37,$37,$37,$35,$35,$35,$35 ; $78F0 | 20`<;97977775555
        DB $34,$37,$60,$3C,$3B,$39,$37,$39,$37,$37,$37,$37,$35,$34,$32,$30 ; $7900 | 47`<;97977775420
        DB $34,$30,$60,$FE,$D2,$78,$A8,$02,$24,$28,$24,$26,$A3,$01,$26,$2B ; $7910 | 40`..x..$($&..&+
        DB $29,$28,$26,$A8,$02,$24,$30,$28,$23,$26,$1F,$23,$28,$24,$28,$24 ; $7920 | )(&..$0(#&.#($($
        DB $26,$A6,$01,$29,$2B,$29,$28,$26,$A8,$02,$24,$30,$28,$2B,$29,$28 ; $7930 | &..)+)(&..$0(+)(
        DB $60,$28,$26,$24,$23,$29,$28,$28,$28,$28,$26,$26,$26,$60,$1F,$28 ; $7940 | `(&$#)((((&&&`.(
        DB $60,$28,$26,$24,$23,$29,$28,$28,$28,$28,$26,$24,$1F,$60,$1F,$24 ; $7950 | `(&$#)((((&$.`.$
        DB $60,$FE,$16,$79,$B0,$01,$60,$2B,$2B,$AD,$02,$2B,$30,$2B,$2D,$2B ; $7960 | `..y..`++..+0+-+
        DB $B2,$01,$60,$2B,$2B,$AD,$02,$2B,$32,$2B,$2D,$2B,$B4,$01,$60,$2B ; $7970 | ..`++..+2+-+..`+
        DB $2B,$AD,$02,$2B,$34,$2B,$2D,$2B,$35,$60,$37,$60,$39,$60,$3B,$60 ; $7980 | +..+4+-+5`7`9`;`
        DB $FE,$64,$79,$98,$02,$28,$60,$18,$18,$28,$60,$18,$17,$26,$60,$17 ; $7990 | .dy..(`..(`..&`.
        DB $17,$26,$60,$17,$18,$28,$60,$18,$18,$28,$60,$18,$1A,$29,$1C,$2B ; $79A0 | .&`..(`..(`..).+
        DB $1D,$2D,$1F,$2F,$FE,$93,$79,$B0,$04,$B4,$02,$30,$32,$37,$37,$37 ; $79B0 | .-./..y....02777
        DB $B0,$04,$B4,$02,$30,$32,$2B,$2B,$2B,$B0,$04,$B4,$02,$30,$32,$37 ; $79C0 | ....02+++....027
        DB $37,$37,$B0,$04,$B4,$02,$30,$32,$34,$30,$60,$FE,$B7,$79,$A8,$02 ; $79D0 | 77....0240`..y..
        DB $2B,$30,$2B,$29,$2B,$2F,$29,$28,$2B,$30,$2B,$29,$26,$23,$2B,$A8 ; $79E0 | +0+)+/)(+0+)&#+.
        DB $02,$2B,$30,$2B,$29,$2B,$2F,$29,$28,$2B,$30,$2B,$29,$2B,$28,$60 ; $79F0 | .+0+)+/)(+0+)+(`
        DB $FE,$DE,$79,$BC,$04,$3C,$40,$3C,$C1,$02,$40,$3E,$40,$C1,$04,$60 ; $7A00 | ..y..<@<..@>@..`
        DB $3B,$3C,$3E,$3B,$C0,$02,$3E,$3C,$3E,$C0,$04,$60,$3C,$3E,$40,$3C ; $7A10 | ;<>;..><>..`<>@<
        DB $C1,$02,$40,$3E,$40,$41,$60,$C5,$04,$E0,$02,$C3,$04,$C5,$02,$C3 ; $7A20 | ..@>@A`.........
        DB $04,$41,$E0,$02,$C0,$04,$BE,$02,$BC,$04,$60,$FF,$A8,$04,$28,$24 ; $7A30 | .A........`...($
        DB $28,$2B,$AB,$02,$2D,$AB,$04,$60,$29,$28,$2B,$2B,$B0,$02,$2B,$28 ; $7A40 | (+..-..`)(++..+(
        DB $2B,$B0,$04,$60,$A8,$04,$28,$24,$28,$2B,$AB,$02,$26,$AB,$04,$2F ; $7A50 | +..`..($(+..&../
        DB $E0,$02,$AF,$04,$B0,$02,$B2,$04,$2F,$E0,$02,$AB,$04,$A9,$02,$A8 ; $7A60 | ......../.......
        DB $04,$60,$FF,$B0,$02,$E0,$01,$30,$B2,$02,$E0,$01,$32,$B4,$02,$E0 ; $7A70 | .`.....0....2...
        DB $01,$34,$B5,$02,$E0,$01,$35,$B4,$02,$60,$AB,$04,$B0,$08,$FF,$A8 ; $7A80 | .4....5..`......
        DB $02,$E0,$01,$28,$AB,$02,$E0,$01,$2B,$B0,$02,$E0,$01,$30,$B2,$02 ; $7A90 | ...(....+....0..
        DB $E0,$01,$32,$B0,$02,$60,$A9,$04,$A8,$08,$FF,$39,$00,$39,$00,$39 ; $7AA0 | ..2..`.....9.9.9
        DB $00,$39,$00,$39,$00,$39,$00,$39,$00,$39,$00,$39,$00,$39,$00,$39 ; $7AB0 | .9.9.9.9.9.9.9.9
        DB $03,$07,$00,$02,$10,$03,$00,$03,$03,$0B,$00,$03,$13,$05,$03,$17 ; $7AC0 | ................
        DB $00,$02,$03,$07,$13,$02,$00,$02,$13,$05,$03,$01,$00,$02,$03,$05 ; $7AD0 | ................
        DB $13,$03,$03,$01,$00,$02,$07,$07,$17,$03,$07,$06,$17,$03,$00,$02 ; $7AE0 | ................
        DB $13,$05,$00,$01,$03,$01,$13,$08,$00,$03,$07,$07,$00,$03,$17,$07 ; $7AF0 | ................
        DB $07,$11,$00,$07,$17,$03,$07,$01,$00,$01,$10,$01,$17,$04,$07,$02 ; $7B00 | ................
        DB $17,$03,$00,$02,$17,$03,$13,$03,$03,$0B,$00,$01,$10,$03,$00,$01 ; $7B10 | ................
        DB $07,$04,$00,$01,$07,$10,$00,$02,$07,$02,$00,$01,$03,$01,$00,$01 ; $7B20 | ................
        DB $03,$02,$00,$01,$03,$09,$00,$05,$13,$04,$03,$0E,$13,$02,$00,$02 ; $7B30 | ................
        DB $17,$05,$00,$02,$13,$04,$00,$02,$03,$06,$13,$09,$03,$0C,$00,$09 ; $7B40 | ................
        DB $17,$08,$00,$02,$13,$07,$00,$46,$10,$01,$00,$08,$07,$02,$00,$18 ; $7B50 | .......F........
        DB $07,$04,$17,$02,$07,$03,$17,$03,$07,$02,$00,$04,$03,$03,$00,$02 ; $7B60 | ................
        DB $07,$04,$00,$01,$03,$09,$00,$03,$10,$01,$00,$17,$03,$02,$00,$07 ; $7B70 | ................
        DB $03,$07,$10,$01,$13,$01,$03,$01,$00,$03,$13,$06,$03,$01,$13,$01 ; $7B80 | ................
        DB $10,$01,$17,$02,$00,$02,$17,$03,$00,$02,$13,$03,$03,$18,$13,$07 ; $7B90 | ................
        DB $03,$0D,$13,$02,$10,$01,$17,$05,$00,$03,$10,$03,$17,$02,$00,$01 ; $7BA0 | ................
        DB $13,$06,$00,$02,$10,$04,$00,$0E,$10,$03,$13,$02,$03,$02,$00,$37 ; $7BB0 | ...............7
        DB $96,$7E,$56,$80,$86,$82,$B6,$84,$76,$86,$B6,$86,$D6,$86,$F6,$86 ; $7BC0 | .~V.....v.......
        DB $96,$87,$56,$9A,$76,$9A,$86,$9A,$96,$9A,$56,$89,$01,$66,$89,$02 ; $7BD0 | ..V.v.....V..f..
        DB $86,$89,$02,$A6,$89,$02,$C6,$89,$02,$E6,$89,$01,$E6,$89,$01,$16 ; $7BE0 | ................
        DB $8A,$03,$46,$8A,$03,$56,$8A,$01,$76,$8A,$02,$96,$8A,$02,$B6,$8A ; $7BF0 | ..F..V..v.......
        DB $06,$B6,$8A,$06,$16,$8B,$03,$46,$8B,$04,$56,$89,$01,$F6,$89,$01 ; $7C00 | .......F..V.....
        DB $F6,$89,$01,$06,$8A,$01,$06,$8A,$01,$86,$8B,$06,$E6,$8B,$02,$06 ; $7C10 | ................
        DB $8C,$02,$26,$8C,$02,$56,$89,$01,$56,$89,$01,$46,$8C,$0F,$36,$8D ; $7C20 | ..&..V..V..F..6.
        DB $04,$76,$8D,$05,$76,$8D,$05,$C6,$8D,$05,$16,$8E,$04,$56,$8E,$08 ; $7C30 | .v..v........V..
        DB $D6,$8E,$04,$16,$8F,$04,$56,$8F,$04,$96,$8F,$04,$D6,$8F,$04,$16 ; $7C40 | ......V.........
        DB $90,$04,$56,$90,$04,$96,$90,$04,$D6,$90,$04,$D6,$90,$04,$D6,$90 ; $7C50 | ..V.............
        DB $04,$D6,$90,$04,$D6,$90,$04,$D6,$90,$04,$16,$91,$10,$B6,$91,$10 ; $7C60 | ................
        DB $56,$92,$10,$F6,$92,$10,$96,$93,$10,$36,$94,$06,$D6,$94,$0C,$96 ; $7C70 | V........6......
        DB $95,$28,$76,$96,$28,$56,$97,$28,$36,$98,$1C,$16,$99,$1C,$56,$89 ; $7C80 | .(v.(V.(6.....V.
        DB $01,$56,$89,$01,$56,$89,$01,$56,$89,$01,$36,$9A,$02,$36,$9A,$02 ; $7C90 | .V..V..V..6..6..
        DB $36,$9A,$02,$F6,$99,$02,$F6,$99,$02,$F6,$99,$02,$F6,$99,$02,$F6 ; $7CA0 | 6...............
        DB $99,$02,$F6,$99,$02,$F6,$99,$02,$F6,$99,$02,$F6,$99,$02,$F6,$99 ; $7CB0 | ................
        DB $02,$F6,$99,$02,$F6,$99,$02,$F6,$99,$02,$F6,$99,$02,$F6,$99,$02 ; $7CC0 | ................
        DB $F6,$99,$02,$F6,$99,$02,$F6,$99,$02,$16,$9A,$02,$16,$9A,$02,$16 ; $7CD0 | ................
        DB $9A,$02,$16,$9A,$02,$16,$9A,$02,$16,$9A,$02,$16,$9A,$02,$96,$9B ; $7CE0 | ................
        DB $96,$A3,$D6,$A3,$DC,$A3,$44,$A4,$49,$A4,$86,$A4,$8B,$A4,$BB,$A4 ; $7CF0 | ......D.I.......
        DB $C0,$A4,$15,$A5,$1D,$A5,$5E,$A5,$65,$A5,$D5,$A5,$DA,$A5,$16,$A6 ; $7D00 | ......^.e.......
        DB $1B,$A6,$5E,$A6,$61,$A6,$9D,$A6,$A1,$A6,$E4,$A6,$E6,$A6,$E8,$A6 ; $7D10 | ..^.a...........
        DB $37,$A7,$3D,$A7,$6D,$A7,$73,$A7,$B0,$A7,$B5,$A7,$E8,$A7,$ED,$A7 ; $7D20 | 7.=.m.s.........
        DB $35,$A8,$38,$A8,$94,$A8,$9A,$A8,$E0,$A8,$E2,$A8,$37,$A9,$3B,$A9 ; $7D30 | 5.8.........7.;.
        DB $87,$A9,$8D,$A9,$D5,$A9,$DA,$A9,$DC,$A9,$18,$AA,$1C,$AA,$84,$AA ; $7D40 | ................
        DB $88,$AA,$CE,$AA,$D2,$AA,$05,$AB,$08,$AB,$3F,$AB,$42,$AB,$97,$AB ; $7D50 | ..........?.B...
        DB $9C,$AB,$F8,$AB,$FB,$AB,$38,$AC,$3D,$AC,$B6,$AC,$B9,$AC,$15,$AD ; $7D60 | ......8.=.......
        DB $17,$AD,$1A,$AD,$57,$AD,$5B,$AD,$A1,$AD,$A5,$AD,$FD,$AD,$00,$AE ; $7D70 | ....W.[.........
        DB $4F,$AE,$53,$AE,$8B,$AE,$90,$AE,$B7,$AE,$BC,$AE,$EA,$AE,$EF,$AE ; $7D80 | O.S.............
        DB $19,$AF,$1D,$AF,$85,$AF,$8B,$AF,$E0,$AF,$E2,$AF,$E4,$AF,$2F,$B0 ; $7D90 | ............../.
        DB $33,$B0,$64,$B0,$68,$B0,$A9,$B0,$AC,$B0,$F4,$B0,$F6,$B0,$34,$B1 ; $7DA0 | 3.d.h.........4.
        DB $38,$B1,$6B,$B1,$71,$B1,$BC,$B1,$C1,$B1,$F0,$B1,$F3,$B1,$20,$B2 ; $7DB0 | 8.k.q......... .
        DB $24,$B2,$57,$B2,$59,$B2,$5B,$B2,$98,$B2,$9B,$B2,$DB,$B2,$DF,$B2 ; $7DC0 | $.W.Y.[.........
        DB $30,$B3,$34,$B3,$6E,$B3,$72,$B3,$BC,$B3,$C3,$B3,$EF,$B3,$F6,$B3 ; $7DD0 | 0.4.n.r.........
        DB $38,$B4,$3F,$B4,$99,$B4,$9E,$B4,$D3,$B4,$D8,$B4,$26,$B5,$28,$B5 ; $7DE0 | 8.?.........&.(.
        DB $2C,$B5,$77,$B5,$7B,$B5,$99,$B5,$9E,$B5,$F8,$B5,$FC,$B5,$2F,$B6 ; $7DF0 | ,.w.{........./.
        DB $33,$B6,$4E,$B6,$50,$B6,$97,$B6,$9A,$B6,$EA,$B6,$ED,$B6,$37,$B7 ; $7E00 | 3.N.P.........7.
        DB $3C,$B7,$79,$B7,$7D,$B7,$C2,$B7,$C4,$B7,$C7,$B7,$03,$B8,$0B,$B8 ; $7E10 | <.y.}...........
        DB $3B,$B8,$43,$B8,$91,$B8,$97,$B8,$DD,$B8,$E3,$B8,$31,$B9,$36,$B9 ; $7E20 | ;.C.........1.6.
        DB $68,$B9,$6E,$B9,$B6,$B9,$BC,$B9,$0B,$BA,$10,$BA,$4E,$BA,$54,$BA ; $7E30 | h.n.........N.T.
        DB $9B,$BA,$9E,$BA,$A0,$BA,$F3,$BA,$F6,$BA,$1E,$BB,$26,$BB,$6C,$BB ; $7E40 | ............&.l.
        DB $70,$BB,$B5,$BB,$BA,$BB,$17,$BC,$1C,$BC,$57,$BC,$5C,$BC,$79,$BC ; $7E50 | p.........W.\.y.
        DB $7C,$BC,$BE,$BC,$C2,$BC,$F3,$BC,$F8,$BC,$32,$BD,$34,$BD,$36,$BD ; $7E60 | |.........2.4.6.
        DB $80,$BD,$83,$BD,$C9,$BD,$CD,$BD,$1D,$BE,$21,$BE,$47,$BE,$4C,$BE ; $7E70 | ..........!.G.L.
        DB $7A,$BE,$7F,$BE,$CA,$BE,$CF,$BE,$14,$BF,$19,$BF,$78,$BF,$7B,$BF ; $7E80 | z...........x.{.
        DB $98,$BF,$9D,$BF,$EA,$BF,$FF,$71,$00,$B4,$00,$B4,$1F,$94,$33,$94 ; $7E90 | .......q......3.
        DB $03,$94,$03,$94,$03,$94,$FF,$71,$00,$B4,$04,$B4,$E0,$94,$30,$94 ; $7EA0 | .......q......0.
        DB $36,$94,$3B,$94,$33,$94,$FF,$71,$00,$B4,$00,$B4,$00,$B4,$00,$B4 ; $7EB0 | 6.;.3..q........
        DB $3C,$94,$66,$94,$64,$94,$FF,$71,$00,$B4,$00,$B4,$00,$B4,$40,$B4 ; $7EC0 | <.f.d..q......@.
        DB $00,$B4,$00,$B4,$00,$B4,$FF,$74,$00,$B4,$00,$B4,$08,$B4,$00,$B4 ; $7ED0 | .......t........
        DB $00,$B4,$80,$B4,$00,$B4,$FF,$71,$00,$F4,$00,$84,$0C,$A4,$0E,$A4 ; $7EE0 | .......q........
        DB $08,$A4,$08,$84,$1C,$84,$FF,$71,$10,$84,$38,$84,$38,$84,$7C,$84 ; $7EF0 | .......q..8.8.|.
        DB $7C,$84,$FE,$84,$FE,$64,$03,$94,$03,$94,$01,$94,$20,$B4,$01,$84 ; $7F00 | |....d...... ...
        DB $03,$84,$07,$84,$07,$84,$33,$94,$BB,$94,$11,$94,$85,$48,$00,$48 ; $7F10 | ......3......H.H
        DB $3C,$48,$7E,$48,$FF,$4B,$69,$94,$F2,$94,$3C,$94,$00,$84,$00,$84 ; $7F20 | <H~H.Ki...<.....
        DB $04,$B4,$80,$84,$80,$84,$00,$B4,$20,$B4,$70,$B4,$20,$B4,$00,$84 ; $7F30 | ........ .p. ...
        DB $01,$84,$03,$84,$01,$84,$00,$B4,$04,$B4,$00,$B4,$20,$84,$70,$84 ; $7F40 | ............ .p.
        DB $30,$84,$B0,$84,$B0,$84,$3E,$84,$3E,$64,$3E,$F4,$2A,$F4,$2A,$F4 ; $7F50 | 0.....>.>d>.*.*.
        DB $3E,$F4,$3F,$F4,$1F,$F4,$01,$4F,$29,$4F,$29,$4F,$01,$8F,$43,$8F ; $7F60 | >.?....O)O)O..C.
        DB $E7,$8F,$E7,$6F,$00,$EF,$0F,$84,$0F,$84,$0F,$84,$0F,$84,$07,$84 ; $7F70 | ...o............
        DB $07,$84,$03,$84,$01,$84,$FF,$4B,$F7,$4B,$FF,$43,$FF,$43,$FF,$43 ; $7F80 | .......K.K.C.C.C
        DB $7F,$48,$3F,$48,$FF,$84,$1E,$84,$73,$84,$E1,$84,$4D,$84,$19,$84 ; $7F90 | .H?H....s...M...
        DB $71,$84,$F5,$84,$38,$84,$3F,$84,$61,$84,$F1,$84,$B9,$84,$9D,$84 ; $7FA0 | q...8.?.a.......
        DB $8F,$84,$C7,$84,$FF,$84,$F1,$84,$B3,$84,$B3,$84,$B6,$84,$B6,$84 ; $7FB0 | ................
        DB $B6,$84,$FB,$84,$B3,$84,$0F,$F8,$07,$F8,$30,$8F,$20,$8F,$40,$8F ; $7FC0 | ..........0. .@.
        DB $84,$8F,$0C,$8F,$07,$F8,$00,$EF,$00,$EF,$55,$EF,$7F,$EF,$00,$4F ; $7FD0 | ..........U....O
        DB $2A,$4F,$00,$4F,$0C,$4F,$00,$34,$00,$34,$10,$34,$80,$14,$92,$14 ; $7FE0 | *O.O.O.4.4.4....
        DB $DF,$14,$FF,$14,$FF,$71,$7C,$84,$00,$34,$00,$34,$20,$14,$32,$14 ; $7FF0 | .....q|..4.4 .2.
        DB $77,$14,$FF,$14,$FF,$71,$10,$84,$00,$34,$08,$14,$18,$14,$1C,$14 ; $8000 | w....q...4......
        DB $3C,$14,$FF,$14,$FF,$71,$FC,$84,$00,$34,$04,$34,$40,$04,$44,$04 ; $8010 | <....q...4.4@.D.
        DB $EE,$04,$FF,$04,$FF,$71,$91,$84,$00,$14,$03,$14,$07,$14,$1F,$14 ; $8020 | .....q..........
        DB $7F,$14,$FF,$14,$FF,$71,$0F,$F8,$E7,$EC,$FF,$04,$FF,$04,$FF,$04 ; $8030 | .....q..........
        DB $FF,$04,$FF,$04,$FF,$71,$0C,$4F,$F3,$E4,$00,$71,$00,$71,$00,$71 ; $8040 | .....q.O...q.q.q
        DB $00,$71,$00,$71,$FF,$71,$00,$A1,$00,$A1,$00,$A1,$01,$A1,$03,$A1 ; $8050 | .q.q.q..........
        DB $07,$A1,$0F,$A1,$1F,$A1,$07,$A1,$3F,$A1,$FF,$A1,$FF,$A1,$FF,$A1 ; $8060 | ........?.......
        DB $FF,$A1,$FF,$A1,$FF,$A1,$FC,$A1,$FF,$A1,$FF,$A1,$FF,$A1,$FF,$A1 ; $8070 | ................
        DB $FC,$A1,$E0,$A1,$80,$A1,$08,$A1,$DC,$A1,$FD,$A1,$FC,$A1,$FE,$A1 ; $8080 | ................
        DB $7E,$A1,$0F,$A1,$03,$A1,$E3,$A1,$FF,$A1,$80,$A1,$08,$A1,$18,$A1 ; $8090 | ~...............
        DB $18,$A1,$18,$A1,$18,$A1,$80,$A1,$C0,$A1,$C0,$A1,$DC,$A1,$F6,$A1 ; $80A0 | ................
        DB $C6,$A1,$C6,$A1,$C6,$A1,$00,$A1,$00,$A1,$00,$A1,$38,$A1,$7E,$A1 ; $80B0 | ............8.~.
        DB $CC,$A1,$88,$A1,$D0,$A1,$1F,$A1,$3F,$A1,$3F,$A1,$7F,$A1,$7F,$A1 ; $80C0 | ........?.?.....
        DB $7F,$A1,$FF,$A1,$FF,$A1,$FF,$A1,$FE,$A1,$FC,$A1,$F8,$A1,$F8,$A1 ; $80D0 | ................
        DB $F0,$A1,$F0,$A1,$E0,$A1,$00,$A1,$00,$A1,$00,$A1,$00,$A1,$00,$A1 ; $80E0 | ................
        DB $00,$A1,$00,$A1,$00,$A1,$01,$A1,$00,$A1,$00,$A1,$00,$A1,$00,$A1 ; $80F0 | ................
        DB $00,$A1,$00,$A1,$00,$A1,$98,$A1,$CC,$A1,$84,$A1,$00,$A1,$00,$A1 ; $8100 | ................
        DB $03,$A1,$0F,$A1,$1F,$A1,$C6,$A1,$63,$A1,$21,$A1,$00,$A1,$78,$A1 ; $8110 | ........c.!...x.
        DB $FF,$A1,$FF,$A1,$FF,$A1,$E0,$A1,$FF,$A1,$3C,$A1,$00,$A1,$00,$A1 ; $8120 | ..........<.....
        DB $00,$A1,$83,$A1,$C3,$A1,$FF,$A1,$FF,$A1,$FF,$A1,$FF,$A1,$FF,$A1 ; $8130 | ................
        DB $FF,$A1,$FF,$A1,$FF,$A1,$E0,$A1,$E0,$A1,$E0,$A1,$E0,$A1,$E0,$A1 ; $8140 | ................
        DB $E0,$A1,$E0,$A1,$E0,$A1,$00,$A1,$00,$A1,$00,$A1,$00,$A1,$00,$A1 ; $8150 | ................
        DB $00,$A1,$00,$A1,$00,$A1,$00,$A1,$00,$A1,$00,$A1,$00,$A1,$00,$A1 ; $8160 | ................
        DB $00,$A1,$00,$A1,$00,$A1,$3E,$A1,$7C,$A1,$78,$A1,$38,$A1,$18,$A1 ; $8170 | ......>.|.x.8...
        DB $08,$A1,$00,$A1,$00,$A1,$07,$A1,$03,$A1,$01,$A1,$01,$A1,$01,$A1 ; $8180 | ................
        DB $01,$A1,$01,$A1,$01,$A1,$E7,$A1,$F7,$A1,$F7,$A1,$FF,$A1,$FF,$A1 ; $8190 | ................
        DB $FF,$A1,$FF,$A1,$FB,$A1,$FF,$A1,$FF,$A1,$7F,$A1,$7F,$A1,$7F,$A1 ; $81A0 | ................
        DB $3F,$A1,$3F,$A1,$1F,$A1,$E0,$A1,$F0,$A1,$F0,$A1,$F8,$A1,$F8,$A1 ; $81B0 | ?.?.............
        DB $FC,$A1,$FC,$A1,$FE,$A1,$00,$A1,$00,$A1,$00,$A1,$00,$A1,$00,$A1 ; $81C0 | ................
        DB $00,$A1,$00,$A1,$00,$A1,$00,$A1,$00,$A1,$00,$A1,$00,$A1,$00,$A1 ; $81D0 | ................
        DB $00,$A1,$00,$A1,$01,$A1,$00,$A1,$03,$A1,$0F,$A1,$1F,$A1,$3F,$A1 ; $81E0 | ..............?.
        DB $7E,$A1,$FF,$A1,$FF,$A1,$79,$A1,$F9,$A1,$E1,$A1,$C1,$A1,$01,$A1 ; $81F0 | ~.....y.........
        DB $01,$A1,$01,$A1,$01,$A1,$F8,$A1,$F8,$A1,$F8,$A1,$F8,$A1,$F8,$A1 ; $8200 | ................
        DB $F8,$A1,$F8,$A1,$F8,$A1,$1F,$A1,$0F,$A1,$07,$A1,$03,$A1,$01,$A1 ; $8210 | ................
        DB $00,$A1,$00,$A1,$00,$A1,$FF,$A1,$FF,$A1,$FF,$A1,$FF,$A1,$FF,$A1 ; $8220 | ................
        DB $FF,$A1,$3F,$A1,$07,$A1,$00,$A1,$80,$A1,$E0,$A1,$FC,$A1,$FF,$A1 ; $8230 | ..?.............
        DB $FF,$A1,$FF,$A1,$FE,$A1,$03,$A1,$07,$A1,$0E,$A1,$7C,$A1,$F8,$A1 ; $8240 | ............|...
        DB $F0,$A1,$C0,$A1,$00,$A1,$FF,$A1,$FF,$A1,$7F,$A1,$0F,$A1,$03,$A1 ; $8250 | ................
        DB $01,$A1,$00,$A1,$00,$A1,$81,$A1,$C7,$A1,$DC,$A1,$F8,$A1,$F0,$A1 ; $8260 | ................
        DB $E0,$A1,$C0,$A1,$40,$A1,$FC,$A1,$FF,$A1,$FF,$A1,$7F,$A1,$3F,$A1 ; $8270 | ....@.........?.
        DB $1F,$A1,$0F,$A1,$07,$A1,$00,$A1,$00,$A1,$00,$A1,$00,$A1,$00,$A1 ; $8280 | ................
        DB $00,$A1,$00,$A1,$00,$A1,$00,$A1,$00,$A1,$00,$A1,$00,$A1,$00,$A1 ; $8290 | ................
        DB $01,$A1,$01,$A1,$03,$A1,$00,$A1,$00,$A1,$01,$A1,$81,$A1,$C3,$A1 ; $82A0 | ................
        DB $E7,$A1,$F7,$A1,$F9,$A1,$80,$A1,$C0,$A1,$E0,$A1,$F0,$A1,$F8,$A1 ; $82B0 | ................
        DB $FC,$A1,$FC,$A1,$FC,$A1,$00,$A1,$00,$A1,$00,$A1,$00,$A1,$00,$A1 ; $82C0 | ................
        DB $00,$A1,$00,$A1,$00,$A1,$00,$A1,$00,$A1,$00,$A1,$00,$A1,$00,$A1 ; $82D0 | ................
        DB $00,$A1,$00,$A1,$00,$A1,$00,$A1,$00,$A1,$00,$A1,$00,$A1,$00,$A1 ; $82E0 | ................
        DB $00,$A1,$00,$A1,$00,$A1,$00,$A1,$00,$A1,$00,$A1,$00,$A1,$3F,$A1 ; $82F0 | ..............?.
        DB $FF,$A1,$FF,$A1,$FF,$A1,$07,$A1,$07,$A1,$01,$A1,$00,$A1,$FF,$A1 ; $8300 | ................
        DB $FF,$A1,$FF,$A1,$FF,$A1,$FC,$A1,$FC,$A1,$FC,$A1,$FC,$A1,$FF,$A1 ; $8310 | ................
        DB $FF,$A1,$FF,$A1,$FF,$A1,$FC,$A1,$FC,$A1,$FC,$A1,$FC,$A1,$FC,$A1 ; $8320 | ................
        DB $FC,$A1,$FC,$A1,$FC,$A1,$00,$A1,$00,$A1,$00,$A1,$00,$A1,$00,$A1 ; $8330 | ................
        DB $03,$A1,$0F,$A1,$1F,$A1,$00,$A1,$00,$A1,$00,$A1,$00,$A1,$7C,$A1 ; $8340 | ..............|.
        DB $FF,$A1,$FF,$A1,$FF,$A1,$00,$A1,$00,$A1,$00,$A1,$00,$A1,$00,$A1 ; $8350 | ................
        DB $00,$A1,$C0,$A1,$F0,$A1,$E0,$A1,$C0,$A1,$C0,$A1,$E0,$A1,$F0,$A1 ; $8360 | ................
        DB $FC,$A1,$FE,$A1,$FF,$A1,$00,$A1,$00,$A1,$00,$A1,$00,$A1,$00,$A1 ; $8370 | ................
        DB $00,$A1,$00,$A1,$80,$A1,$FC,$A1,$FC,$A1,$FC,$A1,$FC,$A1,$FC,$A1 ; $8380 | ................
        DB $FC,$A1,$FC,$A1,$FC,$A1,$FC,$A1,$FC,$A1,$FC,$A1,$FC,$A1,$FD,$A1 ; $8390 | ................
        DB $FD,$A1,$FD,$A1,$FD,$A1,$3F,$A1,$7F,$A1,$FE,$A1,$FC,$A1,$F8,$A1 ; $83A0 | ......?.........
        DB $F8,$A1,$F0,$A1,$F0,$A1,$FF,$A1,$FF,$A1,$1F,$A1,$07,$A1,$01,$A1 ; $83B0 | ................
        DB $00,$A1,$01,$A1,$03,$A1,$F8,$A1,$FC,$A1,$FC,$A1,$F8,$A1,$F0,$A1 ; $83C0 | ................
        DB $E0,$A1,$C0,$A1,$80,$A1,$FF,$A1,$7F,$A1,$1F,$A1,$07,$A1,$03,$A1 ; $83D0 | ................
        DB $01,$A1,$00,$A1,$00,$A1,$C0,$A1,$F0,$A1,$F8,$A1,$FC,$A1,$FE,$A1 ; $83E0 | ................
        DB $FF,$A1,$7F,$A1,$7F,$A1,$FC,$A1,$FC,$A1,$FC,$A1,$FC,$A1,$FC,$A1 ; $83F0 | ................
        DB $FC,$A1,$FC,$A1,$FC,$A1,$FF,$A1,$FF,$A1,$FF,$A1,$FF,$A1,$FD,$A1 ; $8400 | ................
        DB $FD,$A1,$FD,$A1,$FD,$A1,$F0,$A1,$F0,$A1,$F8,$A1,$F8,$A1,$F8,$A1 ; $8410 | ................
        DB $FC,$A1,$FF,$A1,$FF,$A1,$07,$A1,$0E,$A1,$1C,$A1,$38,$A1,$70,$A1 ; $8420 | ............8.p.
        DB $E0,$A1,$C0,$A1,$80,$A1,$00,$A1,$00,$A1,$00,$A1,$00,$A1,$00,$A1 ; $8430 | ................
        DB $00,$A1,$00,$A1,$04,$A1,$00,$A1,$00,$A1,$C0,$A1,$F8,$A1,$FF,$A1 ; $8440 | ................
        DB $FF,$A1,$FF,$A1,$FF,$A1,$3F,$A1,$3F,$A1,$3F,$A1,$7F,$A1,$FE,$A1 ; $8450 | ......?.?.?.....
        DB $FC,$A1,$F8,$A1,$E0,$A1,$FE,$A1,$FF,$A1,$7F,$A1,$7F,$A1,$3E,$A1 ; $8460 | ..............>.
        DB $1E,$A1,$0C,$A1,$04,$A1,$FE,$A1,$FF,$A1,$7F,$A1,$7F,$A1,$3E,$A1 ; $8470 | ..............>.
        DB $1E,$A1,$0C,$A1,$04,$A1,$FF,$A1,$FF,$A1,$7F,$A1,$3F,$A1,$1F,$A1 ; $8480 | ............?...
        DB $0F,$A1,$07,$A1,$00,$A1,$E0,$A1,$F8,$A1,$FF,$A1,$FF,$A1,$FF,$A1 ; $8490 | ................
        DB $FF,$A1,$FF,$A1,$F8,$A1,$0F,$A1,$3E,$A1,$FC,$A1,$F8,$A1,$F0,$A1 ; $84A0 | ........>.......
        DB $C0,$A1,$00,$A1,$00,$A1,$0A,$F4,$0F,$F4,$0F,$F4,$07,$E4,$03,$E4 ; $84B0 | ................
        DB $03,$F4,$08,$84,$1C,$84,$AA,$4F,$FF,$F1,$F0,$11,$F0,$11,$F0,$11 ; $84C0 | .......O........
        DB $F0,$11,$F0,$11,$F0,$11,$8F,$F4,$FF,$F1,$F0,$11,$F0,$11,$F0,$11 ; $84D0 | ................
        DB $F0,$11,$F0,$11,$F0,$11,$FF,$F8,$FF,$F1,$F0,$11,$F0,$11,$F0,$11 ; $84E0 | ................
        DB $F0,$11,$F0,$11,$F0,$11,$07,$48,$FF,$F1,$F0,$11,$F0,$11,$F0,$11 ; $84F0 | .......H........
        DB $F0,$11,$F0,$11,$F0,$11,$D5,$F4,$FF,$F8,$F0,$11,$F0,$11,$F0,$11 ; $8500 | ................
        DB $F0,$11,$F0,$11,$F0,$11,$20,$84,$70,$84,$70,$84,$70,$64,$70,$F4 ; $8510 | ...... .p.p.pdp.
        DB $50,$F4,$D8,$F4,$F8,$F4,$1C,$84,$1C,$64,$1F,$F4,$1B,$F4,$1B,$F4 ; $8520 | P........d......
        DB $0F,$F4,$07,$E4,$07,$F4,$F0,$11,$F0,$11,$F0,$11,$F0,$11,$F0,$11 ; $8530 | ................
        DB $F0,$11,$F0,$11,$F0,$11,$F0,$11,$F0,$11,$F0,$11,$F0,$11,$F0,$11 ; $8540 | ................
        DB $F0,$11,$F0,$11,$F0,$11,$F0,$11,$F0,$11,$F0,$11,$F0,$11,$F0,$11 ; $8550 | ................
        DB $F0,$11,$F0,$11,$F0,$11,$F0,$11,$F0,$11,$F0,$11,$F0,$11,$F0,$11 ; $8560 | ................
        DB $F0,$11,$F0,$11,$F0,$11,$F0,$11,$F0,$11,$F0,$11,$F0,$11,$F0,$11 ; $8570 | ................
        DB $F0,$11,$F0,$11,$F0,$11,$F8,$F4,$F8,$E4,$F0,$E4,$10,$84,$38,$84 ; $8580 | ..............8.
        DB $38,$84,$38,$64,$F8,$F4,$03,$84,$07,$84,$07,$84,$07,$64,$07,$F4 ; $8590 | 8.8d.........d..
        DB $36,$F4,$3F,$F4,$1F,$E4,$F0,$11,$F0,$11,$F0,$11,$F0,$11,$F0,$11 ; $85A0 | 6.?.............
        DB $F0,$11,$F0,$11,$F0,$11,$F0,$11,$F0,$11,$F0,$11,$F0,$11,$F0,$11 ; $85B0 | ................
        DB $F0,$11,$F0,$11,$F0,$11,$F0,$11,$F0,$11,$F0,$11,$F0,$11,$F0,$11 ; $85C0 | ................
        DB $F0,$11,$F0,$11,$F0,$11,$F0,$11,$F0,$11,$F0,$11,$F0,$11,$F0,$11 ; $85D0 | ................
        DB $F0,$11,$F0,$11,$F0,$11,$F0,$11,$F0,$11,$F0,$11,$F0,$11,$F0,$11 ; $85E0 | ................
        DB $F0,$11,$F0,$11,$F0,$11,$D8,$F4,$F8,$F4,$F0,$E4,$FC,$F4,$DC,$F4 ; $85F0 | ................
        DB $D8,$F4,$F8,$F4,$F0,$E4,$0F,$24,$0F,$24,$FF,$61,$FF,$61,$FF,$61 ; $8600 | .......$.$.a.a.a
        DB $FF,$61,$FF,$61,$FF,$71,$F0,$11,$F0,$11,$F0,$11,$F0,$11,$F0,$11 ; $8610 | .a.a.q..........
        DB $F0,$11,$F0,$11,$FF,$71,$F0,$11,$F0,$11,$F0,$11,$F0,$11,$F0,$11 ; $8620 | .....q..........
        DB $F0,$11,$F0,$11,$FF,$71,$F0,$11,$F0,$11,$F0,$11,$F0,$11,$F0,$11 ; $8630 | .....q..........
        DB $F0,$11,$F0,$11,$FF,$71,$F0,$11,$F0,$11,$F0,$11,$F0,$11,$F0,$11 ; $8640 | .....q..........
        DB $F0,$11,$F0,$11,$FF,$71,$F0,$11,$F0,$11,$F0,$11,$F0,$11,$F0,$11 ; $8650 | .....q..........
        DB $F0,$11,$F0,$11,$FF,$71,$E0,$F4,$E0,$F4,$FF,$61,$FF,$61,$FF,$61 ; $8660 | .....q.....a.a.a
        DB $FF,$61,$FF,$61,$FF,$71,$D8,$A1,$D8,$A1,$DA,$A1,$F8,$A1,$DA,$A1 ; $8670 | .a.a.q..........
        DB $DA,$A1,$DA,$A1,$00,$A1,$63,$A1,$D6,$A1,$C6,$A1,$66,$A1,$36,$A1 ; $8680 | ......c.....f.6.
        DB $B6,$A1,$63,$A1,$00,$A1,$19,$A1,$B5,$A1,$B5,$A1,$35,$A1,$B5,$A1 ; $8690 | ..c.........5...
        DB $B5,$A1,$19,$A1,$00,$A1,$CF,$A1,$AC,$A1,$AC,$A1,$CE,$A1,$AC,$A1 ; $86A0 | ................
        DB $AC,$A1,$AF,$A1,$00,$A1,$CC,$71,$D8,$71,$F1,$71,$E3,$71,$F3,$71 ; $86B0 | .......q.q.q.q.q
        DB $DB,$71,$CD,$71,$00,$71,$00,$71,$00,$71,$9B,$71,$5B,$71,$CF,$71 ; $86C0 | .q.q.q.q.q.q[q.q
        DB $03,$71,$DE,$71,$00,$71,$C6,$71,$C6,$71,$C0,$71,$C6,$71,$C6,$71 ; $86D0 | .q.q.q.q.q.q.q.q
        DB $D6,$71,$F6,$71,$00,$71,$70,$71,$C0,$71,$C6,$71,$ED,$71,$CF,$71 ; $86E0 | .q.q.qpq.q.q.q.q
        DB $CC,$71,$C7,$71,$00,$71,$7C,$81,$C6,$81,$C6,$81,$C6,$81,$C6,$81 ; $86F0 | .q.q.q|.........
        DB $C6,$81,$7C,$81,$00,$81,$18,$81,$38,$81,$18,$81,$18,$81,$18,$81 ; $8700 | ..|.....8.......
        DB $18,$81,$3C,$81,$00,$81,$7C,$81,$C6,$81,$C6,$81,$0C,$81,$38,$81 ; $8710 | ..<...|.......8.
        DB $60,$81,$FE,$81,$00,$81,$7C,$81,$C6,$81,$06,$81,$1C,$81,$06,$81 ; $8720 | `.....|.........
        DB $C6,$81,$7C,$81,$00,$81,$0C,$81,$1C,$81,$2C,$81,$4C,$81,$CC,$81 ; $8730 | ..|.......,.L...
        DB $FE,$81,$0C,$81,$00,$81,$FE,$81,$C0,$81,$FC,$81,$06,$81,$06,$81 ; $8740 | ................
        DB $C6,$81,$7C,$81,$00,$81,$7C,$81,$C6,$81,$C0,$81,$FC,$81,$C6,$81 ; $8750 | ..|...|.........
        DB $C6,$81,$7C,$81,$00,$81,$FE,$81,$C6,$81,$0C,$81,$18,$81,$18,$81 ; $8760 | ..|.............
        DB $18,$81,$18,$81,$00,$81,$7C,$81,$C6,$81,$C6,$81,$7C,$81,$C6,$81 ; $8770 | ......|.....|...
        DB $C6,$81,$7C,$81,$00,$81,$7C,$81,$C6,$81,$C6,$81,$7E,$81,$06,$81 ; $8780 | ..|...|.....~...
        DB $C6,$81,$7C,$81,$00,$81,$10,$31,$38,$31,$38,$31,$4C,$31,$7C,$31 ; $8790 | ..|....18181L1|1
        DB $86,$31,$86,$31,$00,$31,$FC,$31,$66,$31,$66,$31,$7C,$31,$66,$31 ; $87A0 | .1.1.1.1f1f1|1f1
        DB $66,$31,$FC,$31,$00,$31,$3C,$31,$66,$31,$C0,$31,$C0,$31,$C0,$31 ; $87B0 | f1.1.1<1f1.1.1.1
        DB $62,$31,$3C,$31,$00,$31,$F8,$31,$64,$31,$66,$31,$66,$31,$66,$31 ; $87C0 | b1<1.1.1d1f1f1f1
        DB $64,$31,$F8,$31,$00,$31,$FE,$31,$62,$31,$68,$31,$78,$31,$68,$31 ; $87D0 | d1.1.1.1b1h1x1h1
        DB $62,$31,$FE,$31,$00,$31,$FE,$31,$62,$31,$68,$31,$78,$31,$68,$31 ; $87E0 | b1.1.1.1b1h1x1h1
        DB $60,$31,$F0,$31,$00,$31,$3C,$31,$66,$31,$C0,$31,$CE,$31,$C6,$31 ; $87F0 | `1.1.1<1f1.1.1.1
        DB $66,$31,$3E,$31,$00,$31,$C6,$31,$C6,$31,$C6,$31,$FE,$31,$C6,$31 ; $8800 | f1>1.1.1.1.1.1.1
        DB $C6,$31,$C6,$31,$00,$31,$3C,$31,$18,$31,$18,$31,$18,$31,$18,$31 ; $8810 | .1.1.1<1.1.1.1.1
        DB $18,$31,$3C,$31,$00,$31,$3E,$31,$0C,$31,$0C,$31,$0C,$31,$CC,$31 ; $8820 | .1<1.1>1.1.1.1.1
        DB $CC,$31,$78,$31,$00,$31,$C6,$31,$CC,$31,$D8,$31,$F0,$31,$E8,$31 ; $8830 | .1x1.1.1.1.1.1.1
        DB $C4,$31,$C2,$31,$00,$31,$F0,$31,$60,$31,$60,$31,$60,$31,$60,$31 ; $8840 | .1.1.1.1`1`1`1`1
        DB $62,$31,$FE,$31,$00,$31,$C6,$31,$C6,$31,$EE,$31,$EE,$31,$B6,$31 ; $8850 | b1.1.1.1.1.1.1.1
        DB $B6,$31,$B6,$31,$00,$31,$C6,$31,$66,$31,$76,$31,$5E,$31,$4E,$31 ; $8860 | .1.1.1.1f1v1^1N1
        DB $46,$31,$E2,$31,$00,$31,$38,$31,$44,$31,$C6,$31,$C6,$31,$C6,$31 ; $8870 | F1.1.181D1.1.1.1
        DB $44,$31,$38,$31,$00,$31,$FC,$31,$66,$31,$66,$31,$7C,$31,$60,$31 ; $8880 | D181.1.1f1f1|1`1
        DB $60,$31,$F0,$31,$00,$31,$38,$31,$44,$31,$C6,$31,$C6,$31,$DE,$31 ; $8890 | `1.1.181D1.1.1.1
        DB $64,$31,$3A,$31,$00,$31,$FC,$31,$66,$31,$66,$31,$7C,$31,$78,$31 ; $88A0 | d1:1.1.1f1f1|1x1
        DB $6C,$31,$E6,$31,$00,$31,$3C,$31,$66,$31,$60,$31,$3C,$31,$06,$31 ; $88B0 | l1.1.1<1f1`1<1.1
        DB $46,$31,$FC,$31,$00,$31,$7E,$31,$5A,$31,$18,$31,$18,$31,$18,$31 ; $88C0 | F1.1.1~1Z1.1.1.1
        DB $18,$31,$3C,$31,$00,$31,$66,$31,$66,$31,$66,$31,$66,$31,$66,$31 ; $88D0 | .1<1.1f1f1f1f1f1
        DB $66,$31,$3C,$31,$00,$31,$C2,$31,$C2,$31,$64,$31,$64,$31,$38,$31 ; $88E0 | f1<1.1.1.1d1d181
        DB $38,$31,$10,$31,$00,$31,$DA,$31,$DA,$31,$DA,$31,$DA,$31,$DA,$31 ; $88F0 | 81.1.1.1.1.1.1.1
        DB $6C,$31,$48,$31,$00,$31,$C2,$31,$64,$31,$38,$31,$18,$31,$2C,$31 ; $8900 | l1H1.1.1d181.1,1
        DB $46,$31,$82,$31,$00,$31,$C2,$31,$64,$31,$38,$31,$18,$31,$18,$31 ; $8910 | F1.1.1.1d181.1.1
        DB $18,$31,$3C,$31,$00,$31,$FE,$31,$8C,$31,$18,$31,$30,$31,$60,$31 ; $8920 | .1<1.1.1.1.101`1
        DB $C2,$31,$FE,$31,$00,$31,$3C,$31,$42,$31,$99,$31,$A1,$31,$A1,$31 ; $8930 | .1.1.1<1B1.1.1.1
        DB $99,$31,$42,$31,$3C,$31,$7E,$31,$E7,$31,$C3,$31,$0E,$31,$18,$31 ; $8940 | .1B1<1~1.1.1.1.1
        DB $00,$31,$18,$31,$18,$31,$00,$11,$00,$11,$00,$11,$00,$11,$00,$11 ; $8950 | .1.1.1..........
        DB $00,$11,$00,$11,$00,$11,$FF,$74,$FF,$F4,$FF,$F4,$FF,$F4,$FF,$F4 ; $8960 | .......t........
        DB $FF,$F4,$FF,$F4,$FF,$11,$E7,$74,$E7,$F4,$E7,$F4,$E7,$F4,$E7,$F4 ; $8970 | .......t........
        DB $E7,$F4,$E7,$F4,$E7,$11,$FF,$97,$FF,$84,$FF,$84,$FF,$84,$FF,$84 ; $8980 | ................
        DB $FF,$84,$FF,$84,$FF,$11,$E7,$97,$E7,$84,$E7,$84,$E7,$84,$E7,$84 ; $8990 | ................
        DB $E7,$84,$E7,$84,$E7,$11,$FF,$F7,$FF,$74,$FF,$74,$FF,$74,$FF,$74 ; $89A0 | .........t.t.t.t
        DB $FF,$74,$FF,$74,$FF,$41,$E7,$F7,$E7,$74,$E7,$74,$E7,$74,$E7,$74 ; $89B0 | .t.t.A...t.t.t.t
        DB $E7,$74,$E7,$74,$E7,$41,$0F,$71,$0F,$F1,$0F,$F1,$0F,$F1,$0F,$F1 ; $89C0 | .t.t.A.q........
        DB $0F,$F1,$0F,$F1,$0F,$E1,$F0,$71,$F0,$F1,$F0,$F1,$F0,$F1,$F0,$F1 ; $89D0 | .......q........
        DB $F0,$F1,$F0,$F1,$F0,$E1,$00,$F7,$FE,$F7,$FE,$F7,$FE,$F7,$FE,$F7 ; $89E0 | ................
        DB $FE,$F7,$FE,$F7,$FF,$17,$FF,$71,$7F,$F1,$3F,$F1,$1F,$F1,$0F,$F1 ; $89F0 | .......q..?.....
        DB $07,$F1,$03,$F1,$01,$11,$FF,$71,$FE,$F1,$FC,$F1,$F8,$F1,$F0,$F1 ; $8A00 | .......q........
        DB $E0,$F1,$C0,$F1,$80,$11,$9F,$7F,$BF,$7F,$83,$7F,$7F,$31,$3F,$31 ; $8A10 | .............1?1
        DB $1F,$31,$0F,$31,$07,$31,$FF,$71,$FF,$71,$FF,$71,$FF,$31,$FF,$31 ; $8A20 | .1.1.1.q.q.q.1.1
        DB $FF,$31,$FF,$31,$FF,$31,$FF,$71,$FF,$71,$FF,$71,$FE,$31,$FC,$31 ; $8A30 | .1.1.1.q.q.q.1.1
        DB $F8,$31,$F0,$31,$E0,$31,$9F,$47,$87,$47,$7F,$41,$3F,$41,$1F,$41 ; $8A40 | .1.1.1.G.G.A?A.A
        DB $0F,$41,$07,$41,$03,$41,$FF,$41,$FF,$41,$FF,$41,$FF,$41,$FF,$41 ; $8A50 | .A.A.A.A.A.A.A.A
        DB $FF,$41,$FF,$41,$FF,$41,$FF,$41,$FF,$41,$FE,$41,$FC,$41,$F8,$41 ; $8A60 | .A.A.A.A.A.A.A.A
        DB $F0,$41,$E0,$41,$C0,$41,$10,$F1,$10,$F1,$10,$F1,$10,$71,$38,$F1 ; $8A70 | .A.A.A.......q8.
        DB $38,$F1,$38,$F1,$38,$F1,$38,$71,$7C,$F1,$7C,$F1,$7C,$F1,$7C,$F1 ; $8A80 | 8.8.8.8q|.|.|.|.
        DB $7C,$F1,$FF,$71,$FF,$41,$FF,$71,$FF,$41,$3E,$F1,$3E,$F1,$3E,$F1 ; $8A90 | |..q.A.q.A>.>.>.
        DB $3E,$F1,$3E,$F1,$1C,$71,$1C,$F1,$1C,$F1,$1C,$F1,$1C,$F1,$08,$71 ; $8AA0 | >.>..q.........q
        DB $08,$F1,$08,$F1,$08,$F1,$C3,$1A,$7E,$A1,$DB,$A6,$E7,$A6,$E7,$A6 ; $8AB0 | ........~.......
        DB $DB,$A6,$7E,$A1,$C3,$1A,$FF,$41,$00,$F1,$FF,$F1,$66,$E6,$66,$F6 ; $8AC0 | ..~....A....f.f.
        DB $FF,$F1,$00,$F1,$FF,$71,$FF,$71,$00,$F1,$FF,$F1,$66,$E6,$66,$F6 ; $8AD0 | .....q.q....f.f.
        DB $FF,$F1,$00,$F1,$FF,$41,$C3,$1A,$7E,$A1,$F7,$A6,$CF,$A6,$F3,$A6 ; $8AE0 | .....A..~.......
        DB $EF,$A6,$7E,$A1,$C3,$1A,$F0,$47,$00,$F1,$FF,$F1,$66,$E6,$66,$F6 ; $8AF0 | ..~....G....f.f.
        DB $FF,$F1,$00,$F1,$0F,$74,$0F,$47,$00,$F1,$FF,$F1,$66,$E6,$66,$F6 ; $8B00 | .....t.G....f.f.
        DB $FF,$F1,$00,$F1,$F0,$74,$3F,$41,$3C,$F1,$5A,$F1,$66,$F7,$66,$F7 ; $8B10 | .....t?A<.Z.f.f.
        DB $5A,$F1,$3C,$F1,$3F,$41,$FF,$41,$00,$11,$00,$11,$00,$11,$00,$11 ; $8B20 | Z.<.?A.A........
        DB $00,$11,$00,$11,$FF,$41,$FC,$41,$3C,$F1,$5A,$F1,$66,$F7,$66,$F7 ; $8B30 | .....A.A<.Z.f.f.
        DB $5A,$F1,$3C,$F1,$FC,$41,$3C,$41,$66,$41,$C3,$41,$81,$41,$81,$81 ; $8B40 | Z.<..A<AfA.A.A..
        DB $C3,$81,$66,$81,$3C,$81,$3C,$81,$66,$81,$C3,$81,$81,$81,$81,$41 ; $8B50 | ..f.<.<.f......A
        DB $C3,$41,$66,$41,$3C,$41,$C0,$81,$03,$41,$30,$81,$0C,$41,$0C,$81 ; $8B60 | .AfA<A...A0..A..
        DB $30,$41,$03,$81,$C0,$41,$C0,$41,$03,$81,$30,$41,$0C,$81,$0C,$41 ; $8B70 | 0A...A.A..0A...A
        DB $30,$81,$03,$41,$C0,$81,$7F,$F7,$3F,$F7,$5D,$71,$7F,$F1,$6D,$71 ; $8B80 | 0..A....?.]q..mq
        DB $7F,$F1,$3F,$71,$0D,$31,$FE,$F7,$E0,$F7,$BA,$71,$FE,$F1,$B6,$71 ; $8B90 | ..?q.1.....q...q
        DB $FE,$F1,$FC,$71,$B0,$31,$1B,$F1,$1B,$F1,$1B,$F1,$1B,$F1,$1B,$F1 ; $8BA0 | ...q.1..........
        DB $1B,$F1,$1B,$F1,$1B,$F1,$E8,$71,$E8,$71,$E8,$71,$E8,$71,$E8,$71 ; $8BB0 | .......q.q.q.q.q
        DB $E8,$71,$E8,$71,$E8,$71,$1B,$F1,$1B,$F1,$1B,$F1,$1B,$F1,$1B,$F1 ; $8BC0 | .q.q.q..........
        DB $0F,$71,$7F,$F7,$3F,$F7,$E8,$71,$E8,$71,$E8,$71,$E8,$71,$E8,$71 ; $8BD0 | .q..?..q.q.q.q.q
        DB $F0,$71,$F8,$F7,$C0,$F7,$FF,$4B,$A9,$4B,$8B,$4B,$8B,$4B,$89,$4B ; $8BE0 | .q.....K.K.K.K.K
        DB $8B,$4B,$A9,$4B,$FF,$4B,$FF,$4B,$51,$4B,$5B,$4B,$BB,$4B,$BB,$4B ; $8BF0 | .K.K.K.KQK[K.K.K
        DB $5B,$4B,$5B,$4B,$FF,$4B,$C0,$71,$C0,$7F,$C0,$7F,$C0,$7F,$C2,$7F ; $8C00 | [K[K.K.q........
        DB $DE,$7F,$C0,$71,$C0,$71,$00,$11,$00,$11,$F0,$F1,$FF,$F1,$F0,$71 ; $8C10 | ...q.q.........q
        DB $00,$11,$00,$11,$00,$11,$00,$11,$00,$11,$0F,$F1,$FF,$F1,$0F,$71 ; $8C20 | ...............q
        DB $00,$11,$00,$11,$00,$11,$03,$71,$03,$7F,$03,$7F,$03,$7F,$43,$7F ; $8C30 | .......q......C.
        DB $7B,$7F,$03,$71,$03,$71,$FC,$4F,$06,$F1,$0F,$F1,$0A,$F1,$0A,$F1 ; $8C40 | {..q.q.O........
        DB $0F,$F1,$06,$F1,$FC,$4F,$3F,$4F,$60,$F1,$F0,$F1,$50,$F1,$50,$F1 ; $8C50 | .....O?O`...P.P.
        DB $F0,$F1,$60,$F1,$3F,$4F,$18,$41,$18,$41,$18,$41,$18,$41,$18,$41 ; $8C60 | ..`.?O.A.A.A.A.A
        DB $18,$41,$18,$41,$18,$41,$0F,$31,$17,$31,$37,$31,$7F,$31,$FE,$F1 ; $8C70 | .A.A.A.1.171.1..
        DB $5F,$7F,$5F,$7F,$5F,$7F,$F0,$31,$E8,$31,$EC,$31,$FE,$31,$7F,$F1 ; $8C80 | _._._..1.1.1.1..
        DB $FF,$7F,$FF,$7F,$FF,$7F,$03,$7F,$7F,$7F,$7F,$7F,$00,$7F,$66,$31 ; $8C90 | ..............f1
        DB $32,$31,$1A,$31,$0F,$31,$F8,$7F,$FF,$7F,$FF,$7F,$FF,$7F,$66,$31 ; $8CA0 | 21.1.1........f1
        DB $4C,$31,$58,$31,$F0,$31,$18,$41,$18,$41,$18,$41,$18,$41,$0F,$31 ; $8CB0 | L1X1.1.A.A.A.A.1
        DB $17,$31,$37,$31,$7F,$31,$18,$41,$18,$41,$18,$41,$18,$41,$F0,$31 ; $8CC0 | .171.1.A.A.A.A.1
        DB $E8,$31,$EC,$31,$FE,$31,$FE,$F1,$5F,$7F,$5F,$7F,$5F,$7F,$00,$11 ; $8CD0 | .1.1.1.._._._...
        DB $00,$11,$00,$11,$00,$11,$7F,$F1,$FF,$7F,$FF,$7F,$FF,$7F,$00,$11 ; $8CE0 | ................
        DB $00,$11,$00,$11,$00,$11,$00,$11,$00,$11,$00,$11,$00,$11,$03,$7F ; $8CF0 | ................
        DB $7F,$7F,$7F,$7F,$00,$7F,$00,$11,$00,$11,$00,$11,$00,$11,$F8,$7F ; $8D00 | ................
        DB $FF,$7F,$FF,$7F,$FF,$7F,$66,$31,$32,$31,$1A,$31,$0F,$31,$00,$11 ; $8D10 | ......f121.1.1..
        DB $00,$11,$00,$11,$00,$11,$66,$31,$4C,$31,$58,$31,$F0,$31,$00,$11 ; $8D20 | ......f1L1X1.1..
        DB $00,$11,$00,$11,$00,$11,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F ; $8D30 | ................
        DB $FF,$7F,$6D,$31,$7F,$71,$FF,$7F,$FF,$7F,$FF,$7F,$FF,$71,$FF,$71 ; $8D40 | ..m1.q.......q.q
        DB $FF,$71,$B6,$31,$FE,$71,$01,$71,$01,$71,$07,$41,$3F,$41,$01,$71 ; $8D50 | .q.1.q.q.q.A?A.q
        DB $01,$71,$07,$41,$3F,$41,$80,$71,$FC,$41,$E0,$41,$80,$71,$80,$71 ; $8D60 | .q.A?A.q.A.A.q.q
        DB $FC,$41,$E0,$41,$80,$71,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F,$7F ; $8D70 | .A.A.q..........
        DB $7F,$41,$16,$31,$1F,$71,$FF,$71,$FF,$71,$FF,$71,$FF,$71,$FF,$71 ; $8D80 | .A.1.q.q.q.q.q.q
        DB $FF,$41,$66,$31,$FF,$71,$FF,$74,$FF,$74,$FF,$74,$FF,$74,$FF,$74 ; $8D90 | .Af1.q.t.t.t.t.t
        DB $FE,$41,$68,$31,$F8,$71,$03,$71,$03,$71,$03,$71,$03,$71,$03,$71 ; $8DA0 | .Ah1.q.q.q.q.q.q
        DB $03,$71,$03,$71,$03,$71,$E0,$41,$E0,$41,$E0,$41,$E0,$41,$E0,$41 ; $8DB0 | .q.q.q.A.A.A.A.A
        DB $E0,$41,$E0,$41,$E0,$41,$FF,$71,$FF,$31,$4E,$41,$31,$71,$3B,$71 ; $8DC0 | .A.A.A.q.1NA1q;q
        DB $6E,$71,$FF,$F1,$FF,$71,$FF,$71,$FF,$31,$72,$41,$8C,$71,$DC,$71 ; $8DD0 | nq...q.q.1rA.q.q
        DB $76,$71,$FF,$F1,$FF,$71,$0F,$71,$0F,$31,$04,$41,$03,$71,$03,$71 ; $8DE0 | vq...q.q.1.A.q.q
        DB $06,$71,$0F,$F1,$0F,$71,$FF,$71,$FF,$31,$E7,$41,$18,$71,$BD,$71 ; $8DF0 | .q...q.q.1.A.q.q
        DB $E7,$71,$FF,$F1,$FF,$71,$F0,$71,$F0,$31,$20,$41,$C0,$71,$C0,$71 ; $8E00 | .q...q.q.1 A.q.q
        DB $60,$71,$F0,$F1,$F0,$71,$05,$B1,$07,$B1,$0F,$81,$0F,$81,$05,$F1 ; $8E10 | `q...q..........
        DB $07,$F1,$03,$F1,$03,$61,$A0,$B1,$E0,$B1,$E0,$81,$F0,$81,$F0,$81 ; $8E20 | .....a..........
        DB $F0,$81,$E0,$81,$E0,$81,$06,$71,$07,$71,$03,$71,$03,$F1,$03,$91 ; $8E30 | .......q.q.q....
        DB $0E,$91,$1F,$F1,$1F,$F1,$F0,$81,$78,$81,$80,$71,$F0,$71,$78,$71 ; $8E40 | ........x..q.qxq
        DB $7C,$71,$3F,$71,$DC,$71,$80,$F7,$C0,$F7,$A0,$F7,$03,$D7,$07,$D7 ; $8E50 | |q?q.q..........
        DB $07,$D7,$02,$F7,$07,$F7,$02,$F7,$06,$F7,$0A,$F7,$80,$D7,$C0,$D7 ; $8E60 | ................
        DB $C0,$D7,$C0,$D7,$C0,$D7,$03,$F7,$07,$F7,$19,$FB,$02,$FB,$05,$FB ; $8E70 | ................
        DB $05,$FB,$05,$FB,$01,$FB,$E0,$D7,$F0,$F7,$C8,$FB,$C0,$FB,$80,$FB ; $8E80 | ................
        DB $00,$FB,$00,$FB,$00,$FB,$00,$DB,$03,$DB,$07,$DB,$07,$DB,$02,$F3 ; $8E90 | ................
        DB $07,$FB,$03,$FB,$07,$F7,$00,$DB,$80,$DB,$C0,$DB,$C0,$DB,$C0,$DB ; $8EA0 | ................
        DB $C0,$DB,$E0,$DB,$C0,$F7,$05,$F7,$1A,$F7,$85,$F7,$85,$F7,$C5,$F7 ; $8EB0 | ................
        DB $61,$F7,$00,$F7,$00,$F7,$E0,$F7,$D8,$F7,$81,$F7,$01,$F7,$03,$F7 ; $8EC0 | a...............
        DB $06,$F7,$00,$F7,$00,$F7,$60,$61,$F0,$81,$F0,$81,$F0,$8F,$F0,$87 ; $8ED0 | ......`a........
        DB $F0,$87,$F0,$87,$10,$8C,$01,$F1,$07,$F1,$3F,$F1,$F1,$F7,$08,$C7 ; $8EE0 | ..........?.....
        DB $1C,$C7,$0C,$9C,$18,$9C,$70,$8C,$F0,$8C,$F0,$8C,$F0,$8C,$F0,$8C ; $8EF0 | ......p.........
        DB $F0,$87,$90,$67,$C0,$1F,$40,$7C,$EC,$7C,$00,$97,$10,$97,$38,$9C ; $8F00 | ...g..@|.|....8.
        DB $03,$FC,$1F,$F7,$F8,$F1,$00,$55,$00,$88,$00,$99,$00,$BB,$00,$AA ; $8F10 | .......U........
        DB $00,$22,$00,$CC,$00,$44,$00,$B1,$80,$B1,$00,$B1,$40,$B1,$00,$B1 ; $8F20 | ."...D......@...
        DB $00,$B1,$80,$B1,$00,$B1,$00,$B1,$01,$B1,$00,$B1,$02,$B1,$00,$B1 ; $8F30 | ................
        DB $01,$B1,$00,$B1,$00,$B1,$00,$B1,$00,$B1,$00,$B1,$10,$B1,$38,$B1 ; $8F40 | ..............8.
        DB $10,$B1,$00,$B1,$00,$B1,$18,$B1,$3D,$B1,$1A,$91,$3C,$F1,$7E,$F1 ; $8F50 | ........=...<.~.
        DB $6A,$74,$56,$74,$42,$74,$18,$B1,$BC,$B1,$58,$91,$3C,$F1,$7E,$F1 ; $8F60 | jtVtBt....X.<.~.
        DB $6A,$74,$56,$74,$42,$74,$7E,$74,$42,$74,$7E,$74,$62,$74,$56,$74 ; $8F70 | jtVtBt~tBt~tbtVt
        DB $62,$74,$7E,$21,$3C,$C1,$7E,$74,$42,$74,$7E,$74,$62,$74,$56,$74 ; $8F80 | bt~!<.~tBt~tbtVt
        DB $62,$74,$7E,$21,$3C,$C1,$00,$C1,$00,$C1,$03,$C1,$04,$C1,$09,$C1 ; $8F90 | bt~!<...........
        DB $09,$C1,$11,$C1,$11,$C1,$1E,$C1,$FE,$C1,$C0,$C1,$80,$C1,$00,$C1 ; $8FA0 | ................
        DB $00,$C1,$00,$C1,$00,$C1,$18,$F1,$3C,$81,$7E,$81,$7E,$81,$3C,$81 ; $8FB0 | ........<.~.~.<.
        DB $18,$81,$00,$81,$00,$81,$80,$C1,$60,$C1,$18,$F1,$3C,$81,$7E,$81 ; $8FC0 | ........`...<.~.
        DB $7E,$81,$3C,$81,$18,$81,$01,$91,$01,$91,$03,$F1,$03,$F1,$01,$71 ; $8FD0 | ~.<............q
        DB $01,$71,$01,$71,$03,$F1,$C0,$61,$C0,$61,$E0,$F1,$E0,$71,$C0,$C1 ; $8FE0 | .q.q...a.a...q..
        DB $C0,$21,$C0,$31,$E0,$F1,$07,$F1,$0F,$F1,$0F,$31,$0F,$71,$0F,$71 ; $8FF0 | .!.1.......1.q.q
        DB $0F,$71,$0E,$31,$07,$21,$F0,$31,$F8,$71,$E8,$71,$E8,$A1,$E8,$A1 ; $9000 | .q.1.!.1.q.q....
        DB $C8,$21,$18,$21,$F0,$C1,$00,$B1,$01,$B1,$03,$B1,$07,$B1,$0F,$F1 ; $9010 | .!.!............
        DB $0F,$A1,$1F,$A1,$1F,$A1,$00,$B1,$F0,$B1,$E8,$B1,$DC,$B1,$B8,$F1 ; $9020 | ................
        DB $B0,$A1,$E0,$A1,$C0,$A1,$FF,$11,$0F,$B1,$1F,$B1,$3E,$B1,$7C,$F1 ; $9030 | ............>.|.
        DB $7C,$A1,$FE,$A1,$FE,$A1,$00,$B1,$8F,$B1,$1F,$B1,$3E,$B1,$7C,$F1 ; $9040 | |...........>.|.
        DB $7C,$A1,$FE,$A1,$FE,$A1,$00,$11,$03,$81,$07,$F1,$0F,$81,$0F,$81 ; $9050 | |...............
        DB $07,$81,$07,$31,$1F,$31,$00,$11,$00,$11,$80,$81,$C0,$81,$C0,$81 ; $9060 | ...1.1..........
        DB $F0,$31,$E0,$31,$70,$61,$0E,$91,$0E,$F1,$0E,$B1,$0F,$B1,$07,$B1 ; $9070 | .1.1pa..........
        DB $07,$B1,$03,$91,$01,$91,$38,$81,$1C,$91,$0C,$91,$0C,$F1,$0C,$F1 ; $9080 | ......8.........
        DB $9C,$B1,$D8,$A1,$F0,$A1,$01,$A1,$03,$B1,$01,$A1,$03,$B1,$29,$A1 ; $9090 | ..............).
        DB $7F,$A1,$7F,$C1,$29,$A1,$C0,$C1,$E0,$A1,$C0,$C1,$E0,$A1,$CA,$A1 ; $90A0 | ....)...........
        DB $3F,$A8,$C0,$8C,$CA,$A1,$01,$A1,$01,$A1,$03,$B1,$01,$A1,$03,$B1 ; $90B0 | ?...............
        DB $01,$A1,$03,$B1,$01,$A1,$C0,$C1,$C0,$C1,$E0,$A1,$C0,$C1,$E0,$A1 ; $90C0 | ................
        DB $C0,$C1,$E0,$A1,$C0,$C1,$00,$B1,$00,$B1,$03,$B1,$06,$B1,$07,$B1 ; $90D0 | ................
        DB $07,$B1,$07,$B1,$03,$B1,$00,$B1,$00,$B1,$C0,$B1,$60,$B1,$E0,$B1 ; $90E0 | ............`...
        DB $E0,$B1,$E0,$B1,$C0,$B1,$01,$B1,$01,$B1,$01,$B1,$01,$B1,$01,$B1 ; $90F0 | ................
        DB $01,$B1,$00,$B1,$00,$B1,$80,$B1,$C0,$B1,$80,$B1,$E0,$B1,$E0,$B1 ; $9100 | ................
        DB $80,$B1,$00,$B1,$00,$B1,$07,$B1,$1F,$91,$1F,$91,$07,$C1,$0F,$21 ; $9110 | ...............!
        DB $3F,$B1,$7F,$B1,$7F,$A1,$E0,$A1,$F8,$91,$F8,$81,$E0,$C1,$F0,$21 ; $9120 | ?..............!
        DB $FC,$21,$FE,$A1,$FE,$A1,$9F,$AB,$0F,$9B,$07,$89,$FF,$89,$F7,$86 ; $9130 | .!..............
        DB $EB,$68,$7F,$61,$1F,$61,$F8,$98,$03,$68,$0F,$68,$0F,$68,$DF,$68 ; $9140 | .h.a.a...h.h.h.h
        DB $FF,$68,$FE,$61,$F8,$61,$00,$11,$01,$91,$01,$91,$00,$11,$00,$11 ; $9150 | .h.a.a..........
        DB $03,$21,$07,$B1,$07,$A1,$7E,$B1,$FF,$91,$F0,$98,$7E,$C1,$FF,$21 ; $9160 | .!....~.....~..!
        DB $F0,$B2,$F0,$BA,$FF,$A1,$00,$11,$80,$91,$80,$81,$00,$11,$00,$11 ; $9170 | ................
        DB $C0,$21,$E0,$A1,$E0,$A1,$0F,$A1,$0F,$B1,$0F,$91,$0F,$81,$0F,$81 ; $9180 | .!..............
        DB $0F,$61,$07,$61,$01,$61,$0F,$9A,$F0,$98,$7F,$89,$F4,$86,$60,$86 ; $9190 | .a.a.a........`.
        DB $FF,$61,$FF,$61,$FF,$61,$F0,$91,$F0,$81,$F0,$61,$F0,$61,$F0,$61 ; $91A0 | .a.a.a.....a.a.a
        DB $F0,$61,$E0,$61,$80,$61,$7F,$91,$00,$8F,$FE,$9F,$FE,$8E,$FE,$8E ; $91B0 | .a.a.a..........
        DB $FE,$6E,$80,$1E,$F7,$8E,$FF,$91,$00,$8F,$FE,$9F,$FE,$8E,$FE,$8E ; $91C0 | .n..............
        DB $FE,$6E,$00,$1E,$EF,$8E,$F7,$8E,$F7,$8E,$F7,$6E,$80,$1E,$FE,$8E ; $91D0 | .n.........n....
        DB $FE,$8E,$FE,$6E,$80,$1E,$EF,$8E,$EF,$8E,$EF,$6E,$00,$1E,$FE,$8E ; $91E0 | ...n.......n....
        DB $FE,$8E,$FE,$6E,$00,$1E,$07,$91,$0F,$F1,$0F,$91,$0F,$81,$0F,$81 ; $91F0 | ...n............
        DB $0F,$61,$07,$E1,$0F,$81,$FF,$91,$FF,$F1,$EF,$9F,$EF,$8E,$EF,$8E ; $9200 | .a..............
        DB $EF,$6E,$FF,$EE,$7E,$8E,$F0,$91,$F0,$F1,$F0,$91,$F0,$81,$F0,$81 ; $9210 | .n..~...........
        DB $F0,$61,$F0,$E1,$F0,$81,$0F,$81,$0F,$81,$0F,$61,$07,$E1,$0F,$81 ; $9220 | .a.........a....
        DB $0F,$81,$0F,$61,$07,$E1,$7E,$8E,$7E,$8E,$7E,$6E,$FF,$EE,$EF,$8E ; $9230 | ...a..~.~.~n....
        DB $EF,$8E,$EF,$6E,$FF,$E1,$F0,$81,$F0,$81,$F0,$61,$F0,$E1,$F0,$81 ; $9240 | ...n.......a....
        DB $F0,$81,$F0,$61,$F0,$E1,$1F,$41,$3F,$41,$7F,$71,$C3,$7F,$8F,$7F ; $9250 | ...a...A?A.q....
        DB $9F,$7F,$BF,$7F,$BF,$7F,$FF,$41,$FE,$41,$FE,$71,$F0,$73,$FC,$73 ; $9260 | .......A.A.q.s.s
        DB $FE,$73,$FE,$73,$EF,$71,$BF,$7F,$BF,$7F,$FF,$7F,$FF,$7F,$FF,$7F ; $9270 | .s.s.q..........
        DB $FF,$71,$FF,$71,$7F,$71,$C7,$7B,$C7,$79,$EF,$71,$EF,$71,$EF,$71 ; $9280 | .q.q.q.{.y.q.q.q
        DB $FC,$73,$F0,$73,$FE,$71,$01,$41,$03,$41,$07,$71,$0F,$F1,$0F,$71 ; $9290 | .s.s.q.A.A.q...q
        DB $0F,$71,$0F,$71,$0F,$71,$FF,$41,$FF,$41,$FF,$71,$FF,$71,$FF,$71 ; $92A0 | .q.q.q.A.A.q.q.q
        DB $FF,$71,$FF,$71,$FE,$71,$F0,$41,$E0,$41,$E0,$71,$F0,$31,$F0,$71 ; $92B0 | .q.q.q.A.A.q.1.q
        DB $F0,$71,$F0,$71,$F0,$71,$0F,$71,$0F,$71,$0F,$71,$0F,$71,$0F,$71 ; $92C0 | .q.q.q.q.q.q.q.q
        DB $0F,$71,$0F,$71,$07,$71,$FC,$7B,$FC,$79,$FE,$71,$FE,$71,$FE,$71 ; $92D0 | .q.q.q.{.y.q.q.q
        DB $FF,$71,$FF,$71,$FF,$71,$70,$71,$70,$71,$F0,$71,$F0,$71,$F0,$71 ; $92E0 | .q.q.qpqpq.q.q.q
        DB $F0,$71,$F0,$31,$E0,$71,$3F,$B1,$2E,$61,$7F,$81,$6E,$81,$7F,$81 ; $92F0 | .q.1.q?..a..n...
        DB $FF,$BA,$DE,$61,$FA,$86,$FC,$A1,$EC,$61,$FE,$61,$EE,$61,$FE,$61 ; $9300 | ...a.....a.a.a.a
        DB $5F,$AB,$FF,$68,$F7,$61,$DE,$81,$F4,$86,$F4,$BA,$6E,$61,$7F,$61 ; $9310 | _..h.a......na.a
        DB $6E,$61,$3F,$61,$3F,$B1,$1F,$68,$F7,$61,$FF,$A1,$EE,$61,$FE,$61 ; $9320 | na?a?..h.a...a.a
        DB $EE,$61,$FC,$61,$FC,$A1,$03,$B1,$02,$61,$07,$81,$06,$81,$07,$81 ; $9330 | .a.a.....a......
        DB $0F,$B1,$0D,$61,$0F,$81,$F0,$BA,$EE,$61,$F0,$86,$EE,$81,$F0,$86 ; $9340 | ...a.....a......
        DB $FA,$BA,$EF,$61,$5F,$68,$C0,$A1,$C0,$61,$E0,$61,$E0,$61,$E0,$61 ; $9350 | ...a_h...a.a.a.a
        DB $F0,$A1,$F0,$61,$70,$61,$0D,$81,$0F,$81,$0F,$B1,$06,$61,$07,$61 ; $9360 | ...apa.......a.a
        DB $06,$61,$03,$61,$03,$B1,$EF,$81,$BF,$68,$40,$BA,$EE,$61,$FF,$61 ; $9370 | .a.a.....h@..a.a
        DB $EE,$61,$FF,$61,$F0,$BA,$F0,$61,$70,$61,$F0,$A1,$E0,$61,$E0,$61 ; $9380 | .a.a...apa...a.a
        DB $E0,$61,$C0,$61,$C0,$A1,$0F,$31,$0F,$31,$0F,$21,$7F,$F1,$0F,$7F ; $9390 | .a.a...1.1.!....
        DB $0F,$7F,$FE,$74,$C3,$74,$F0,$21,$F0,$21,$F0,$21,$FE,$71,$BF,$74 ; $93A0 | ...t.t.!.!.!.q.t
        DB $1F,$74,$0F,$74,$BF,$74,$C1,$74,$FD,$74,$F0,$74,$F8,$74,$CD,$74 ; $93B0 | .t.t.t.t.t.t.t.t
        DB $87,$7B,$87,$5B,$CF,$4B,$83,$74,$C3,$74,$7F,$74,$FF,$74,$F3,$74 ; $93C0 | .{.[.K.t.t.t.t.t
        DB $E1,$7B,$E1,$5B,$F3,$4B,$00,$11,$00,$11,$00,$11,$07,$F1,$0F,$F1 ; $93D0 | .{.[.K..........
        DB $0F,$F1,$0F,$71,$0C,$71,$F0,$32,$F0,$32,$FF,$21,$F0,$F7,$FB,$74 ; $93E0 | ...q.q.2.2.!...t
        DB $F1,$74,$E0,$74,$3B,$74,$00,$11,$00,$11,$00,$11,$E0,$71,$F0,$71 ; $93F0 | .t.t;t.......q.q
        DB $F0,$71,$F0,$71,$F0,$71,$0C,$71,$0F,$71,$0F,$71,$0F,$71,$0C,$71 ; $9400 | .q.q.q.q.q.q.q.q
        DB $07,$B1,$07,$B1,$03,$B1,$18,$74,$DC,$74,$07,$74,$8F,$74,$DF,$74 ; $9410 | .......t.t.t.t.t
        DB $7E,$7B,$7E,$5B,$FF,$4B,$30,$71,$30,$71,$F0,$71,$F0,$71,$30,$71 ; $9420 | ~{~[.K0q0q.q.q0q
        DB $E0,$B1,$E0,$B1,$C0,$B1,$00,$81,$01,$B1,$03,$B1,$07,$B1,$07,$81 ; $9430 | ................
        DB $03,$81,$0E,$F1,$3F,$F1,$40,$B1,$C0,$B1,$E0,$B1,$E0,$91,$60,$81 ; $9440 | ....?.@.......`.
        DB $C0,$81,$F0,$F1,$FC,$F1,$3F,$F1,$1D,$F1,$0A,$71,$16,$F1,$1F,$F1 ; $9450 | ......?....q....
        DB $60,$17,$DB,$7F,$F6,$74,$FC,$F1,$D8,$F1,$90,$F1,$48,$71,$68,$F1 ; $9460 | `....t......Hqh.
        DB $06,$17,$BB,$7F,$D5,$74,$00,$11,$00,$11,$00,$11,$00,$11,$00,$11 ; $9470 | .....t..........
        DB $00,$11,$00,$F1,$03,$F1,$10,$B1,$38,$B1,$7C,$B1,$7E,$91,$76,$81 ; $9480 | ........8.|.~.v.
        DB $2C,$81,$EF,$F1,$FF,$F1,$00,$11,$00,$11,$00,$11,$00,$11,$00,$11 ; $9490 | ,...............
        DB $00,$11,$00,$F1,$C0,$F1,$03,$F1,$01,$F1,$00,$71,$01,$F1,$01,$F1 ; $94A0 | ...........q....
        DB $09,$71,$0F,$71,$0F,$71,$FF,$F1,$DD,$F1,$A9,$71,$64,$F1,$F6,$F1 ; $94B0 | .q.q.q.....qd...
        DB $FF,$71,$BB,$7F,$DB,$74,$C0,$F1,$80,$F1,$00,$71,$80,$71,$80,$F1 ; $94C0 | .q...t.....q.q..
        DB $90,$71,$F0,$71,$F0,$41,$00,$11,$00,$11,$00,$11,$00,$11,$00,$D1 ; $94D0 | .q.q.A..........
        DB $01,$D1,$03,$21,$07,$21,$00,$11,$00,$11,$00,$11,$00,$11,$80,$D1 ; $94E0 | ...!.!..........
        DB $C0,$D1,$E0,$21,$F0,$C1,$05,$D1,$0F,$D1,$1A,$D1,$37,$D1,$35,$D1 ; $94F0 | ...!........7.5.
        DB $ED,$25,$7F,$21,$1F,$C1,$A0,$D1,$F0,$D1,$58,$D1,$EC,$D1,$AC,$51 ; $9500 | .%.!......X....Q
        DB $B7,$25,$FE,$21,$F8,$C1,$00,$D1,$C0,$D1,$FC,$D1,$7F,$D1,$03,$D1 ; $9510 | .%.!............
        DB $03,$D1,$3B,$F1,$0F,$61,$C0,$D1,$E0,$D1,$70,$D1,$33,$D1,$B3,$D1 ; $9520 | ..;..a....p.3...
        DB $B7,$D1,$E6,$D1,$CC,$D1,$07,$61,$36,$F1,$1F,$E1,$87,$D1,$EF,$D1 ; $9530 | .......a6.......
        DB $7D,$D1,$F1,$25,$3F,$C1,$FC,$D1,$E0,$D1,$FC,$D1,$CE,$D1,$66,$D1 ; $9540 | }..%?.........f.
        DB $19,$1D,$8F,$25,$FC,$C1,$00,$D1,$1D,$D1,$3F,$D1,$67,$D1,$C3,$D1 ; $9550 | ...%......?.g...
        DB $C3,$D1,$03,$D1,$1B,$F1,$60,$D1,$F0,$D1,$B8,$D1,$18,$D1,$7C,$D1 ; $9560 | ......`.......|.
        DB $7E,$D1,$36,$D1,$EE,$D1,$36,$F1,$1B,$F1,$8F,$D1,$DF,$D1,$7B,$D1 ; $9570 | ~.6...6.......{.
        DB $07,$D1,$E3,$25,$3F,$C1,$DC,$D1,$F8,$D1,$FC,$D1,$EE,$D1,$DC,$D1 ; $9580 | ...%?...........
        DB $F8,$D1,$C7,$25,$FC,$C1,$00,$81,$01,$81,$2B,$81,$0E,$81,$55,$81 ; $9590 | ...%......+...U.
        DB $5F,$81,$7D,$81,$77,$8B,$8E,$81,$34,$81,$7C,$81,$6B,$8B,$BB,$8B ; $95A0 | _.}.w...4.|.k...
        DB $7A,$81,$F4,$81,$3B,$8B,$5D,$8B,$A9,$8B,$A0,$8B,$C0,$8B,$C0,$8B ; $95B0 | z...;.].........
        DB $F1,$8B,$7F,$81,$1F,$81,$6E,$8B,$DC,$8B,$1B,$8B,$AE,$81,$78,$81 ; $95C0 | ......n.......x.
        DB $FA,$81,$F0,$81,$40,$81,$02,$81,$08,$81,$02,$81,$25,$81,$2F,$81 ; $95D0 | ....@.......%./.
        DB $5F,$81,$2F,$81,$7F,$81,$15,$81,$B6,$81,$EC,$81,$7C,$81,$5F,$8B ; $95E0 | _./.........|._.
        DB $DC,$81,$1F,$8B,$4F,$8B,$EA,$8B,$78,$8B,$D2,$8B,$D4,$8B,$F0,$8B ; $95F0 | ....O...x.......
        DB $BF,$81,$7F,$81,$1B,$81,$F8,$81,$2F,$8B,$5F,$8B,$B8,$81,$FC,$81 ; $9600 | ......../._.....
        DB $F8,$81,$C0,$81,$00,$81,$00,$81,$00,$81,$00,$81,$02,$81,$02,$81 ; $9610 | ................
        DB $05,$81,$02,$81,$07,$81,$21,$81,$8B,$81,$2E,$81,$57,$81,$FB,$8B ; $9620 | ......!.....W...
        DB $5F,$8B,$B1,$8B,$F4,$8B,$50,$81,$60,$81,$C0,$81,$C0,$81,$F0,$81 ; $9630 | _.....P.`.......
        DB $C0,$B1,$F0,$81,$E0,$81,$0C,$B1,$07,$81,$0F,$81,$0D,$81,$0F,$81 ; $9640 | ................
        DB $0B,$81,$07,$81,$01,$81,$AF,$8B,$82,$8B,$25,$8B,$4B,$8B,$0F,$8B ; $9650 | ..........%.K...
        DB $B7,$8B,$FC,$81,$B0,$81,$80,$B1,$F0,$81,$E0,$81,$80,$B1,$C0,$81 ; $9660 | ................
        DB $80,$81,$00,$81,$00,$81,$40,$B1,$63,$B1,$77,$91,$3F,$81,$7F,$F1 ; $9670 | ......@.c.w.?...
        DB $E6,$F1,$7F,$F1,$FF,$F1,$08,$B1,$98,$B1,$B8,$91,$F0,$81,$FE,$F1 ; $9680 | ................
        DB $3C,$F1,$FE,$F1,$FC,$F1,$7F,$F1,$1F,$F8,$3F,$F8,$1C,$F8,$3C,$F8 ; $9690 | <.........?...<.
        DB $98,$F8,$82,$E6,$1E,$71,$FE,$F1,$7F,$8F,$FE,$81,$3F,$8B,$F1,$8B ; $96A0 | .....q......?...
        DB $31,$89,$08,$E6,$78,$71,$40,$B1,$63,$B1,$77,$91,$3F,$81,$7F,$F1 ; $96B0 | 1...xq@.c.w.?...
        DB $E6,$F1,$7F,$F1,$FF,$F1,$08,$B1,$98,$B1,$B8,$91,$F0,$81,$FE,$F1 ; $96C0 | ................
        DB $3C,$F1,$FE,$F1,$FC,$F1,$7F,$F1,$F0,$8F,$78,$8F,$70,$8F,$78,$8F ; $96D0 | <.........x.p.x.
        DB $0E,$F8,$EC,$76,$78,$71,$FE,$F1,$3F,$8F,$7F,$8F,$F7,$81,$FC,$8B ; $96E0 | ...vxq..?.......
        DB $63,$B8,$37,$76,$3C,$71,$04,$B1,$06,$B1,$07,$91,$03,$81,$07,$F1 ; $96F0 | c.7v<q..........
        DB $0E,$F1,$07,$F1,$0F,$F1,$00,$B1,$39,$B1,$7B,$91,$FF,$81,$FF,$F1 ; $9700 | ........9.{.....
        DB $63,$F1,$FF,$F1,$FF,$F1,$80,$B1,$80,$B1,$80,$91,$00,$81,$E0,$F1 ; $9710 | c...............
        DB $C0,$F1,$E0,$F1,$C0,$F1,$07,$F1,$0F,$81,$07,$81,$07,$81,$07,$81 ; $9720 | ................
        DB $0C,$B1,$0E,$71,$07,$71,$FF,$F1,$03,$8F,$87,$8F,$0F,$8F,$8F,$8F ; $9730 | ...q.q..........
        DB $1F,$8F,$3C,$67,$83,$71,$E0,$F1,$E0,$81,$F0,$81,$70,$81,$70,$B1 ; $9740 | ..<g.q......p.p.
        DB $70,$B1,$60,$71,$C0,$71,$01,$41,$03,$41,$3F,$41,$FF,$41,$0F,$41 ; $9750 | p.`q.q.A.A?A.A.A
        DB $00,$41,$0C,$B1,$0E,$B1,$7F,$41,$FF,$41,$FE,$41,$FC,$41,$E0,$41 ; $9760 | .A.....A.A.A.A.A
        DB $F8,$41,$3C,$41,$CF,$41,$CC,$B1,$C8,$B1,$F3,$41,$3F,$47,$3F,$47 ; $9770 | .A<A.A.....A?G?G
        DB $BF,$47,$BF,$47,$BF,$47,$F3,$41,$F0,$41,$F8,$41,$FC,$41,$FC,$41 ; $9780 | .G.G.G.A.A.A.A.A
        DB $FE,$41,$FF,$41,$FF,$41,$01,$41,$03,$41,$3F,$41,$FF,$41,$0F,$41 ; $9790 | .A.A.A.A.A?A.A.A
        DB $01,$41,$0C,$B1,$0E,$B1,$7F,$41,$FF,$41,$FE,$41,$FC,$41,$E0,$41 ; $97A0 | .A.....A.A.A.A.A
        DB $F8,$41,$C3,$14,$30,$14,$0C,$B1,$08,$B1,$1F,$41,$77,$41,$60,$B4 ; $97B0 | .A..0......AwA`.
        DB $60,$B4,$E7,$47,$F3,$47,$0C,$14,$0F,$14,$E0,$41,$F0,$41,$07,$14 ; $97C0 | `..G.G.....A.A..
        DB $03,$14,$FE,$41,$FF,$41,$00,$41,$00,$41,$03,$41,$0F,$41,$00,$41 ; $97D0 | ...A.A.A.A.A.A.A
        DB $00,$B1,$00,$B1,$00,$B1,$17,$41,$3F,$41,$FF,$41,$FF,$41,$FE,$41 ; $97E0 | .......A?A.A.A.A
        DB $1F,$41,$C0,$B4,$E0,$B4,$F0,$41,$F0,$41,$E0,$41,$C0,$41,$00,$41 ; $97F0 | .A.....A.A.A.A.A
        DB $80,$41,$C0,$41,$F0,$41,$00,$B1,$00,$B1,$01,$41,$03,$41,$06,$B1 ; $9800 | .A.A.A.....A.A..
        DB $06,$B1,$01,$71,$01,$41,$C0,$B4,$80,$B4,$BE,$41,$FF,$41,$7F,$41 ; $9810 | ...q.A.....A.A.A
        DB $FF,$41,$7F,$47,$3F,$47,$30,$41,$00,$41,$00,$41,$00,$41,$80,$41 ; $9820 | .A.G?G0A.A.A.A.A
        DB $C0,$41,$E0,$41,$F8,$41,$03,$D1,$07,$D1,$07,$51,$07,$71,$0C,$F1 ; $9830 | .A.A.A.....Q.q..
        DB $1F,$F1,$0F,$71,$1F,$71,$F0,$D1,$F8,$D1,$F8,$51,$FE,$71,$7C,$71 ; $9840 | ...q.q.....Q.q|q
        DB $FA,$71,$F8,$71,$FE,$71,$3F,$71,$8F,$47,$DB,$4D,$91,$4D,$9B,$4D ; $9850 | .q.q.q?q.G.M.M.M
        DB $DF,$4D,$F0,$1D,$1F,$71,$FC,$D1,$7E,$D4,$6F,$D1,$E3,$DF,$E3,$DF ; $9860 | .M...q..~.o.....
        DB $F8,$D1,$83,$1D,$3C,$71,$03,$D1,$07,$D1,$07,$51,$07,$71,$0C,$F1 ; $9870 | ....<q.....Q.q..
        DB $1F,$F1,$0F,$71,$1F,$71,$F0,$D1,$F8,$D1,$F8,$51,$FE,$71,$7C,$71 ; $9880 | ...q.q.....Q.q|q
        DB $05,$17,$F8,$71,$FE,$71,$3F,$7F,$3F,$7F,$24,$D4,$6E,$D4,$64,$D4 ; $9890 | ...q.q?.?.$.n.d.
        DB $3F,$47,$70,$71,$3C,$71,$FC,$D1,$DE,$D1,$EE,$D1,$F8,$DF,$F8,$DF ; $98A0 | ?Gpq<q..........
        DB $FC,$D7,$0E,$71,$3C,$71,$00,$D1,$00,$D1,$00,$51,$00,$71,$00,$F1 ; $98B0 | ...q<q.....Q.q..
        DB $01,$F1,$00,$71,$01,$71,$3F,$D1,$7F,$D1,$7F,$51,$7F,$71,$C7,$F1 ; $98C0 | ...q.q?....Q.q..
        DB $E0,$F7,$FF,$71,$FF,$71,$00,$D1,$80,$D1,$80,$51,$E0,$71,$C0,$71 ; $98D0 | ...q.q.....Q.q.q
        DB $A0,$71,$80,$71,$E0,$71,$03,$71,$03,$71,$0C,$F1,$0C,$F1,$03,$D1 ; $98E0 | .q.q.q.q.q......
        DB $03,$D1,$0F,$71,$07,$71,$F0,$7D,$FA,$4D,$B9,$4D,$10,$4D,$B0,$4D ; $98F0 | ...q.q.}.M.M.M.M
        DB $F0,$4D,$81,$D1,$C3,$71,$C0,$D1,$E0,$D1,$E0,$D1,$70,$F1,$70,$F1 ; $9900 | .M...q......p.p.
        DB $30,$71,$E0,$71,$C0,$71,$00,$81,$00,$81,$10,$81,$10,$81,$30,$81 ; $9910 | 0q.q.q........0.
        DB $30,$81,$30,$81,$70,$84,$3F,$41,$78,$74,$FC,$71,$FC,$71,$0C,$F4 ; $9920 | 0.0.p.?Axt.q.q..
        DB $0C,$F4,$3E,$74,$E3,$7F,$30,$B4,$18,$B1,$0F,$B1,$03,$F1,$30,$81 ; $9930 | ..>t..0.......0.
        DB $30,$81,$10,$81,$00,$71,$F1,$7F,$C7,$74,$0F,$74,$7F,$74,$FF,$71 ; $9940 | 0....q...t.t.t.q
        DB $6E,$41,$6E,$41,$DE,$71,$03,$81,$06,$81,$1C,$81,$38,$81,$30,$81 ; $9950 | nAnA.q......8.0.
        DB $60,$81,$60,$81,$C0,$81,$3F,$41,$78,$74,$FC,$71,$FC,$71,$0C,$F4 ; $9960 | `.`...?Axt.q.q..
        DB $0C,$F4,$3E,$71,$E1,$7F,$C0,$81,$80,$81,$03,$71,$03,$7B,$03,$71 ; $9970 | ..>q.......q.{.q
        DB $18,$71,$0C,$71,$07,$71,$F0,$7F,$C7,$74,$0F,$74,$3F,$74,$FE,$71 ; $9980 | .q.q.q...t.t?t.q
        DB $01,$71,$06,$71,$1C,$71,$01,$81,$06,$81,$0C,$81,$18,$81,$18,$81 ; $9990 | .q.q.q..........
        DB $30,$81,$30,$81,$20,$81,$07,$41,$07,$71,$0F,$71,$0F,$71,$0F,$41 ; $99A0 | 0.0. ..A.q.q.q.A
        DB $0F,$41,$03,$71,$1F,$71,$E0,$41,$C0,$41,$C0,$71,$C0,$71,$C0,$F1 ; $99B0 | .A.q.q.A.A.q.q..
        DB $C0,$F1,$E0,$71,$E0,$F1,$20,$81,$20,$81,$00,$81,$1F,$B1,$00,$71 ; $99C0 | ...q.. . ......q
        DB $01,$71,$00,$71,$00,$71,$1F,$74,$18,$74,$61,$74,$67,$74,$3F,$71 ; $99D0 | .q.q.q.t.tatgt?q
        DB $80,$71,$C0,$71,$71,$71,$E0,$F1,$E0,$71,$E0,$71,$E0,$71,$C0,$71 ; $99E0 | .q.qqq...q.q.q.q
        DB $18,$71,$30,$71,$E0,$71,$FF,$F1,$FF,$F1,$FF,$F1,$F0,$F4,$E0,$F4 ; $99F0 | .q0q.q..........
        DB $C0,$F4,$80,$F4,$00,$F4,$FF,$F1,$FF,$F1,$FF,$F1,$0F,$F4,$07,$F4 ; $9A00 | ................
        DB $03,$F4,$01,$F4,$00,$F4,$C1,$41,$DD,$41,$DD,$41,$DD,$41,$DD,$41 ; $9A10 | .......A.A.A.A.A
        DB $C1,$41,$FF,$41,$FF,$41,$83,$41,$BB,$41,$BB,$41,$BB,$41,$BB,$41 ; $9A20 | .A.A.A.A.A.A.A.A
        DB $83,$41,$FF,$41,$FF,$41,$FF,$F1,$FF,$F1,$FF,$F1,$F0,$F1,$E0,$F1 ; $9A30 | .A.A.A..........
        DB $C0,$F1,$80,$F1,$00,$F1,$FF,$F1,$FF,$F1,$FF,$F1,$0F,$F1,$07,$F1 ; $9A40 | ................
        DB $03,$F1,$01,$F1,$00,$F1,$00,$41,$78,$41,$FC,$41,$7B,$41,$32,$41 ; $9A50 | .......AxA.A{A2A
        DB $33,$41,$39,$41,$33,$41,$00,$41,$38,$41,$7C,$41,$38,$41,$10,$41 ; $9A60 | 3A9A3A.A8A|A8A.A
        DB $18,$41,$10,$41,$00,$41,$00,$81,$6C,$81,$FE,$81,$FE,$81,$7C,$81 ; $9A70 | .A.A.A..l.....|.
        DB $38,$81,$10,$81,$00,$81,$80,$71,$80,$71,$80,$71,$80,$71,$80,$71 ; $9A80 | 8......q.q.q.q.q
        DB $80,$71,$80,$71,$80,$71,$02,$89,$05,$89,$06,$86,$0D,$86,$7F,$86 ; $9A90 | .q.q.q..........
        DB $3E,$8B,$09,$4B,$0C,$4B,$E0,$86,$E0,$87,$F0,$87,$F3,$87,$FF,$86 ; $9AA0 | >..K.K..........
        DB $1C,$8B,$28,$4B,$08,$4B,$04,$BA,$24,$BA,$1B,$B8,$1F,$98,$1F,$89 ; $9AB0 | ..(K.K..$.......
        DB $3B,$8F,$C6,$F8,$CF,$F8,$00,$BA,$80,$BA,$00,$BA,$00,$98,$40,$86 ; $9AC0 | ;.............@.
        DB $40,$86,$7F,$F8,$7F,$F8,$06,$4B,$06,$89,$0F,$86,$18,$86,$1F,$86 ; $9AD0 | @......K........
        DB $3D,$8A,$37,$86,$35,$8A,$10,$4B,$38,$89,$7C,$89,$8A,$86,$FA,$86 ; $9AE0 | =.7.5..K8.|.....
        DB $9F,$8A,$F7,$86,$93,$8A,$EF,$F8,$E6,$B8,$10,$F7,$DB,$FB,$DF,$FB ; $9AF0 | ................
        DB $DF,$FB,$9F,$FB,$0F,$FB,$3F,$F8,$3F,$F8,$BF,$F8,$A0,$FB,$A0,$FB ; $9B00 | ......?.?.......
        DB $20,$FB,$20,$FB,$20,$FB,$33,$86,$38,$84,$2F,$8B,$0F,$8B,$EF,$8B ; $9B10 |  . . .3.8./.....
        DB $EF,$86,$EF,$86,$E7,$86,$F7,$86,$4F,$8B,$C6,$8B,$E0,$8B,$74,$86 ; $9B20 | ........O.....t.
        DB $74,$86,$7A,$86,$74,$86,$0C,$FB,$3F,$BF,$CF,$FB,$E4,$F7,$CE,$F7 ; $9B30 | t.z.t...?.......
        DB $9F,$F7,$BF,$F7,$BF,$F7,$60,$FB,$1F,$BF,$30,$F7,$30,$F7,$18,$F7 ; $9B40 | ......`...0.0...
        DB $1C,$F7,$9C,$F7,$CE,$F7,$C1,$86,$06,$76,$07,$75,$0B,$75,$0B,$75 ; $9B50 | .........v.u.u.u
        DB $0B,$75,$07,$75,$0F,$75,$68,$86,$90,$76,$E0,$75,$60,$75,$60,$75 ; $9B60 | .u.u.uh..v.u`u`u
        DB $60,$75,$F0,$75,$78,$75,$FF,$F7,$7F,$F7,$7F,$FE,$7F,$FE,$3F,$FE ; $9B70 | `u.uxu........?.
        DB $2E,$FE,$3E,$FE,$37,$FE,$EF,$F7,$EE,$F7,$EC,$FE,$A8,$FE,$E8,$FE ; $9B80 | ..>.7...........
        DB $A8,$FE,$B4,$FE,$D0,$FE,$03,$07,$1F,$FC,$F8,$70,$00,$00,$00,$0C ; $9B90 | ...........p....
        DB $1F,$36,$0F,$0E,$00,$00,$C0,$E0,$F8,$3F,$1F,$0E,$00,$00,$00,$30 ; $9BA0 | .6.......?.....0
        DB $F8,$6C,$F0,$70,$00,$00,$00,$00,$00,$00,$07,$0D,$1D,$0F,$07,$03 ; $9BB0 | .l.p............
        DB $00,$01,$30,$31,$00,$00,$00,$00,$00,$00,$E0,$B0,$B8,$F0,$E0,$C0 ; $9BC0 | ..01............
        DB $00,$80,$0C,$8C,$00,$00,$00,$00,$00,$00,$00,$00,$20,$30,$18,$00 ; $9BD0 | ............ 0..
        DB $00,$00,$00,$00,$00,$1E,$1C,$1E,$06,$00,$00,$00,$04,$0C,$18,$00 ; $9BE0 | ................
        DB $00,$00,$00,$00,$00,$78,$3C,$7E,$7F,$3F,$03,$00,$00,$00,$00,$01 ; $9BF0 | .....x<~.?......
        DB $1F,$0E,$1E,$0F,$00,$00,$F0,$F0,$00,$F8,$F8,$7C,$00,$00,$00,$F0 ; $9C00 | ...........|....
        DB $D0,$D0,$D0,$30,$00,$00,$00,$00,$00,$00,$0C,$1B,$3F,$3F,$1F,$1E ; $9C10 | ...0........??..
        DB $00,$10,$00,$10,$00,$00,$00,$00,$00,$00,$00,$80,$80,$80,$80,$00 ; $9C20 | ................
        DB $00,$00,$00,$C0,$C0,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; $9C30 | ................
        DB $00,$00,$00,$00,$00,$0F,$04,$0E,$0C,$06,$04,$02,$70,$70,$78,$00 ; $9C40 | ............ppx.
        DB $00,$00,$00,$00,$00,$C0,$3C,$7E,$7F,$3F,$03,$00,$00,$00,$00,$03 ; $9C50 | ......<~.?......
        DB $1F,$3C,$33,$1F,$00,$00,$F0,$F0,$00,$F8,$F8,$7C,$00,$00,$00,$F0 ; $9C60 | .<3........|....
        DB $F8,$F0,$F0,$F0,$00,$00,$00,$00,$00,$00,$0C,$1B,$3F,$3F,$1F,$1C ; $9C70 | ............??..
        DB $00,$C0,$C0,$00,$00,$00,$00,$00,$00,$00,$00,$80,$80,$80,$80,$00 ; $9C80 | ................
        DB $00,$06,$06,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; $9C90 | ................
        DB $00,$00,$00,$00,$C0,$70,$04,$0E,$0C,$06,$04,$02,$70,$70,$78,$00 ; $9CA0 | .....p......ppx.
        DB $00,$00,$00,$00,$06,$1C,$3C,$7E,$7F,$3F,$03,$00,$00,$00,$00,$01 ; $9CB0 | ......<~.?......
        DB $1F,$2F,$1F,$0F,$00,$00,$F0,$F0,$00,$F8,$F8,$7C,$00,$00,$00,$F0 ; $9CC0 | ./.........|....
        DB $FC,$98,$F0,$F0,$00,$00,$00,$00,$00,$00,$0C,$1B,$3F,$3F,$1F,$1E ; $9CD0 | ............??..
        DB $00,$D0,$C0,$10,$00,$00,$00,$00,$00,$00,$00,$80,$80,$80,$80,$00 ; $9CE0 | ................
        DB $00,$06,$06,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; $9CF0 | ................
        DB $00,$00,$00,$00,$C0,$70,$04,$0E,$0C,$06,$04,$02,$70,$70,$78,$00 ; $9D00 | .....p......ppx.
        DB $00,$00,$00,$00,$06,$1C,$1E,$3F,$3F,$1F,$01,$00,$00,$00,$03,$3F ; $9D10 | .......??......?
        DB $1F,$08,$0B,$1F,$07,$00,$78,$78,$80,$FC,$FC,$3E,$00,$00,$C0,$E0 ; $9D20 | ......xx...>....
        DB $F0,$F0,$F8,$FE,$C0,$00,$00,$00,$00,$00,$06,$0D,$1F,$1F,$0C,$C0 ; $9D30 | ................
        DB $60,$00,$04,$00,$00,$00,$00,$00,$00,$00,$00,$C0,$C0,$C0,$00,$00 ; $9D40 | `...............
        DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; $9D50 | ................
        DB $00,$00,$00,$C0,$60,$38,$02,$07,$06,$03,$02,$01,$38,$3E,$3C,$18 ; $9D60 | ....`8......8><.
        DB $00,$00,$00,$00,$00,$00,$03,$07,$1F,$FC,$F8,$70,$00,$00,$18,$3C ; $9D70 | ...........p...<
        DB $1F,$0E,$03,$00,$00,$00,$C0,$E0,$F8,$3F,$1F,$0E,$00,$00,$18,$3C ; $9D80 | .........?.....<
        DB $F8,$70,$C0,$00,$00,$00,$00,$00,$00,$00,$07,$0D,$1D,$6F,$67,$03 ; $9D90 | .p...........og.
        DB $00,$01,$00,$00,$00,$00,$00,$00,$00,$00,$E0,$B0,$B8,$F6,$E6,$C0 ; $9DA0 | ................
        DB $00,$80,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$20,$00,$00,$00 ; $9DB0 | ............ ...
        DB $20,$30,$1C,$0C,$00,$00,$1C,$0E,$04,$00,$00,$00,$04,$00,$00,$00 ; $9DC0 |  0..............
        DB $04,$0C,$38,$30,$00,$00,$20,$70,$30,$60,$20,$40,$0E,$0E,$1E,$00 ; $9DD0 | ..80.. p0` @....
        DB $00,$00,$00,$00,$00,$03,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; $9DE0 | ................
        DB $00,$00,$00,$00,$00,$F0,$0F,$0F,$00,$1F,$1F,$3E,$00,$00,$00,$0F ; $9DF0 | ...........>....
        DB $0B,$0B,$0B,$0C,$00,$00,$3C,$7E,$FE,$FC,$C0,$00,$00,$00,$00,$80 ; $9E00 | ......<~........
        DB $F8,$70,$78,$F0,$00,$00,$00,$00,$00,$00,$00,$01,$01,$01,$01,$00 ; $9E10 | .px.............
        DB $00,$00,$00,$03,$03,$00,$00,$00,$00,$00,$30,$D8,$FC,$FC,$F8,$78 ; $9E20 | ..........0....x
        DB $00,$08,$00,$08,$00,$00,$20,$70,$30,$60,$20,$40,$0E,$0E,$1E,$00 ; $9E30 | ...... p0` @....
        DB $00,$00,$00,$00,$60,$38,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; $9E40 | ....`8..........
        DB $00,$00,$00,$00,$03,$0E,$0F,$0F,$00,$1F,$1F,$3E,$00,$00,$00,$0F ; $9E50 | ...........>....
        DB $1F,$0F,$0F,$0F,$00,$00,$3C,$7E,$FE,$FC,$C0,$00,$00,$00,$00,$C0 ; $9E60 | ......<~........
        DB $F8,$3C,$CC,$F8,$00,$00,$00,$00,$00,$00,$00,$01,$01,$01,$01,$00 ; $9E70 | .<..............
        DB $00,$60,$60,$00,$00,$00,$00,$00,$00,$00,$30,$D8,$FC,$FC,$F8,$38 ; $9E80 | .``.......0....8
        DB $00,$03,$03,$00,$00,$00,$20,$70,$30,$60,$20,$40,$0E,$0E,$1E,$00 ; $9E90 | ...... p0` @....
        DB $00,$00,$00,$00,$60,$38,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; $9EA0 | ....`8..........
        DB $00,$00,$00,$00,$03,$0E,$0F,$0F,$00,$1F,$1F,$3E,$00,$00,$00,$0F ; $9EB0 | ...........>....
        DB $3F,$19,$0F,$0F,$00,$00,$3C,$7E,$FE,$FC,$C0,$00,$00,$00,$00,$80 ; $9EC0 | ?.....<~........
        DB $F8,$FC,$F8,$F0,$00,$00,$00,$00,$00,$00,$00,$01,$01,$01,$01,$00 ; $9ED0 | ................
        DB $00,$60,$60,$00,$00,$00,$00,$00,$00,$00,$30,$D8,$FC,$FC,$F8,$78 ; $9EE0 | .``.......0....x
        DB $00,$03,$03,$08,$00,$00,$40,$E0,$60,$C0,$40,$80,$1C,$7C,$3C,$18 ; $9EF0 | ......@.`.@..|<.
        DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; $9F00 | ................
        DB $00,$00,$00,$03,$06,$1C,$1E,$1E,$01,$3F,$3F,$7C,$00,$00,$03,$07 ; $9F10 | .........??|....
        DB $0F,$0E,$1F,$7F,$03,$00,$78,$FC,$FC,$F8,$80,$00,$00,$00,$80,$FC ; $9F20 | ......x.........
        DB $F8,$10,$D0,$F8,$E0,$00,$00,$00,$00,$00,$00,$03,$03,$03,$00,$00 ; $9F30 | ................
        DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$60,$B0,$F8,$F8,$70,$03 ; $9F40 | ..........`...p.
        DB $06,$00,$20,$00,$00,$00,$0C,$0C,$00,$00,$0C,$08,$06,$06,$07,$00 ; $9F50 | .. .............
        DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$40,$00,$00,$00,$00,$00 ; $9F60 | ..........@.....
        DB $00,$00,$00,$00,$00,$00,$00,$62,$F7,$F7,$F3,$F3,$79,$39,$D8,$DC ; $9F70 | .......b....y9..
        DB $DC,$DC,$1C,$04,$00,$00,$00,$00,$00,$E0,$38,$BC,$FC,$FC,$FC,$78 ; $9F80 | ..........8....x
        DB $78,$70,$70,$40,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$03 ; $9F90 | xpp@............
        DB $03,$03,$63,$F1,$59,$08,$00,$04,$06,$03,$01,$01,$00,$00,$00,$80 ; $9FA0 | ..c.Y...........
        DB $80,$80,$80,$86,$1C,$38,$00,$38,$60,$C0,$80,$00,$00,$00,$00,$00 ; $9FB0 | .....8.8`.......
        DB $00,$00,$00,$00,$00,$00,$00,$00,$04,$06,$03,$01,$01,$18,$7C,$78 ; $9FC0 | ..............|x
        DB $02,$04,$06,$0C,$0E,$04,$00,$03,$07,$0F,$1F,$09,$17,$1F,$7C,$30 ; $9FD0 | ..............|0
        DB $00,$03,$3F,$7F,$7E,$3C,$00,$F0,$F8,$F8,$FC,$FE,$FC,$E0,$00,$00 ; $9FE0 | ..?.~<..........
        DB $7C,$F8,$F8,$00,$F0,$F0,$00,$00,$00,$00,$00,$10,$00,$00,$03,$CF ; $9FF0 | |...............
        DB $DB,$0C,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$80,$86 ; $A000 | ................
        DB $80,$00,$00,$00,$00,$00,$60,$C0,$80,$81,$01,$01,$00,$00,$00,$00 ; $A010 | ......`.........
        DB $00,$00,$80,$C0,$60,$30,$00,$2A,$1F,$06,$C0,$C0,$C0,$00,$00,$00 ; $A020 | ....`0.*........
        DB $00,$00,$00,$00,$00,$00,$00,$00,$08,$1C,$3E,$3E,$7F,$7F,$7F,$7F ; $A030 | ..........>>....
        DB $3B,$3D,$1D,$08,$00,$00,$00,$00,$20,$38,$3B,$3B,$3B,$1B,$1C,$9E ; $A040 | ;=...... 8;;;...
        DB $8F,$CF,$CF,$EF,$46,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; $A050 | ....F...........
        DB $00,$00,$02,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$E0,$E0,$60 ; $A060 | ...............`
        DB $50,$30,$20,$00,$30,$30,$00,$00,$60,$F0,$F0,$F0,$F0,$78,$38,$D8 ; $A070 | P0 .00..`....x8.
        DB $DC,$DC,$DC,$DE,$06,$02,$00,$00,$00,$00,$00,$00,$00,$30,$6A,$7E ; $A080 | .............0j~
        DB $7E,$7C,$7C,$6C,$70,$60,$00,$00,$00,$00,$00,$03,$07,$07,$03,$03 ; $A090 | ~||lp`..........
        DB $03,$03,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$C0,$C0,$94,$80 ; $A0A0 | ................
        DB $80,$80,$00,$00,$0C,$1C,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; $A0B0 | ................
        DB $00,$00,$03,$01,$F9,$55,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; $A0C0 | .....U..........
        DB $01,$01,$81,$81,$81,$81,$7F,$3F,$1F,$0C,$00,$80,$20,$00,$80,$E0 ; $A0D0 | .......?.... ...
        DB $CE,$FC,$F8,$FA,$FA,$FE,$FD,$F9,$F1,$61,$01,$03,$07,$10,$01,$03 ; $A0E0 | .........a......
        DB $37,$3F,$7F,$FF,$FF,$FF,$FF,$FC,$F8,$F8,$F8,$F8,$FC,$F0,$C0,$E0 ; $A0F0 | 7?..............
        DB $C0,$92,$02,$96,$FF,$FF,$FF,$7F,$3F,$3F,$3F,$3F,$1F,$0F,$07,$07 ; $A100 | ........????....
        DB $03,$C9,$E0,$E9,$FF,$FF,$09,$21,$1D,$BC,$74,$E4,$4D,$DB,$6E,$46 ; $A110 | .......!..t.M.nF
        DB $CE,$7B,$F1,$14,$25,$09,$20,$24,$48,$03,$62,$36,$B7,$FE,$7E,$6B ; $A120 | .{..%. $H.b6..~k
        DB $6A,$E6,$A2,$2B,$64,$20,$0E,$37,$69,$4E,$90,$44,$99,$A8,$A2,$A9 ; $A130 | j..+d .7iN.D....
        DB $AC,$55,$48,$37,$1C,$03,$F0,$0C,$D6,$2D,$C2,$29,$85,$55,$14,$92 ; $A140 | .UH7.....-.).U..
        DB $49,$89,$1A,$62,$1C,$E0,$02,$11,$00,$54,$00,$50,$20,$80,$00,$A0 ; $A150 | I..b.....T.P ...
        DB $10,$00,$44,$10,$11,$04,$40,$08,$44,$20,$04,$10,$04,$01,$00,$08 ; $A160 | ..D...@.D ......
        DB $02,$08,$22,$40,$28,$80,$00,$00,$11,$11,$FF,$11,$11,$FF,$11,$11 ; $A170 | .."@(...........
        DB $FF,$11,$11,$FF,$11,$11,$00,$00,$11,$11,$FF,$11,$11,$FF,$11,$11 ; $A180 | ................
        DB $FF,$11,$11,$FF,$11,$11,$00,$00,$10,$10,$FF,$10,$10,$FF,$10,$10 ; $A190 | ................
        DB $FF,$10,$10,$FF,$10,$10,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; $A1A0 | ................
        DB $00,$00,$00,$00,$00,$00,$FF,$11,$11,$FF,$11,$11,$FF,$11,$11,$FF ; $A1B0 | ................
        DB $11,$11,$FF,$11,$11,$00,$FF,$11,$11,$FF,$11,$11,$FF,$11,$11,$FF ; $A1C0 | ................
        DB $11,$11,$FF,$11,$11,$00,$FF,$10,$10,$FF,$10,$10,$FF,$10,$10,$FF ; $A1D0 | ................
        DB $10,$10,$FF,$10,$10,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; $A1E0 | ................
        DB $00,$00,$00,$00,$00,$00,$80,$80,$80,$80,$80,$80,$80,$80,$80,$80 ; $A1F0 | ................
        DB $80,$80,$80,$80,$80,$80,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; $A200 | ................
        DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$0C,$1C,$0C,$0C,$0C,$0C ; $A210 | ................
        DB $0C,$1E,$00,$00,$00,$00,$00,$00,$00,$00,$70,$D8,$D8,$D8,$D8,$D8 ; $A220 | ..........p.....
        DB $D8,$70,$00,$00,$00,$00,$00,$00,$00,$00,$1C,$36,$36,$06,$0C,$18 ; $A230 | .p.........66...
        DB $30,$3E,$00,$00,$00,$00,$00,$00,$00,$00,$70,$D8,$D8,$D8,$D8,$D8 ; $A240 | 0>........p.....
        DB $D8,$70,$00,$00,$00,$00,$00,$00,$00,$00,$3E,$30,$30,$3C,$06,$06 ; $A250 | .p........>00<..
        DB $36,$1C,$00,$00,$00,$00,$00,$00,$00,$00,$70,$D8,$D8,$D8,$D8,$D8 ; $A260 | 6.........p.....
        DB $D8,$70,$00,$00,$00,$00,$00,$00,$00,$00,$63,$E6,$66,$66,$66,$66 ; $A270 | .p........c.ffff
        DB $66,$F3,$00,$00,$00,$00,$00,$00,$00,$00,$8E,$DB,$DB,$DB,$DB,$DB ; $A280 | f...............
        DB $DB,$8E,$00,$00,$00,$00,$00,$00,$00,$00,$71,$DB,$DB,$1B,$33,$63 ; $A290 | ..........q...3c
        DB $C3,$F9,$00,$00,$00,$00,$00,$00,$00,$00,$8C,$5A,$5A,$5A,$5A,$5A ; $A2A0 | ...........ZZZZZ
        DB $5A,$8C,$00,$00,$00,$00,$00,$00,$00,$00,$11,$33,$73,$B3,$B3,$FB ; $A2B0 | Z..........3s...
        DB $33,$79,$00,$00,$00,$00,$00,$00,$00,$00,$8C,$5A,$5A,$5A,$5A,$5A ; $A2C0 | 3y.........ZZZZZ
        DB $5A,$8C,$00,$00,$00,$00,$00,$00,$00,$00,$71,$DB,$DB,$DB,$73,$DB ; $A2D0 | Z.........q...s.
        DB $DB,$DB,$71,$00,$00,$00,$00,$00,$00,$00,$8C,$5A,$5A,$5A,$5A,$5A ; $A2E0 | ..q........ZZZZZ
        DB $5A,$5A,$8C,$00,$00,$00,$FE,$FC,$F8,$90,$80,$C0,$F0,$F0,$F8,$F8 ; $A2F0 | ZZ..............
        DB $F0,$E0,$C0,$C0,$C8,$C8,$1F,$07,$03,$04,$00,$03,$07,$07,$0F,$07 ; $A300 | ................
        DB $03,$01,$01,$00,$08,$0C,$FB,$D1,$C0,$E0,$E0,$C0,$C0,$C0,$E0,$E0 ; $A310 | ................
        DB $E0,$C0,$C0,$C0,$80,$00,$FF,$7F,$7F,$FF,$7F,$7F,$7F,$7F,$3F,$3F ; $A320 | ..............??
        DB $3F,$3F,$3F,$3F,$1F,$1F,$C8,$C8,$E0,$E0,$F0,$F0,$F0,$F0,$F8,$FC ; $A330 | ????............
        DB $FC,$FC,$FC,$FC,$F8,$F0,$08,$40,$01,$07,$07,$07,$07,$07,$0F,$1F ; $A340 | .......@........
        DB $1F,$1F,$1F,$1F,$0F,$07,$00,$C0,$C0,$E0,$C0,$80,$80,$80,$80,$80 ; $A350 | ................
        DB $80,$80,$C0,$C0,$C0,$C0,$1F,$0F,$0F,$0F,$07,$03,$03,$01,$00,$01 ; $A360 | ................
        DB $03,$07,$0F,$0F,$07,$3F,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; $A370 | .....?..........
        DB $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; $A380 | ................
        DB $00,$00,$00,$00,$00,$00,$08,$0B,$07,$08,$0B,$07,$08,$0B,$07,$08 ; $A390 | ................
        DB $0B,$07,$08,$0B,$07,$08,$0B,$07,$07,$08,$0B,$07,$08,$0B,$07,$08 ; $A3A0 | ................
        DB $0B,$07,$08,$0B,$0B,$08,$07,$07,$08,$0B,$07,$08,$0B,$08,$0B,$07 ; $A3B0 | ................
        DB $01,$01,$09,$0B,$0F,$01,$01,$01,$01,$07,$0F,$0F,$0F,$0F,$0F,$0F ; $A3C0 | ................
        DB $0F,$01,$01,$01,$01,$00,$A0,$8E,$08,$10,$07,$02,$4C,$1F,$08,$01 ; $A3D0 | ............L...
        DB $19,$0F,$0C,$10,$0A,$11,$09,$12,$01,$13,$03,$12,$00,$14,$03,$12 ; $A3E0 | ................
        DB $00,$11,$22,$03,$22,$00,$11,$32,$03,$32,$01,$10,$30,$07,$30,$01 ; $A3F0 | .."."..2.2..0.0.
        DB $10,$30,$07,$30,$01,$10,$30,$07,$30,$01,$10,$30,$07,$30,$01,$10 ; $A400 | .0.0..0.0..0.0..
        DB $30,$07,$30,$01,$10,$30,$07,$30,$01,$10,$30,$07,$30,$01,$10,$39 ; $A410 | 0.0..0.0..0.0..9
        DB $0F,$10,$10,$20,$0F,$2E,$F0,$0F,$02,$F0,$0F,$02,$F0,$0F,$02,$F0 ; $A420 | ... ............
        DB $0F,$02,$F0,$0F,$0E,$30,$0F,$02,$40,$0F,$15,$D1,$C4,$C1,$C6,$FB ; $A430 | .....0..@.......
        DB $D1,$FC,$D1,$00,$A0,$88,$36,$8F,$06,$4C,$1C,$00,$3A,$02,$28,$03 ; $A440 | ......6..L..:.(.
        DB $E8,$0F,$0E,$36,$01,$31,$0F,$0C,$26,$02,$20,$0F,$0C,$36,$02,$30 ; $A450 | ...6.1..&. ..6.0
        DB $0F,$0C,$26,$02,$20,$0F,$0A,$1C,$0F,$A8,$B6,$0F,$35,$B3,$A8,$B3 ; $A460 | ..&. .......5...
        DB $AB,$B3,$AE,$13,$91,$46,$85,$19,$88,$19,$8B,$19,$8E,$7D,$C8,$8D ; $A470 | .....F.......}..
        DB $CB,$9D,$CE,$6D,$D1,$00,$A0,$88,$36,$8F,$06,$4C,$1C,$01,$1A,$01 ; $A480 | ...m....6..L....
        DB $1A,$0F,$23,$10,$0F,$17,$10,$0F,$2F,$10,$0D,$A9,$0E,$1C,$06,$F0 ; $A490 | ..#...../.......
        DB $06,$F0,$05,$10,$20,$0F,$5B,$F0,$0F,$03,$F0,$0F,$3B,$F0,$06,$F0 ; $A4A0 | .... .[.....;...
        DB $0F,$08,$D1,$C8,$D1,$D1,$7D,$C8,$6D,$D1,$00,$A0,$8A,$34,$8F,$04 ; $A4B0 | ......}.m....4..
        DB $42,$09,$12,$02,$46,$12,$02,$19,$02,$10,$35,$01,$10,$02,$10,$35 ; $A4C0 | B...F.....5....5
        DB $01,$10,$02,$10,$35,$05,$10,$30,$04,$10,$04,$10,$30,$04,$10,$04 ; $A4D0 | ....5..0....0...
        DB $10,$30,$04,$10,$04,$10,$30,$0A,$10,$30,$F4,$05,$10,$30,$0A,$10 ; $A4E0 | .0....0..0...0..
        DB $30,$0A,$10,$30,$0B,$30,$0B,$32,$F1,$30,$0F,$24,$09,$30,$40,$0F ; $A4F0 | 0..0.0.2.0.$.0@.
        DB $12,$30,$40,$0F,$46,$10,$20,$0F,$68,$10,$20,$01,$73,$B1,$C9,$C6 ; $A500 | .0@.F. .h. .s...
        DB $A9,$CD,$CA,$C6,$00,$00,$A0,$88,$9A,$03,$30,$9F,$01,$0C,$4C,$1C ; $A510 | ..........0...L.
        DB $3F,$01,$08,$33,$0F,$31,$38,$0F,$37,$34,$00,$30,$0F,$0A,$3C,$0F ; $A520 | ?..3.18.74.0..<.
        DB $44,$30,$40,$0F,$9E,$71,$D0,$72,$D0,$73,$D0,$74,$D0,$75,$D0,$76 ; $A530 | D0@..q.r.s.t.u.v
        DB $D0,$88,$C4,$88,$86,$18,$88,$89,$C4,$8A,$C4,$8A,$86,$1A,$88,$8A ; $A540 | ................
        DB $8C,$0A,$8E,$8B,$C4,$8C,$C4,$8C,$86,$1C,$88,$8D,$C4,$00,$00,$A0 ; $A550 | ................
        DB $88,$9F,$02,$33,$9A,$07,$11,$02,$47,$11,$02,$18,$03,$38,$0B,$30 ; $A560 | ...3....G....8.0
        DB $02,$10,$07,$30,$02,$10,$07,$30,$01,$11,$07,$30,$01,$11,$02,$30 ; $A570 | ...0...0...0...0
        DB $03,$30,$02,$10,$02,$30,$03,$30,$02,$10,$33,$03,$31,$02,$33,$03 ; $A580 | .0...0.0..3.1.3.
        DB $31,$0F,$0F,$31,$03,$31,$12,$01,$31,$03,$32,$11,$01,$31,$03,$30 ; $A590 | 1..1.1..1.2..1.0
        DB $03,$30,$00,$31,$03,$30,$03,$30,$00,$31,$03,$30,$03,$3A,$00,$10 ; $A5A0 | .0.1.0.0.1.0.:..
        DB $0F,$48,$72,$02,$74,$0E,$D4,$0E,$E4,$08,$82,$02,$84,$0F,$07,$30 ; $A5B0 | .Hr.t..........0
        DB $40,$0F,$00,$30,$40,$0F,$0A,$10,$20,$0F,$04,$10,$20,$07,$71,$C8 ; $A5C0 | @..0@... ... .q.
        DB $A2,$C8,$73,$C8,$00,$88,$33,$8F,$03,$33,$02,$11,$0A,$11,$47,$03 ; $A5D0 | ..s...3..3....G.
        DB $18,$03,$19,$0B,$10,$0B,$11,$0A,$16,$00,$14,$0F,$0A,$F2,$32,$02 ; $A5E0 | ..............2.
        DB $32,$0F,$18,$10,$0F,$0C,$32,$0F,$11,$15,$02,$13,$0F,$18,$10,$20 ; $A5F0 | 2.....2........ 
        DB $0B,$F0,$06,$10,$20,$0F,$0B,$54,$0F,$63,$57,$0F,$19,$61,$8C,$66 ; $A600 | .... ..T.cW..a.f
        DB $CE,$26,$91,$6A,$CE,$00,$00,$A0,$8F,$06,$31,$08,$13,$48,$1F,$0E ; $A610 | .&.j......1..H..
        DB $08,$E3,$0B,$30,$0F,$04,$33,$0F,$12,$31,$03,$30,$0F,$21,$30,$00 ; $A620 | ...0..3..1.0.!0.
        DB $33,$02,$30,$04,$B0,$0F,$17,$18,$00,$12,$03,$72,$00,$71,$00,$73 ; $A630 | 3.0........r.q.s
        DB $0F,$13,$F0,$0F,$14,$F0,$0F,$2C,$51,$0F,$21,$C0,$0F,$08,$BA,$0F ; $A640 | .......,Q.!.....
        DB $09,$05,$91,$67,$88,$67,$8D,$08,$91,$49,$85,$3B,$8C,$00,$8F,$08 ; $A650 | ...g.g...I.;....
        DB $31,$1C,$0F,$10,$32,$0F,$01,$33,$08,$36,$00,$32,$0F,$0B,$30,$00 ; $A660 | 1...2..3.6.2..0.
        DB $50,$30,$0F,$00,$31,$00,$30,$0F,$1B,$31,$00,$50,$34,$0B,$31,$0A ; $A670 | P0..1.0..1.P4.1.
        DB $31,$0F,$0C,$1C,$0F,$F4,$52,$83,$13,$87,$13,$8C,$34,$83,$05,$8C ; $A680 | 1.....R.....4...
        DB $36,$84,$37,$8C,$17,$91,$38,$81,$08,$88,$3A,$84,$00,$88,$32,$8F ; $A690 | 6.7...8...:...2.
        DB $07,$1C,$0F,$0B,$32,$02,$33,$0B,$30,$0B,$30,$02,$37,$05,$B1,$30 ; $A6A0 | ....2.3.0.0.7..0
        DB $02,$30,$0B,$30,$0B,$30,$0B,$30,$06,$35,$0F,$11,$37,$04,$37,$02 ; $A6B0 | .0.0.0.0.5..7.7.
        DB $30,$00,$37,$0F,$0C,$15,$00,$14,$00,$0F,$0B,$58,$0F,$24,$62,$0F ; $A6C0 | 0.7........X.$b.
        DB $63,$87,$08,$7D,$0F,$06,$C0,$B4,$A4,$86,$AC,$B7,$84,$07,$C9,$88 ; $A6D0 | c..}............
        DB $8C,$09,$81,$00,$8F,$0C,$07,$0C,$01,$11,$00,$17,$01,$10,$0B,$10 ; $A6E0 | ................
        DB $0B,$10,$0B,$10,$01,$13,$00,$12,$0F,$54,$30,$0B,$30,$92,$00,$11 ; $A6F0 | .........T0.0...
        DB $01,$11,$01,$30,$92,$01,$10,$05,$30,$92,$01,$10,$04,$32,$91,$01 ; $A700 | ...0....0....2..
        DB $10,$04,$32,$91,$01,$10,$03,$34,$90,$01,$10,$01,$37,$0F,$1D,$58 ; $A710 | ..2....4....7..X
        DB $0F,$09,$C0,$0F,$03,$C0,$04,$58,$0F,$82,$77,$CA,$77,$CC,$88,$C2 ; $A720 | .......X..w.w...
        DB $79,$A8,$2C,$82,$4D,$C5,$00,$88,$02,$30,$8E,$9B,$33,$1C,$0F,$17 ; $A730 | y.,.M....0..3...
        DB $11,$01,$10,$02,$10,$01,$11,$0F,$4B,$31,$00,$32,$00,$32,$00,$31 ; $A740 | ........K1.2.2.1
        DB $9F,$1A,$32,$90,$32,$9F,$0D,$3C,$0F,$45,$56,$0F,$39,$56,$0F,$48 ; $A750 | ..2.2..<.EV.9V.H
        DB $E1,$CA,$F4,$CA,$66,$CA,$68,$CA,$FA,$CA,$ED,$CA,$00,$88,$02,$30 ; $A760 | ....f.h........0
        DB $8E,$9B,$36,$1C,$0F,$23,$10,$0F,$17,$1F,$0A,$0F,$17,$91,$30,$06 ; $A770 | ..6..#........0.
        DB $30,$93,$30,$06,$30,$93,$30,$06,$30,$92,$31,$06,$31,$92,$30,$06 ; $A780 | 0.0.0.0.0.1.1.0.
        DB $30,$93,$30,$06,$30,$91,$32,$06,$32,$03,$F0,$0F,$67,$F0,$07,$F0 ; $A790 | 0.0.0.2.2...g...
        DB $02,$F0,$0F,$46,$F0,$0F,$13,$B1,$86,$41,$CA,$B7,$A6,$BD,$86,$00 ; $A7A0 | ...F.....A......
        DB $88,$34,$8E,$9B,$36,$0F,$24,$10,$08,$32,$09,$32,$0A,$31,$02,$30 ; $A7B0 | .4..6.$..2.2.1.0
        DB $06,$31,$0B,$30,$07,$30,$02,$30,$0F,$17,$9F,$3E,$32,$D6,$32,$04 ; $A7C0 | .1.0.0.0...>2.2.
        DB $30,$40,$0F,$09,$F0,$0F,$3F,$F0,$0F,$4D,$10,$20,$0F,$04,$10,$20 ; $A7D0 | 0@....?..M. ... 
        DB $0F,$04,$10,$20,$07,$D1,$C8,$00,$98,$33,$9F,$03,$35,$0F,$24,$30 ; $A7E0 | ... .....3..5.$0
        DB $00,$35,$06,$36,$08,$34,$08,$34,$01,$F6,$35,$08,$33,$0A,$31,$0B ; $A7F0 | .5.6.4.4..5.3.1.
        DB $30,$05,$32,$03,$97,$30,$03,$97,$31,$02,$96,$32,$02,$95,$33,$02 ; $A800 | 0.2..0..1..2..3.
        DB $94,$35,$01,$93,$37,$00,$3C,$04,$72,$0F,$91,$80,$0F,$18,$80,$03 ; $A810 | .5..7.<.r.......
        DB $71,$06,$D3,$02,$80,$0B,$E3,$03,$82,$04,$84,$C0,$95,$C0,$86,$C0 ; $A820 | q...............
        DB $97,$C0,$88,$C0,$00,$9F,$08,$33,$30,$00,$36,$00,$30,$00,$10,$05 ; $A830 | .......30.6.0...
        DB $30,$0B,$30,$0B,$31,$06,$31,$02,$31,$00,$12,$00,$33,$02,$31,$12 ; $A840 | 0.0.1.1.1...3.1.
        DB $00,$34,$02,$30,$12,$00,$35,$02,$12,$00,$36,$03,$10,$00,$37,$08 ; $A850 | .4.0..5...6...7.
        DB $34,$07,$35,$01,$32,$01,$31,$05,$32,$01,$31,$0F,$00,$12,$0F,$24 ; $A860 | 4.5.2.1.2.1....$
        DB $1C,$0F,$06,$C2,$0F,$1F,$F0,$0F,$04,$F0,$0F,$48,$C2,$0F,$3B,$C1 ; $A870 | ...........H..;.
        DB $C6,$C1,$C8,$E1,$CE,$22,$8A,$E2,$CE,$85,$83,$A6,$B1,$78,$C1,$68 ; $A880 | .....".......x.h
        DB $CC,$99,$CC,$00,$88,$33,$8D,$35,$88,$35,$15,$02,$13,$0F,$17,$D1 ; $A890 | .....3.5.5......
        DB $03,$D6,$11,$03,$18,$0A,$10,$0B,$10,$06,$15,$02,$10,$03,$13,$03 ; $A8A0 | ................
        DB $11,$03,$12,$02,$13,$03,$11,$01,$15,$03,$10,$00,$17,$03,$19,$02 ; $A8B0 | ................
        DB $11,$02,$15,$0F,$18,$1D,$0F,$30,$F0,$0F,$B3,$63,$8A,$65,$87,$67 ; $A8C0 | .......0...c.e.g
        DB $89,$97,$91,$79,$C6,$69,$8B,$7A,$C6,$7B,$C6,$7C,$C6,$7D,$C6,$00 ; $A8D0 | ...y.i.z.{.|.}..
        DB $8F,$0C,$1F,$09,$08,$12,$09,$11,$02,$16,$00,$10,$02,$30,$03,$12 ; $A8E0 | .............0..
        DB $03,$31,$03,$12,$02,$32,$11,$00,$12,$02,$33,$03,$10,$02,$34,$11 ; $A8F0 | .1...2....3...4.
        DB $00,$11,$01,$35,$05,$36,$05,$32,$01,$31,$14,$00,$32,$02,$30,$14 ; $A900 | ...5.6.2.1..2.0.
        DB $00,$33,$01,$30,$13,$02,$33,$01,$12,$04,$32,$01,$11,$06,$30,$07 ; $A910 | .3.0..3...2...0.
        DB $30,$05,$30,$03,$32,$03,$31,$00,$3B,$0F,$20,$F0,$0F,$C3,$D1,$C5 ; $A920 | 0.0.2.1.;. .....
        DB $D4,$C5,$86,$A2,$EA,$CB,$00,$88,$34,$9F,$07,$0F,$3E,$33,$20,$60 ; $A930 | ........4...>3 `
        DB $00,$50,$20,$36,$20,$04,$20,$34,$20,$06,$20,$32,$20,$08,$20,$30 ; $A940 | .P 6 . 4 . 2 . 0
        DB $20,$03,$22,$03,$20,$0F,$0D,$22,$00,$22,$02,$20,$0B,$30,$20,$0A ; $A950 |  .". ..".". .0 .
        DB $31,$21,$07,$20,$0A,$20,$30,$05,$20,$02,$20,$34,$20,$00,$32,$00 ; $A960 | 1!. . 0. . 4 .2.
        DB $20,$32,$0F,$F4,$D1,$D1,$83,$A2,$33,$84,$73,$A9,$85,$CB,$97,$C0 ; $A970 |  2......3.s.....
        DB $77,$D0,$89,$CB,$7B,$A9,$00,$88,$32,$9D,$91,$35,$9A,$15,$00,$15 ; $A980 | w...{...2..5....
        DB $0F,$17,$35,$15,$0A,$11,$0A,$11,$0A,$11,$05,$30,$01,$10,$00,$10 ; $A990 | ..5........0....
        DB $0B,$10,$0F,$07,$10,$0F,$32,$10,$01,$A4,$0F,$05,$35,$01,$12,$01 ; $A9A0 | ......2.....5...
        DB $0F,$20,$F0,$02,$F0,$02,$F0,$0F,$20,$63,$00,$59,$0F,$04,$D0,$0F ; $A9B0 | . ...... c.Y....
        DB $03,$E0,$04,$52,$03,$56,$0F,$0F,$55,$0B,$30,$40,$0F,$0E,$E1,$C5 ; $A9C0 | ...R.V..U.0@....
        DB $CA,$C5,$5D,$C4,$00,$8B,$18,$20,$07,$06,$07,$0C,$01,$10,$01,$17 ; $A9D0 | ..].... ........
        DB $01,$10,$0B,$10,$0B,$10,$01,$36,$02,$10,$28,$0F,$10,$35,$00,$10 ; $A9E0 | .......6..(..5..
        DB $0F,$23,$10,$0F,$0E,$32,$01,$32,$0F,$0D,$10,$29,$01,$10,$39,$01 ; $A9F0 | .#...2.2...)..9.
        DB $1A,$0F,$1D,$5B,$05,$D0,$0F,$03,$E0,$0F,$08,$55,$0F,$4E,$55,$0F ; $AA00 | ...[.......U.NU.
        DB $1E,$C7,$C8,$78,$AA,$FA,$C8,$00,$8F,$06,$34,$89,$1C,$0F,$12,$11 ; $AA10 | ...x......4.....
        DB $0A,$14,$01,$10,$00,$10,$02,$10,$05,$10,$00,$10,$02,$10,$05,$12 ; $AA20 | ................
        DB $02,$10,$00,$10,$00,$10,$02,$11,$02,$10,$00,$10,$00,$11,$02,$10 ; $AA30 | ................
        DB $06,$11,$02,$10,$06,$11,$02,$10,$01,$10,$00,$11,$00,$12,$01,$10 ; $AA40 | ................
        DB $06,$12,$01,$10,$06,$10,$00,$10,$01,$10,$02,$12,$00,$10,$03,$12 ; $AA50 | ................
        DB $00,$12,$0F,$10,$13,$04,$1A,$00,$10,$0F,$55,$DD,$05,$ED,$07,$C7 ; $AA60 | ..........U.....
        DB $0F,$48,$C0,$0F,$04,$22,$8F,$22,$91,$18,$81,$08,$90,$19,$81,$5B ; $AA70 | .H...".".......[
        DB $89,$2B,$8C,$00,$88,$33,$8F,$07,$12,$06,$12,$0F,$17,$10,$00,$33 ; $AA80 | .+...3.........3
        DB $00,$33,$00,$10,$0F,$0C,$22,$02,$22,$0F,$0D,$32,$04,$32,$0F,$0B ; $AA90 | .3...."."..2.2..
        DB $10,$03,$A2,$03,$10,$0F,$02,$32,$0F,$1C,$12,$00,$10,$02,$10,$00 ; $AAA0 | .......2........
        DB $12,$0F,$19,$52,$06,$57,$0F,$7E,$52,$06,$57,$0F,$19,$D1,$CF,$22 ; $AAB0 | ...R.W.~R.W...."
        DB $91,$74,$C5,$74,$C8,$7A,$C5,$7A,$C8,$2C,$91,$DD,$C1,$00,$8F,$06 ; $AAC0 | .t.t.z.z.,......
        DB $36,$89,$1C,$EC,$0F,$0C,$13,$00,$12,$05,$E6,$0F,$0F,$17,$01,$10 ; $AAD0 | 6...............
        DB $0F,$0D,$17,$0F,$0F,$17,$0F,$0F,$17,$04,$17,$01,$1C,$0F,$05,$BA ; $AAE0 | ................
        DB $0F,$49,$B4,$0F,$4F,$B8,$0F,$0E,$74,$C2,$75,$C2,$B7,$A9,$07,$8C ; $AAF0 | .I..O...t.u.....
        DB $48,$86,$09,$82,$00,$8F,$08,$36,$0F,$10,$40,$06,$60,$01,$50,$02 ; $AB00 | H......6..@.`.P.
        DB $60,$01,$50,$0F,$1E,$40,$08,$60,$04,$50,$0F,$1F,$50,$00,$60,$06 ; $AB10 | `.P..@.`.P..P.`.
        DB $60,$06,$50,$0F,$0C,$50,$0A,$60,$01,$A8,$0E,$1C,$0F,$F4,$F1,$C0 ; $AB20 | `.P..P.`........
        DB $84,$86,$85,$81,$87,$A0,$F7,$C5,$89,$A1,$8A,$A6,$FD,$C0,$00,$8F ; $AB30 | ................
        DB $08,$34,$1C,$00,$B0,$02,$B0,$02,$10,$0B,$10,$05,$A0,$04,$10,$0B ; $AB40 | .4..............
        DB $10,$03,$14,$02,$10,$03,$B0,$06,$10,$0B,$10,$05,$A0,$04,$10,$01 ; $AB50 | ................
        DB $10,$08,$10,$01,$14,$04,$10,$01,$10,$B2,$05,$10,$0B,$10,$0B,$10 ; $AB60 | ................
        DB $0B,$10,$0B,$10,$0F,$02,$A0,$00,$A0,$0F,$00,$11,$02,$1C,$0F,$3A ; $AB70 | ...............:
        DB $C4,$0F,$0B,$5C,$0A,$D8,$0A,$E8,$01,$8E,$0F,$09,$74,$07,$71,$0B ; $AB80 | ...\........t.q.
        DB $82,$0C,$83,$02,$87,$00,$00,$88,$02,$30,$8F,$07,$10,$02,$18,$05 ; $AB90 | .........0......
        DB $16,$05,$10,$34,$06,$10,$30,$02,$30,$00,$13,$01,$10,$30,$02,$30 ; $ABA0 | ...4..0.0....0.0
        DB $03,$10,$01,$10,$30,$0F,$15,$10,$30,$02,$31,$13,$01,$10,$30,$02 ; $ABB0 | ....0...0.1...0.
        DB $31,$02,$10,$01,$10,$30,$02,$31,$05,$10,$30,$02,$31,$05,$10,$35 ; $ABC0 | 1....0.1..0.1..5
        DB $05,$1A,$0F,$2D,$13,$01,$16,$0F,$32,$64,$01,$64,$0F,$09,$D0,$0F ; $ABD0 | ...-....2d.d....
        DB $03,$E0,$0F,$59,$64,$0F,$10,$12,$87,$12,$8C,$18,$86,$18,$91,$1A ; $ABE0 | ...Yd...........
        DB $91,$DB,$C3,$1C,$91,$CD,$C2,$00,$8F,$08,$34,$00,$1B,$0F,$17,$1C ; $ABF0 | ..........4.....
        DB $07,$14,$08,$13,$08,$13,$09,$12,$00,$C6,$01,$12,$00,$16,$02,$11 ; $AC00 | ................
        DB $0A,$11,$0B,$14,$07,$10,$0F,$0C,$12,$0F,$12,$1C,$0F,$73,$57,$0F ; $AC10 | .............sW.
        DB $69,$03,$87,$83,$CB,$73,$D1,$84,$CB,$94,$CE,$74,$D1,$55,$87,$95 ; $AC20 | i....s.....t.U..
        DB $CE,$67,$C1,$68,$C1,$3B,$91,$00,$88,$35,$8F,$03,$36,$13,$00,$12 ; $AC30 | .g.h.;...5..6...
        DB $00,$13,$0F,$17,$13,$00,$12,$00,$17,$00,$12,$00,$13,$00,$10,$00 ; $AC40 | ................
        DB $10,$00,$10,$00,$10,$00,$10,$00,$10,$01,$10,$00,$10,$00,$10,$00 ; $AC50 | ................
        DB $10,$00,$10,$00,$10,$0F,$0C,$10,$00,$10,$00,$10,$00,$10,$00,$10 ; $AC60 | ................
        DB $00,$10,$01,$10,$00,$10,$00,$10,$00,$10,$00,$10,$00,$10,$00,$13 ; $AC70 | ................
        DB $00,$12,$00,$17,$00,$12,$00,$17,$00,$12,$00,$17,$00,$12,$00,$13 ; $AC80 | ................
        DB $0F,$17,$1C,$0F,$34,$F0,$0F,$03,$F0,$0F,$40,$F0,$0F,$03,$F0,$0F ; $AC90 | ....4.....@.....
        DB $36,$D1,$C6,$71,$CA,$F3,$C6,$83,$CA,$E7,$C6,$97,$CA,$FB,$C6,$8B ; $ACA0 | 6..q............
        DB $CA,$DD,$C6,$7D,$CA,$00,$8F,$08,$36,$15,$01,$12,$0B,$10,$0B,$10 ; $ACB0 | ...}....6.......
        DB $0B,$10,$01,$15,$01,$12,$0B,$10,$0B,$10,$0B,$10,$01,$15,$01,$14 ; $ACC0 | ................
        DB $09,$12,$09,$11,$0A,$11,$00,$15,$01,$13,$00,$13,$05,$11,$02,$11 ; $ACD0 | ................
        DB $05,$11,$02,$11,$05,$11,$02,$13,$01,$13,$04,$11,$01,$13,$04,$11 ; $ACE0 | ................
        DB $01,$13,$00,$12,$00,$11,$01,$13,$00,$0F,$7B,$D0,$0F,$03,$E0,$0F ; $ACF0 | ..........{.....
        DB $4A,$30,$40,$07,$71,$C1,$71,$C5,$71,$C9,$96,$AE,$99,$82,$99,$86 ; $AD00 | J0@.q.q.q.......
        DB $99,$8A,$99,$8E,$00,$07,$0C,$03,$8F,$08,$01,$1A,$0F,$1C,$17,$06 ; $AD10 | ................
        DB $15,$01,$11,$03,$14,$01,$11,$04,$13,$01,$11,$05,$12,$01,$14,$03 ; $AD20 | ................
        DB $11,$01,$15,$03,$10,$01,$11,$00,$13,$05,$11,$01,$13,$0F,$0D,$1A ; $AD30 | ................
        DB $0F,$12,$10,$05,$12,$C6,$12,$0F,$19,$54,$0F,$C6,$64,$84,$36,$87 ; $AD40 | .........T..d.6.
        DB $67,$90,$88,$A2,$8B,$82,$00,$88,$33,$8F,$07,$1C,$0F,$0D,$12,$00 ; $AD50 | g.......3.......
        DB $11,$03,$10,$0F,$0C,$17,$0B,$10,$0B,$10,$04,$11,$01,$11,$0F,$0F ; $AD60 | ................
        DB $13,$00,$12,$0F,$1B,$14,$00,$10,$05,$14,$00,$10,$03,$A1,$16,$05 ; $AD70 | ................
        DB $1C,$0F,$B9,$54,$0F,$26,$05,$81,$05,$87,$05,$8E,$08,$81,$08,$87 ; $AD80 | ...T.&..........
        DB $09,$91,$1B,$89,$1B,$8B,$1B,$8D,$1B,$8F,$1B,$91,$6C,$C6,$6D,$C6 ; $AD90 | ............l.m.
        DB $00,$8F,$04,$33,$8B,$12,$06,$15,$06,$15,$06,$15,$00,$10,$02,$10 ; $ADA0 | ...3............
        DB $00,$12,$0F,$24,$12,$00,$10,$02,$10,$00,$12,$0F,$03,$10,$0F,$05 ; $ADB0 | ...$............
        DB $10,$06,$10,$0F,$1D,$10,$02,$10,$0F,$0E,$12,$02,$10,$02,$12,$0F ; $ADC0 | ................
        DB $25,$55,$0F,$09,$53,$0F,$1C,$F0,$02,$F0,$0F,$0B,$53,$0F,$1D,$55 ; $ADD0 | %U..S.......S..U
        DB $0F,$19,$61,$C4,$72,$C4,$73,$C4,$63,$8A,$65,$81,$65,$8E,$67,$88 ; $ADE0 | ..a.r.s.c.e.e.g.
        DB $69,$81,$69,$8E,$7B,$C4,$6B,$8A,$7C,$C4,$6D,$C4,$00,$8F,$08,$33 ; $ADF0 | i.i.{.k.|.m....3
        DB $1C,$0F,$0A,$C4,$01,$D4,$0C,$10,$0D,$D4,$C4,$0F,$0C,$C4,$01,$D4 ; $AE00 | ................
        DB $00,$14,$01,$1A,$01,$1A,$01,$1A,$03,$13,$03,$10,$03,$13,$03,$10 ; $AE10 | ................
        DB $08,$11,$00,$10,$0E,$11,$0A,$11,$03,$1C,$0F,$F4,$62,$CE,$03,$84 ; $AE20 | ............b...
        DB $03,$87,$63,$CE,$04,$81,$07,$84,$7A,$CF,$7A,$D1,$0B,$81,$7B,$CF ; $AE30 | ..c.....z.z...{.
        DB $7B,$D1,$0C,$81,$0C,$87,$EC,$CF,$EC,$D1,$ED,$CF,$ED,$D1,$00,$88 ; $AE40 | {...............
        DB $33,$8F,$07,$1C,$0F,$17,$10,$00,$1B,$01,$19,$03,$18,$04,$18,$03 ; $AE50 | 3...............
        DB $19,$03,$19,$04,$18,$04,$18,$04,$12,$01,$13,$04,$11,$03,$12,$04 ; $AE60 | ................
        DB $10,$03,$13,$09,$13,$0F,$0E,$1C,$0F,$F4,$71,$CD,$81,$CF,$72,$CD ; $AE70 | ..........q...r.
        DB $82,$CF,$93,$CE,$94,$CE,$86,$82,$36,$8B,$00,$88,$35,$8F,$03,$36 ; $AE80 | ........6...5..6
        DB $1C,$0F,$17,$12,$06,$12,$0F,$0A,$11,$08,$11,$0F,$0D,$C6,$0F,$1A ; $AE90 | ................
        DB $12,$06,$12,$0F,$24,$12,$02,$16,$0F,$F4,$E1,$C5,$12,$82,$82,$8C ; $AEA0 | ....$...........
        DB $8C,$AC,$1C,$91,$ED,$C5,$00,$88,$35,$8F,$03,$36,$13,$01,$16,$0F ; $AEB0 | ........5..6....
        DB $17,$FC,$0E,$A2,$02,$A2,$0F,$01,$18,$0F,$38,$12,$04,$F4,$10,$00 ; $AEC0 | ..........8.....
        DB $10,$F4,$0F,$17,$1C,$0F,$64,$65,$09,$54,$0F,$06,$65,$0F,$55,$81 ; $AED0 | ......de.T..e.U.
        DB $C9,$F6,$CC,$E7,$CF,$F8,$CC,$8D,$C9,$00,$88,$35,$8F,$03,$36,$1C ; $AEE0 | ...........5..6.
        DB $0F,$31,$FC,$0C,$9C,$11,$98,$11,$00,$14,$90,$14,$01,$10,$98,$10 ; $AEF0 | .1..............
        DB $00,$90,$10,$98,$10,$9F,$03,$12,$94,$1C,$0F,$17,$1B,$00,$0F,$F4 ; $AF00 | ................
        DB $41,$C1,$E1,$CA,$02,$84,$ED,$CA,$00,$88,$35,$8F,$07,$16,$00,$14 ; $AF10 | A.........5.....
        DB $E6,$0B,$10,$0B,$10,$05,$10,$01,$10,$01,$10,$00,$11,$00,$12,$01 ; $AF20 | ................
        DB $10,$01,$13,$00,$12,$04,$10,$05,$10,$04,$13,$00,$12,$00,$C1,$01 ; $AF30 | ................
        DB $13,$00,$12,$04,$10,$F5,$10,$04,$10,$05,$10,$01,$D1,$00,$10,$05 ; $AF40 | ................
        DB $10,$04,$17,$04,$17,$00,$C1,$01,$10,$05,$E2,$09,$10,$0B,$10,$04 ; $AF50 | ................
        DB $10,$05,$11,$D2,$00,$10,$05,$1C,$0F,$05,$BE,$0F,$31,$BD,$0F,$0D ; $AF60 | ............1...
        DB $C0,$0F,$2D,$F0,$0F,$25,$43,$82,$68,$CA,$6A,$CA,$6B,$CA,$FC,$CE ; $AF70 | ..-..%C.h.j.k...
        DB $6D,$CA,$FD,$CE,$00,$88,$02,$30,$8F,$03,$36,$12,$00,$11,$01,$13 ; $AF80 | m......0..6.....
        DB $04,$11,$0A,$11,$0A,$11,$07,$14,$07,$34,$01,$13,$02,$72,$09,$82 ; $AF90 | .........4...r..
        DB $0F,$12,$11,$32,$10,$01,$13,$0F,$25,$12,$04,$13,$0F,$18,$15,$01 ; $AFA0 | ...2....%.......
        DB $13,$00,$0F,$7B,$D0,$0F,$03,$E0,$0F,$2D,$53,$00,$53,$00,$53,$00 ; $AFB0 | ...{.....-S.S.S.
        DB $52,$0F,$05,$81,$CB,$92,$CB,$34,$C8,$6A,$C1,$9A,$83,$7A,$C6,$9A ; $AFC0 | R......4.j...z..
        DB $88,$9A,$CB,$9A,$8D,$9A,$D0,$6B,$C1,$7B,$C6,$8B,$CB,$8B,$D0,$00 ; $AFD0 | .......k.{......
        DB $07,$0C,$8F,$0C,$01,$1A,$0F,$27,$17,$0D,$10,$0F,$19,$17,$0E,$10 ; $AFE0 | .......'........
        DB $0F,$01,$50,$17,$0F,$0C,$17,$0B,$10,$0B,$10,$04,$18,$01,$0F,$03 ; $AFF0 | ..P.............
        DB $D0,$0F,$03,$E0,$0A,$54,$0F,$90,$72,$0F,$15,$83,$34,$83,$84,$D1 ; $B000 | .....T..r...4...
        DB $35,$86,$35,$88,$85,$D1,$36,$83,$86,$D1,$B7,$A8,$B7,$8B,$B7,$AE ; $B010 | 5.5...6.........
        DB $97,$D1,$38,$83,$98,$D1,$39,$86,$39,$88,$99,$D1,$3A,$83,$00,$8E ; $B020 | ..8...9.9...:...
        DB $36,$8F,$01,$B5,$00,$B5,$0F,$18,$19,$02,$E9,$0F,$0D,$10,$00,$17 ; $B030 | 6...............
        DB $0F,$0B,$10,$03,$14,$0F,$0E,$11,$00,$10,$0F,$10,$12,$08,$13,$02 ; $B040 | ................
        DB $1F,$07,$0F,$1D,$B6,$0F,$C0,$36,$90,$A7,$82,$47,$86,$37,$89,$38 ; $B050 | .......6...G.7.8
        DB $90,$3B,$8E,$00,$8E,$36,$8F,$01,$0F,$0B,$DB,$07,$14,$08,$13,$C6 ; $B060 | .;...6..........
        DB $01,$1A,$02,$12,$05,$B0,$02,$12,$0A,$11,$0A,$11,$0B,$10,$0B,$10 ; $B070 | ................
        DB $0F,$27,$10,$0F,$13,$1C,$09,$F0,$04,$F0,$0F,$14,$F0,$0C,$58,$0F ; $B080 | .'............X.
        DB $27,$57,$0F,$69,$02,$80,$52,$83,$55,$83,$07,$80,$39,$84,$3A,$86 ; $B090 | 'W.i..R.U...9.:.
        DB $0B,$80,$3B,$88,$3C,$8A,$3D,$8C,$00,$8F,$08,$36,$1C,$EC,$0F,$0E ; $B0A0 | ..;.<.=....6....
        DB $16,$0F,$10,$16,$0F,$0C,$10,$00,$10,$08,$10,$0F,$0C,$18,$0F,$0B ; $B0B0 | ................
        DB $10,$0F,$0C,$18,$01,$1C,$0F,$05,$BD,$0F,$00,$51,$0F,$77,$54,$0F ; $B0C0 | ...........Q.wT.
        DB $33,$61,$C2,$A4,$AB,$04,$90,$A6,$8B,$06,$90,$F7,$C5,$A7,$AB,$F8 ; $B0D0 | 3a..............
        DB $C5,$C8,$C8,$08,$90,$F9,$C5,$C9,$C8,$A9,$8B,$4A,$82,$0A,$90,$ED ; $B0E0 | ...........J....
        DB $C8,$ED,$CD,$00,$8F,$0C,$1C,$0F,$18,$33,$08,$33,$0B,$30,$0B,$30 ; $B0F0 | .........3.3.0.0
        DB $08,$33,$08,$33,$0A,$31,$0A,$31,$08,$33,$08,$33,$08,$36,$05,$38 ; $B100 | .3.3.1.1.3.3.6.8
        DB $08,$36,$05,$36,$14,$00,$1B,$00,$16,$0F,$59,$72,$00,$72,$00,$70 ; $B110 | .6.6......Yr.r.p
        DB $0F,$0E,$F0,$02,$F0,$02,$F0,$0F,$5B,$83,$A6,$83,$8A,$6D,$C1,$7D ; $B120 | ........[....m.}
        DB $C5,$8D,$C9,$00,$8F,$05,$34,$8A,$12,$02,$16,$72,$09,$82,$0F,$14 ; $B130 | ......4....r....
        DB $13,$01,$16,$0F,$24,$18,$03,$B8,$0F,$00,$10,$0A,$11,$09,$12,$09 ; $B140 | ....$...........
        DB $14,$06,$16,$05,$17,$03,$19,$00,$16,$0F,$64,$F0,$0F,$7F,$81,$C6 ; $B150 | ..........d.....
        DB $32,$C3,$82,$C6,$12,$8E,$A4,$A8,$A9,$A3,$00,$88,$03,$30,$8A,$36 ; $B160 | 2............0.6
        DB $8E,$15,$00,$15,$0F,$24,$15,$00,$15,$0F,$0A,$10,$0A,$10,$0F,$17 ; $B170 | .....$..........
        DB $10,$03,$10,$00,$10,$03,$10,$04,$12,$0F,$02,$10,$0A,$10,$0F,$17 ; $B180 | ................
        DB $1C,$0F,$55,$53,$00,$55,$0F,$04,$C0,$00,$54,$06,$55,$0F,$5C,$61 ; $B190 | ..US.U....T.U.\a
        DB $C6,$71,$CD,$64,$C1,$74,$A8,$65,$C1,$96,$CE,$28,$81,$28,$83,$98 ; $B1A0 | .q.d.t.e...(.(..
        DB $CE,$89,$C1,$8A,$C1,$7A,$A8,$6D,$C6,$7D,$CD,$00,$89,$34,$8F,$02 ; $B1B0 | .....z.m.}...4..
        DB $36,$1B,$0F,$25,$1B,$0F,$32,$11,$06,$13,$09,$12,$0A,$11,$01,$12 ; $B1C0 | 6..%..2.........
        DB $06,$10,$01,$13,$09,$13,$09,$13,$08,$14,$03,$12,$00,$18,$0F,$4B ; $B1D0 | ...............K
        DB $F0,$0F,$98,$91,$C1,$92,$C1,$12,$89,$93,$C1,$A5,$A3,$19,$83,$00 ; $B1E0 | ................
        DB $8F,$08,$36,$0F,$2A,$16,$0F,$2A,$11,$09,$11,$0F,$2A,$16,$0F,$1D ; $B1F0 | ..6.*..*....*...
        DB $1C,$0F,$30,$F0,$05,$F0,$0F,$64,$F0,$05,$F0,$0F,$30,$71,$C6,$F1 ; $B200 | ..0....d....0q..
        DB $C9,$04,$91,$AA,$82,$9B,$C0,$9C,$C0,$9D,$C0,$FD,$C6,$7D,$C9,$00 ; $B210 | .............}..
        DB $88,$34,$8F,$07,$15,$01,$13,$0F,$0C,$C8,$04,$13,$00,$11,$05,$13 ; $B220 | .4..............
        DB $00,$11,$0F,$42,$D8,$03,$18,$0F,$0F,$1A,$0F,$0C,$1A,$00,$0F,$03 ; $B230 | ...B............
        DB $C0,$0F,$B9,$5E,$0F,$08,$12,$81,$94,$C6,$85,$C6,$B5,$AE,$96,$C6 ; $B240 | ...^............
        DB $57,$84,$5A,$84,$1C,$91,$00,$07,$0C,$8F,$0C,$01,$38,$0F,$1B,$25 ; $B250 | W.Z.........8..%
        DB $0F,$38,$30,$00,$23,$01,$30,$03,$30,$95,$31,$03,$30,$95,$31,$03 ; $B260 | .80.#.0.0.1.0.1.
        DB $31,$93,$32,$04,$31,$91,$33,$04,$37,$05,$35,$0F,$0D,$15,$00,$15 ; $B270 | 1.2.1.3.7.5.....
        DB $09,$D8,$0A,$E8,$05,$54,$0F,$4F,$54,$0F,$13,$C5,$09,$58,$0F,$0E ; $B280 | .....T.OT....X..
        DB $8F,$00,$03,$16,$C6,$4C,$CA,$00,$8F,$08,$36,$00,$32,$04,$32,$02 ; $B290 | .....L....6.2.2.
        DB $31,$04,$31,$04,$30,$04,$30,$0F,$10,$30,$04,$30,$04,$32,$02,$32 ; $B2A0 | 1.1.0.0..0.0.2.2
        DB $02,$3A,$0F,$32,$30,$0A,$32,$08,$32,$0A,$30,$0F,$17,$1C,$0A,$F0 ; $B2B0 | .:.20.2.2.0.....
        DB $0F,$24,$F0,$0F,$22,$F0,$0F,$80,$61,$C0,$12,$8C,$E5,$C0,$86,$C8 ; $B2C0 | .$.."...a.......
        DB $B6,$B1,$87,$C8,$88,$C8,$E9,$C0,$1C,$8C,$00,$88,$35,$8F,$07,$01 ; $B2D0 | ............5...
        DB $38,$05,$24,$08,$22,$0A,$20,$0B,$20,$0F,$16,$20,$0F,$03,$30,$0A ; $B2E0 | 8.$.". . .. ..0.
        DB $31,$20,$08,$20,$30,$05,$20,$05,$30,$20,$03,$20,$03,$20,$31,$0A ; $B2F0 | 1 . 0. .0 . . 1.
        DB $30,$0F,$03,$20,$0A,$22,$08,$24,$06,$36,$02,$1C,$0F,$0F,$F0,$0F ; $B300 | 0.. .".$.6......
        DB $24,$F0,$0F,$1B,$52,$0F,$11,$F0,$0F,$32,$F0,$0F,$0C,$E1,$C0,$71 ; $B310 | $...R....2.....q
        DB $D1,$72,$D1,$73,$D1,$67,$CD,$7B,$D1,$7C,$D1,$ED,$C0,$7D,$D1,$00 ; $B320 | .r.s.g.{.|...}..
        DB $88,$35,$8F,$07,$1B,$0B,$10,$0B,$10,$0E,$11,$01,$11,$0F,$1F,$11 ; $B330 | .5..............
        DB $01,$11,$0F,$1C,$10,$01,$11,$01,$11,$0F,$19,$10,$04,$11,$01,$11 ; $B340 | ................
        DB $0F,$0D,$1B,$00,$0F,$CF,$5B,$00,$66,$0B,$C8,$82,$A2,$22,$91,$83 ; $B350 | ......[.f...."..
        DB $A6,$84,$AA,$85,$AE,$86,$A2,$87,$A6,$88,$AA,$89,$AE,$00,$8A,$2F ; $B360 | .............../
        DB $04,$8C,$14,$00,$1B,$00,$15,$00,$14,$00,$14,$04,$11,$00,$13,$05 ; $B370 | ................
        DB $11,$00,$12,$0F,$27,$10,$0A,$11,$09,$10,$31,$09,$10,$30,$20,$09 ; $B380 | ....'.....1..0 .
        DB $10,$30,$20,$09,$10,$31,$0A,$11,$00,$10,$09,$10,$0F,$18,$1B,$0F ; $B390 | .0 ..1..........
        DB $07,$5B,$00,$61,$0F,$0A,$30,$0F,$1B,$F0,$01,$F0,$01,$F0,$0F,$0D ; $B3A0 | .[.a..0.........
        DB $10,$0F,$62,$75,$C5,$A6,$C2,$76,$C5,$77,$C5,$00,$8C,$35,$99,$91 ; $B3B0 | ..bu...v.w...5..
        DB $99,$88,$36,$0F,$58,$15,$00,$15,$35,$00,$3B,$00,$35,$25,$00,$28 ; $B3C0 | ..6.X...5.;.5%.(
        DB $06,$22,$35,$00,$3B,$00,$35,$15,$00,$15,$0F,$0F,$50,$06,$1C,$0F ; $B3D0 | ."5.;.5.....P...
        DB $74,$F0,$0F,$6F,$94,$A6,$2A,$86,$9B,$91,$EC,$C0,$ED,$C0,$00,$8C ; $B3E0 | t..o..*.........
        DB $35,$99,$91,$99,$88,$35,$12,$01,$12,$01,$12,$0F,$4B,$11,$30,$01 ; $B3F0 | 5....5......K.0.
        DB $30,$10,$30,$01,$30,$11,$32,$21,$32,$21,$35,$21,$32,$21,$32,$2F ; $B400 | 0.0.0.2!2!5!2!2/
        DB $0A,$3F,$0A,$1C,$01,$11,$00,$12,$00,$11,$0F,$0C,$13,$00,$12,$00 ; $B410 | .?..............
        DB $13,$0F,$34,$D0,$0F,$03,$E0,$0F,$3F,$D0,$0F,$03,$E0,$0F,$37,$E1 ; $B420 | ..4.....?.....7.
        DB $C1,$E2,$C1,$EC,$C1,$ED,$C1,$00,$8C,$35,$99,$91,$99,$88,$35,$12 ; $B430 | .........5....5.
        DB $00,$15,$00,$11,$03,$13,$08,$13,$08,$13,$08,$13,$08,$13,$08,$15 ; $B440 | ................
        DB $00,$11,$03,$1F,$00,$05,$35,$10,$05,$35,$06,$23,$30,$10,$06,$22 ; $B450 | ......5..5.#0.."
        DB $31,$07,$33,$10,$07,$33,$08,$13,$0F,$19,$31,$00,$33,$1C,$0F,$4E ; $B460 | 1.3..3....1.3..N
        DB $30,$40,$0F,$00,$30,$40,$0F,$00,$30,$40,$0F,$00,$30,$40,$0F,$02 ; $B470 | 0@..0@..0@..0@..
        DB $CA,$0F,$09,$C2,$0F,$25,$62,$C2,$63,$C2,$99,$C1,$2A,$88,$2A,$8A ; $B480 | .....%b.c...*.*.
        DB $2A,$8C,$2A,$8E,$2A,$90,$9D,$C1,$00,$8A,$33,$8D,$35,$8A,$15,$00 ; $B490 | *.*.*.....3.5...
        DB $15,$0F,$36,$10,$00,$10,$09,$12,$0A,$10,$04,$10,$05,$10,$0F,$3D ; $B4A0 | ..6............=
        DB $10,$0F,$03,$AC,$0C,$1C,$0F,$1E,$F0,$03,$F0,$03,$F0,$0F,$23,$10 ; $B4B0 | ..............#.
        DB $20,$09,$C6,$0F,$05,$30,$40,$0F,$28,$F0,$0F,$25,$FB,$C1,$FC,$C1 ; $B4C0 |  ....0@.(..%....
        DB $FD,$C1,$00,$8A,$36,$8D,$36,$8A,$1A,$0A,$11,$0F,$26,$11,$00,$16 ; $B4D0 | ....6.6.....&...
        DB $00,$10,$07,$12,$0F,$0F,$10,$05,$10,$04,$10,$95,$10,$00,$10,$02 ; $B4E0 | ................
        DB $10,$95,$10,$03,$12,$94,$10,$03,$12,$94,$10,$03,$10,$00,$10,$93 ; $B4F0 | ................
        DB $11,$02,$11,$00,$10,$94,$10,$02,$11,$96,$10,$02,$11,$96,$10,$02 ; $B500 | ................
        DB $19,$02,$0F,$A6,$53,$0F,$12,$30,$40,$04,$53,$0F,$0D,$C3,$CF,$95 ; $B510 | ....S..0@.S.....
        DB $84,$69,$C1,$4B,$C6,$00,$07,$0C,$8F,$08,$08,$02,$11,$00,$10,$00 ; $B520 | .i.K............
        DB $10,$00,$10,$00,$10,$00,$10,$01,$10,$0B,$10,$0B,$10,$02,$10,$0D ; $B530 | ................
        DB $10,$0F,$0D,$10,$0F,$07,$10,$02,$11,$00,$10,$00,$10,$00,$10,$04 ; $B540 | ................
        DB $11,$0A,$11,$0F,$24,$1B,$0F,$16,$1C,$0F,$26,$C0,$0F,$09,$CE,$0F ; $B550 | ....$.....&.....
        DB $11,$C6,$0F,$0F,$C8,$0F,$13,$C4,$0F,$11,$C6,$04,$C1,$C1,$61,$CC ; $B560 | ..............a.
        DB $16,$81,$18,$82,$1C,$84,$00,$8F,$08,$02,$30,$1C,$0F,$C1,$AB,$0C ; $B570 | ..........0.....
        DB $1C,$0F,$3C,$F0,$0F,$27,$F0,$0F,$27,$F0,$0F,$27,$F0,$0E,$61,$C1 ; $B580 | ..<..'..'..'..a.
        DB $E2,$C1,$FD,$C6,$FD,$CA,$FD,$CE,$00,$88,$02,$30,$8F,$07,$1C,$0F ; $B590 | ...........0....
        DB $17,$18,$09,$12,$0E,$11,$00,$11,$0F,$0D,$13,$02,$10,$0F,$14,$11 ; $B5A0 | ................
        DB $00,$11,$02,$10,$07,$10,$02,$11,$06,$10,$02,$11,$30,$03,$10,$00 ; $B5B0 | ............0...
        DB $10,$02,$11,$31,$92,$05,$11,$32,$91,$05,$11,$33,$90,$12,$01,$12 ; $B5C0 | ...1...2...3....
        DB $34,$0F,$20,$54,$0F,$0A,$D0,$0F,$03,$E0,$0F,$32,$64,$0F,$4B,$F1 ; $B5D0 | 4. T.......2d.K.
        DB $C5,$F1,$CB,$16,$85,$16,$87,$16,$89,$16,$8B,$16,$8D,$16,$8F,$16 ; $B5E0 | ................
        DB $91,$C8,$C6,$8D,$C1,$8D,$C7,$00,$8F,$07,$98,$36,$1C,$05,$B0,$0F ; $B5F0 | ...........6....
        DB $12,$31,$04,$31,$03,$31,$94,$31,$04,$31,$92,$31,$06,$34,$0F,$1B ; $B600 | .1.1.1.1.1.1.4..
        DB $10,$0A,$10,$0F,$1D,$30,$05,$95,$30,$9B,$30,$9B,$30,$95,$3C,$06 ; $B610 | .....0..0.0.0.<.
        DB $F0,$0F,$33,$F0,$0F,$24,$56,$0F,$2C,$F0,$0F,$23,$F0,$0B,$00,$8F ; $B620 | ..3..$V.,..#....
        DB $07,$98,$36,$00,$1B,$0F,$24,$19,$0F,$2A,$19,$0F,$24,$39,$02,$9F ; $B630 | ..6...$..*..$9..
        DB $17,$39,$12,$0F,$F4,$42,$C6,$B6,$83,$86,$88,$B6,$8D,$00,$8F,$0C ; $B640 | .9...B..........
        DB $11,$00,$14,$34,$05,$11,$30,$02,$30,$06,$10,$30,$02,$30,$06,$10 ; $B650 | ...4..0.0..0.0..
        DB $30,$02,$30,$07,$30,$02,$30,$11,$00,$11,$0F,$2C,$11,$00,$17,$0F ; $B660 | 0.0.0.0....,....
        DB $26,$11,$00,$13,$0F,$1D,$11,$00,$19,$0F,$25,$C6,$0F,$19,$20,$0F ; $B670 | &.........%... .
        DB $04,$10,$20,$0F,$04,$10,$0F,$63,$12,$83,$12,$88,$12,$8D,$A9,$B1 ; $B680 | .. ....c........
        DB $DA,$C1,$DB,$C1,$DC,$C1,$00,$8F,$08,$34,$11,$07,$12,$0F,$0B,$21 ; $B690 | .........4.....!
        DB $05,$21,$0F,$27,$29,$0F,$19,$18,$0F,$10,$16,$0F,$1B,$13,$03,$12 ; $B6A0 | .!.')...........
        DB $00,$10,$0F,$08,$53,$0B,$30,$0E,$52,$09,$65,$0B,$F0,$0E,$20,$01 ; $B6B0 | ....S.0.R.e... .
        DB $80,$01,$80,$0C,$40,$01,$70,$01,$70,$01,$65,$0F,$13,$F0,$0B,$10 ; $B6C0 | ....@.p.p.e.....
        DB $0F,$07,$53,$00,$59,$0F,$02,$C2,$00,$8E,$03,$72,$C9,$73,$C9,$D4 ; $B6D0 | ..S.Y......r.s..
        DB $D0,$75,$C9,$76,$C9,$78,$C9,$79,$C9,$00,$8F,$08,$35,$06,$12,$0F ; $B6E0 | .u.v.x.y....5...
        DB $14,$C2,$05,$10,$0B,$10,$A8,$02,$10,$0B,$19,$02,$10,$00,$10,$72 ; $B6F0 | ...............r
        DB $10,$05,$10,$01,$82,$06,$10,$0B,$10,$0B,$10,$00,$15,$04,$10,$0B ; $B700 | ................
        DB $10,$0B,$10,$07,$10,$0F,$17,$13,$00,$15,$F1,$7F,$00,$0F,$0C,$8B ; $B710 | ................
        DB $0F,$14,$C7,$03,$F0,$03,$65,$00,$55,$00,$10,$0F,$34,$65,$00,$55 ; $B720 | ......e.U...4e.U
        DB $00,$30,$0F,$2B,$38,$CA,$00,$88,$35,$8F,$03,$35,$0F,$24,$10,$01 ; $B730 | .0.+8...5..5.$..
        DB $10,$01,$10,$01,$10,$01,$10,$0F,$24,$11,$01,$11,$00,$11,$01,$11 ; $B740 | ........$.......
        DB $0F,$24,$12,$01,$12,$01,$12,$0F,$24,$1C,$0F,$F4,$91,$C5,$81,$CA ; $B750 | .$......$.......
        DB $E1,$CF,$E2,$CF,$84,$A2,$25,$87,$87,$A2,$27,$8C,$29,$87,$8A,$A2 ; $B760 | ......%...'.)...
        DB $EC,$CF,$9D,$C5,$8D,$CA,$ED,$CF,$00,$88,$36,$8F,$07,$08,$10,$0B ; $B770 | ..........6.....
        DB $10,$0B,$10,$0B,$10,$02,$15,$02,$10,$0B,$10,$0B,$10,$0B,$10,$0B ; $B780 | ................
        DB $10,$05,$16,$0B,$10,$0B,$10,$0B,$10,$0B,$10,$02,$15,$02,$10,$0B ; $B790 | ................
        DB $10,$0B,$10,$0B,$10,$0B,$10,$02,$19,$02,$04,$74,$0F,$86,$84,$04 ; $B7A0 | ...........t....
        DB $84,$0F,$45,$02,$8C,$02,$91,$85,$C0,$F5,$C5,$F5,$CA,$85,$CF,$08 ; $B7B0 | ..E.............
        DB $87,$00,$07,$0C,$07,$0B,$88,$12,$09,$12,$49,$1F,$1A,$05,$10,$02 ; $B7C0 | ..........I.....
        DB $12,$09,$12,$09,$12,$09,$13,$01,$16,$01,$11,$0A,$11,$0A,$11,$0A ; $B7D0 | ................
        DB $11,$09,$19,$00,$10,$01,$10,$0F,$21,$1C,$0F,$0E,$10,$20,$0F,$08 ; $B7E0 | ........!.... ..
        DB $66,$0F,$6F,$65,$0F,$37,$F2,$CF,$94,$C5,$07,$8C,$B7,$91,$B9,$8C ; $B7F0 | f.oe.7..........
        DB $2C,$C5,$00,$00,$A0,$8A,$2B,$89,$36,$03,$30,$0C,$4C,$1F,$17,$00 ; $B800 | ,.....+.6.0.L...
        DB $B0,$03,$B1,$0F,$1C,$12,$01,$17,$0F,$10,$10,$0A,$11,$05,$16,$01 ; $B810 | ................
        DB $13,$0F,$22,$60,$00,$1C,$0F,$F4,$71,$C5,$17,$91,$B9,$91,$8A,$C5 ; $B820 | .."`....q.......
        DB $1B,$8C,$8C,$C5,$BD,$87,$FD,$CA,$FD,$CF,$00,$00,$A0,$8A,$03,$30 ; $B830 | ...............0
        DB $2B,$89,$36,$01,$10,$01,$10,$06,$41,$10,$01,$10,$46,$12,$01,$1A ; $B840 | +.6.....A...F...
        DB $01,$1A,$01,$17,$0F,$24,$12,$01,$10,$00,$11,$01,$11,$04,$10,$01 ; $B850 | .....$..........
        DB $10,$0B,$11,$04,$A0,$04,$10,$0B,$10,$03,$12,$01,$12,$01,$12,$0F ; $B860 | ................
        DB $24,$18,$C2,$10,$0F,$27,$53,$09,$D9,$09,$E9,$05,$53,$01,$66,$0F ; $B870 | $....'S.....S.f.
        DB $2C,$30,$0F,$40,$83,$00,$61,$CA,$E2,$CF,$26,$91,$E8,$CA,$FC,$CA ; $B880 | ,0.@..a...&.....
        DB $00,$00,$A0,$8B,$36,$2B,$8D,$0C,$4C,$1F,$17,$0F,$24,$10,$01,$10 ; $B890 | ....6+..L...$...
        DB $01,$11,$03,$10,$06,$11,$02,$10,$06,$10,$02,$11,$02,$10,$01,$11 ; $B8A0 | ................
        DB $02,$11,$09,$13,$07,$14,$01,$10,$03,$11,$0A,$10,$0F,$0E,$17,$C2 ; $B8B0 | ................
        DB $11,$0F,$16,$D0,$0F,$03,$E0,$0F,$0A,$DD,$05,$ED,$0F,$7D,$71,$CA ; $B8C0 | .............}q.
        DB $61,$D1,$87,$CA,$88,$87,$88,$91,$9B,$C5,$EC,$CF,$00,$00,$A0,$8B ; $B8D0 | a...............
        DB $36,$8D,$35,$0C,$4C,$1F,$17,$0F,$12,$13,$08,$12,$01,$10,$F2,$10 ; $B8E0 | 6.5.L...........
        DB $02,$10,$07,$10,$02,$10,$07,$10,$02,$10,$07,$10,$02,$13,$03,$11 ; $B8F0 | ................
        DB $02,$10,$B2,$04,$10,$02,$10,$03,$10,$02,$10,$02,$10,$07,$10,$02 ; $B900 | ................
        DB $10,$07,$10,$0B,$10,$07,$17,$01,$12,$0F,$5E,$78,$0F,$0D,$88,$0F ; $B910 | ..........^x....
        DB $24,$66,$0F,$20,$91,$CA,$74,$CE,$67,$CC,$6A,$85,$EA,$C9,$FD,$CE ; $B920 | $f. ..t.g.j.....
        DB $00,$00,$A0,$8F,$06,$35,$0C,$4C,$1F,$17,$0F,$17,$13,$F3,$12,$0F ; $B930 | .....5.L........
        DB $0C,$12,$C5,$00,$12,$0F,$0A,$11,$01,$14,$01,$11,$0F,$24,$1C,$0F ; $B940 | .............$..
        DB $F4,$F1,$C5,$F1,$C9,$F1,$CC,$32,$91,$A3,$A6,$A4,$B1,$96,$CC,$98 ; $B950 | .......2........
        DB $CC,$09,$86,$7D,$CC,$7D,$CF,$00,$00,$A0,$8B,$36,$8F,$02,$02,$10 ; $B960 | ...}.}.....6....
        DB $04,$10,$02,$42,$10,$04,$10,$42,$13,$04,$17,$04,$17,$04,$13,$0F ; $B970 | ...B...B........
        DB $24,$10,$0A,$10,$0F,$0A,$10,$0A,$10,$0E,$11,$01,$10,$01,$11,$02 ; $B980 | $...............
        DB $12,$04,$12,$0F,$0F,$A1,$00,$A1,$03,$13,$01,$10,$01,$13,$0F,$28 ; $B990 | ...............(
        DB $66,$05,$55,$65,$0F,$5F,$55,$65,$0F,$06,$66,$0F,$19,$E2,$C5,$67 ; $B9A0 | f.Ue._Ue..f....g
        DB $CA,$78,$A1,$EC,$C5,$00,$00,$A0,$8B,$36,$8F,$02,$06,$12,$02,$46 ; $B9B0 | .x.......6.....F
        DB $12,$02,$18,$03,$18,$03,$17,$02,$11,$0F,$24,$10,$00,$16,$01,$11 ; $B9C0 | ..........$.....
        DB $0F,$0C,$19,$0F,$0D,$12,$0C,$11,$0A,$13,$08,$15,$01,$12,$01,$17 ; $B9D0 | ................
        DB $0F,$28,$65,$0F,$15,$10,$20,$0F,$32,$30,$0F,$01,$30,$40,$0F,$00 ; $B9E0 | .(e... .20..0@..
        DB $30,$40,$0F,$2A,$B1,$B1,$B4,$AA,$34,$8D,$15,$87,$E6,$CA,$67,$8E ; $B9F0 | 0@.*....4.....g.
        DB $B8,$8A,$69,$8F,$6B,$90,$7D,$C0,$8D,$C5,$00,$2B,$88,$2B,$8E,$33 ; $BA00 | ..i.k.}....+.+.3
        DB $05,$11,$0A,$11,$0A,$11,$44,$05,$16,$03,$18,$0D,$A1,$0F,$08,$14 ; $BA10 | ......D.........
        DB $0F,$4E,$13,$07,$11,$09,$12,$08,$13,$02,$19,$00,$11,$0F,$08,$F0 ; $BA20 | .N..............
        DB $0F,$32,$F0,$07,$10,$20,$0F,$32,$F0,$0F,$4B,$E1,$C0,$72,$C0,$73 ; $BA30 | .2... .2..K..r.s
        DB $C0,$74,$C0,$75,$C0,$67,$90,$69,$8E,$FC,$C5,$FD,$C5,$00,$01,$A0 ; $BA40 | .t.u.g.i........
        DB $8F,$01,$35,$35,$05,$10,$01,$10,$08,$10,$01,$10,$02,$45,$10,$01 ; $BA50 | ..55.........E..
        DB $10,$02,$16,$01,$10,$02,$16,$01,$10,$0B,$10,$0B,$10,$0B,$10,$0B ; $BA60 | ................
        DB $10,$02,$16,$01,$10,$0B,$10,$0B,$10,$0B,$10,$0B,$10,$04,$14,$01 ; $BA70 | ................
        DB $10,$02,$19,$0F,$1A,$1C,$0F,$86,$D4,$0E,$E4,$0F,$05,$66,$0F,$2D ; $BA80 | .............f.-
        DB $E2,$C5,$92,$87,$E2,$D0,$96,$8C,$FB,$CE,$00,$07,$0B,$88,$97,$0C ; $BA90 | ................
        DB $00,$2B,$0F,$0B,$21,$02,$21,$00,$21,$01,$21,$02,$21,$05,$20,$02 ; $BAA0 | .+..!.!.!.!.!. .
        DB $21,$09,$21,$09,$21,$02,$20,$03,$20,$00,$21,$02,$21,$09,$21,$09 ; $BAB0 | !.!.!. . .!.!.!.
        DB $21,$09,$21,$03,$21,$04,$21,$0B,$23,$0A,$21,$0F,$01,$20,$00,$20 ; $BAC0 | !.!.!.!.#.!.. . 
        DB $0D,$24,$07,$24,$05,$2B,$01,$C1,$0F,$09,$56,$0F,$74,$CA,$04,$56 ; $BAD0 | .$.$.+....V.t..V
        DB $00,$56,$0F,$2D,$F1,$CA,$F4,$C8,$F5,$C7,$85,$8F,$66,$82,$F6,$C6 ; $BAE0 | .V.-........f...
        DB $E6,$CB,$00,$97,$08,$36,$22,$0F,$24,$29,$0F,$27,$29,$0F,$27,$29 ; $BAF0 | .....6".$).').')
        DB $0F,$24,$20,$01,$29,$00,$7D,$0F,$08,$D0,$0F,$03,$E0,$0F,$B8,$15 ; $BB00 | .$ .).}.........
        DB $82,$85,$A7,$95,$AC,$B5,$B1,$F8,$C5,$F8,$CA,$F8,$CF,$00,$90,$36 ; $BB10 | ...............6
        DB $90,$36,$90,$36,$90,$36,$0F,$24,$21,$09,$20,$00,$21,$07,$21,$01 ; $BB20 | .6.6.6.$!. .!.!.
        DB $21,$06,$21,$02,$21,$05,$21,$02,$22,$06,$25,$09,$22,$05,$20,$02 ; $BB30 | !.!.!.!.".%.". .
        DB $21,$05,$21,$01,$21,$09,$21,$09,$21,$09,$20,$0A,$21,$04,$20,$0A ; $BB40 | !.!.!.!.!. .!. .
        DB $21,$A6,$02,$22,$06,$2C,$0F,$58,$F0,$08,$F0,$0F,$13,$F0,$0F,$28 ; $BB50 | !..".,.X.......(
        DB $F0,$0F,$24,$D3,$C7,$D3,$CA,$FD,$C8,$FD,$CC,$00,$90,$36,$97,$07 ; $BB60 | ..$..........6..
        DB $0F,$24,$20,$01,$20,$01,$20,$01,$20,$01,$20,$0F,$18,$20,$08,$20 ; $BB70 | .$ . . . . .. . 
        DB $05,$22,$0F,$21,$22,$0F,$02,$20,$0A,$20,$02,$21,$02,$21,$0F,$06 ; $BB80 | .".!".. . .!.!..
        DB $20,$05,$2C,$0F,$31,$5A,$0F,$21,$53,$00,$52,$0F,$24,$5A,$0F,$30 ; $BB90 |  .,.1Z.!S.R.$Z.0
        DB $F1,$CA,$93,$CE,$94,$B1,$F6,$C7,$86,$CA,$F8,$C7,$88,$CA,$9A,$91 ; $BBA0 | ................
        DB $9B,$CE,$FD,$CA,$00,$90,$36,$97,$03,$36,$01,$10,$00,$13,$01,$10 ; $BBB0 | ......6..6......
        DB $03,$10,$06,$10,$03,$10,$06,$10,$05,$15,$02,$20,$01,$16,$01,$20 ; $BBC0 | ........... ... 
        DB $0B,$20,$0F,$08,$20,$00,$26,$02,$21,$00,$22,$05,$21,$01,$21,$06 ; $BBD0 | . .. .&.!.".!.!.
        DB $21,$01,$20,$06,$23,$0F,$02,$21,$09,$23,$02,$21,$02,$21,$01,$21 ; $BBE0 | !. .#..!.#.!.!.!
        DB $02,$21,$01,$20,$03,$21,$04,$21,$0A,$21,$09,$26,$D2,$22,$0F,$1B ; $BBF0 | .!. .!.!.!.&."..
        DB $10,$20,$0E,$C3,$0F,$7B,$30,$40,$0F,$1F,$C2,$04,$14,$86,$F5,$CF ; $BC00 | . ...{0@........
        DB $B5,$B1,$F6,$CF,$ED,$C6,$00,$90,$36,$97,$03,$36,$0F,$24,$20,$01 ; $BC10 | ........6..6.$ .
        DB $21,$02,$21,$01,$20,$0F,$0B,$21,$01,$22,$01,$21,$0F,$0B,$20,$01 ; $BC20 | !.!. ..!.".!.. .
        DB $21,$02,$21,$01,$20,$0F,$0B,$21,$01,$22,$01,$21,$0F,$0E,$21,$02 ; $BC30 | !.!. ..!.".!..!.
        DB $21,$0F,$0D,$2C,$0F,$F4,$F1,$C7,$84,$A2,$85,$C8,$95,$CE,$89,$A2 ; $BC40 | !..,............
        DB $8A,$C8,$9A,$CE,$FD,$C7,$00,$90,$36,$97,$03,$36,$0F,$27,$29,$0F ; $BC50 | ........6..6.').
        DB $24,$29,$0F,$2A,$29,$0F,$24,$2C,$0F,$F4,$F1,$CA,$36,$82,$B6,$A7 ; $BC60 | $).*).$,....6...
        DB $B6,$AC,$36,$91,$FD,$C0,$FD,$C5,$00,$97,$08,$35,$0F,$0B,$21,$0A ; $BC70 | ..6........5..!.
        DB $22,$0F,$01,$20,$02,$20,$06,$21,$09,$22,$0F,$03,$21,$0B,$21,$03 ; $BC80 | ".. . .!."..!.!.
        DB $22,$04,$21,$02,$22,$0A,$21,$0A,$20,$02,$20,$05,$20,$04,$21,$03 ; $BC90 | ".!.".!. . . .!.
        DB $21,$04,$22,$01,$21,$0F,$01,$20,$0A,$21,$09,$2F,$00,$0F,$F4,$F2 ; $BCA0 | !.".!.. .!./....
        DB $C4,$92,$CB,$83,$80,$64,$86,$88,$CC,$89,$C2,$8B,$C7,$00,$90,$36 ; $BCB0 | .....d.........6
        DB $97,$07,$0F,$24,$20,$01,$25,$02,$20,$0F,$21,$A2,$0C,$20,$03,$22 ; $BCC0 | ...$ .%. .!.. ."
        DB $01,$22,$0F,$17,$20,$01,$25,$00,$20,$00,$20,$0F,$24,$24,$02,$24 ; $BCD0 | .".. .%. . .$$.$
        DB $0F,$31,$58,$0F,$79,$52,$0F,$1E,$81,$CB,$E1,$CF,$97,$82,$07,$88 ; $BCE0 | .1X.yR..........
        DB $97,$8C,$00,$90,$36,$95,$35,$94,$29,$01,$20,$0F,$17,$20,$0E,$26 ; $BCF0 | ....6.5.). .. .&
        DB $0F,$27,$22,$01,$24,$0F,$1A,$20,$00,$20,$0F,$1D,$A0,$01,$A0,$0C ; $BD00 | .'".$.. . ......
        DB $29,$01,$20,$0F,$23,$52,$0F,$65,$57,$0F,$18,$D0,$0F,$03,$E0,$0F ; $BD10 | ). .#R.eW.......
        DB $04,$F1,$C5,$11,$8C,$B5,$B1,$E6,$CB,$E7,$CB,$B8,$83,$B8,$88,$E8 ; $BD20 | ................
        DB $CB,$00,$97,$0C,$97,$0C,$00,$20,$00,$29,$0F,$1A,$27,$F1,$0F,$25 ; $BD30 | ....... .)..'..%
        DB $20,$00,$27,$A1,$06,$23,$09,$26,$00,$21,$03,$25,$00,$23,$02,$22 ; $BD40 |  .'..#.&.!.%.#."
        DB $03,$23,$02,$21,$03,$24,$02,$23,$00,$25,$0A,$22,$09,$23,$00,$2C ; $BD50 | .#.!.$.#.%.".#.,
        DB $0F,$05,$57,$0F,$D7,$71,$CE,$71,$D1,$72,$CE,$72,$D1,$D3,$C0,$73 ; $BD60 | ..W..q.q.r.r...s
        DB $D1,$84,$A2,$74,$D1,$15,$87,$75,$D1,$76,$D1,$77,$D1,$78,$D1,$00 ; $BD70 | ...t...u.v.w.x..
        DB $97,$08,$35,$02,$29,$0F,$1A,$23,$01,$20,$01,$20,$0F,$1A,$23,$01 ; $BD80 | ..5.)..#. . ..#.
        DB $20,$01,$20,$0F,$1C,$21,$01,$20,$01,$21,$01,$20,$08,$23,$0F,$0F ; $BD90 |  . ..!. .!. .#..
        DB $20,$01,$20,$0F,$0A,$23,$00,$27,$7C,$0F,$01,$D3,$0F,$00,$E3,$0F ; $BDA0 |  . ..#.'|.......
        DB $19,$C4,$08,$52,$0F,$84,$B6,$A2,$56,$86,$87,$AA,$8A,$A6,$FA,$C9 ; $BDB0 | ...R....V.......
        DB $FA,$CD,$9D,$C5,$9D,$C9,$9D,$CD,$00,$90,$36,$97,$07,$04,$16,$05 ; $BDC0 | ..........6.....
        DB $10,$08,$11,$00,$10,$0B,$10,$06,$20,$07,$11,$00,$20,$0F,$0B,$14 ; $BDD0 | ........ ... ...
        DB $0F,$0D,$12,$03,$14,$0B,$10,$0B,$10,$0C,$11,$04,$11,$0F,$0A,$16 ; $BDE0 | ................
        DB $0F,$0C,$2C,$06,$CB,$08,$54,$10,$20,$0F,$0C,$53,$03,$64,$00,$10 ; $BDF0 | ..,...T. ..S.d..
        DB $20,$0F,$0B,$64,$0F,$12,$58,$02,$64,$0B,$C4,$07,$64,$00,$53,$0F ; $BE00 |  ..d..X.d...d.S.
        DB $19,$54,$30,$40,$0F,$07,$85,$CB,$97,$CB,$7B,$CA,$00,$90,$36,$97 ; $BE10 | .T0@......{...6.
        DB $07,$0F,$24,$24,$02,$29,$02,$24,$0F,$17,$21,$01,$24,$0F,$0E,$9F ; $BE20 | ..$$.).$..!.$...
        DB $17,$20,$9B,$21,$9A,$22,$99,$23,$98,$2C,$0F,$46,$61,$0F,$3D,$61 ; $BE30 | . .!.".#.,.Fa.=a
        DB $0F,$4B,$41,$C7,$A7,$C4,$00,$90,$36,$97,$03,$36,$0F,$24,$20,$02 ; $BE40 | .KA.....6..6.$ .
        DB $2A,$0A,$22,$0B,$20,$0B,$21,$0B,$20,$02,$25,$02,$21,$07,$20,$02 ; $BE50 | *.". .!. .%.!. .
        DB $20,$07,$93,$21,$06,$94,$20,$06,$94,$28,$9F,$23,$2C,$0F,$F4,$F1 ; $BE60 |  ..!.. ..(.#,...
        DB $C7,$99,$82,$99,$87,$6D,$C0,$6D,$C5,$00,$97,$03,$36,$90,$36,$0F ; $BE70 | .....m.m....6.6.
        DB $0E,$20,$03,$20,$05,$20,$03,$20,$05,$20,$03,$20,$03,$20,$00,$20 ; $BE80 | . . . . . . . . 
        DB $03,$20,$03,$22,$03,$20,$03,$22,$03,$20,$03,$21,$04,$20,$03,$21 ; $BE90 | . .". .". .!. .!
        DB $04,$20,$03,$21,$04,$20,$03,$21,$09,$21,$09,$21,$02,$21,$91,$02 ; $BEA0 | . .!. .!.!.!.!..
        DB $22,$01,$21,$92,$28,$9F,$00,$20,$9F,$17,$2C,$0F,$F4,$F1,$C0,$85 ; $BEB0 | ".!.(.. ..,.....
        DB $80,$F7,$C6,$47,$CC,$8A,$80,$AD,$C7,$00,$90,$36,$97,$03,$36,$0F ; $BEC0 | ...G.......6..6.
        DB $24,$20,$00,$20,$00,$21,$00,$21,$00,$20,$00,$20,$0F,$17,$20,$00 ; $BED0 | $ . .!.!. . .. .
        DB $20,$00,$21,$00,$21,$00,$20,$00,$20,$0F,$17,$25,$90,$25,$9F,$29 ; $BEE0 |  .!.!. . ..%.%.)
        DB $22,$98,$24,$93,$2C,$0F,$18,$53,$0F,$2D,$52,$00,$52,$0F,$11,$52 ; $BEF0 | ".$.,..S.-R.R..R
        DB $00,$52,$0F,$20,$53,$0F,$28,$91,$C6,$B3,$AA,$85,$C6,$89,$C6,$BB ; $BF00 | .R. S.(.........
        DB $8A,$9D,$C6,$00,$90,$36,$97,$03,$36,$02,$B0,$03,$B2,$21,$0D,$A0 ; $BF10 | .....6..6....!..
        DB $02,$A1,$0F,$03,$2A,$0B,$20,$0B,$20,$01,$23,$02,$23,$0B,$20,$0B ; $BF20 | ....*. . .#.#. .
        DB $20,$01,$23,$03,$22,$0B,$20,$01,$95,$20,$02,$20,$01,$95,$20,$00 ; $BF30 |  .#.". .. . .. .
        DB $22,$01,$94,$21,$02,$20,$01,$94,$21,$05,$93,$22,$05,$92,$23,$05 ; $BF40 | "..!. ..!.."..#.
        DB $91,$28,$01,$2A,$00,$20,$0F,$C7,$61,$0F,$01,$C4,$00,$8E,$03,$71 ; $BF50 | .(.*. ..a......q
        DB $C5,$71,$C8,$72,$C5,$72,$C8,$73,$C5,$73,$C8,$78,$C5,$79,$C5,$79 ; $BF60 | .q.r.r.s.s.x.y.y
        DB $CB,$7A,$C5,$AA,$C8,$7A,$CB,$00,$97,$08,$36,$0F,$74,$20,$0B,$21 ; $BF70 | .z...z....6.t .!
        DB $0A,$22,$0F,$12,$2C,$0F,$17,$2C,$7E,$0F,$D1,$8C,$06,$73,$A2,$73 ; $BF80 | ."..,..,~....s.s
        DB $A6,$D3,$C8,$7B,$A2,$7B,$A6,$00,$97,$05,$01,$30,$36,$29,$01,$26 ; $BF90 | ...{.{.....06).&
        DB $01,$B1,$01,$B0,$0F,$18,$26,$05,$24,$07,$22,$09,$20,$0B,$20,$05 ; $BFA0 | ......&.$.". . .
        DB $A1,$01,$A0,$0F,$04,$25,$04,$27,$02,$25,$04,$22,$03,$20,$03,$21 ; $BFB0 | .....%.'.%.". .!
        DB $05,$20,$0F,$04,$A0,$01,$A0,$0F,$03,$2C,$0F,$06,$65,$0F,$15,$65 ; $BFC0 | . .......,..e..e
        DB $0F,$15,$65,$0F,$37,$61,$0F,$0A,$D5,$0D,$E5,$0F,$0D,$C1,$C2,$61 ; $BFD0 | ..e.7a.........a
        DB $C4,$61,$C6,$73,$C2,$75,$C2,$1C,$CE,$00,$97,$0C,$00,$39,$00,$39 ; $BFE0 | .a.s.u.......9.9
        DB $28,$43,$29,$20,$31,$39,$38,$36,$20,$4B,$2E,$49,$2F,$49,$2E,$59 ; $BFF0 | (C) 1986 K.I/I.Y
