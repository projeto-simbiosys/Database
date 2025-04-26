CREATE DATABASE SIMBIOSYS;
USE SIMBIOSYS;

CREATE TABLE usuario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    sobrenome VARCHAR(255) NOT NULL,
    cargo VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE unique,
    senha VARCHAR(255) NOT NULL
);


CREATE TABLE Encaminhamento (
    id INT AUTO_INCREMENT PRIMARY KEY,
    enc_beneficio_prestacao_continuada INT,
    enc_aposentadoria INT,
    enc_assistencia_social INT,
    enc_cursos_profissionalizantes_fora_organizacao INT,
    enc_cursos_profissionalizantes_dentro_organizacao INT,
    enc_educacao_nao_formal INT,
    enc_educacao_formal INT,
    enc_documentos INT,
    enc_trabalho INT,
    enc_geracao_renda INT,
    enc_saude INT,
    enc_tratamento_drogas INT,
    enc_programas_transferencia_renda INT,
    enc_politicas_publicas INT
);


CREATE TABLE outros_numeros (
    id INT AUTO_INCREMENT PRIMARY KEY,
    alimentacao INT,
    numero_de_pessoas_presencial INT,
    cestas_basicas_doadas INT,
    kits_higiene_doados INT,
    total_participantes_atividade_distancia INT,
    total_participantes_atividade_presencial INT
);



CREATE TABLE acoes_realizadas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    total_atividades_grupo_virtual INT,
    total_atividades_culturais_externas INT,
    total_atividades_culturais_virtuais INT,
    total_palestras_presenciais INT,
    total_palestras_virtuais INT,
    total_visitas_familiares_presenciais INT,
    total_visitas_familiares_virtuais INT,
    total_visitas_monitoradas_presenciais INT,
    total_visitas_monitoradas_virtuais INT,
    total_cursos_ministrados_presenciais INT,
    total_cursos_ministrados_virtuais INT,
    total_pessoas_cursos_capacitacao_presenciais INT,
    total_pessoas_cursos_capacitacao_virtuais INT,
    total_pessoas_cursos_profissionalizantes_presenciais INT,
    total_pessoas_cursos_profissionalizantes_virtuais INT
);

CREATE TABLE Relatorio (
    id INT AUTO_INCREMENT PRIMARY KEY,
    mes_ano VARCHAR(45) NOT NULL UNIQUE,
    data_atualizacao DATETIME NOT NULL,
    fkencaminhamento INT,
    fkoutros_numeros INT,
    fkacoes_realizadas INT,
    FOREIGN KEY (FKencaminhamento) REFERENCES Encaminhamento(id),
    FOREIGN KEY (fkoutros_numeros) REFERENCES outros_numeros(id),
    FOREIGN KEY (fkacoes_realizadas) REFERENCES acoes_realizadas(id),
    fk_usuario INT,
    FOREIGN KEY (fk_usuario) REFERENCES Usuario(id) ON DELETE CASCADE
);

-- Exemplos de Inserts:

INSERT INTO USUARIO (EMAIL, NOME, SENHA)
VALUES 
    ('matheus.torres@sptech.school', 'MATHEUS', 'FERRO TORRES', 'Assistente Social','Ferro10'),
    ('reynald.costa@sptech.school', 'REYNALD', 'ALBUQUERQUE COSTA', 'Professor', 'Reynald20'),
    ('marcela.martins@sptech.school', 'MARCELA', 'CARNEIRO DE OLIVEIRA MARTINS', 'Coordenadora', 'Marcela30'),
    ('vitoria.suliman@sptech.school', 'VITÓRIA', 'LEMES SULIMAN', 'Assistente Social', 'Vitoria40'),
    ('cintia.ohara@sptech.school', 'CINTIA', 'KAORY OHARA', 'Assistente Social','Cintia50'),
    ('matheus.csilva@sptech.school', 'MATHEUS', 'DE CASTRO SILVA', 'Assistente Social','Castro60');


