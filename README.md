# Sistema de Controle de Animais Resgatados

## 🔴 Problema

Muitas ONGs de resgate de animais têm dificuldade em organizar adoções e acompanhar tratamentos.

## ✅ Solução

Desenvolvemos uma Banco de Dados para registrar resgates, adoções e monitoramento da saúde dos animais.

# 🚀 Como Criar o Banco de Dados de forma automática no Seu Computador

###  🔴 Abra o init.sql que está localizado na pasta sql
1. Modifique o caminho dos arquivos para onde está localizado os arquivos no seu computador.

### 📌 Abra o MySQL Command Line Client
1. No **Windows**, abra o **MySQL Command Line Client** pelo menu Iniciar.
2. Digite sua senha de acesso ao MySQL.

### 🚀 Executar a Inicialização do Banco

Agora, rode o script `init.sql` para criar o banco de dados e popular com os dados iniciais.

1. No **MySQL Command Line Client**, digite o seguinte comando para rodar o script:

SOURCE C:/caminho/para/o/projeto/Controle-de-Animais-Resgatados/sql/init.sql;

### ✅ Confirmar que o Banco foi Criado
Após rodar o init.sql, verifique se o banco foi criado corretamente:

```sql```
SHOW DATABASES;

### Se o banco estiver na lista, prossiga.
Agora, selecione o banco:

```sql``
USE sistemaong;