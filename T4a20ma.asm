
_writeSPI:

;T4a20ma.c,15 :: 		void writeSPI() {
;T4a20ma.c,19 :: 		Chip_Select = 0;                                                           // Escrita no SPI por meio dos registradores
	BCF         RC0_bit+0, BitPos(RC0_bit+0) 
;T4a20ma.c,20 :: 		SSPBUF = 0b00110000; while(pir1.sspif==0) { } pir1.sspif=0;
	MOVLW       48
	MOVWF       SSPBUF+0 
L_writeSPI0:
	BTFSC       PIR1+0, 3 
	GOTO        L_writeSPI1
	GOTO        L_writeSPI0
L_writeSPI1:
	BCF         PIR1+0, 3 
;T4a20ma.c,21 :: 		SSPBUF = 0b00000000; while(pir1.sspif==0) { } pir1.sspif=0;
	CLRF        SSPBUF+0 
L_writeSPI2:
	BTFSC       PIR1+0, 3 
	GOTO        L_writeSPI3
	GOTO        L_writeSPI2
L_writeSPI3:
	BCF         PIR1+0, 3 
;T4a20ma.c,22 :: 		SPI1_Write(0b00110000);
	MOVLW       48
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;T4a20ma.c,23 :: 		SPI1_Write(0b00000000);
	CLRF        FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;T4a20ma.c,24 :: 		Chip_Select = 1;
	BSF         RC0_bit+0, BitPos(RC0_bit+0) 
;T4a20ma.c,25 :: 		delay_ms(100);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_writeSPI4:
	DECFSZ      R13, 1, 1
	BRA         L_writeSPI4
	DECFSZ      R12, 1, 1
	BRA         L_writeSPI4
	NOP
	NOP
;T4a20ma.c,29 :: 		Chip_Select = 0;                                                           // Alto
	BCF         RC0_bit+0, BitPos(RC0_bit+0) 
;T4a20ma.c,30 :: 		SPI1_Write(0b00111111);
	MOVLW       63
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;T4a20ma.c,31 :: 		SPI1_Write(0b10101100);
	MOVLW       172
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;T4a20ma.c,32 :: 		Chip_Select = 1;
	BSF         RC0_bit+0, BitPos(RC0_bit+0) 
;T4a20ma.c,33 :: 		delay_ms(100);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_writeSPI5:
	DECFSZ      R13, 1, 1
	BRA         L_writeSPI5
	DECFSZ      R12, 1, 1
	BRA         L_writeSPI5
	NOP
	NOP
;T4a20ma.c,36 :: 		Chip_Select = 0;                                                           // Alto
	BCF         RC0_bit+0, BitPos(RC0_bit+0) 
;T4a20ma.c,37 :: 		SPI1_Write(0x30);
	MOVLW       48
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;T4a20ma.c,38 :: 		SPI1_Write(0x00);
	CLRF        FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;T4a20ma.c,39 :: 		Chip_Select = 1;
	BSF         RC0_bit+0, BitPos(RC0_bit+0) 
;T4a20ma.c,40 :: 		delay_ms(100);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_writeSPI6:
	DECFSZ      R13, 1, 1
	BRA         L_writeSPI6
	DECFSZ      R12, 1, 1
	BRA         L_writeSPI6
	NOP
	NOP
;T4a20ma.c,42 :: 		Chip_Select = 0;                                                           // Alto
	BCF         RC0_bit+0, BitPos(RC0_bit+0) 
;T4a20ma.c,43 :: 		SPI1_Write(0x30);
	MOVLW       48
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;T4a20ma.c,44 :: 		SPI1_Write(0xFF);
	MOVLW       255
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;T4a20ma.c,45 :: 		Chip_Select = 1;
	BSF         RC0_bit+0, BitPos(RC0_bit+0) 
;T4a20ma.c,46 :: 		delay_ms(100);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_writeSPI7:
	DECFSZ      R13, 1, 1
	BRA         L_writeSPI7
	DECFSZ      R12, 1, 1
	BRA         L_writeSPI7
	NOP
	NOP
;T4a20ma.c,48 :: 		Chip_Select = 0;                                                           // Quase alto
	BCF         RC0_bit+0, BitPos(RC0_bit+0) 
;T4a20ma.c,49 :: 		SPI1_Write(0x31);
	MOVLW       49
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;T4a20ma.c,50 :: 		SPI1_Write(0x80);
	MOVLW       128
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;T4a20ma.c,51 :: 		Chip_Select = 1;
	BSF         RC0_bit+0, BitPos(RC0_bit+0) 
;T4a20ma.c,52 :: 		delay_ms(100);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_writeSPI8:
	DECFSZ      R13, 1, 1
	BRA         L_writeSPI8
	DECFSZ      R12, 1, 1
	BRA         L_writeSPI8
	NOP
	NOP
;T4a20ma.c,54 :: 		Chip_Select = 0;                                                           // Quase meio
	BCF         RC0_bit+0, BitPos(RC0_bit+0) 
;T4a20ma.c,55 :: 		SPI1_Write(0x31);
	MOVLW       49
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;T4a20ma.c,56 :: 		SPI1_Write(0xFF);
	MOVLW       255
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;T4a20ma.c,57 :: 		Chip_Select = 1;
	BSF         RC0_bit+0, BitPos(RC0_bit+0) 
;T4a20ma.c,58 :: 		delay_ms(100);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_writeSPI9:
	DECFSZ      R13, 1, 1
	BRA         L_writeSPI9
	DECFSZ      R12, 1, 1
	BRA         L_writeSPI9
	NOP
	NOP
;T4a20ma.c,60 :: 		Chip_Select = 0;                                                           // Abaixo do meio
	BCF         RC0_bit+0, BitPos(RC0_bit+0) 
;T4a20ma.c,61 :: 		SPI1_Write(0x32);
	MOVLW       50
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;T4a20ma.c,62 :: 		SPI1_Write(0xFF);
	MOVLW       255
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;T4a20ma.c,63 :: 		Chip_Select = 1;
	BSF         RC0_bit+0, BitPos(RC0_bit+0) 
;T4a20ma.c,64 :: 		delay_ms(100);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_writeSPI10:
	DECFSZ      R13, 1, 1
	BRA         L_writeSPI10
	DECFSZ      R12, 1, 1
	BRA         L_writeSPI10
	NOP
	NOP
;T4a20ma.c,66 :: 		Chip_Select = 0;                                                           // Baixo
	BCF         RC0_bit+0, BitPos(RC0_bit+0) 
;T4a20ma.c,67 :: 		SPI1_Write(0x3F);
	MOVLW       63
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;T4a20ma.c,68 :: 		SPI1_Write(0xFF);
	MOVLW       255
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;T4a20ma.c,69 :: 		Chip_Select = 1;
	BSF         RC0_bit+0, BitPos(RC0_bit+0) 
;T4a20ma.c,70 :: 		delay_ms(100);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_writeSPI11:
	DECFSZ      R13, 1, 1
	BRA         L_writeSPI11
	DECFSZ      R12, 1, 1
	BRA         L_writeSPI11
	NOP
	NOP
;T4a20ma.c,75 :: 		Chip_Select = 0;                                                           // Abaixo do meio
	BCF         RC0_bit+0, BitPos(RC0_bit+0) 
;T4a20ma.c,76 :: 		SPI1_Write(0x32);
	MOVLW       50
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;T4a20ma.c,77 :: 		SPI1_Write(0xFF);
	MOVLW       255
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;T4a20ma.c,78 :: 		Chip_Select = 1;
	BSF         RC0_bit+0, BitPos(RC0_bit+0) 
;T4a20ma.c,79 :: 		delay_ms(100);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_writeSPI12:
	DECFSZ      R13, 1, 1
	BRA         L_writeSPI12
	DECFSZ      R12, 1, 1
	BRA         L_writeSPI12
	NOP
	NOP
;T4a20ma.c,81 :: 		Chip_Select = 0;                                                           // Quase meio
	BCF         RC0_bit+0, BitPos(RC0_bit+0) 
;T4a20ma.c,82 :: 		SPI1_Write(0x31);
	MOVLW       49
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;T4a20ma.c,83 :: 		SPI1_Write(0xFF);
	MOVLW       255
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;T4a20ma.c,84 :: 		Chip_Select = 1;
	BSF         RC0_bit+0, BitPos(RC0_bit+0) 
;T4a20ma.c,85 :: 		delay_ms(100);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_writeSPI13:
	DECFSZ      R13, 1, 1
	BRA         L_writeSPI13
	DECFSZ      R12, 1, 1
	BRA         L_writeSPI13
	NOP
	NOP
;T4a20ma.c,87 :: 		Chip_Select = 0;                                                           // Quase alto
	BCF         RC0_bit+0, BitPos(RC0_bit+0) 
;T4a20ma.c,88 :: 		SPI1_Write(0x31);
	MOVLW       49
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;T4a20ma.c,89 :: 		SPI1_Write(0x80);
	MOVLW       128
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;T4a20ma.c,90 :: 		Chip_Select = 1;
	BSF         RC0_bit+0, BitPos(RC0_bit+0) 
;T4a20ma.c,91 :: 		delay_ms(100);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_writeSPI14:
	DECFSZ      R13, 1, 1
	BRA         L_writeSPI14
	DECFSZ      R12, 1, 1
	BRA         L_writeSPI14
	NOP
	NOP
;T4a20ma.c,93 :: 		for(x = 48; x < 255; x++) {                                                // Estrutura de repetição para onda senóide (subida)
	MOVLW       48
	MOVWF       writeSPI_x_L0+0 
	MOVLW       0
	MOVWF       writeSPI_x_L0+1 
L_writeSPI15:
	MOVLW       128
	XORWF       writeSPI_x_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__writeSPI32
	MOVLW       255
	SUBWF       writeSPI_x_L0+0, 0 
L__writeSPI32:
	BTFSC       STATUS+0, 0 
	GOTO        L_writeSPI16
;T4a20ma.c,94 :: 		for(y = 0; y < 255; y++) {
	CLRF        writeSPI_y_L0+0 
	CLRF        writeSPI_y_L0+1 
L_writeSPI18:
	MOVLW       128
	XORWF       writeSPI_y_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__writeSPI33
	MOVLW       255
	SUBWF       writeSPI_y_L0+0, 0 
L__writeSPI33:
	BTFSC       STATUS+0, 0 
	GOTO        L_writeSPI19
;T4a20ma.c,96 :: 		SPI1_Write(x);
	MOVF        writeSPI_x_L0+0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;T4a20ma.c,97 :: 		SPI1_Write(y);
	MOVF        writeSPI_y_L0+0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;T4a20ma.c,94 :: 		for(y = 0; y < 255; y++) {
	INFSNZ      writeSPI_y_L0+0, 1 
	INCF        writeSPI_y_L0+1, 1 
;T4a20ma.c,100 :: 		}
	GOTO        L_writeSPI18
L_writeSPI19:
;T4a20ma.c,93 :: 		for(x = 48; x < 255; x++) {                                                // Estrutura de repetição para onda senóide (subida)
	INFSNZ      writeSPI_x_L0+0, 1 
	INCF        writeSPI_x_L0+1, 1 
;T4a20ma.c,101 :: 		}
	GOTO        L_writeSPI15
L_writeSPI16:
;T4a20ma.c,103 :: 		for(x = 255; x > 48; x--) {                                                // Estrutura de repetição para onda senóide (descida)
	MOVLW       255
	MOVWF       writeSPI_x_L0+0 
	MOVLW       0
	MOVWF       writeSPI_x_L0+1 
L_writeSPI21:
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       writeSPI_x_L0+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__writeSPI34
	MOVF        writeSPI_x_L0+0, 0 
	SUBLW       48
L__writeSPI34:
	BTFSC       STATUS+0, 0 
	GOTO        L_writeSPI22
;T4a20ma.c,104 :: 		for(y = 255; y > 0; y--) {
	MOVLW       255
	MOVWF       writeSPI_y_L0+0 
	MOVLW       0
	MOVWF       writeSPI_y_L0+1 
L_writeSPI24:
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       writeSPI_y_L0+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__writeSPI35
	MOVF        writeSPI_y_L0+0, 0 
	SUBLW       0
L__writeSPI35:
	BTFSC       STATUS+0, 0 
	GOTO        L_writeSPI25
;T4a20ma.c,106 :: 		SPI1_Write(x);
	MOVF        writeSPI_x_L0+0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;T4a20ma.c,107 :: 		SPI1_Write(y);
	MOVF        writeSPI_y_L0+0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;T4a20ma.c,104 :: 		for(y = 255; y > 0; y--) {
	MOVLW       1
	SUBWF       writeSPI_y_L0+0, 1 
	MOVLW       0
	SUBWFB      writeSPI_y_L0+1, 1 
;T4a20ma.c,110 :: 		}
	GOTO        L_writeSPI24
L_writeSPI25:
;T4a20ma.c,103 :: 		for(x = 255; x > 48; x--) {                                                // Estrutura de repetição para onda senóide (descida)
	MOVLW       1
	SUBWF       writeSPI_x_L0+0, 1 
	MOVLW       0
	SUBWFB      writeSPI_x_L0+1, 1 
;T4a20ma.c,111 :: 		}
	GOTO        L_writeSPI21
L_writeSPI22:
;T4a20ma.c,113 :: 		Chip_Select = 1;
	BSF         RC0_bit+0, BitPos(RC0_bit+0) 
;T4a20ma.c,114 :: 		}
L_end_writeSPI:
	RETURN      0
; end of _writeSPI

_main:

;T4a20ma.c,116 :: 		void main() {
;T4a20ma.c,118 :: 		Chip_Select = 1;
	BSF         RC0_bit+0, BitPos(RC0_bit+0) 
;T4a20ma.c,119 :: 		Chip_Select_Direction = 0;
	BCF         TRISC0_bit+0, BitPos(TRISC0_bit+0) 
;T4a20ma.c,120 :: 		SPI1_Init();
	CALL        _SPI1_Init+0, 0
;T4a20ma.c,122 :: 		delay_ms(100);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_main27:
	DECFSZ      R13, 1, 1
	BRA         L_main27
	DECFSZ      R12, 1, 1
	BRA         L_main27
	NOP
	NOP
;T4a20ma.c,124 :: 		do{
L_main28:
;T4a20ma.c,125 :: 		writeSPI();
	CALL        _writeSPI+0, 0
;T4a20ma.c,126 :: 		} while(1);
	GOTO        L_main28
;T4a20ma.c,127 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
