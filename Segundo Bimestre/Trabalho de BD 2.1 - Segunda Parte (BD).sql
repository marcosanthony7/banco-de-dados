ALTER TABLE livros ADD COLUMN editora VARCHAR(100);

ALTER TABLE livros DROP COLUMN ano_publicacao;

UPDATE autores SET nome = "Pedro Alves" WHERE id_autor = 3;

UPDATE livros SET ano_publicacao = "2023" WHERE id_categoria = 1;

DELETE FROM livros WHERE id_livro = 4;