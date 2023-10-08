CREATE DATABASE lobby;
USE lobby;

CREATE TABLE usuario(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome_usuario VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE,
    senha VARCHAR(50) NOT NULL,
    nome_exibido VARCHAR(50),
    foto VARCHAR(100),
    banner VARCHAR(100),
    descricao VARCHAR(200),
    titulo VARCHAR(50),
	avaliacao INT
);

CREATE TABLE participante(
	id INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id)
);

CREATE TABLE administradorGrupo(
	id INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id)
);

CREATE TABLE comunidade(
	codigo INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    foto VARCHAR(100),
    banner VARCHAR(100),
	descricao VARCHAR(200)
);

CREATE TABLE participanteComunidade(
	id_participante INT NOT NULL,
    id_comunidade INT NOT NULL,
	FOREIGN KEY (id_participante) REFERENCES participante(id),
    FOREIGN KEY (id_comunidade) REFERENCES comunidade(codigo)
);

CREATE TABLE grupo(
	codigo INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    foto VARCHAR(100),
    banner VARCHAR(100),
	descricao VARCHAR(200),
    id_adminGrupo INT NOT NULL,
    id_comunidade INT NOT NULL,
	FOREIGN KEY (id_adminGrupo) REFERENCES administradorGrupo(id),
    FOREIGN KEY (id_comunidade) REFERENCES comunidade(codigo)
);

CREATE TABLE participanteGrupo(
	id_participante INT NOT NULL,
    id_grupo INT NOT NULL,
	FOREIGN KEY (id_participante) REFERENCES participante(id),
    FOREIGN KEY (id_grupo) REFERENCES grupo(codigo)
);

CREATE TABLE amigos(
	FK_id_usuario1 INT NOT NULL,
    FK_id_usuario2 INT NOT NULL,
    FOREIGN KEY(FK_id_usuario1) REFERENCES usuario(id),
    FOREIGN KEY(FK_id_usuario2) REFERENCES usuario(id),
    PRIMARY KEY(FK_id_usuario1, FK_id_usuario2)
);

CREATE TABLE mensagens(
	FK_id_origem INT NOT NULL,
    FK_id_destino INT NOT NULL,
    mensagem VARCHAR(100),
    FOREIGN KEY(FK_id_origem) REFERENCES usuario(id),
    FOREIGN KEY(FK_id_destino) REFERENCES usuario(id),
    PRIMARY KEY(FK_id_origem, FK_id_destino)
);

CREATE TABLE postagens(
	id INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    foto VARCHAR(100),
    link_video VARCHAR(100),
    descricao VARCHAR(200),
    likes INT,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id)
);

CREATE TABLE comentarios(
	id INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    id_postagem INT,
    comentario VARCHAR(200),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id),
    FOREIGN KEY (id_postagem) REFERENCES postagens(id)
);

CREATE TABLE salaJogo(
	id INT AUTO_INCREMENT PRIMARY KEY,
    horario DATETIME NOT NULL,
    nome_jogo VARCHAR(50) NOT NULL,
    quant_jogadores INT NOT NULL,
    quant_disponivel INT
);

CREATE TABLE canalVoz(
	id INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(50) NOT NULL,
	id_grupo INT NOT NULL,
    FOREIGN KEY (id_grupo) REFERENCES grupo(codigo)
);

CREATE TABLE notificacao(
	id INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    tipo INT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id)
);

# Inserts antigos abaixo:

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