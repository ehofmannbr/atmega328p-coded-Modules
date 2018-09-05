;
; tm1637test.asm
;
; Created: 28/06/2018 12:24:53
; Author : Home
;
.include "m328pdef.inc"

#define LETRAD 0x5E
#define LETRAO 0x5C
#define LETRAN 0x54
#define LETRAE 0x79
;Dois pontos eh ligado quando o bit 7 da centena esta ligado
#define NUM0 0b00111111
#define NUM1 0b00000110
#define NUM2 0b01011011
#define NUM3 0b01001111
#define NUM4 0b01100110
#define NUM5 0b01101101
#define NUM6 0b01111101
#define NUM7 0b00000111
#define NUM8 0b01111111
#define NUM9 0b01101111
#define NUMA 0b01110111
#define NUMB 0b01111100
#define NUMC 0b00111001
#define NUMD 0b01011110
#define NUME 0b01111001
#define NUMF 0b01110001

.org 0x00
jmp start

; Map TM1637 PIN1 CLK = ATMEGA328 PIN 9 PORTB PIN 6
;            PIN2 DATA = ATMEGA328 PIN 10 PORTB PIN 7 
;            LED = ATMEGA328 PIN 19 PORTB PIN 5

#define p_DIO 7
#define p_CLK 6
#define p_LED 5

start:

sbi DDRB, p_DIO
sbi DDRB, p_CLK ;PORTB 7 e 6 e 5 saida
sbi DDRB, p_LED
sbi PORTB, p_DIO
sbi PORTB, p_CLK; DATA e CLK em 1
cbi PORTB, p_LED; LED Apagado
ldi r16, NUM0
sts dp_m, r16
ldi r16, NUM1
sts dp_c, r16
ldi r16, NUM2
sts dp_d, r16
ldi r16, NUM3
sts dp_u, r16
ldi r16, 8
sts dp_bright, r16
sbi PORTB, p_LED; LED Aceso
rcall write_display_tm1637
rcall delay3
cbi PORTB, p_LED; LED apagado

lupi:	
rcall shifta
ldi r16, NUM4
ori r16, 0x80
sts dp_u, r16
ldi r16, 9
sts dp_bright, r16
sbi PORTB, p_LED; LED Aceso
rcall write_display_tm1637
rcall delay3
cbi PORTB, p_LED; LED apagado
rcall shifta
ldi r16, 10
sts dp_bright, r16
ldi r16, NUM5
sts dp_u, r16
sbi PORTB, p_LED; LED Aceso
rcall write_display_tm1637
rcall delay3
cbi PORTB, p_LED; LED apagado
rcall shifta
ldi r16, 11
sts dp_bright, r16
ldi r16, NUM6
sts dp_u, r16
sbi PORTB, p_LED; LED Aceso
rcall write_display_tm1637
rcall delay3
cbi PORTB, p_LED; LED apagado
rcall shifta
ldi r16, 12
sts dp_bright, r16
ldi r16, NUM7
sts dp_u, r16
sbi PORTB, p_LED; LED Aceso
rcall write_display_tm1637
rcall delay3
cbi PORTB, p_LED; LED apagado
rcall shifta
ldi r16, 13
sts dp_bright, r16
ldi r16, NUM8
ori r16, 0x80
sts dp_u, r16
sbi PORTB, p_LED; LED Aceso
rcall write_display_tm1637
rcall delay3
cbi PORTB, p_LED; LED apagado
rcall shifta
ldi r16, 14
sts dp_bright, r16
ldi r16, NUM9
sts dp_u, r16
sbi PORTB, p_LED; LED Aceso
rcall write_display_tm1637
rcall delay3
cbi PORTB, p_LED; LED apagado
rcall shifta
ldi r16, 15
sts dp_bright, r16
ldi r16, NUMA
sts dp_u, r16
sbi PORTB, p_LED; LED Aceso
rcall write_display_tm1637
rcall delay3
cbi PORTB, p_LED; LED apagado
rcall shifta
ldi r16, 14
sts dp_bright, r16
ldi r16, NUMB
sts dp_u, r16
sbi PORTB, p_LED; LED Aceso
rcall write_display_tm1637
rcall delay3
cbi PORTB, p_LED; LED apagado
rcall shifta
ldi r16, 13
sts dp_bright, r16
ldi r16, NUMC
ori r16, 0x80
sts dp_u, r16
sbi PORTB, p_LED; LED Aceso
rcall write_display_tm1637
rcall delay3
cbi PORTB, p_LED; LED apagado
rcall shifta
ldi r16, 12
sts dp_bright, r16
ldi r16, NUMD
sts dp_u, r16
sbi PORTB, p_LED; LED Aceso
rcall write_display_tm1637
rcall delay3
cbi PORTB, p_LED; LED apagado
rcall shifta
ldi r16, 11
sts dp_bright, r16
ldi r16, NUME
sts dp_u, r16
sbi PORTB, p_LED; LED Aceso
rcall write_display_tm1637
rcall delay3
cbi PORTB, p_LED; LED apagado
rcall shifta
ldi r16, 10
sts dp_bright, r16
ldi r16, NUMF
sts dp_u, r16
sbi PORTB, p_LED; LED Aceso
rcall write_display_tm1637
rcall delay3
cbi PORTB, p_LED; LED apagado
rcall shifta
ldi r16, 9
sts dp_bright, r16
ldi r16, NUM0
sts dp_u, r16
sbi PORTB, p_LED; LED Aceso
rcall write_display_tm1637
rcall delay3
cbi PORTB, p_LED; LED apagado
rcall shifta
ldi r16, 8
sts dp_bright, r16
ldi r16, NUM1
sts dp_u, r16
sbi PORTB, p_LED; LED Aceso
rcall write_display_tm1637
rcall delay3
cbi PORTB, p_LED; LED apagado
rcall shifta
ldi r16, 8
sts dp_bright, r16
ldi r16, NUM2
sts dp_u, r16
sbi PORTB, p_LED; LED Aceso
rcall write_display_tm1637
rcall delay3
cbi PORTB, p_LED; LED apagado
rcall shifta
ldi r16, 8
sts dp_bright, r16
ldi r16, NUM3
sts dp_u, r16
sbi PORTB, p_LED; LED Aceso
rcall write_display_tm1637
rcall delay3
cbi PORTB, p_LED; LED apagado
rjmp lupi

