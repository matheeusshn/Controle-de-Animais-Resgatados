USE sistemaong;

-- Dashboard das ONGs

-- Retorna o total de ONGs registradas no sistema.

SELECT COUNT(*) AS Total_ONGs
FROM ONG;

-- Mostra o nome da ONG e a quantidade de animais vinculados a ela.

SELECT O.Nome AS ONG, COUNT(A.ID_Animal) AS Total_Animais
FROM ONG O
JOIN Animal A ON O.ID_ONG = A.ID_ONG
GROUP BY O.Nome;

-- Calcula, para cada ONG, a média de vacinas aplicadas por animal.

SELECT O.Nome AS ONG, ROUND(AVG(Vacinas), 2) AS Media_Vacinas_por_Animal
FROM (
    SELECT A.ID_ONG, COUNT(V.ID_Vacina) AS Vacinas
    FROM Animal A
    LEFT JOIN Vacina V ON A.ID_Animal = V.ID_Animal
    GROUP BY A.ID_Animal
) AS Sub
JOIN ONG O ON Sub.ID_ONG = O.ID_ONG
GROUP BY O.Nome;

-- Dashboard dos Animais

-- Agrupa os animais pela espécie e retorna a contagem de cada.

SELECT Especie, COUNT(*) AS Total_Animais
FROM Animal
GROUP BY Especie;

-- Calcula a idade média dos animais para cada espécie.

SELECT Especie, ROUND(AVG(Idade), 2) AS Media_Idade
FROM Animal
GROUP BY Especie;

-- Exibe a quantidade de animais em cada status (Disponível, Adotado, Em Tratamento, etc.).

SELECT Status, COUNT(*) AS Quantidade
FROM Animal
GROUP BY Status;

-- Dashboard das Vacinas

-- Agrupa as vacinas pela data de aplicação (mês/ano) e conta quantas foram aplicadas em cada período.

SELECT DATE_FORMAT(Data_Aplicacao, '%Y-%m') AS Mes, COUNT(*) AS Total_Vacinas
FROM Vacina
GROUP BY Mes;

-- Lista os animais, a vacina aplicada, a data da aplicação e a próxima dose, com todas as vacinas aplicadas.
SELECT 
    A.Nome AS Animal, 
    V.Nome AS Vacina, 
    V.Data_Aplicacao, 
    V.Proxima_Dose,
    IF(V.Proxima_Dose IS NULL, 'Sem próxima dose', 
        CASE 
            WHEN V.Proxima_Dose < CURDATE() THEN 'Atrasada'
            WHEN V.Proxima_Dose = CURDATE() THEN 'Vence Hoje'
            ELSE 'Dentro do Prazo'
        END
    ) AS Status_Vacina
FROM Vacina V
JOIN Animal A ON V.ID_Animal = A.ID_Animal
ORDER BY V.Proxima_Dose;

-- Agrupa as vacinas pelo nome (tipo) e retorna a quantidade de aplicações de cada.

SELECT Nome, COUNT(*) AS Total_Aplicacoes
FROM Vacina
GROUP BY Nome;

-- Dashboard dos Procedimentos

-- Exibe o total de procedimentos realizados, agrupados pelo tipo (Cirurgia, Exame, etc.).

SELECT Tipo, COUNT(*) AS Total_Procedimentos
FROM Procedimento
GROUP BY Tipo;

-- Faz a junção entre Procedimento, Animal e ONG para mostrar quantos procedimentos de cada tipo foram realizados por cada ONG.

SELECT O.Nome AS ONG, P.Tipo, COUNT(*) AS Total_Procedimentos
FROM Procedimento P
JOIN Animal A ON P.ID_Animal = A.ID_Animal
JOIN ONG O ON A.ID_ONG = O.ID_ONG
GROUP BY O.Nome, P.Tipo;

-- Calcula, para cada tipo de procedimento, a média de duração (em dias) entre a data de início e a data de término, considerando apenas os procedimentos finalizados.

SELECT Tipo, ROUND(AVG(DATEDIFF(Data_Termino, Data_Inicio)), 2) AS Media_Duracao_Dias
FROM Procedimento
WHERE Data_Termino IS NOT NULL
GROUP BY Tipo;

-- Dashboard dos Tutores

-- Exibe cada tutor e a quantidade de adoções associadas a ele.

SELECT T.Nome AS Tutor, COUNT(*) AS Total_Adocoes
FROM Tutor T
JOIN Adocao A ON T.ID_Tutor = A.ID_Tutor
GROUP BY T.Nome;

-- Calcula a idade média dos animais adotados por cada tutor.

SELECT T.Nome AS Tutor, ROUND(AVG(An.Idade), 2) AS Media_Idade_Animais
FROM Tutor T
JOIN Adocao A ON T.ID_Tutor = A.ID_Tutor
JOIN Animal An ON A.ID_Animal = An.ID_Animal
GROUP BY T.Nome;

-- Exibe os tutores que tiveram devoluções e quantas ocorreram, considerando a ligação entre Adocao e Devolucao.

SELECT T.Nome AS Tutor, COUNT(D.ID_Devolucao) AS Total_Devolucoes
FROM Tutor T
JOIN Adocao A ON T.ID_Tutor = A.ID_Tutor
JOIN Devolucao D ON A.ID_Adocao = D.ID_Adocao
GROUP BY T.Nome;

-- Dashboard das Adoções

-- Agrupa as adoções pelo status (Concluída, Em Andamento, etc.) e retorna a contagem de cada.

SELECT Status_Adocao, COUNT(*) AS Total_Adocoes
FROM Adocao
GROUP BY Status_Adocao;

-- Agrupa as adoções pela data (mês/ano) e mostra quantas foram realizadas em cada período.

SELECT DATE_FORMAT(Data_Adocao, '%Y-%m') AS Mes, COUNT(*) AS Total_Adocoes
FROM Adocao
GROUP BY Mes;

-- Calcula a média de dias entre a data de adoção e a data atual para as adoções que ainda estão em andamento.

SELECT ROUND(AVG(DATEDIFF(CURDATE(), Data_Adocao)), 2) AS Media_Dias_Aguardando
FROM Adocao
WHERE Status_Adocao = 'Em Andamento';

-- Dashboard de Visitas Pós-Adoção e Devoluções

-- Contagem de animais disponíveis para adoção e seus status, agrupados por ONG

SELECT 
    O.Nome AS ONG, 
    COUNT(*) AS Total_Animais, 
    SUM(CASE WHEN A.Status = 'Disponível' THEN 1 ELSE 0 END) AS Animais_Disponiveis,
    SUM(CASE WHEN A.Status = 'Adotado' THEN 1 ELSE 0 END) AS Animais_Adotados,
    SUM(CASE WHEN A.Status = 'Em Tratamento' THEN 1 ELSE 0 END) AS Animais_Em_Tratamento
FROM Animal A
JOIN ONG O ON A.ID_ONG = O.ID_ONG
GROUP BY O.Nome;

-- Calcula o tempo médio que o animal ficou com o tutor antes de ser devolvido.
SELECT 
    COUNT(*) AS Total_Devolucoes, 
    ROUND(AVG(DATEDIFF(D.Data_Devolucao, A.Data_Adocao)), 2) AS Media_Dias_Ate_Devolucao
FROM Devolucao D
JOIN Adocao A ON D.ID_Adocao = A.ID_Adocao;

-- Agrupa as devoluções pelo motivo e retorna a quantidade de cada motivo, possibilitando identificar os principais motivos de devolução.

SELECT Motivo, COUNT(*) AS Total_Devolucoes
FROM Devolucao
GROUP BY Motivo;
