CREATE DATABASE Lobby;
USE Lobby;

CREATE TABLE Usuario(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE,
    senha VARCHAR(50) NOT NULL,
	apelido VARCHAR(50),
    foto VARCHAR(100),
    banner VARCHAR(100),
    descricao VARCHAR(200),
    titulo VARCHAR(50),
	avaliacao INT,
    seguidores INT,
    seguindo INT
);

CREATE TABLE Participante(
	id INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id)
);

CREATE TABLE AdministradorGrupo(
	id INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id)
);

CREATE TABLE Comunidade(
	codigo INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    foto VARCHAR(100),
    banner VARCHAR(100),
	descricao VARCHAR(200)
);

CREATE TABLE ParticipanteComunidade(
	id_participante INT NOT NULL,
    id_comunidade INT NOT NULL,
	FOREIGN KEY (id_participante) REFERENCES Participante(id),
    FOREIGN KEY (id_comunidade) REFERENCES Comunidade(codigo)
);

CREATE TABLE Grupo(
	codigo INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    foto VARCHAR(100),
    banner VARCHAR(100),
	descricao VARCHAR(200),
    id_adminGrupo INT NOT NULL,
    id_comunidade INT NOT NULL,
	FOREIGN KEY (id_adminGrupo) REFERENCES AdministradorGrupo(id),
    FOREIGN KEY (id_comunidade) REFERENCES Comunidade(codigo)
);

CREATE TABLE Amigos(
	FK_id_usuario1 INT NOT NULL,
    FK_id_usuario2 INT NOT NULL,
    FOREIGN KEY(FK_id_usuario1) REFERENCES Usuario(id),
    FOREIGN KEY(FK_id_usuario2) REFERENCES Usuario(id),
    PRIMARY KEY(FK_id_usuario1, FK_id_usuario2)
);

CREATE TABLE Mensagens(
	FK_id_origem INT NOT NULL,
    FK_id_destino INT NOT NULL,
    mensagem VARCHAR(100),
    FOREIGN KEY(FK_id_origem) REFERENCES Usuario(id),
    FOREIGN KEY(FK_id_destino) REFERENCES Usuario(id),
    PRIMARY KEY(FK_id_origem, FK_id_destino)
);

CREATE TABLE Postagens(
	id INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    foto VARCHAR(100),
    link_video VARCHAR(100),
    descricao VARCHAR(200),
    likes INT,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id)
);

INSERT INTO Usuario (id, nome, email, senha)
VALUES (1, 'Marcos', 'marcos@gmail.com', 'marcos123'),
(2, 'Anthony', 'anthony@gmail.com', 'anthony123'),
(3, 'Thiago', 'thiago@yahoo.com', 'thiago123'),
(4, 'Alberto', 'alberto@outlook.com', 'alberto123'),
(5, 'Lucas', 'lucas@hotmail.com', 'lucas123'),
(6, 'Maria', 'maria@hotmail.com', 'maria123');

INSERT INTO Participante (id, id_usuario)
VALUES (1, 4), (2, 5), (3, 6);

INSERT INTO AdministradorGrupo (id, id_usuario)
VALUES (1, 1), (2, 2), (3, 3);

INSERT INTO Comunidade (codigo, nome)
VALUES (1, 'Valorant'), (2, 'League of Legends'), (3, 'Minecraft');

INSERT INTO ParticipanteComunidade (id_participante, id_comunidade)
VALUES (1, 1), (2, 1), (3, 2);

INSERT INTO Grupo (codigo, nome, id_adminGrupo, id_comunidade)
VALUES (1, 'Valorant Time A', 1, 1),
(2, 'Lolzeiros de AL', 2, 2), (3, 'Em busca da casa automatica', 3, 3);