shifta:
push r16
lds r16, dp_c
sts dp_m, r16
lds r16, dp_d
sts dp_c, r16
lds r16, dp_u
sts dp_d, r16
pop r16
ret

Delay:
;200uS Carregar com 28
push r15
in r15, SREG
push r16
ldi r16, 28
Delay_1:
dec r16
brne Delay_1
pop r16
out SREG, r15
pop r15
ret

Delay3:
;Delay de 3 niveis para 0.502s
push r16
in r16, SREG
push r17
push r18
push r19
ldi r17, 50
Delay3_1:
ldi r18, 118
Delay3_2:
ldi r19, 28
Delay3_3:
dec r19
brne Delay3_3
dec r18
brne Delay3_2
dec r17
brne Delay3_1
pop r19
pop r18
pop r17
out SREG, r16
pop r16
ret

write_display_tm1637:
;Supoe conteudo a ser escrito em dp_m, dp_c, dp_d, dp_u e dp_comma
;Comeca e termina com CLK e DIO em 1 
push r15
in r15, SREG
push r16
cbi PORTB, p_DIO;;Abaixa DIO indicando START
rcall Delay
rcall Delay
;Abaixa CLK
cbi PORTB, p_CLK
ldi r16, 0x40
sts dp_shift, r16;Data Command Setting Write Data Automatic Address Adding Normal Mode
rcall write_command_tm1637
rcall write_ack
;Novo protocolo de envio de comando. Sobe Clock
sbi PORTB, p_CLK
rcall Delay
;Sobe DIO para forcar start
sbi PORTB, p_DIO
rcall Delay
;Abaixa DIO indicando fim de start
cbi PORTB, p_DIO
rcall Delay
;Abaixa CLK
cbi PORTB, p_CLK
rcall Delay
ldi r16, 0xc0;Initial Address 0
sts dp_shift, r16;
rcall write_command_tm1637
rcall write_ack
; Milhar
lds r16, dp_m
sts dp_shift, r16
rcall write_command_tm1637
rcall write_ack
; Centena
lds r16, dp_c
sts dp_shift, r16
rcall write_command_tm1637
rcall write_ack
; Dezena
lds r16, dp_d
sts dp_shift, r16
rcall write_command_tm1637
rcall write_ack
; Unidade
lds r16, dp_u
sts dp_shift, r16
rcall write_command_tm1637
rcall write_ack
;Novo protocolo de envio de comando. Sobe Clock
sbi PORTB, p_CLK
rcall Delay
;Sobe DIO para forcar start
sbi PORTB, p_DIO
rcall Delay
;Abaixa DIO indicando fim de start
cbi PORTB, p_DIO
rcall Delay
;Abaixa CLK
cbi PORTB, p_CLK
rcall Delay
lds r16, dp_bright;Comando Display Control Max Brightness
ori r16, 0x80
sts dp_shift, r16
rcall write_command_tm1637
rcall write_ack
;Levanta Clock
sbi PORTB, p_CLK
rcall Delay
;Levanta DIO forcando start
sbi PORTB, p_DIO
rcall Delay
;fim de protocolo
pop r16
out SREG, r15
pop r15
ret

write_ack:
push r15
in r15, SREG
;DIO em 0 e CLK em 0, deve estar no ciclo de ACK
rcall Delay
rcall Delay
;Sobe clock
sbi PORTB, p_CLK
rcall Delay
;Retorna com Clock zerado
cbi PORTB, p_CLK
rcall Delay
out SREG, r15
pop r15
ret

write_command_tm1637:
;Comeca com CLK em 0 para permitir mudanca de DIO
;Termina com CLK em 0 para permitir ciclo de ACK
;Supoe byte a ser shiftado em dp_shift
push r16
in r16, SREG
push r17
ldi r17, 8
push r18
lds r18, dp_shift
write_command_tm1637_1:
ror r18
brbs 0, write_command_tm1637_2
;bit eh 0 replica em DIO
cbi PORTB, p_DIO
rjmp write_command_tm1637_3
write_command_tm1637_2:
;bit eh 1 replica em DIO
sbi PORTB, p_DIO
write_command_tm1637_3:
;da tempo de setup
rcall Delay
;ativa transicao positiva do CLOCK
sbi PORTB, p_CLK
rcall Delay
;Abaixa CLK
cbi PORTB, p_CLK
dec r17
brne write_command_tm1637_1
;Poe 0 em DIO para nao atrapalhar ACK
cbi PORTB, p_DIO
pop r18
pop r17
out SREG, r16
pop r16
ret

.dseg
dp_m: .byte 1
dp_c: .byte 1
dp_d: .byte 1
dp_u: .byte 1
dp_shift: .byte 1
dp_bright: .byte 1

.eseg

hex2seg: .DB NUM0, NUM1, NUM2, NUM3, NUM4, NUM5, NUM6, NUM7, NUM8, NUM9, NUMA, NUMB, NUMC, NUMD, NUME, NUMF, NUMD, LETRAO, LETRAN, NUME
