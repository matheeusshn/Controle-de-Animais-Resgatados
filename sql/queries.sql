-- Retorna o total de ONGs registradas no sistema.

SELECT COUNT(*) AS Total_ONGs
FROM ONG;

-- Mostra o nome da ONG e a quantidade de animais vinculados a ela.

SELECT O.Nome AS ONG, COUNT(A.ID_Animal) AS Total_Animais
FROM ONG O
JOIN Animal A ON O.ID_ONG = A.ID_ONG
GROUP BY O.Nome;

-- Calcula, para cada ONG, a média de vacinas aplicadas por animal.

SELECT O.Nome AS ONG, AVG(Vacinas) AS Media_Vacinas_por_Animal
FROM (
    SELECT A.ID_ONG, COUNT(V.ID_Vacina) AS Vacinas
    FROM Animal A
    LEFT JOIN Vacina V ON A.ID_Animal = V.ID_Animal
    GROUP BY A.ID_Animal
) AS Sub
JOIN ONG O ON Sub.ID_ONG = O.ID_ONG
GROUP BY O.Nome;