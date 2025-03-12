# Regras de Negócio

## ONG → Recebe → Animal

- Uma ONG pode receber vários animais.
- Cada animal pertence a uma única ONG.

## Animal → Pode ter → Adoção

- Um animal pode ser adotado apenas uma vez.
- Cada adoção está vinculada a um único animal.

## Adoção → Tem → Tutor

- Cada adoção envolve um único tutor.
- Um tutor pode ter adotado vários animais ao longo do tempo.

## Animal → Recebe → Vacina

- Um animal pode receber várias vacinas.
- Uma vacina pode ser aplicada a vários animais.

## Animal → Pode passar por → Procedimento

- Um animal pode passar por vários procedimentos.
- Um procedimento pode ser aplicado a vários animais.


## Adoção → Relaciona-se com → Visita Pós-Adoção

- Cada adoção pode ter várias.
- Toda visita deve estar associada a uma única adoção.