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

CREATE TABLE Tutor (
    ID_Tutor INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    CPF VARCHAR(14) UNIQUE NOT NULL,
    Telefone VARCHAR(20),
    Endereco VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    Email VARCHAR(255),
    INDEX (Nome)
);

CREATE TABLE Adocao (
    ID_Adocao INT PRIMARY KEY AUTO_INCREMENT,
    Data_Adocao DATE NOT NULL,
    Status_Adocao VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    ID_Animal INT NOT NULL UNIQUE,
    ID_Tutor INT NOT NULL,
    FOREIGN KEY (ID_Animal) REFERENCES Animal(ID_Animal),
    FOREIGN KEY (ID_Tutor) REFERENCES Tutor(ID_Tutor),
    INDEX (Data_Adocao),
    INDEX (Status_Adocao),
    INDEX (ID_Animal),
    INDEX (ID_Tutor)
);

CREATE TABLE Visita_Pos_Adocao (
    ID_Visita INT PRIMARY KEY AUTO_INCREMENT,
    Data_Visita DATE NOT NULL,
    Status_Visita VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    Observacao TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    ID_Adocao INT NOT NULL,
    FOREIGN KEY (ID_Adocao) REFERENCES Adocao(ID_Adocao),
    INDEX (Data_Visita),
    INDEX (Status_Visita),
    INDEX (ID_Adocao)
);

CREATE TABLE Devolucao (
    ID_Devolucao INT PRIMARY KEY AUTO_INCREMENT,
    Data_Devolucao DATE NOT NULL,
    Motivo TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    Observacoes TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    ID_Adocao INT NOT NULL,
    FOREIGN KEY (ID_Adocao) REFERENCES Adocao(ID_Adocao),
    INDEX (Data_Devolucao),
    INDEX (ID_Adocao)
);

SET NAMES utf8mb4;
SET CHARACTER SET utf8mb4;
