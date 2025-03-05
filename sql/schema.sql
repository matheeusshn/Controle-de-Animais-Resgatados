CREATE DATABASE IF NOT EXISTS SistemaONG;
USE SistemaONG;

CREATE TABLE ONG (
    ID_ONG INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(255) NOT NULL,
    Responsavel VARCHAR(255) NOT NULL,
    Telefone VARCHAR(20),
    Endereco VARCHAR(255),
    Email VARCHAR(255)
);

CREATE TABLE Animal (
    ID_Animal INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Especie VARCHAR(100) NOT NULL,
    Raca VARCHAR(100) NOT NULL,
    Porte VARCHAR(50),
    Peso FLOAT,
    Idade INT,
    Saude VARCHAR(255),
    Status VARCHAR(100) NOT NULL,
    ID_ONG INT NOT NULL,
    FOREIGN KEY (ID_ONG) REFERENCES ONG(ID_ONG),
    INDEX (Raca),
    INDEX (Status)
);

CREATE TABLE Vacina (
    ID_Vacina INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(255) NOT NULL,
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
    Tipo VARCHAR(100) NOT NULL,
    Descricao TEXT,
    Data_Inicio DATE NOT NULL,
    Data_Termino DATE,
    ID_Animal INT NOT NULL,
    FOREIGN KEY (ID_Animal) REFERENCES Animal(ID_Animal),
    INDEX (Tipo),
    INDEX (ID_Animal)
);

CREATE TABLE Tutor (
    ID_Tutor INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(255) NOT NULL,
    CPF VARCHAR(14) UNIQUE NOT NULL,
    Telefone VARCHAR(20),
    Endereco VARCHAR(255),
    Email VARCHAR(255),
    INDEX (Nome)
);

CREATE TABLE Adocao (
    ID_Adocao INT PRIMARY KEY AUTO_INCREMENT,
    Data_Adocao DATE NOT NULL,
    Status_Adocao VARCHAR(100) NOT NULL,
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
    Status_Visita VARCHAR(100) NOT NULL,
    Observacao TEXT,
    ID_Adocao INT NOT NULL,
    FOREIGN KEY (ID_Adocao) REFERENCES Adocao(ID_Adocao),
    INDEX (Data_Visita),
    INDEX (Status_Visita),
    INDEX (ID_Adocao)
);

CREATE TABLE Devolucao (
    ID_Devolucao INT PRIMARY KEY AUTO_INCREMENT,
    Data_Devolucao DATE NOT NULL,
    Motivo TEXT NOT NULL,
    Observacoes TEXT,
    ID_Adocao INT NOT NULL,
    FOREIGN KEY (ID_Adocao) REFERENCES Adocao(ID_Adocao),
    INDEX (Data_Devolucao),
    INDEX (ID_Adocao)
);

