#line 1 "C:/Users/Public/Documents/Mikroelektronika/mikroC PRO for PIC/Projects/4a20mA/v2/T4a20ma.c"
#line 12 "C:/Users/Public/Documents/Mikroelektronika/mikroC PRO for PIC/Projects/4a20mA/v2/T4a20ma.c"
sbit Chip_Select at RC0_bit;
sbit Chip_Select_Direction at TRISC0_bit;

void writeSPI() {
 int x, y;


 Chip_Select = 0;
 SSPBUF = 0b00110000; while(pir1.sspif==0) { } pir1.sspif=0;
 SSPBUF = 0b00000000; while(pir1.sspif==0) { } pir1.sspif=0;
 SPI1_Write(0b00110000);
 SPI1_Write(0b00000000);
 Chip_Select = 1;
 delay_ms(100);



 Chip_Select = 0;
 SPI1_Write(0b00111111);
 SPI1_Write(0b10101100);
 Chip_Select = 1;
 delay_ms(100);


 Chip_Select = 0;
 SPI1_Write(0x30);
 SPI1_Write(0x00);
 Chip_Select = 1;
 delay_ms(100);

 Chip_Select = 0;
 SPI1_Write(0x30);
 SPI1_Write(0xFF);
 Chip_Select = 1;
 delay_ms(100);

 Chip_Select = 0;
 SPI1_Write(0x31);
 SPI1_Write(0x80);
 Chip_Select = 1;
 delay_ms(100);

 Chip_Select = 0;
 SPI1_Write(0x31);
 SPI1_Write(0xFF);
 Chip_Select = 1;
 delay_ms(100);

 Chip_Select = 0;
 SPI1_Write(0x32);
 SPI1_Write(0xFF);
 Chip_Select = 1;
 delay_ms(100);

 Chip_Select = 0;
 SPI1_Write(0x3F);
 SPI1_Write(0xFF);
 Chip_Select = 1;
 delay_ms(100);




 Chip_Select = 0;
 SPI1_Write(0x32);
 SPI1_Write(0xFF);
 Chip_Select = 1;
 delay_ms(100);

 Chip_Select = 0;
 SPI1_Write(0x31);
 SPI1_Write(0xFF);
 Chip_Select = 1;
 delay_ms(100);

 Chip_Select = 0;
 SPI1_Write(0x31);
 SPI1_Write(0x80);
 Chip_Select = 1;
 delay_ms(100);

 for(x = 48; x < 255; x++) {
 for(y = 0; y < 255; y++) {

 SPI1_Write(x);
 SPI1_Write(y);


 }
 }

 for(x = 255; x > 48; x--) {
 for(y = 255; y > 0; y--) {

 SPI1_Write(x);
 SPI1_Write(y);


 }
 }

 Chip_Select = 1;
}

void main() {

 Chip_Select = 1;
 Chip_Select_Direction = 0;
 SPI1_Init();

 delay_ms(100);

 do{
 writeSPI();
 } while(1);
}
