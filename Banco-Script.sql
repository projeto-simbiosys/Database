CREATE DATABASE SIMBIOSYS;
USE SIMBIOSYS;

CREATE TABLE Usuario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL
);

CREATE TABLE Encaminhamento (
    id INT AUTO_INCREMENT PRIMARY KEY,
    encBeneficioPrestacaoContinuada INT,
    encAposentadoria INT,
    encAssistenciaSocial INT,
    encCursosProfissionalizantesForaOrganizacao INT,
    encCursosProfissionalizantesDentroOrganizacao INT,
    encEducacaoNaoFormal INT,
    encEducacaoFormal INT,
    encDocumentos INT,
    encTrabalho INT,
    encGeracaoRenda INT,
    encSaude INT,
    encTratamentoDrogas INT,
    encProgramasTransferenciaRenda INT,
    encPoliticasPublicas INT
);

CREATE TABLE OutrosNumeros (
    id INT AUTO_INCREMENT PRIMARY KEY,
    alimentacao INT,
    numeroDePessoasPresencial INT,
    cestasBasicasDoadas INT,
    kitsHigieneDoados INT,
    totalParticipantesAtividadeDistancia INT,
    totalParticipantesAtividadePresencial INT
);

CREATE TABLE AcoesRealizadas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    totalAtividadesGrupoVirtual INT,
    totalAtividadesCulturaisExternas INT,
    totalAtividadesCulturaisVirtuais INT,
    totalPalestrasPresenciais INT,
    totalPalestrasVirtuais INT,
    totalVisitasFamiliaresPresenciais INT,
    totalVisitasFamiliaresVirtuais INT,
    totalVisitasMonitoradasPresenciais INT,
    totalVisitasMonitoradasVirtuais INT,
    totalCursosMinistradosPresenciais INT,
    totalCursosMinistradosVirtuais INT,
    totalPessoasCursosCapacitacaoPresenciais INT,
    totalPessoasCursosCapacitacaoVirtuais INT,
    totalPessoasCursosProfissionalizantesPresenciais INT,
    totalPessoasCursosProfissionalizantesVirtuais INT
);

CREATE TABLE Relatorio (
    id INT AUTO_INCREMENT PRIMARY KEY,
    mesAno VARCHAR(7) NOT NULL UNIQUE,
    dataAtualizacao DATETIME NOT NULL,
    FKencaminhamento INT,
    FKoutrosNumeros INT,
    FKacoesRealizadas INT,
    FOREIGN KEY (FKencaminhamento) REFERENCES Encaminhamento(id),
    FOREIGN KEY (FKoutrosNumeros) REFERENCES OutrosNumeros(id),
    FOREIGN KEY (FKacoesRealizadas) REFERENCES AcoesRealizadas(id),
    fkUsuario INT,
    FOREIGN KEY (fkUsuario) REFERENCES Usuario(id) ON DELETE CASCADE
);

CREATE TABLE Atividade (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    descricao TEXT,
    dataInicio DATE NOT NULL,
    dataFim DATE NOT NULL
);

-- Exemplos de Inserts:

INSERT INTO USUARIO (EMAIL, NOME, SENHA)
VALUES 
    ('matheus.torres@sptech.school', 'MATHEUS FERRO TORRES', 'Ferro10'),
    ('reynald.costa@sptech.school', 'REYNALD ALBUQUERQUE COSTA', 'Reynald20'),
    ('marcela.martins@sptech.school', 'MARCELA CARNEIRO DE OLIVEIRA MARTINS', 'Marcela30'),
    ('vitoria.suliman@sptech.school', 'VITÓRIA LEMES SULIMAN', 'Vitoria40'),
    ('cintia.ohara@sptech.school', 'CINTIA KAORY OHARA', 'Cintia50'),
    ('matheus.csilva@sptech.school', 'MATHEUS DE CASTRO SILVA', 'Castro60');


