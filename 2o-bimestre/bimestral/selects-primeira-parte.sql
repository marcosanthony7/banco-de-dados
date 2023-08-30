# 1.
SELECT id, nome FROM Usuario WHERE id IN (SELECT id_usuario FROM Participante);
# 2.
SELECT * FROM Comunidade WHERE codigo NOT IN (SELECT id_comunidade FROM ParticipanteComunidade);
# 3.
SELECT * FROM ParticipanteComunidade WHERE id_comunidade = 1;
# 4.
SELECT id, nome FROM Usuario ORDER BY nome ASC;
# 5.
SELECT codigo, nome FROM Comunidade ORDER BY nome DESC;
# 6.
SELECT codigo, nome FROM Grupo WHERE codigo BETWEEN 1 AND 2;
# 7.
SELECT codigo, nome FROM Comunidade WHERE codigo NOT BETWEEN 1 AND 2;
# 8.
SELECT id, nome FROM Usuario WHERE id IN (SELECT id_usuario FROM AdministradorGrupo);
# 9.
SELECT COUNT(*) AS total_administradores FROM AdministradorGrupo;
# 10.
SELECT id, nome, email FROM Usuario WHERE email LIKE '%gmail%';
# 11.
SELECT id, nome, email FROM Usuario WHERE email NOT LIKE '%gmail%';
# 12.
SELECT id, nome FROM Usuario WHERE email NOT LIKE 'a%' AND email NOT LIKE 'm%';