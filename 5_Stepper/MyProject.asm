
_main:

;MyProject.c,3 :: 		void main() {
;MyProject.c,4 :: 		CMCON = 0x07;
	MOVLW      7
	MOVWF      CMCON+0
;MyProject.c,5 :: 		ADCON1 = 0x06;
	MOVLW      6
	MOVWF      ADCON1+0
;MyProject.c,6 :: 		TRISB=0;
	CLRF       TRISB+0
;MyProject.c,7 :: 		PORTB=0x0f;
	MOVLW      15
	MOVWF      PORTB+0
;MyProject.c,8 :: 		while(1){
L_main0:
;MyProject.c,9 :: 		PORTB=mov[i];
	MOVF       _i+0, 0
	ADDLW      _mov+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;MyProject.c,10 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
	NOP
;MyProject.c,11 :: 		i++;
	INCF       _i+0, 1
;MyProject.c,12 :: 		if(i>7){
	MOVF       _i+0, 0
	SUBLW      7
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;MyProject.c,13 :: 		i=0;
	CLRF       _i+0
;MyProject.c,14 :: 		}
L_main3:
;MyProject.c,15 :: 		}
	GOTO       L_main0
;MyProject.c,16 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
