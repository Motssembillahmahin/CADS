
_main:

;eight.c,18 :: 		void main() {
;eight.c,19 :: 		TRISB=0x00;
	CLRF       TRISB+0
;eight.c,20 :: 		TRISC=0x00;
	CLRF       TRISC+0
;eight.c,21 :: 		TRISD=0xff;
	MOVLW      255
	MOVWF      TRISD+0
;eight.c,22 :: 		start=input();
	CALL       _input+0
	MOVF       R0+0, 0
	MOVWF      _start+0
	MOVF       R0+1, 0
	MOVWF      _start+1
;eight.c,23 :: 		i=0;
	CLRF       _i+0
	CLRF       _i+1
;eight.c,24 :: 		end=input();
	CALL       _input+0
	MOVF       R0+0, 0
	MOVWF      _end+0
	MOVF       R0+1, 0
	MOVWF      _end+1
;eight.c,25 :: 		while(1){
L_main0:
;eight.c,26 :: 		for(ii=start;ii<=end;ii++){
	MOVF       _start+0, 0
	MOVWF      _ii+0
	MOVF       _start+1, 0
	MOVWF      _ii+1
L_main2:
	MOVLW      128
	XORWF      _end+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _ii+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main30
	MOVF       _ii+0, 0
	SUBWF      _end+0, 0
L__main30:
	BTFSS      STATUS+0, 0
	GOTO       L_main3
;eight.c,27 :: 		display(ii);
	MOVF       _ii+0, 0
	MOVWF      FARG_display_num+0
	MOVF       _ii+1, 0
	MOVWF      FARG_display_num+1
	CALL       _display+0
;eight.c,26 :: 		for(ii=start;ii<=end;ii++){
	INCF       _ii+0, 1
	BTFSC      STATUS+0, 2
	INCF       _ii+1, 1
;eight.c,28 :: 		}
	GOTO       L_main2
L_main3:
;eight.c,29 :: 		}
	GOTO       L_main0
;eight.c,31 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_input:

;eight.c,33 :: 		int input(){
;eight.c,34 :: 		while(1){
L_input5:
;eight.c,36 :: 		portb=hexvalue[(i/10)%10];
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
;eight.c,37 :: 		portc.f0=0;
	BCF        PORTC+0, 0
;eight.c,38 :: 		delay_ms(1);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_input7:
	DECFSZ     R13+0, 1
	GOTO       L_input7
	DECFSZ     R12+0, 1
	GOTO       L_input7
	NOP
	NOP
;eight.c,39 :: 		portc.f0=1;
	BSF        PORTC+0, 0
;eight.c,41 :: 		portb=hexvalue[i%10];
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
;eight.c,42 :: 		portc.f1=0;
	BCF        PORTC+0, 1
;eight.c,43 :: 		delay_ms(1);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_input8:
	DECFSZ     R13+0, 1
	GOTO       L_input8
	DECFSZ     R12+0, 1
	GOTO       L_input8
	NOP
	NOP
;eight.c,44 :: 		portc.f1=1;
	BSF        PORTC+0, 1
;eight.c,46 :: 		if(portd.f0==1){
	BTFSS      PORTD+0, 0
	GOTO       L_input9
;eight.c,47 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_input10:
	DECFSZ     R13+0, 1
	GOTO       L_input10
	DECFSZ     R12+0, 1
	GOTO       L_input10
	DECFSZ     R11+0, 1
	GOTO       L_input10
;eight.c,48 :: 		if(portd.f0==1){
	BTFSS      PORTD+0, 0
	GOTO       L_input11
;eight.c,49 :: 		i++;
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;eight.c,50 :: 		if(i>99){
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _i+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__input32
	MOVF       _i+0, 0
	SUBLW      99
L__input32:
	BTFSC      STATUS+0, 0
	GOTO       L_input12
;eight.c,51 :: 		i=0;
	CLRF       _i+0
	CLRF       _i+1
;eight.c,52 :: 		}
L_input12:
;eight.c,53 :: 		}
L_input11:
;eight.c,54 :: 		}
L_input9:
;eight.c,56 :: 		if(portd.f1==1){
	BTFSS      PORTD+0, 1
	GOTO       L_input13
;eight.c,57 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_input14:
	DECFSZ     R13+0, 1
	GOTO       L_input14
	DECFSZ     R12+0, 1
	GOTO       L_input14
	DECFSZ     R11+0, 1
	GOTO       L_input14
;eight.c,58 :: 		if(portd.f1==1){
	BTFSS      PORTD+0, 1
	GOTO       L_input15
;eight.c,59 :: 		i--;
	MOVLW      1
	SUBWF      _i+0, 1
	BTFSS      STATUS+0, 0
	DECF       _i+1, 1
;eight.c,60 :: 		if(i<0){
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__input33
	MOVLW      0
	SUBWF      _i+0, 0
L__input33:
	BTFSC      STATUS+0, 0
	GOTO       L_input16
;eight.c,61 :: 		i=0;
	CLRF       _i+0
	CLRF       _i+1
;eight.c,62 :: 		}
L_input16:
;eight.c,63 :: 		}
L_input15:
;eight.c,64 :: 		}
L_input13:
;eight.c,66 :: 		if(portd.f2==1){
	BTFSS      PORTD+0, 2
	GOTO       L_input17
;eight.c,67 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_input18:
	DECFSZ     R13+0, 1
	GOTO       L_input18
	DECFSZ     R12+0, 1
	GOTO       L_input18
	DECFSZ     R11+0, 1
	GOTO       L_input18
;eight.c,68 :: 		if(portd.f2==1){
	BTFSS      PORTD+0, 2
	GOTO       L_input19
;eight.c,69 :: 		return i;
	MOVF       _i+0, 0
	MOVWF      R0+0
	MOVF       _i+1, 0
	MOVWF      R0+1
	GOTO       L_end_input
;eight.c,70 :: 		}
L_input19:
;eight.c,71 :: 		}
L_input17:
;eight.c,72 :: 		}
	GOTO       L_input5
;eight.c,73 :: 		}
L_end_input:
	RETURN
; end of _input

_delay:

;eight.c,75 :: 		void delay(int x){
;eight.c,76 :: 		for(m=0;m<x;m++){
	CLRF       _m+0
	CLRF       _m+1
L_delay20:
	MOVLW      128
	XORWF      _m+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      FARG_delay_x+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__delay35
	MOVF       FARG_delay_x+0, 0
	SUBWF      _m+0, 0
L__delay35:
	BTFSC      STATUS+0, 0
	GOTO       L_delay21
;eight.c,77 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_delay23:
	DECFSZ     R13+0, 1
	GOTO       L_delay23
	DECFSZ     R12+0, 1
	GOTO       L_delay23
	DECFSZ     R11+0, 1
	GOTO       L_delay23
	NOP
	NOP
;eight.c,76 :: 		for(m=0;m<x;m++){
	INCF       _m+0, 1
	BTFSC      STATUS+0, 2
	INCF       _m+1, 1
;eight.c,78 :: 		}
	GOTO       L_delay20
L_delay21:
;eight.c,79 :: 		}
L_end_delay:
	RETURN
; end of _delay

_display:

;eight.c,81 :: 		void display(int num){
;eight.c,83 :: 		for(kk=0;kk<160;kk++){
	CLRF       _kk+0
	CLRF       _kk+1
L_display24:
	MOVLW      128
	XORWF      _kk+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__display37
	MOVLW      160
	SUBWF      _kk+0, 0
L__display37:
	BTFSC      STATUS+0, 0
	GOTO       L_display25
;eight.c,84 :: 		portb=hexvalue[(num/10)%10];
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FARG_display_num+0, 0
	MOVWF      R0+0
	MOVF       FARG_display_num+1, 0
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
;eight.c,85 :: 		portc.f0=0;
	BCF        PORTC+0, 0
;eight.c,86 :: 		delay_ms(1);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_display27:
	DECFSZ     R13+0, 1
	GOTO       L_display27
	DECFSZ     R12+0, 1
	GOTO       L_display27
	NOP
	NOP
;eight.c,87 :: 		portc.f0=1;
	BSF        PORTC+0, 0
;eight.c,89 :: 		portb=hexvalue[num%10];
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FARG_display_num+0, 0
	MOVWF      R0+0
	MOVF       FARG_display_num+1, 0
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
;eight.c,90 :: 		portc.f1=0;
	BCF        PORTC+0, 1
;eight.c,91 :: 		delay_ms(1);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_display28:
	DECFSZ     R13+0, 1
	GOTO       L_display28
	DECFSZ     R12+0, 1
	GOTO       L_display28
	NOP
	NOP
;eight.c,92 :: 		portc.f1=1;
	BSF        PORTC+0, 1
;eight.c,83 :: 		for(kk=0;kk<160;kk++){
	INCF       _kk+0, 1
	BTFSC      STATUS+0, 2
	INCF       _kk+1, 1
;eight.c,94 :: 		}
	GOTO       L_display24
L_display25:
;eight.c,95 :: 		}
L_end_display:
	RETURN
; end of _display
