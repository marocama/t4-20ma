# Saída 4-20mA

Rotina para autenticação de usuários em microcontroladores através da leitura de um arquivo de texto como base de dados em um SD Card.

Rotina para utilização de saída 4-20mA em microcontroladores utilizando protocolo SPI.

### Instalação

Clone o repositório, obtendo todos os arquivos gerados pelo projeto do mikroC, tanto o hexadecimal para gravação, quanto os arquivos `.c` e `.h`.

```sh
$ git clone https://github.com/marocama/SD_Card_Auth.git
```

### Calibragem

Deve-se realizar uma calibragem a fim de mapear os valores enviados via SPI com os valores correspondentes na saída 4-20mA. No hardware utilizado por este repositório, aferiu-se:

> Calibragem aferida: 20mA - 4012 | 4mA  - 0814 | 199 U.N./mA