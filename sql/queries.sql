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