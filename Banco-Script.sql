CREATE DATABASE SIMBIOSYS;
USE SIMBIOSYS;

CREATE TABLE usuario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    sobrenome VARCHAR(255) NOT NULL,
    cargo VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    token varchar(255) NOT NULL
);


CREATE TABLE encaminhamento (
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

CREATE TABLE relatorio (
    id INT AUTO_INCREMENT PRIMARY KEY,
    mes_ano VARCHAR(45) NOT NULL UNIQUE,
    data_atualizacao DATETIME NOT NULL,
    aberto BOOLEAN NOT NULL,
    fkencaminhamento INT,
    fkoutros_numeros INT,
    fkacoes_realizadas INT,
    fk_usuario INT,
    FOREIGN KEY (fkencaminhamento) REFERENCES encaminhamento(id),
    FOREIGN KEY (fkoutros_numeros) REFERENCES outros_numeros(id),
    FOREIGN KEY (fkacoes_realizadas) REFERENCES acoes_realizadas(id),
    FOREIGN KEY (fk_usuario) REFERENCES usuario(id) ON DELETE CASCADE
);

-- Exemplos de Inserts:

INSERT INTO usuario (email, nome, sobrenome, cargo, senha)
VALUES 
    ('matheus.torres@sptech.school', 'Matheus', 'Ferro Torres', 'Assistente Social', 'Ferro10'),
    ('reynald.costa@sptech.school', 'Reynald', 'Albuquerque Costa', 'Professor', 'Reynald20'),
    ('marcela.martins@sptech.school', 'Marcela', 'Carneiro de Oliveira Martins', 'Coordenadora', 'Marcela30'),
    ('vitoria.suliman@sptech.school', 'Vitória', 'Lemes Suliman', 'Assistente Social', 'Vitoria40'),
    ('cintia.ohara@sptech.school', 'Cíntia', 'Kaory Ohara', 'Assistente Social', 'Cintia50'),
    ('matheus.csilva@sptech.school', 'Matheus', 'de Castro Silva', 'Assistente Social', 'Castro60');

-- Inserir múltiplos registros na tabela Encaminhamento
INSERT INTO encaminhamento (
    enc_beneficio_prestacao_continuada,
    enc_aposentadoria,
    enc_assistencia_social,
    enc_cursos_profissionalizantes_fora_organizacao,
    enc_cursos_profissionalizantes_dentro_organizacao,
    enc_educacao_nao_formal,
    enc_educacao_formal,
    enc_documentos,
    enc_trabalho,
    enc_geracao_renda,
    enc_saude,
    enc_tratamento_drogas,
    enc_programas_transferencia_renda,
    enc_politicas_publicas
) VALUES 
(5, 3, 7, 2, 4, 6, 8, 5, 7, 3, 10, 1, 4, 2),
(3, 2, 5, 1, 2, 3, 6, 4, 5, 2, 8, 0, 3, 1),
(7, 5, 8, 3, 5, 7, 9, 6, 8, 4, 12, 2, 5, 3);

-- Inserir múltiplos registros na tabela outros_numeros
INSERT INTO outros_numeros (
    alimentacao,
    numero_de_pessoas_presencial,
    cestas_basicas_doadas,
    kits_higiene_doados,
    total_participantes_atividade_distancia,
    total_participantes_atividade_presencial
) VALUES 
(100, 75, 50, 30, 120, 90),
(80, 60, 40, 20, 100, 80),
(120, 90, 60, 40, 140, 100);

-- Inserir múltiplos registros na tabela acoes_realizadas
INSERT INTO acoes_realizadas (
    total_atividades_grupo_virtual,
    total_atividades_culturais_externas,
    total_atividades_culturais_virtuais,
    total_palestras_presenciais,
    total_palestras_virtuais,
    total_visitas_familiares_presenciais,
    total_visitas_familiares_virtuais,
    total_visitas_monitoradas_presenciais,
    total_visitas_monitoradas_virtuais,
    total_cursos_ministrados_presenciais,
    total_cursos_ministrados_virtuais,
    total_pessoas_cursos_capacitacao_presenciais,
    total_pessoas_cursos_capacitacao_virtuais,
    total_pessoas_cursos_profissionalizantes_presenciais,
    total_pessoas_cursos_profissionalizantes_virtuais
) VALUES 
(10, 5, 7, 4, 6, 8, 2, 3, 1, 5, 2, 50, 30, 40, 20),
(12, 6, 8, 5, 7, 9, 3, 4, 2, 6, 3, 55, 35, 45, 25),
(9, 4, 6, 3, 5, 7, 1, 2, 0, 4, 1, 45, 25, 35, 15);

INSERT INTO relatorio (
    mes_ano,
    data_atualizacao,
    aberto,
    fkencaminhamento,
    fkoutros_numeros,
    fkacoes_realizadas,
    fk_usuario
) VALUES 
('01/2025', NOW(), false, 1, 1, 1, 1),
('02/2025', NOW(), false, 2, 2, 2, 1),
('03/2025', NOW(), true, 3, 3, 3, 1);
