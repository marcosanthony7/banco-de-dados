# Inserir dados de usuários
INSERT INTO usuario (nome_usuario, email, senha, nome_exibido, foto, banner, descricao, titulo, avaliacao)
VALUES
    ('marcos123', 'marcos@gmail.com', 'marcos123', 'Marcos Silva', 'foto_marcos.jpg', 'banner_marcos.jpg', 'Descrição do Marcos', 'Título do Marcos', 4),
    ('anthony123', 'anthony@gmail.com', 'anthony123', 'Anthony Santos', 'foto_anthony.jpg', 'banner_anthony.jpg', 'Descrição do Anthony', 'Título do Anthony', 5),
    ('thiago123', 'thiago@yahoo.com', 'thiago123', 'Thiago Oliveira', 'foto_thiago.jpg', 'banner_thiago.jpg', 'Descrição do Thiago', 'Título do Thiago', 3),
    ('alberto123', 'alberto@outlook.com', 'alberto123', 'Alberto Pereira', 'foto_alberto.jpg', 'banner_alberto.jpg', 'Descrição do Alberto', 'Título do Alberto', 5),
    ('lucas123', 'lucas@hotmail.com', 'lucas123', 'Lucas Souza', 'foto_lucas.jpg', 'banner_lucas.jpg', 'Descrição do Lucas', 'Título do Lucas', 4),
    ('maria123', 'maria@hotmail.com', 'maria123', 'Maria Lima', 'foto_maria.jpg', 'banner_maria.jpg', 'Descrição da Maria', 'Título da Maria', 4),
    ('fernanda123', 'fernanda@gmail.com', 'fernanda123', 'Fernanda Oliveira', 'foto_fernanda.jpg', 'banner_fernanda.jpg', 'Descrição da Fernanda', 'Título da Fernanda', 4),
    ('joao123', 'joao@gmail.com', 'joao123', 'João Santos', 'foto_joao.jpg', 'banner_joao.jpg', 'Descrição do João', 'Título do João', 5),
    ('carla123', 'carla@yahoo.com', 'carla123', 'Carla Pereira', 'foto_carla.jpg', 'banner_carla.jpg', 'Descrição da Carla', 'Título da Carla', 3),
    ('gabriel123', 'gabriel@outlook.com', 'gabriel123', 'Gabriel Souza', 'foto_gabriel.jpg', 'banner_gabriel.jpg', 'Descrição do Gabriel', 'Título do Gabriel', 5),
    ('ana123', 'ana@hotmail.com', 'ana123', 'Ana Lima', 'foto_ana.jpg', 'banner_ana.jpg', 'Descrição da Ana', 'Título da Ana', 4);

# Inserir dados de participantes
INSERT INTO participante (id_usuario)
VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10), (11);

# Inserir dados de administradores de grupos
INSERT INTO administradorGrupo (id_usuario)
VALUES (1), (2), (3), (4), (5), (6);

# Inserir dados de comunidades
INSERT INTO comunidade (nome, foto, banner, descricao)
VALUES
    ('Valorant', 'foto_valorant.jpg', 'banner_valorant.jpg', 'Comunidade de Valorant'),
    ('League of Legends', 'foto_lol.jpg', 'banner_lol.jpg', 'Comunidade de League of Legends'),
    ('Minecraft', 'foto_minecraft.jpg', 'banner_minecraft.jpg', 'Comunidade de Minecraft'),
    ('CS:GO', 'foto_csgo.jpg', 'banner_csgo.jpg', 'Comunidade de CS:GO'),
    ('Overwatch', 'foto_overwatch.jpg', 'banner_overwatch.jpg', 'Comunidade de Overwatch'),
    ('Fortnite', 'foto_fortnite.jpg', 'banner_fortnite.jpg', 'Comunidade de Fortnite');

# Inserir dados de grupos
INSERT INTO grupo (nome, foto, banner, descricao, id_adminGrupo, id_comunidade)
VALUES
    ('Valorant Time A', 'foto_grupo_valorant.jpg', 'banner_grupo_valorant.jpg', 'Grupo de Valorant', 1, 1),
    ('Lolzeiros de AL', 'foto_grupo_lol.jpg', 'banner_grupo_lol.jpg', 'Grupo de League of Legends', 2, 2),
    ('Em busca da casa automática', 'foto_grupo_minecraft.jpg', 'banner_grupo_minecraft.jpg', 'Grupo de Minecraft', 3, 3),
    ('CS:GO Team A', 'foto_grupo_csgo.jpg', 'banner_grupo_csgo.jpg', 'Equipe de CS:GO', 4, 4),
    ('Overwatch Squad', 'foto_grupo_overwatch.jpg', 'banner_grupo_overwatch.jpg', 'Time de Overwatch', 5, 5),
    ('Fortnite Warriors', 'foto_grupo_fortnite.jpg', 'banner_grupo_fortnite.jpg', 'Clã de Fortnite', 6, 6);

# Inserir dados de participantes de comunidades
INSERT INTO participanteComunidade (id_participante, id_comunidade)
VALUES (1, 1), (2, 1), (3, 2), (4, 2), (5, 3), (6, 3), (7, 4), (8, 4), (9, 5), (10, 5), (11, 6);

# Inserir dados de postagens
INSERT INTO postagens (id_usuario, foto, link_video, descricao, likes)
VALUES
    (1, 'foto_postagem1.jpg', NULL, 'Postagem de Marcos', 10),
    (2, 'foto_postagem2.jpg', NULL, 'Postagem de Anthony', 15),
    (3, 'foto_postagem3.jpg', NULL, 'Postagem de Thiago', 8),
    (4, 'foto_postagem4.jpg', NULL, 'Nova conquista no CS:GO!', 20),
    (5, 'foto_postagem5.jpg', NULL, 'Overwatch é demais!', 25),
    (6, 'foto_postagem6.jpg', NULL, 'Fortnite Battle Royale', 18);

# Inserir dados de comentários
INSERT INTO comentarios (id_usuario, id_postagem, comentario)
VALUES
    (1, 1, 'Ótima postagem!'),
    (2, 1, 'Gostei muito também!'),
    (3, 2, 'Excelente foto!'),
    (4, 3, 'Parabéns pela conquista!'),
    (5, 4, 'Quero jogar CS:GO com vocês!'),
    (6, 5, 'Overwatch é meu jogo favorito!');

# Inserir dados de salas de jogo
INSERT INTO salaJogo (horario, nome_jogo, quant_jogadores, quant_disponivel)
VALUES
    ('2023-10-10 19:00:00', 'Valorant', 5, 3),
    ('2023-10-12 20:00:00', 'League of Legends', 10, 7),
    ('2023-10-15 21:00:00', 'CS:GO', 5, 2),
    ('2023-10-17 19:30:00', 'Overwatch', 6, 4),
    ('2023-10-20 20:00:00', 'Fortnite', 10, 8);

# Inserir dados de canais de voz
INSERT INTO canalVoz (nome, id_grupo)
VALUES
    ('Canal Valorant', 1),
    ('Canal LOL', 2),
    ('Canal Fortnite', 3),
    ('Sala CS:GO', 4),
    ('Sala Overwatch', 5),
    ('Sala Fortnite', 6);

# Inserir dados de notificações
INSERT INTO notificacao (id_usuario, tipo)
VALUES (1, 1), (2, 2), (3, 1), (4, 2), (5, 1),
    (6, 2), (7, 1), (8, 2), (9, 1), (10, 2), (11, 1);