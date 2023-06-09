CREATE DATABASE lobby;
USE lobby;

CREATE TABLE usuario(
	id INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    senha VARCHAR(100) NOT NULL
);

CREATE TABLE participante(
	id INT PRIMARY KEY,
    id_usuario INT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id)
);

CREATE TABLE administradorGrupo(
	id INT PRIMARY KEY,
    id_usuario INT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id)
);

CREATE TABLE comunidade(
	codigo INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE participanteComunidade(
	id_participante INT NOT NULL,
    id_comunidade INT NOT NULL,
	FOREIGN KEY (id_participante) REFERENCES participante(id),
    FOREIGN KEY (id_comunidade) REFERENCES comunidade(codigo)
);

CREATE TABLE grupo(
	codigo INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    id_adminGrupo INT NOT NULL,
    id_comunidade INT NOT NULL,
	FOREIGN KEY (id_adminGrupo) REFERENCES administradorGrupo(id),
    FOREIGN KEY (id_comunidade) REFERENCES comunidade(codigo)
);

INSERT INTO usuario (id, nome, email, senha)
VALUES (1, 'Marcos', 'marcos@gmail.com', 'marcos123'),
(2, 'Anthony', 'anthony@gmail.com', 'anthony123'),
(3, 'Thiago', 'thiago@yahoo.com', 'thiago123'),
(4, 'Alberto', 'alberto@outlook.com', 'alberto123'),
(5, 'Lucas', 'lucas@hotmail.com', 'lucas123'),
(6, 'Maria', 'maria@hotmail.com', 'maria123');

INSERT INTO participante (id, id_usuario)
VALUES (1, 4), (2, 5), (3, 6);

INSERT INTO administradorGrupo (id, id_usuario)
VALUES (1, 1), (2, 2), (3, 3);

INSERT INTO comunidade (codigo, nome)
VALUES (1, 'Valorant'), (2, 'League of Legends'), (3, 'Minecraft');

INSERT INTO participanteComunidade (id_participante, id_comunidade)
VALUES (1, 1), (2, 1), (3, 2);

INSERT INTO grupo (codigo, nome, id_adminGrupo, id_comunidade)
VALUES (1, 'Valorant Time A', 1, 1),
(2, 'Lolzeiros de AL', 2, 2), (3, 'Em busca da casa automatica', 3, 3);