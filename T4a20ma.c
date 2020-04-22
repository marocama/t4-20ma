// -----------------------------------------------------------------------------
// Projeto : IPD Cabine
// Placa: CLP PIC 40 com MikroE 4-20mA T Click
// Microcontrolador : 16F887
// Data : 02/04/2020
// Autor : Marcus Roberto
// Versão: 1.0
// Compilador: MikroC PRO for PIC v.6.6.2
// Obs: Calibragem aferida: 20mA - 4012 | 4mA  - 0814 | 199 U.N./mA
//------------------------------------------------------------------------------

sbit Chip_Select at RC0_bit;
sbit Chip_Select_Direction at TRISC0_bit;

void writeSPI() {
     int x, y;                                                                  // Variaveis de controle
     
     
     Chip_Select = 0;                                                           // Escrita no SPI por meio dos registradores
     SSPBUF = 0b00110000; while(pir1.sspif==0) { } pir1.sspif=0;
     SSPBUF = 0b00000000; while(pir1.sspif==0) { } pir1.sspif=0;
     SPI1_Write(0b00110000);
     SPI1_Write(0b00000000);
     Chip_Select = 1;
     delay_ms(100);
     


     Chip_Select = 0;                                                           // Alto
     SPI1_Write(0b00111111);
     SPI1_Write(0b10101100);
     Chip_Select = 1;
     delay_ms(100);


     Chip_Select = 0;                                                           // Alto
     SPI1_Write(0x30);
     SPI1_Write(0x00);
     Chip_Select = 1;
     delay_ms(100);

     Chip_Select = 0;                                                           // Alto
     SPI1_Write(0x30);
     SPI1_Write(0xFF);
     Chip_Select = 1;
     delay_ms(100);
     
     Chip_Select = 0;                                                           // Quase alto
     SPI1_Write(0x31);
     SPI1_Write(0x80);
     Chip_Select = 1;
     delay_ms(100);
     
     Chip_Select = 0;                                                           // Quase meio
     SPI1_Write(0x31);
     SPI1_Write(0xFF);
     Chip_Select = 1;
     delay_ms(100);
     
     Chip_Select = 0;                                                           // Abaixo do meio
     SPI1_Write(0x32);
     SPI1_Write(0xFF);
     Chip_Select = 1;
     delay_ms(100);
     
     Chip_Select = 0;                                                           // Baixo
     SPI1_Write(0x3F);
     SPI1_Write(0xFF);
     Chip_Select = 1;
     delay_ms(100);

     // ================================================================================================
     // ================================================================================================
     
     Chip_Select = 0;                                                           // Abaixo do meio
     SPI1_Write(0x32);
     SPI1_Write(0xFF);
     Chip_Select = 1;
     delay_ms(100);
     
     Chip_Select = 0;                                                           // Quase meio
     SPI1_Write(0x31);
     SPI1_Write(0xFF);
     Chip_Select = 1;
     delay_ms(100);
     
     Chip_Select = 0;                                                           // Quase alto
     SPI1_Write(0x31);
     SPI1_Write(0x80);
     Chip_Select = 1;
     delay_ms(100);

     for(x = 48; x < 255; x++) {                                                // Estrutura de repetição para onda senóide (subida)
         for(y = 0; y < 255; y++) {
             //Chip_Select = 0;
             SPI1_Write(x);
             SPI1_Write(y);
             //Chip_Select = 1;
             //delay_ms(1);
         }
     }
     
     for(x = 255; x > 48; x--) {                                                // Estrutura de repetição para onda senóide (descida)
         for(y = 255; y > 0; y--) {
             //Chip_Select = 0;
             SPI1_Write(x);
             SPI1_Write(y);
             //Chip_Select = 1;
             //delay_ms(1);
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