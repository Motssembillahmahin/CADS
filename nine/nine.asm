
_main:

;nine.c,16 :: 		void main() {
;nine.c,17 :: 		TRISB=0x00;
	CLRF       TRISB+0
;nine.c,18 :: 		TRISC=0x00;
	CLRF       TRISC+0
;nine.c,19 :: 		TRISD=0xff;
	MOVLW      255
	MOVWF      TRISD+0
;nine.c,20 :: 		i=display();
	CALL       _display+0
	MOVF       R0+0, 0
	MOVWF      _i+0
	MOVF       R0+1, 0
	MOVWF      _i+1
;nine.c,21 :: 		while(1){
L_main0:
;nine.c,22 :: 		portc.f7=1;
	BSF        PORTC+0, 7
;nine.c,23 :: 		delay(i);
	MOVF       _i+0, 0
	MOVWF      FARG_delay_x+0
	MOVF       _i+1, 0
	MOVWF      FARG_delay_x+1
	CALL       _delay+0
;nine.c,24 :: 		portc.f7=0;
	BCF        PORTC+0, 7
;nine.c,25 :: 		delay(i);
	MOVF       _i+0, 0
	MOVWF      FARG_delay_x+0
	MOVF       _i+1, 0
	MOVWF      FARG_delay_x+1
	CALL       _delay+0
;nine.c,26 :: 		}
	GOTO       L_main0
;nine.c,28 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_display:

;nine.c,30 :: 		int display(){
;nine.c,31 :: 		while(1){
L_display2:
;nine.c,33 :: 		portb=hexvalue[(i/10)%10];
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _i+0, 0
	MOVWF      R0+0
	MOVF       _i+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	ADDLW      _hexvalue+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;nine.c,34 :: 		portc.f0=0;
	BCF        PORTC+0, 0
;nine.c,35 :: 		delay_ms(1);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_display4:
	DECFSZ     R13+0, 1
	GOTO       L_display4
	DECFSZ     R12+0, 1
	GOTO       L_display4
	NOP
	NOP
;nine.c,36 :: 		portc.f0=1;
	BSF        PORTC+0, 0
;nine.c,38 :: 		portb=hexvalue[i%10];
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _i+0, 0
	MOVWF      R0+0
	MOVF       _i+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	ADDLW      _hexvalue+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;nine.c,39 :: 		portc.f1=0;
	BCF        PORTC+0, 1
;nine.c,40 :: 		delay_ms(1);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_display5:
	DECFSZ     R13+0, 1
	GOTO       L_display5
	DECFSZ     R12+0, 1
	GOTO       L_display5
	NOP
	NOP
;nine.c,41 :: 		portc.f1=1;
	BSF        PORTC+0, 1
;nine.c,43 :: 		if(portd.f0==1){
	BTFSS      PORTD+0, 0
	GOTO       L_display6
;nine.c,44 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_display7:
	DECFSZ     R13+0, 1
	GOTO       L_display7
	DECFSZ     R12+0, 1
	GOTO       L_display7
	DECFSZ     R11+0, 1
	GOTO       L_display7
;nine.c,45 :: 		if(portd.f0==1){
	BTFSS      PORTD+0, 0
	GOTO       L_display8
;nine.c,46 :: 		i++;
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;nine.c,47 :: 		if(i>99){
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _i+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__display23
	MOVF       _i+0, 0
	SUBLW      99
L__display23:
	BTFSC      STATUS+0, 0
	GOTO       L_display9
;nine.c,48 :: 		i=0;
	CLRF       _i+0
	CLRF       _i+1
;nine.c,49 :: 		}
L_display9:
;nine.c,50 :: 		}
L_display8:
;nine.c,51 :: 		}
L_display6:
;nine.c,53 :: 		if(portd.f1==1){
	BTFSS      PORTD+0, 1
	GOTO       L_display10
;nine.c,54 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_display11:
	DECFSZ     R13+0, 1
	GOTO       L_display11
	DECFSZ     R12+0, 1
	GOTO       L_display11
	DECFSZ     R11+0, 1
	GOTO       L_display11
;nine.c,55 :: 		if(portd.f1==1){
	BTFSS      PORTD+0, 1
	GOTO       L_display12
;nine.c,56 :: 		i--;
	MOVLW      1
	SUBWF      _i+0, 1
	BTFSS      STATUS+0, 0
	DECF       _i+1, 1
;nine.c,57 :: 		if(i<0){
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__display24
	MOVLW      0
	SUBWF      _i+0, 0
L__display24:
	BTFSC      STATUS+0, 0
	GOTO       L_display13
;nine.c,58 :: 		i=0;
	CLRF       _i+0
	CLRF       _i+1
;nine.c,59 :: 		}
L_display13:
;nine.c,60 :: 		}
L_display12:
;nine.c,61 :: 		}
L_display10:
;nine.c,63 :: 		if(portd.f2==1){
	BTFSS      PORTD+0, 2
	GOTO       L_display14
;nine.c,64 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_display15:
	DECFSZ     R13+0, 1
	GOTO       L_display15
	DECFSZ     R12+0, 1
	GOTO       L_display15
	DECFSZ     R11+0, 1
	GOTO       L_display15
;nine.c,65 :: 		if(portd.f2==1){
	BTFSS      PORTD+0, 2
	GOTO       L_display16
;nine.c,66 :: 		return i;
	MOVF       _i+0, 0
	MOVWF      R0+0
	MOVF       _i+1, 0
	MOVWF      R0+1
	GOTO       L_end_display
;nine.c,67 :: 		}
L_display16:
;nine.c,68 :: 		}
L_display14:
;nine.c,69 :: 		}
	GOTO       L_display2
;nine.c,70 :: 		}
L_end_display:
	RETURN
; end of _display

_delay:

;nine.c,72 :: 		void delay(int x){
;nine.c,73 :: 		for(m=0;m<x;m++){
	CLRF       _m+0
	CLRF       _m+1
L_delay17:
	MOVLW      128
	XORWF      _m+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      FARG_delay_x+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__delay26
	MOVF       FARG_delay_x+0, 0
	SUBWF      _m+0, 0
L__delay26:
	BTFSC      STATUS+0, 0
	GOTO       L_delay18
;nine.c,74 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_delay20:
	DECFSZ     R13+0, 1
	GOTO       L_delay20
	DECFSZ     R12+0, 1
	GOTO       L_delay20
	DECFSZ     R11+0, 1
	GOTO       L_delay20
	NOP
	NOP
;nine.c,73 :: 		for(m=0;m<x;m++){
	INCF       _m+0, 1
	BTFSC      STATUS+0, 2
	INCF       _m+1, 1
;nine.c,75 :: 		}
	GOTO       L_delay17
L_delay18:
;nine.c,76 :: 		}
L_end_delay:
	RETURN
; end of _delay
