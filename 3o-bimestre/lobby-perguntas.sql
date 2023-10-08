# Liste o histórico de lobbys de um determinado jogador
SELECT s.*
FROM salaJogo s
INNER JOIN participante p ON s.id = p.id
INNER JOIN usuario u ON p.id_usuario = u.id
WHERE u.nome = 'Marcos';

# Liste as partidas disponíveis para um determinado jogo
SELECT *
FROM salaJogo
WHERE nome_jogo = 'Valorant' AND quant_jogadores > 0;

# Liste todos os lobbys de Valorant procurando 2 jogadores para iniciar hoje a noite
SELECT *
FROM salaJogo
WHERE nome_jogo = 'Valorant' AND quant_disponivel >= 2 AND DATE(horario) = CURDATE();

# Mostre o top 5 de jogadores com quem um determinado jogador já jogou junto
SELECT u2.nome AS jogador, COUNT(*) AS vezes_jogadas_junto
FROM amigos a
JOIN usuario u1 ON a.FK_id_usuario1 = u1.id
JOIN usuario u2 ON a.FK_id_usuario2 = u2.id
WHERE u1.nome = 'Marcos'
GROUP BY u2.id
ORDER BY vezes_jogadas_junto DESC
LIMIT 5;

# Liste a quantidade de jogadores online em cada jogo disponivel
SELECT s.nome_jogo, COUNT(*) AS jogadores_online
FROM salaJogo s
WHERE s.quant_disponivel > 0
GROUP BY s.nome_jogo;