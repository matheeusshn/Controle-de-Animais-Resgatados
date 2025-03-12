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
