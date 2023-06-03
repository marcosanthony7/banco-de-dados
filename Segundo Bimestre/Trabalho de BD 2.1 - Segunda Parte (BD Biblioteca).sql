CREATE DATABASE biblioteca;

CREATE TABLE autores(
	id_autor INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_nascimento VARCHAR(100) NOT NULL,
    nacionalidade VARCHAR(100) NOT NULL
);

CREATE TABLE categoria(
	id_categoria INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE livros(
	id_livro INT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    id_autor INT NOT NULL,
    id_categoria INT NOT NULL,
    ano_publicacao VARCHAR(100) NOT NULL,
    FOREIGN KEY (id_autor) REFERENCES autores(id_autor),
    FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
);

INSERT INTO autores(id_autor, nome, data_nascimento, nacionalidade)
VALUES (1, "Gabriel Machado", "20/06/1972", "Brasil"),
(2, "John Dixon", "12/04/1954", "Inglaterra"),
(3, "Pedro Peixoto", "05/12/1997", "Brasil");

INSERT INTO categoria(id_categoria, nome)
VALUES (1, "Romance"), (2, "Mistério"), (3, "Aventura");

INSERT INTO livros(id_livro, titulo, id_autor, id_categoria, ano_publicacao)
VALUES (1, "Rosas Vermelhas", 1, 1, "1999"), (2, "Alma Gêmea", 1, 1, "2012"),
(3, "A Casa Assombrada", 2, 2, "1987"), (4, "O Desaparecimento do Prefeito", 2, 2, "2005"),
(5, "O Viajante do Tempo", 3, 3, "2014"), (6, "Tarzan", 3, 3, "2022");
