CREATE DATABASE SIMBIOSYS;
USE SIMBIOSYS;

CREATE TABLE EMPRESA (
	idEMPRESA INT PRIMARY KEY AUTO_INCREMENT,
	RAZAO VARCHAR(100) NOT NULL,
    CNPJ CHAR(14) NOT NULL UNIQUE
);

CREATE TABLE CARGO (
    idCARGO INT AUTO_INCREMENT PRIMARY KEY,
    NOME VARCHAR(50) CONSTRAINT CHK_NOME CHECK (NOME IN ('Técnico', 'Gerente', 'Administrador'))
);

ALTER TABLE CARGO ADD CONSTRAINT CHK_NOME_CARGO CHECK (NOME IN ('Técnico', 'Gerente', 'Administrador'));
INSERT INTO CARGO (NOME) VALUES ('Técnico'), ('Gerente'), ('Administrador');

CREATE TABLE USUARIO (
    idUSUARIO INT,
    EMAIL VARCHAR(80) NOT NULL UNIQUE,
    NOME VARCHAR(80) NOT NULL,
    SENHA VARCHAR(60) NOT NULL, 
    fkCARGO INT NOT NULL,
    FOREIGN KEY (fkCARGO) REFERENCES CARGO(idCARGO),
    fkEMPRESA INT NOT NULL,
    PRIMARY KEY (idUSUARIO, fkEMPRESA),
    FOREIGN KEY (fkEMPRESA) REFERENCES EMPRESA(idEMPRESA)
);

ALTER TABLE USUARIO MODIFY COLUMN idUSUARIO INT auto_increment;

INSERT INTO Empresa (RAZAO, CNPJ)
VALUES ('SIMBIOSYS', 'NULL');

INSERT INTO USUARIO (EMAIL, NOME, SENHA, fkCARGO, fkEMPRESA)
VALUES 
    ('matheus.torres@sptech.school', 'MATHEUS FERRO TORRES', 'Ferro10', 3, 1),
    ('reynald.costa@sptech.school', 'REYNALD ALBUQUERQUE COSTA', 'Reynald20', 3, 1),
    ('marcela.martins@sptech.school', 'MARCELA CARNEIRO DE OLIVEIRA MARTINS', 'Marcela30', 3, 1),
    ('vitoria.suliman@sptech.school', 'VITÓRIA LEMES SULIMAN', 'Vitoria40', 3, 1),
    ('cintia.ohara@sptech.school', 'CINTIA KAORY OHARA', 'Cintia50', 3, 1),
    ('matheus.csilva@sptech.school', 'MATHEUS DE CASTRO SILVA', 'Castro50', 3, 1);
    
    -- Tabelas do Sistema:
    
CREATE TABLE Aluno (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    dataNascimento DATE NOT NULL,
    rg VARCHAR(20) UNIQUE NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    escolaridade VARCHAR(100),
    endereco VARCHAR(255),
    telefone VARCHAR(20),
    email VARCHAR(255) UNIQUE
);

CREATE TABLE Atividade (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    descricao TEXT,
    dataInicio DATE NOT NULL,
    dataFim DATE NOT NULL
);

CREATE TABLE Inscricao (
    id INT AUTO_INCREMENT PRIMARY KEY,
    aluno_id INT NOT NULL,
    atividade_id INT NOT NULL,
    data_inscricao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (aluno_id) REFERENCES Aluno(id) ON DELETE CASCADE,
    FOREIGN KEY (atividade_id) REFERENCES Atividade(id) ON DELETE CASCADE,
    UNIQUE (aluno_id, atividade_id)
);

-- Exemplos de Insert

INSERT INTO Aluno (nome, dataNascimento, rg, cpf, escolaridade, endereco, telefone, email)
VALUES ('João Silva', '2000-05-15', '1234567', '123.456.789-00', 'Ensino Médio', 'Rua A, 100', '(11) 99999-9999', 'joao@email.com');

INSERT INTO Atividade (nome, descricao, dataInicio, dataFim)
VALUES ('Curso de Java', 'Aprenda Java do zero', '2024-03-01', '2024-06-30');

INSERT INTO Inscricao (aluno_id, atividade_id)
VALUES (1, 1);


