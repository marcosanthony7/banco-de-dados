# 1.
SELECT id, nome FROM usuario WHERE id IN (SELECT id_usuario FROM participante);
# 2.
SELECT * FROM comunidade WHERE codigo NOT IN (SELECT id_comunidade FROM participanteComunidade);
# 3.
SELECT * FROM participanteComunidade WHERE id_comunidade = 1;
# 4.
SELECT id, nome FROM usuario ORDER BY nome ASC;
# 5.
SELECT codigo, nome FROM comunidade ORDER BY nome DESC;
# 6.
SELECT codigo, nome FROM grupo WHERE codigo BETWEEN 1 AND 2;
# 7.
SELECT codigo, nome FROM comunidade WHERE codigo NOT BETWEEN 1 AND 2;
# 8.
SELECT id, nome FROM usuario WHERE id IN (SELECT id_usuario FROM administradorGrupo);
# 9.
SELECT COUNT(*) AS total_administradores FROM administradorGrupo;
# 10.
SELECT id, nome, email FROM usuario WHERE email LIKE '%gmail%';
# 11.
SELECT id, nome, email FROM usuario WHERE email NOT LIKE '%gmail%';
# 12.
SELECT id, nome FROM usuario WHERE email NOT LIKE 'a%' AND email NOT LIKE 'm%';