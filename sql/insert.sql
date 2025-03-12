USE SistemaONG;

-- Inserção dos Dados
-- 1. ONGs
INSERT INTO ONG (Nome, Responsavel, Telefone, Endereco, Email) VALUES
('ONG Amiga dos Animais', 'João Silva', '11987654321', 'Rua A, 123', 'contato@amigadosanimais.org'),
('Protege Vida Animal', 'Maria Oliveira', '11912345678', 'Av. B, 456', 'contato@protegervida.org'),
('Cuidando dos Bichos', 'Ricardo Mendes', '11987651234', 'Rua E, 250', 'contato@cuidandodosbichos.org'),
('Patinhas Felizes', 'Fernanda Costa', '11998765432', 'Av. F, 300', 'contato@patinhasfelizes.org');

-- 2. Animais
INSERT INTO Animal (Nome, Especie, Raca, Porte, Peso, Idade, Saude, Status, ID_ONG) VALUES
('Rex', 'Cão', 'Labrador', 'Grande', 30.5, 5, 'Boa', 'Disponível', 1),
('Mia', 'Gato', 'Siamês', 'Pequeno', 4.2, 3, 'Boa', 'Disponível', 1),
('Bolt', 'Cão', 'Pastor Alemão', 'Médio', 25.0, 4, 'Regular', 'Em Tratamento', 2),
('Luna', 'Gato', 'Persa', 'Pequeno', 3.5, 2, 'Boa', 'Disponível', 2),
('Bela', 'Cão', 'Poodle', 'Pequeno', 5.2, 2, 'Boa', 'Disponível', 3),  -- Fêmea
('Thor', 'Cão', 'Bulldog', 'Médio', 20.0, 4, 'Boa', 'Disponível', 3),
('Mel', 'Gato', 'Persa', 'Pequeno', 3.0, 1, 'Regular', 'Disponível', 4),  -- Fêmea
('Maggie', 'Cão', 'Golden Retriever', 'Grande', 28.0, 3, 'Boa', 'Disponível', 1),  -- Fêmea
('Tom', 'Gato', 'SRD', 'Pequeno', 4.0, 2, 'Boa', 'Disponível', 2),
('Max', 'Cão', 'Vira-lata', 'Médio', 15.0, 5, 'Boa', 'Adotado', 2),  -- Será devolvido
('Nina', 'Gato', 'Angorá', 'Pequeno', 4.2, 3, 'Boa', 'Adotado', 3),  -- Será devolvida
('Daisy', 'Cão', 'Beagle', 'Médio', 12.0, 4, 'Boa', 'Disponível', 3);

-- 3. Tutores
INSERT INTO Tutor (Nome, CPF, Telefone, Endereco, Email) VALUES
('Carlos Pereira', '123.456.789-10', '21987654321', 'Rua C, 789', 'carlos@gmail.com'),
('Ana Souza', '987.654.321-00', '21912345678', 'Av. D, 101', 'ana@gmail.com'),
('Fernanda Souza', '321.654.987-00', '21955555555', 'Rua G, 400', 'fernanda@gmail.com'),
('José Martins', '741.852.963-11', '21966666666', 'Av. H, 500', 'josemartins@gmail.com'),
('Mariana Lopes', '852.741.369-22', '21977777777', 'Rua I, 600', 'mariana@gmail.com');

-- 4. Adoções
INSERT INTO Adocao (Data_Adocao, Status_Adocao, ID_Animal, ID_Tutor) VALUES
('2023-08-01', 'Concluída', 1, 1),
('2023-08-05', 'Em Andamento', 2, 2),
('2023-10-01', 'Concluída', 10, 4),  -- Max adotado por José Martins
('2023-10-05', 'Concluída', 11, 5);   -- Nina adotada por Mariana Lopes

-- 5. Devoluções
INSERT INTO Devolucao (Data_Devolucao, Motivo, Observacoes, ID_Adocao) VALUES
('2023-09-01', 'Adaptação difícil', 'O tutor encontrou dificuldades na adaptação do animal.', 2),
('2023-11-01', 'Problemas financeiros', 'O tutor não conseguiu manter os custos do animal.', 3),
('2023-11-10', 'Alergia severa', 'O tutor desenvolveu alergia ao pelo do gato.', 4);

-- 6. Vacinas
INSERT INTO Vacina (Nome, Data_Aplicacao, Proxima_Dose, ID_Animal) VALUES
('Vacina V8', '2023-01-10', '2023-07-10', 1),
('Vacina Antirrábica', '2023-02-15', '2023-08-15', 2),
('Vacina V8', '2023-03-20', '2023-09-20', 3),
('Vacina Antirrábica', '2023-04-05', '2023-10-05', 4),
('Vacina V10', '2023-06-10', '2023-12-10', 5),
('Vacina Antirrábica', '2023-07-15', '2024-01-15', 6),
('Vacina V8', '2023-08-20', '2024-02-20', 7),
('Vacina Tríplice', '2023-09-10', '2024-03-10', 8),
('Vacina V10', '2023-09-15', '2024-03-15', 9);

-- 7. Procedimentos
INSERT INTO Procedimento (Tipo, Descricao, Data_Inicio, Data_Termino, ID_Animal) VALUES
('Cirurgia', 'Cirurgia para remoção de tumor', '2023-05-01', '2023-05-03', 1),
('Exame', 'Exame de rotina', '2023-06-10', NULL, 2),
('Fisioterapia', 'Sessões de fisioterapia pós-lesão', '2023-04-15', '2023-06-15', 3),
('Exame', 'Avaliação de saúde geral', '2023-07-01', NULL, 4),
('Esterilização', 'Castração preventiva', '2023-06-05', '2023-06-05', 5),  -- Bela (fêmea)
('Esterilização', 'Castração preventiva', '2023-07-10', '2023-07-10', 6),  -- Thor (macho)
('Esterilização', 'Castração preventiva', '2023-08-15', '2023-08-15', 12); -- Daisy (fêmea)
