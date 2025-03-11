CREATE DATABASE IF NOT EXISTS SistemaONG 
DEFAULT CHARACTER SET utf8mb4 
DEFAULT COLLATE utf8mb4_unicode_ci;

USE SistemaONG;

CREATE TABLE ONG (
    ID_ONG INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    Responsavel VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    Telefone VARCHAR(20),
    Endereco VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    Email VARCHAR(255)
);

CREATE TABLE Animal (
    ID_Animal INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    Especie VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    Raca VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    Porte VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    Peso FLOAT,
    Idade INT,
    Saude VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    Status VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    ID_ONG INT NOT NULL,
    FOREIGN KEY (ID_ONG) REFERENCES ONG(ID_ONG),
    INDEX (Raca),
    INDEX (Status)
);

CREATE TABLE Vacina (
    ID_Vacina INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    Data_Aplicacao DATE NOT NULL,
    Proxima_Dose DATE,
    ID_Animal INT NOT NULL,
    FOREIGN KEY (ID_Animal) REFERENCES Animal(ID_Animal),
    INDEX (Nome),
    INDEX (Data_Aplicacao),
    INDEX (ID_Animal)
);

CREATE TABLE Procedimento (
    ID_Tratamento INT PRIMARY KEY AUTO_INCREMENT,
    Tipo VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    Descricao TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    Data_Inicio DATE NOT NULL,
    Data_Termino DATE,
    ID_Animal INT NOT NULL,
    FOREIGN KEY (ID_Animal) REFERENCES Animal(ID_Animal),
    INDEX (Tipo),
    INDEX (ID_Animal)
);
