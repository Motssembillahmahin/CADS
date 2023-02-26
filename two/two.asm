
_main:

;two.c,14 :: 		void main() {
;two.c,15 :: 		TRISB=0x00;
	CLRF       TRISB+0
;two.c,16 :: 		TRISC=0x00;
	CLRF       TRISC+0
;two.c,17 :: 		TRISD=0xff;
	MOVLW      255
	MOVWF      TRISD+0
;two.c,18 :: 		i=eeprom_read(0x01);
	MOVLW      1
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _i+0
	CLRF       _i+1
;two.c,19 :: 		while(1){
L_main0:
;two.c,20 :: 		portb=hexvalue[(i/10)%10];
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
;two.c,21 :: 		portc.f0=0;
	BCF        PORTC+0, 0
;two.c,22 :: 		delay_ms(1);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	NOP
	NOP
;two.c,23 :: 		portc.f0=1;
	BSF        PORTC+0, 0
;two.c,25 :: 		portb=hexvalue[i%10];
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
;two.c,26 :: 		portc.f1=0;
	BCF        PORTC+0, 1
;two.c,27 :: 		delay_ms(1);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	NOP
	NOP
;two.c,28 :: 		portc.f1=1;
	BSF        PORTC+0, 1
;two.c,30 :: 		if(portd.f0==1){
	BTFSS      PORTD+0, 0
	GOTO       L_main4
;two.c,31 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	DECFSZ     R11+0, 1
	GOTO       L_main5
;two.c,32 :: 		if(portd.f0==1){
	BTFSS      PORTD+0, 0
	GOTO       L_main6
;two.c,33 :: 		i++;
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;two.c,34 :: 		eeprom_write(0x01,i);
	MOVLW      1
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       _i+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;two.c,35 :: 		if(i>99){
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _i+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main13
	MOVF       _i+0, 0
	SUBLW      99
L__main13:
	BTFSC      STATUS+0, 0
	GOTO       L_main7
;two.c,36 :: 		i=0;
	CLRF       _i+0
	CLRF       _i+1
;two.c,37 :: 		eeprom_write(0x01,i);
	MOVLW      1
	MOVWF      FARG_EEPROM_Write_Address+0
	CLRF       FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;two.c,38 :: 		}
L_main7:
;two.c,39 :: 		}
L_main6:
;two.c,40 :: 		}
L_main4:
;two.c,42 :: 		if(portd.f1==1){
	BTFSS      PORTD+0, 1
	GOTO       L_main8
;two.c,43 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	DECFSZ     R12+0, 1
	GOTO       L_main9
	DECFSZ     R11+0, 1
	GOTO       L_main9
;two.c,44 :: 		if(portd.f1==1){
	BTFSS      PORTD+0, 1
	GOTO       L_main10
;two.c,45 :: 		i--;
	MOVLW      1
	SUBWF      _i+0, 1
	BTFSS      STATUS+0, 0
	DECF       _i+1, 1
;two.c,46 :: 		eeprom_write(0x01,i);
	MOVLW      1
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       _i+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;two.c,47 :: 		if(i<0){
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main14
	MOVLW      0
	SUBWF      _i+0, 0
L__main14:
	BTFSC      STATUS+0, 0
	GOTO       L_main11
;two.c,48 :: 		i=0;
	CLRF       _i+0
	CLRF       _i+1
;two.c,49 :: 		eeprom_write(0x01,i);
	MOVLW      1
	MOVWF      FARG_EEPROM_Write_Address+0
	CLRF       FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;two.c,50 :: 		}
L_main11:
;two.c,51 :: 		}
L_main10:
;two.c,52 :: 		}
L_main8:
;two.c,53 :: 		}
	GOTO       L_main0
;two.c,54 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
