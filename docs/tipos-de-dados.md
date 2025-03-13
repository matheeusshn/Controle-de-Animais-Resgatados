## Tipos de Dados

### **Tipos Numéricos**

- **`INT`** → Usado para IDs e idade.
  - Exemplos: `ID_ONG`, `ID_Animal`, `Idade`, etc.
- **`FLOAT`** → Usado para armazenar valores decimais.
  - Exemplo: `Peso` (peso do animal).

### **Tipos de Texto**

- **`VARCHAR(n)`** → Armazena textos curtos de comprimento variável.
  - Exemplos: `Nome`, `Especie`, `Endereco`, `Telefone`, `Email`, `CPF`, etc.
- **`TEXT`** → Armazena textos longos.
  - Exemplos: `Descricao`, `Observacao`, `Motivo`, `Observacoes`.

### **Tipos de Data**

- **`DATE`** → Armazena datas.
  - Exemplos: `Data_Aplicacao`, `Proxima_Dose`, `Data_Adocao`, `Data_Visita`, `Data_Devolucao`.

### **Outros Atributos**

- **`AUTO_INCREMENT`** → Gera valores automaticamente para chaves primárias.
- **`NOT NULL`** → Impede que o campo fique vazio.
- **`UNIQUE`** → Garante que os valores sejam únicos.
  - Exemplo: `CPF` na tabela `Tutor`, `ID_Animal` na tabela `Adocao`.
- **`FOREIGN KEY`** → Define chaves estrangeiras para relacionamentos entre tabelas.
- **`INDEX`** → Otimiza a performance de consultas para colunas frequentemente pesquisadas.