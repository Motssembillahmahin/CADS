
_servorotate0:

;MyProject.c,1 :: 		void servorotate0(){
;MyProject.c,3 :: 		for(i=0;i<50;i++){
	CLRF       R1+0
	CLRF       R1+1
L_servorotate00:
	MOVLW      0
	SUBWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__servorotate022
	MOVLW      50
	SUBWF      R1+0, 0
L__servorotate022:
	BTFSC      STATUS+0, 0
	GOTO       L_servorotate01
;MyProject.c,4 :: 		PORTB.f0=1;
	BSF        PORTB+0, 0
;MyProject.c,5 :: 		delay_us(800);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      18
	MOVWF      R13+0
L_servorotate03:
	DECFSZ     R13+0, 1
	GOTO       L_servorotate03
	DECFSZ     R12+0, 1
	GOTO       L_servorotate03
	NOP
;MyProject.c,6 :: 		PORTB.f0=0;
	BCF        PORTB+0, 0
;MyProject.c,7 :: 		delay_us(19200);
	MOVLW      50
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_servorotate04:
	DECFSZ     R13+0, 1
	GOTO       L_servorotate04
	DECFSZ     R12+0, 1
	GOTO       L_servorotate04
	NOP
	NOP
;MyProject.c,3 :: 		for(i=0;i<50;i++){
	INCF       R1+0, 1
	BTFSC      STATUS+0, 2
	INCF       R1+1, 1
;MyProject.c,8 :: 		}
	GOTO       L_servorotate00
L_servorotate01:
;MyProject.c,9 :: 		}
L_end_servorotate0:
	RETURN
; end of _servorotate0

_servorotate90:

;MyProject.c,10 :: 		void servorotate90(){
;MyProject.c,12 :: 		for(i=0;i<50;i++){
	CLRF       R1+0
	CLRF       R1+1
L_servorotate905:
	MOVLW      0
	SUBWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__servorotate9024
	MOVLW      50
	SUBWF      R1+0, 0
L__servorotate9024:
	BTFSC      STATUS+0, 0
	GOTO       L_servorotate906
;MyProject.c,13 :: 		PORTB.f0=1;
	BSF        PORTB+0, 0
;MyProject.c,14 :: 		delay_us(1500);
	MOVLW      4
	MOVWF      R12+0
	MOVLW      228
	MOVWF      R13+0
L_servorotate908:
	DECFSZ     R13+0, 1
	GOTO       L_servorotate908
	DECFSZ     R12+0, 1
	GOTO       L_servorotate908
	NOP
;MyProject.c,15 :: 		PORTB.f0=0;
	BCF        PORTB+0, 0
;MyProject.c,16 :: 		delay_us(8500);
	MOVLW      23
	MOVWF      R12+0
	MOVLW      18
	MOVWF      R13+0
L_servorotate909:
	DECFSZ     R13+0, 1
	GOTO       L_servorotate909
	DECFSZ     R12+0, 1
	GOTO       L_servorotate909
	NOP
;MyProject.c,12 :: 		for(i=0;i<50;i++){
	INCF       R1+0, 1
	BTFSC      STATUS+0, 2
	INCF       R1+1, 1
;MyProject.c,17 :: 		}
	GOTO       L_servorotate905
L_servorotate906:
;MyProject.c,18 :: 		}
L_end_servorotate90:
	RETURN
; end of _servorotate90

_servorotate180:

;MyProject.c,19 :: 		void servorotate180(){
;MyProject.c,21 :: 		for(i=0;i<50;i++){
	CLRF       R1+0
	CLRF       R1+1
L_servorotate18010:
	MOVLW      0
	SUBWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__servorotate18026
	MOVLW      50
	SUBWF      R1+0, 0
L__servorotate18026:
	BTFSC      STATUS+0, 0
	GOTO       L_servorotate18011
;MyProject.c,22 :: 		PORTB.f0=1;
	BSF        PORTB+0, 0
;MyProject.c,23 :: 		delay_us(2200);
	MOVLW      6
	MOVWF      R12+0
	MOVLW      181
	MOVWF      R13+0
L_servorotate18013:
	DECFSZ     R13+0, 1
	GOTO       L_servorotate18013
	DECFSZ     R12+0, 1
	GOTO       L_servorotate18013
	NOP
	NOP
;MyProject.c,24 :: 		PORTB.f0=0;
	BCF        PORTB+0, 0
;MyProject.c,25 :: 		delay_us(17800);
	MOVLW      47
	MOVWF      R12+0
	MOVLW      58
	MOVWF      R13+0
L_servorotate18014:
	DECFSZ     R13+0, 1
	GOTO       L_servorotate18014
	DECFSZ     R12+0, 1
	GOTO       L_servorotate18014
	NOP
;MyProject.c,21 :: 		for(i=0;i<50;i++){
	INCF       R1+0, 1
	BTFSC      STATUS+0, 2
	INCF       R1+1, 1
;MyProject.c,26 :: 		}
	GOTO       L_servorotate18010
L_servorotate18011:
;MyProject.c,27 :: 		}
L_end_servorotate180:
	RETURN
; end of _servorotate180

_main:

;MyProject.c,28 :: 		void main() {
;MyProject.c,29 :: 		TRISB=0;
	CLRF       TRISB+0
;MyProject.c,30 :: 		do{
L_main15:
;MyProject.c,31 :: 		servorotate0();
	CALL       _servorotate0+0
;MyProject.c,32 :: 		delay_ms(2000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main18:
	DECFSZ     R13+0, 1
	GOTO       L_main18
	DECFSZ     R12+0, 1
	GOTO       L_main18
	DECFSZ     R11+0, 1
	GOTO       L_main18
	NOP
;MyProject.c,33 :: 		servorotate90();
	CALL       _servorotate90+0
;MyProject.c,34 :: 		delay_ms(2000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main19:
	DECFSZ     R13+0, 1
	GOTO       L_main19
	DECFSZ     R12+0, 1
	GOTO       L_main19
	DECFSZ     R11+0, 1
	GOTO       L_main19
	NOP
;MyProject.c,35 :: 		servorotate180();
	CALL       _servorotate180+0
;MyProject.c,36 :: 		delay_ms(2000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main20:
	DECFSZ     R13+0, 1
	GOTO       L_main20
	DECFSZ     R12+0, 1
	GOTO       L_main20
	DECFSZ     R11+0, 1
	GOTO       L_main20
	NOP
;MyProject.c,37 :: 		}while(1);
	GOTO       L_main15
;MyProject.c,38 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
