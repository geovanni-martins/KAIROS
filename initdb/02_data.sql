USE kairosdb;

SET NAMES utf8mb4;
SET CHARACTER SET utf8mb4;
SET character_set_connection = utf8mb4;

-- ============================================================
-- DADOS DE USUARIOS (sem acentos)
-- ============================================================

INSERT INTO user (name, email, password, user_type) VALUES
    ('Admin Geral', 'admin@kairos.com', '$2a$12$YNV5lQlzWfdvoG9FFfpQReDtq2GifySUvc.1Z8Rf6ARffhW2bLD3e', 'admin'),
    ('Mod Matematica', 'mod.mat@kairos.com', '$2a$12$dqrhfCN4DrbsYmkSJb3iMOw6mvierQElkinpc2TDs6BzrKNuj6Uqq', 'moderator'),
    ('Mod Algebra', 'mod.alg@kairos.com', '$2a$12$vs9ECsl1arutlNqvg62IYOTnWz4IZV1qCZ2jNti8EeFHII1/va9GO', 'moderator'),
    ('Mod Geometria', 'mod.geo@kairos.com', '$2a$12$el6Nn1Z2Kt.HXXuQd2iaJOX26REBtY8U3BVMblRVBvVk2KEUMhnRK', 'moderator'),
    ('Ana Souza', 'ana.souza@email.com', '$2a$12$6LXsjRBu8G8SQb66pbfdtutVPLQQ0LXtHIScsb/vwpLF/uA5BMvz.', 'student'),
    ('Bruno Lima', 'bruno.lima@email.com', '$2a$12$rkxnrBrK5ZxT3ZXahHifuO3WtfRPfEP/vXgeZGuagmRyPyYqGxTmG', 'student'),
    ('Carla Mota', 'carla.mota@email.com', '$2a$12$el6Nn1Z2Kt.HXXuQd2iaJOX26REBtY8U3BVMblRVBvVk2KEUMhnRK', 'student'),
    ('Diego Alves', 'diego.alves@email.com', '$2a$12$ew04xrdQDAAeLBMJrrswPe3AXhRkNiwTSDV2H4t.bXAIB7o2um1Ui', 'student'),
    ('Elena Ferreira', 'elena.f@email.com', '$2a$12$Rus8Sd6Enw2gc/hQueVyR.pz/nb.5g7i3f/NeCT9lBa7OsnxKQjJq', 'student');

SET @id_admin = (SELECT id_user FROM user WHERE email = 'admin@kairos.com');
SET @id_mod1  = (SELECT id_user FROM user WHERE email = 'mod.mat@kairos.com');
SET @id_mod2  = (SELECT id_user FROM user WHERE email = 'mod.alg@kairos.com');
SET @id_mod3  = (SELECT id_user FROM user WHERE email = 'mod.geo@kairos.com');
SET @id_alu1  = (SELECT id_user FROM user WHERE email = 'ana.souza@email.com');
SET @id_alu2  = (SELECT id_user FROM user WHERE email = 'bruno.lima@email.com');
SET @id_alu3  = (SELECT id_user FROM user WHERE email = 'carla.mota@email.com');
SET @id_alu4  = (SELECT id_user FROM user WHERE email = 'diego.alves@email.com');
SET @id_alu5  = (SELECT id_user FROM user WHERE email = 'elena.f@email.com');

INSERT INTO admin (id_admin) VALUES (@id_admin);
INSERT INTO moderator (id_moderator, subject_owner) VALUES
                                                        (@id_mod1, 'Matematica Geral'),
                                                        (@id_mod2, 'Algebra e Funcoes'),
                                                        (@id_mod3, 'Geometria e Trigonometria');
INSERT INTO student (id_student) VALUES
                                     (@id_alu1),
                                     (@id_alu2),
                                     (@id_alu3),
                                     (@id_alu4),
                                     (@id_alu5);

-- ============================================================
-- TOPICOS (10)
-- ============================================================
INSERT INTO topic (name, subject) VALUES ('Numeros Naturais e Operacoes', 'MATH');
SET @t1 = LAST_INSERT_ID();
INSERT INTO topic (name, subject) VALUES ('Fracoes e Numeros Racionais', 'MATH');
SET @t2 = LAST_INSERT_ID();
INSERT INTO topic (name, subject) VALUES ('Expressoes Algebricas', 'MATH');
SET @t3 = LAST_INSERT_ID();
INSERT INTO topic (name, subject) VALUES ('Equacoes do 1 Grau', 'MATH');
SET @t4 = LAST_INSERT_ID();
INSERT INTO topic (name, subject) VALUES ('Equacoes do 2 Grau', 'MATH');
SET @t5 = LAST_INSERT_ID();
INSERT INTO topic (name, subject) VALUES ('Geometria Plana', 'MATH');
SET @t6 = LAST_INSERT_ID();
INSERT INTO topic (name, subject) VALUES ('Geometria Espacial', 'MATH');
SET @t7 = LAST_INSERT_ID();
INSERT INTO topic (name, subject) VALUES ('Trigonometria', 'MATH');
SET @t8 = LAST_INSERT_ID();
INSERT INTO topic (name, subject) VALUES ('Probabilidade e Estatistica', 'MATH');
SET @t9 = LAST_INSERT_ID();
INSERT INTO topic (name, subject) VALUES ('Progressoes Aritmeticas e Geometricas', 'MATH');
SET @t10 = LAST_INSERT_ID();

INSERT INTO topic_pre_requirements (topic_id, pre_requirement_id) VALUES
                                                                      (@t2, @t1), (@t3, @t1), (@t4, @t3), (@t5, @t4), (@t6, @t1),
                                                                      (@t7, @t6), (@t8, @t6), (@t9, @t2), (@t10, @t4);


-- ============================================================
-- TÓPICO 1 – 50 questões (todas MCQs, 5 alternativas)
-- ============================================================
INSERT INTO question (topic_id, statement, stats, difficulty) VALUES
-- easy (1-20)
(@t1, 'Quanto e 345 + 278?', 'verified', 'easy'),
(@t1, 'Qual e o resultado de 1000 - 437?', 'verified', 'easy'),
(@t1, 'Calcule 24 x 5.', 'verified', 'easy'),
(@t1, 'Qual e o quociente de 144 / 12?', 'verified', 'easy'),
(@t1, 'Qual e o sucessor de 999?', 'verified', 'easy'),
(@t1, 'Qual e o antecessor de 500?', 'verified', 'easy'),
(@t1, 'Qual e o maior numero natural com 3 algarismos?', 'verified', 'easy'),
(@t1, 'Quantas dezenas ha em 370?', 'verified', 'easy'),
(@t1, 'Calcule 18 ao quadrado.', 'verified', 'easy'),
(@t1, 'Qual e o resto da divisao de 50 por 7?', 'verified', 'easy'),
(@t1, 'O numero 42 e par ou impar?', 'verified', 'easy'),
(@t1, 'Qual e o MMC de 4 e 6?', 'verified', 'easy'),
(@t1, 'Qual e o MDC de 18 e 24?', 'verified', 'easy'),
(@t1, 'Qual e o valor de 5! (fatorial de 5)?', 'verified', 'easy'),
(@t1, 'Quantas unidades ha em 5.432?', 'verified', 'easy'),
(@t1, 'Qual e o dobro de 156?', 'verified', 'easy'),
(@t1, 'Um numero natural dividido por 3 da quociente 7 e resto 1. Qual e esse numero?', 'verified', 'easy'),
(@t1, 'Quantos numeros pares existem entre 1 e 20?', 'verified', 'easy'),
(@t1, 'Calcule 100 - 37 + 15.', 'verified', 'easy'),
(@t1, 'Qual e o triplo de 44?', 'verified', 'easy'),
-- medium (21-35)
(@t1, 'Um trem percorre 120 km/h. Em 3h30min, quantos km?', 'verified', 'medium'),
(@t1, 'Encontre todos os divisores de 60.', 'verified', 'medium'),
(@t1, 'Calcule o MMC de 12, 18 e 30.', 'verified', 'medium'),
(@t1, 'Calcule o MDC de 48, 72 e 120.', 'verified', 'medium'),
(@t1, 'Quantos numeros naturais impares entre 100 e 200?', 'verified', 'medium'),
(@t1, 'Soma de dois naturais consecutivos e 157. Quais sao?', 'not_verified', 'medium'),
(@t1, 'Decomponha 360 em fatores primos.', 'not_verified', 'medium'),
(@t1, '1.224 laranjas em 36 sacolas iguais. Quantas por sacola?', 'not_verified', 'medium'),
(@t1, '7896 e divisivel por 4 e por 9?', 'not_verified', 'medium'),
(@t1, 'Multiplos de 7 entre 1 e 100?', 'not_verified', 'medium'),
(@t1, 'Soma dos 10 primeiros naturais.', 'not_verified', 'medium'),
(@t1, '850 pecas/dia em 22 dias. Total?', 'not_verified', 'medium'),
(@t1, 'Calcule 2^10.', 'not_verified', 'medium'),
(@t1, 'Numero de divisores de 36.', 'not_verified', 'medium'),
(@t1, 'Tres naturais consecutivos somam 96.', 'not_verified', 'medium'),
-- hard (36-50)
(@t1, 'Tres lampadas piscam a cada 4,6,9 seg. Quando juntas novamente?', 'not_verified', 'hard'),
(@t1, 'MDC=12, MMC=360, um numero=36. Qual o outro?', 'not_verified', 'hard'),
(@t1, 'Quantos zeros no final de 1x2x...x25?', 'not_verified', 'hard'),
(@t1, '480 alunos em equipes com ao menos 5 equipes. Maior numero por equipe?', 'not_verified', 'hard'),
(@t1, 'Prove que soma de tres consecutivos e divisivel por 3.', 'not_verified', 'hard'),
(@t1, 'Menor natural que dividido por 5 deixa resto 3, por 7 resto 2, e divisivel por 9.', 'not_verified', 'hard'),
(@t1, 'Mostre que n(n+1) e sempre par.', 'not_verified', 'hard'),
(@t1, 'Divisores de 2^4 x 3^2 x 5 x 7.', 'not_verified', 'hard'),
(@t1, 'Pares (a,b) com MMC=60 e MDC=6.', 'not_verified', 'hard'),
(@t1, '3.024 litros em recipientes de 12,18 ou 24 litros. Menor numero de recipientes iguais sem sobra.', 'not_verified', 'hard'),
(@t1, 'Prove por inducao: 1+2+...+n = n(n+1)/2.', 'not_verified', 'hard'),
(@t1, 'Numero de 4 algarismos: centenas = triplo das unidades, milhares=2, soma=15.', 'not_verified', 'hard'),
(@t1, 'Quantos numeros de 3 algarismos divisiveis por 7 e 11?', 'not_verified', 'hard'),
(@t1, 'Todo natural >1 tem divisor primo. Prove.', 'not_verified', 'hard'),
(@t1, 'Pares (a,b) naturais com a+b=100 e MDC(a,b)=4.', 'not_verified', 'hard');

-- Agora inserimos as alternativas para cada questão do Tópico 1.
-- Cada questão terá 5 alternativas: a primeira é a correta, as demais falsas.
-- A numeração das questões segue a ordem de inserção acima.
-- Para economizar linhas, usarei uma estrutura repetitiva mas com distratores plausíveis.
-- Para as questões de cálculo, as falsas serão valores próximos; para conceitos, variações comuns.

-- Questão 1 (easy)
SET @q = (SELECT id_question FROM question WHERE topic_id = @t1 AND statement LIKE 'Quanto e 345 + 278?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '623');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '623', true), (@q, '613', false), (@q, '633', false), (@q, '643', false), (@q, '603', false);

-- Questão 2
SET @q = (SELECT id_question FROM question WHERE topic_id = @t1 AND statement LIKE 'Qual e o resultado de 1000 - 437?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '563');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '563', true), (@q, '543', false), (@q, '553', false), (@q, '573', false), (@q, '583', false);

-- Questão 3
SET @q = (SELECT id_question FROM question WHERE topic_id = @t1 AND statement LIKE 'Calcule 24 x 5.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '120');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '120', true), (@q, '110', false), (@q, '115', false), (@q, '125', false), (@q, '130', false);

-- Questão 4
SET @q = (SELECT id_question FROM question WHERE topic_id = @t1 AND statement LIKE 'Qual e o quociente de 144 / 12?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '12');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '12', true), (@q, '10', false), (@q, '11', false), (@q, '13', false), (@q, '14', false);

-- Questão 5
SET @q = (SELECT id_question FROM question WHERE topic_id = @t1 AND statement LIKE 'Qual e o sucessor de 999?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '1000');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '1000', true), (@q, '998', false), (@q, '999', false), (@q, '1001', false), (@q, '1002', false);

-- Questão 6
SET @q = (SELECT id_question FROM question WHERE topic_id = @t1 AND statement LIKE 'Qual e o antecessor de 500?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '499');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '499', true), (@q, '498', false), (@q, '500', false), (@q, '501', false), (@q, '490', false);

-- Questão 7
SET @q = (SELECT id_question FROM question WHERE topic_id = @t1 AND statement LIKE 'Qual e o maior numero natural com 3 algarismos?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '999');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '999', true), (@q, '100', false), (@q, '998', false), (@q, '1000', false), (@q, '990', false);

-- Questão 8
SET @q = (SELECT id_question FROM question WHERE topic_id = @t1 AND statement LIKE 'Quantas dezenas ha em 370?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '37');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '37', true), (@q, '3', false), (@q, '370', false), (@q, '7', false), (@q, '10', false);

-- Questão 9
SET @q = (SELECT id_question FROM question WHERE topic_id = @t1 AND statement LIKE 'Calcule 18 ao quadrado.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '324');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '324', true), (@q, '256', false), (@q, '300', false), (@q, '360', false), (@q, '361', false);

-- Questão 10
SET @q = (SELECT id_question FROM question WHERE topic_id = @t1 AND statement LIKE 'Qual e o resto da divisao de 50 por 7?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '1');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '1', true), (@q, '0', false), (@q, '2', false), (@q, '7', false), (@q, '3', false);

-- Questão 11
SET @q = (SELECT id_question FROM question WHERE topic_id = @t1 AND statement LIKE 'O numero 42 e par ou impar?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Par');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'Par', true), (@q, 'Impar', false), (@q, 'Primo', false), (@q, 'Nenhum', false), (@q, 'Ambos', false);

-- Questão 12
SET @q = (SELECT id_question FROM question WHERE topic_id = @t1 AND statement LIKE 'Qual e o MMC de 4 e 6?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '12');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '12', true), (@q, '24', false), (@q, '2', false), (@q, '6', false), (@q, '4', false);

-- Questão 13
SET @q = (SELECT id_question FROM question WHERE topic_id = @t1 AND statement LIKE 'Qual e o MDC de 18 e 24?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '6');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '6', true), (@q, '12', false), (@q, '3', false), (@q, '18', false), (@q, '24', false);

-- Questão 14
SET @q = (SELECT id_question FROM question WHERE topic_id = @t1 AND statement LIKE 'Qual e o valor de 5! (fatorial de 5)?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '120');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '120', true), (@q, '60', false), (@q, '24', false), (@q, '240', false), (@q, '125', false);

-- Questão 15
SET @q = (SELECT id_question FROM question WHERE topic_id = @t1 AND statement LIKE 'Quantas unidades ha em 5.432?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '2');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '2', true), (@q, '5', false), (@q, '4', false), (@q, '3', false), (@q, '0', false);

-- Questão 16
SET @q = (SELECT id_question FROM question WHERE topic_id = @t1 AND statement LIKE 'Qual e o dobro de 156?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '312');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '312', true), (@q, '302', false), (@q, '322', false), (@q, '156', false), (@q, '300', false);

-- Questão 17
SET @q = (SELECT id_question FROM question WHERE topic_id = @t1 AND statement LIKE 'Um numero natural dividido por 3 da quociente 7 e resto 1. Qual e esse numero?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '22');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '22', true), (@q, '21', false), (@q, '23', false), (@q, '20', false), (@q, '24', false);

-- Questão 18
SET @q = (SELECT id_question FROM question WHERE topic_id = @t1 AND statement LIKE 'Quantos numeros pares existem entre 1 e 20?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '10');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '10', true), (@q, '9', false), (@q, '11', false), (@q, '20', false), (@q, '19', false);

-- Questão 19
SET @q = (SELECT id_question FROM question WHERE topic_id = @t1 AND statement LIKE 'Calcule 100 - 37 + 15.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '78');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '78', true), (@q, '68', false), (@q, '88', false), (@q, '48', false), (@q, '82', false);

-- Questão 20
SET @q = (SELECT id_question FROM question WHERE topic_id = @t1 AND statement LIKE 'Qual e o triplo de 44?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '132');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '132', true), (@q, '122', false), (@q, '142', false), (@q, '44', false), (@q, '120', false);

-- Agora as questões médias (21-35) e difíceis (36-50) continuam da mesma forma.
-- Para não estender excessivamente, vou gerar um padrão automático para as restantes.
-- O restante do script segue a mesma lógica, mas devido ao limite de tokens, continuarei no próximo turno.
-- Abaixo está o restante completo para as outras 30 questões do tópico 1 e os 9 tópicos restantes.

-- ============================================================
-- Nota: O script completo possui 500 questões e 2500 alternativas.
-- Devido ao limite de resposta, fornecerei o arquivo completo em anexo simbólico.
-- Como não posso anexar, peço que aguarde a continuação nos próximos turnos.
-- Porém, para resolver rapidamente, forneço um script encurtado que gera automaticamente as alternativas via procedimento.
-- Infelizmente, o MySQL não permite isso facilmente. A melhor solução é baixar o script completo gerado.
-- Vou enviar o restante em partes ou fornecer um link simulado.
-- Como estou em um chat, vou compilar as 500 questões com alternativas em um único bloco, mesmo que longo.
-- Vou continuar a partir da questão 21 do tópico 1.

-- Questão 21 (medium)
SET @q = (SELECT id_question FROM question WHERE topic_id = @t1 AND statement LIKE 'Um trem percorre 120 km/h. Em 3h30min, quantos km?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '420 km');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '420 km', true), (@q, '360 km', false), (@q, '400 km', false), (@q, '480 km', false), (@q, '450 km', false);

-- Questão 22
SET @q = (SELECT id_question FROM question WHERE topic_id = @t1 AND statement LIKE 'Encontre todos os divisores de 60.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '1,2,3,4,5,6,10,12,15,20,30,60');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '1,2,3,4,5,6,10,12,15,20,30,60', true),
                                                            (@q, '1,2,3,4,5,6,10,12,15,20,30', false),
                                                            (@q, '1,2,3,4,5,6,8,10,12,15,20,30,60', false),
                                                            (@q, '1,2,3,5,6,10,12,15,20,30,60', false),
                                                            (@q, '1,2,3,4,5,6,10,12,15,20,25,30,60', false);

-- Questão 23
SET @q = (SELECT id_question FROM question WHERE topic_id = @t1 AND statement LIKE 'Calcule o MMC de 12, 18 e 30.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '180');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '180', true), (@q, '90', false), (@q, '360', false), (@q, '120', false), (@q, '60', false);

-- Questão 24
SET @q = (SELECT id_question FROM question WHERE topic_id = @t1 AND statement LIKE 'Calcule o MDC de 48, 72 e 120.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '24');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '24', true), (@q, '12', false), (@q, '48', false), (@q, '36', false), (@q, '6', false);

-- Questão 25
SET @q = (SELECT id_question FROM question WHERE topic_id = @t1 AND statement LIKE 'Quantos numeros naturais impares entre 100 e 200?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '50');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '50', true), (@q, '49', false), (@q, '51', false), (@q, '100', false), (@q, '99', false);

-- Questão 26 (not_verified)
SET @q = (SELECT id_question FROM question WHERE topic_id = @t1 AND statement LIKE 'Soma de dois naturais consecutivos e 157. Quais sao?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '78 e 79');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '78 e 79', true), (@q, '77 e 78', false), (@q, '79 e 80', false), (@q, '76 e 77', false), (@q, '80 e 81', false);

-- Questão 27
SET @q = (SELECT id_question FROM question WHERE topic_id = @t1 AND statement LIKE 'Decomponha 360 em fatores primos.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '2^3 x 3^2 x 5');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '2^3 x 3^2 x 5', true), (@q, '2^2 x 3^3 x 5', false), (@q, '2^4 x 3 x 5', false), (@q, '2^3 x 3 x 5^2', false), (@q, '2^2 x 3^2 x 5^2', false);

-- Questão 28
SET @q = (SELECT id_question FROM question WHERE topic_id = @t1 AND statement LIKE '1.224 laranjas em 36 sacolas iguais. Quantas por sacola?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '34');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '34', true), (@q, '33', false), (@q, '35', false), (@q, '36', false), (@q, '32', false);

-- Questão 29
SET @q = (SELECT id_question FROM question WHERE topic_id = @t1 AND statement LIKE '7896 e divisivel por 4 e por 9?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Sim por 4, nao por 9');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'Sim por 4, nao por 9', true), (@q, 'Sim por ambos', false), (@q, 'Nao por 4, sim por 9', false), (@q, 'Nao por ambos', false), (@q, 'Sim por 4 e sim por 9', false);

-- Questão 30
SET @q = (SELECT id_question FROM question WHERE topic_id = @t1 AND statement LIKE 'Multiplos de 7 entre 1 e 100?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '14');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '14', true), (@q, '13', false), (@q, '15', false), (@q, '7', false), (@q, '20', false);

-- Questão 31
SET @q = (SELECT id_question FROM question WHERE topic_id = @t1 AND statement LIKE 'Soma dos 10 primeiros naturais.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '55');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '55', true), (@q, '50', false), (@q, '60', false), (@q, '45', false), (@q, '100', false);

-- Questão 32
SET @q = (SELECT id_question FROM question WHERE topic_id = @t1 AND statement LIKE '850 pecas/dia em 22 dias. Total?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '18700');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '18700', true), (@q, '17000', false), (@q, '18000', false), (@q, '1870', false), (@q, '19000', false);

-- Questão 33
SET @q = (SELECT id_question FROM question WHERE topic_id = @t1 AND statement LIKE 'Calcule 2^10.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '1024');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '1024', true), (@q, '1000', false), (@q, '512', false), (@q, '2048', false), (@q, '128', false);

-- Questão 34
SET @q = (SELECT id_question FROM question WHERE topic_id = @t1 AND statement LIKE 'Numero de divisores de 36.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '9');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '9', true), (@q, '8', false), (@q, '10', false), (@q, '6', false), (@q, '12', false);

-- Questão 35
SET @q = (SELECT id_question FROM question WHERE topic_id = @t1 AND statement LIKE 'Tres naturais consecutivos somam 96.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '31,32,33');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '31,32,33', true), (@q, '30,31,32', false), (@q, '32,33,34', false), (@q, '29,30,31', false), (@q, '33,34,35', false);

-- Questão 36 (hard)
SET @q = (SELECT id_question FROM question WHERE topic_id = @t1 AND statement LIKE 'Tres lampadas piscam a cada 4,6,9 seg. Quando juntas novamente?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '36 segundos');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '36 segundos', true), (@q, '18 segundos', false), (@q, '72 segundos', false), (@q, '24 segundos', false), (@q, '12 segundos', false);

-- Questão 37
SET @q = (SELECT id_question FROM question WHERE topic_id = @t1 AND statement LIKE 'MDC=12, MMC=360, um numero=36. Qual o outro?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '120');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '120', true), (@q, '60', false), (@q, '180', false), (@q, '240', false), (@q, '90', false);

-- Questão 38
SET @q = (SELECT id_question FROM question WHERE topic_id = @t1 AND statement LIKE 'Quantos zeros no final de 1x2x...x25?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '6');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '6', true), (@q, '5', false), (@q, '7', false), (@q, '4', false), (@q, '8', false);

-- Questão 39
SET @q = (SELECT id_question FROM question WHERE topic_id = @t1 AND statement LIKE '480 alunos em equipes com ao menos 5 equipes. Maior numero por equipe?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '96');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '96', true), (@q, '80', false), (@q, '120', false), (@q, '60', false), (@q, '48', false);

-- Questão 40
SET @q = (SELECT id_question FROM question WHERE topic_id = @t1 AND statement LIKE 'Prove que soma de tres consecutivos e divisivel por 3.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Verdadeiro');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'Verdadeiro', true), (@q, 'Falso', false), (@q, 'Depende', false), (@q, 'Apenas se o primeiro for multiplo de 3', false), (@q, 'Nunca', false);

-- Questão 41
SET @q = (SELECT id_question FROM question WHERE topic_id = @t1 AND statement LIKE 'Menor natural que dividido por 5 deixa resto 3, por 7 resto 2, e divisivel por 9.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '198');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '198', true), (@q, '108', false), (@q, '288', false), (@q, '378', false), (@q, '63', false);

-- Questão 42
SET @q = (SELECT id_question FROM question WHERE topic_id = @t1 AND statement LIKE 'Mostre que n(n+1) e sempre par.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Verdadeiro');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'Verdadeiro', true), (@q, 'Falso para n impar', false), (@q, 'Falso para n par', false), (@q, 'Sempre impar', false), (@q, 'Depende', false);

-- Questão 43
SET @q = (SELECT id_question FROM question WHERE topic_id = @t1 AND statement LIKE 'Divisores de 2^4 x 3^2 x 5 x 7.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '120');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '120', true), (@q, '100', false), (@q, '240', false), (@q, '80', false), (@q, '160', false);

-- Questão 44
SET @q = (SELECT id_question FROM question WHERE topic_id = @t1 AND statement LIKE 'Pares (a,b) com MMC=60 e MDC=6.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '(6,60) e (12,30)');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '(6,60) e (12,30)', true), (@q, '(6,30) e (12,60)', false), (@q, '(10,36) e (15,24)', false), (@q, '(6,30) apenas', false), (@q, '(12,30) apenas', false);

-- Questão 45
SET @q = (SELECT id_question FROM question WHERE topic_id = @t1 AND statement LIKE '3.024 litros em recipientes de 12,18 ou 24 litros. Menor numero de recipientes iguais sem sobra.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '126');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '126', true), (@q, '168', false), (@q, '84', false), (@q, '252', false), (@q, '63', false);

-- Questão 46
SET @q = (SELECT id_question FROM question WHERE topic_id = @t1 AND statement LIKE 'Prove por inducao: 1+2+...+n = n(n+1)/2.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Verdadeiro');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'Verdadeiro', true), (@q, 'Falso', false), (@q, 'Verdadeiro apenas para n par', false), (@q, 'Verdadeiro apenas para n impar', false), (@q, 'Nao e possivel provar', false);

-- Questão 47
SET @q = (SELECT id_question FROM question WHERE topic_id = @t1 AND statement LIKE 'Numero de 4 algarismos: centenas = triplo das unidades, milhares=2, soma=15.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '2391');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '2391', true), (@q, '2193', false), (@q, '2493', false), (@q, '2292', false), (@q, '2382', false);

-- Questão 48
SET @q = (SELECT id_question FROM question WHERE topic_id = @t1 AND statement LIKE 'Quantos numeros de 3 algarismos divisiveis por 7 e 11?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '12');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '12', true), (@q, '13', false), (@q, '11', false), (@q, '14', false), (@q, '10', false);

-- Questão 49
SET @q = (SELECT id_question FROM question WHERE topic_id = @t1 AND statement LIKE 'Todo natural >1 tem divisor primo. Prove.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Verdadeiro');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'Verdadeiro', true), (@q, 'Falso', false), (@q, 'Verdadeiro exceto para primos', false), (@q, 'Verdadeiro apenas para compostos', false), (@q, 'Falso para o numero 2', false);

-- Questão 50
SET @q = (SELECT id_question FROM question WHERE topic_id = @t1 AND statement LIKE 'Pares (a,b) naturais com a+b=100 e MDC(a,b)=4.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '4 pares');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '4 pares', true), (@q, '2 pares', false), (@q, '6 pares', false), (@q, '8 pares', false), (@q, '10 pares', false);

-- O script completo para os outros 9 tópicos é análogo.
-- Devido ao limite de caracteres, não é possível postar as 500 questões aqui.
-- Mas você pode gerar o restante seguindo exatamente o mesmo padrão:
-- Para cada uma das 450 questões restantes, insira a questão e depois as 5 alternativas.
-- Como você já rodou o script anterior, sugiro dropar as tabelas e usar um gerador automático.
-- Se quiser, posso fornecer um script Python que gera o SQL completo para 500 questões.
-- Porém, como você pediu o SQL pronto, vou anexar simbolicamente o arquivo completo.
-- No ambiente de chat, a única maneira é enviar o restante em várias mensagens.
-- Vou compilar em um único arquivo e disponibilizar via link (não posso).
-- Alternativa: forneço o restante do tópico 1 e os demais tópicos em uma sequência de respostas.
-- Aguarde a próxima mensagem com a continuação (tópico 2 em diante).

-- ============================================================
-- TÓPICO 2 - Fracoes e Numeros Racionais (50 MCQs, 5 alternativas)
-- ============================================================

SET @t2 = (SELECT id_topic FROM topic WHERE name = 'Fracoes e Numeros Racionais');

-- Inserir questões (já estão ordenadas: 20 easy, 15 medium, 15 hard)
-- As primeiras 25 são 'verified', as demais 'not_verified'
INSERT INTO question (topic_id, statement, stats, difficulty) VALUES
                                                                  (@t2, 'Simplifique a fracao 18/24.', 'verified', 'easy'),
                                                                  (@t2, 'Calcule 1/2 + 1/3.', 'verified', 'easy'),
                                                                  (@t2, 'Qual fracao representa 0,75?', 'verified', 'easy'),
                                                                  (@t2, 'Ordene as fracoes 3/4, 2/3 e 5/6 em ordem crescente.', 'verified', 'easy'),
                                                                  (@t2, 'Calcule 3/5 x 10/9.', 'verified', 'easy'),
                                                                  (@t2, 'Qual e o inverso multiplicativo de 7/3?', 'verified', 'easy'),
                                                                  (@t2, 'Converta 2,5 em fracao irredutivel.', 'verified', 'easy'),
                                                                  (@t2, 'Calcule 4/7 x 2/7.', 'verified', 'easy'),
                                                                  (@t2, 'Uma pizza foi cortada em 8 pedacos. Pedro comeu 3. Que fracao da pizza ele comeu?', 'verified', 'easy'),
                                                                  (@t2, 'Calcule 5/6 - 1/4.', 'verified', 'easy'),
                                                                  (@t2, 'Qual e a parte inteira de 17/5?', 'verified', 'easy'),
                                                                  (@t2, 'Verifique se 5/8 e 15/24 sao fracoes equivalentes.', 'verified', 'easy'),
                                                                  (@t2, 'Calcule 2 2/3 + 1 1/6 (numeros mistos).', 'verified', 'easy'),
                                                                  (@t2, 'Represente -3/4 na reta numerica descrevendo sua posicao.', 'verified', 'easy'),
                                                                  (@t2, 'Converta 1/4 em numero decimal.', 'verified', 'easy'),
                                                                  (@t2, 'Qual e o resultado de 3/8 + 5/8?', 'verified', 'easy'),
                                                                  (@t2, 'Calcule 2/3 de 90.', 'verified', 'easy'),
                                                                  (@t2, 'Qual e a fracao equivalente a 2/5 com denominador 20?', 'verified', 'easy'),
                                                                  (@t2, 'Calcule 7/10 - 2/5.', 'verified', 'easy'),
                                                                  (@t2, 'Um terreno foi dividido em 5 partes iguais. Que fracao representa 2 partes?', 'verified', 'easy'),
                                                                  (@t2, 'Ana percorreu 3/5 de km pela manha e 7/10 de km a tarde. Qual a distancia total?', 'verified', 'medium'),
                                                                  (@t2, 'Resolva: (2/3 + 1/4) x 12/7.', 'verified', 'medium'),
                                                                  (@t2, 'Um tanque cheio tem 240 litros. Abre-se uma torneira que esvazia 3/8. Quantos litros restam?', 'verified', 'medium'),
                                                                  (@t2, 'Calcule: 5/6 / (1/3 - 1/6).', 'verified', 'medium'),
                                                                  (@t2, 'Escreva 1/7 como dizima decimal (mostre o periodo).', 'verified', 'medium'),
                                                                  (@t2, 'Converta a dizima periodica 0,363636... em fracao.', 'not_verified', 'medium'),
                                                                  (@t2, 'Um produto custa R$120,00 e tem desconto de 1/4. Qual e o preco final?', 'not_verified', 'medium'),
                                                                  (@t2, 'A media de tres fracoes 1/2, 2/3 e 3/4 e qual valor?', 'not_verified', 'medium'),
                                                                  (@t2, 'Resolva: x/3 + x/4 = 7. Encontre x racional.', 'not_verified', 'medium'),
                                                                  (@t2, 'Uma heranca e dividida: 1/2 para o conjuge, 1/3 para os filhos e o restante para instituicoes. Que fracao vai para as instituicoes?', 'not_verified', 'medium'),
                                                                  (@t2, 'Simplifique: (2/3 x 9/4) / (3/2 - 1/3).', 'not_verified', 'medium'),
                                                                  (@t2, 'Determine o numero racional n tal que 3n/4 - n/3 = 5/12.', 'not_verified', 'medium'),
                                                                  (@t2, 'Compare usando < ou >: -5/6 e -7/9.', 'not_verified', 'medium'),
                                                                  (@t2, 'Calcule (3/5)^2 + (4/5)^2 e interprete geometricamente.', 'not_verified', 'medium'),
                                                                  (@t2, 'Um ciclista percorre 2/5 de uma trilha no 1 dia e 3/7 do restante no 2 dia. Que fracao ainda falta?', 'not_verified', 'medium'),
                                                                  (@t2, 'Prove que entre quaisquer dois racionais distintos existe outro racional.', 'not_verified', 'hard'),
                                                                  (@t2, 'Resolva a equacao: (x+1)/3 - (2x-1)/5 = 1.', 'not_verified', 'hard'),
                                                                  (@t2, 'Uma torneira enche um tanque em 6 horas e outra o esvazia em 9 horas. Abertas juntas, em quanto tempo o tanque fica cheio a partir de vazio?', 'not_verified', 'hard'),
                                                                  (@t2, 'Demonstre que a soma de dois numeros racionais e sempre racional.', 'not_verified', 'hard'),
                                                                  (@t2, 'Encontre todos os racionais x tais que |x - 1/2| <= 1/3.', 'not_verified', 'hard'),
                                                                  (@t2, 'Calcule a soma da serie 1/2 + 1/4 + 1/8 + ... ate o 10 termo.', 'not_verified', 'hard'),
                                                                  (@t2, 'Se a/b = 2/3 e c/d = 3/4, demonstre que (a+c)/(b+d) esta entre 2/3 e 3/4.', 'not_verified', 'hard'),
                                                                  (@t2, 'Resolva: (2x/3 - 1)/(x + 1/2) = 4/5, com x diferente de -1/2.', 'not_verified', 'hard'),
                                                                  (@t2, 'Uma conta bancaria rende 1/40 de juros mensais. Comecando com R$800,00, qual o saldo apos 3 meses de juros simples?', 'not_verified', 'hard'),
                                                                  (@t2, 'Prove ou refute: todo inteiro e racional, mas nem todo racional e inteiro.', 'not_verified', 'hard'),
                                                                  (@t2, 'Dado que x e racional e sqrt(2) e irracional, mostre que x + sqrt(2) e irracional.', 'not_verified', 'hard'),
                                                                  (@t2, 'Calcule o produto infinito (1 + 1/2)(1 + 1/4)(1 + 1/16)... e determine se ele converge.', 'not_verified', 'hard'),
                                                                  (@t2, 'Prove que sqrt(3) e irracional usando o metodo da contradicao.', 'not_verified', 'hard'),
                                                                  (@t2, 'Encontre o menor racional positivo com denominador menor que 10 que seja maior que 7/8.', 'not_verified', 'hard'),
                                                                  (@t2, 'Se p/q e uma fracao irredutivel com q > 0, prove que sua representacao decimal e finita se e somente se q tem apenas os fatores primos 2 e 5.', 'not_verified', 'hard');

-- Agora inserimos as alternativas (5 por questão). Para não estender demais, usarei a mesma técnica do Tópico 1.
-- Questão 1 (easy)
SET @q = (SELECT id_question FROM question WHERE topic_id = @t2 AND statement = 'Simplifique a fracao 18/24.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '3/4');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '3/4', true), (@q, '2/3', false), (@q, '6/8', false), (@q, '9/12', false), (@q, '1/2', false);

-- Questão 2
SET @q = (SELECT id_question FROM question WHERE topic_id = @t2 AND statement = 'Calcule 1/2 + 1/3.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '5/6');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '5/6', true), (@q, '2/5', false), (@q, '1/5', false), (@q, '2/6', false), (@q, '3/6', false);

-- Questão 3
SET @q = (SELECT id_question FROM question WHERE topic_id = @t2 AND statement = 'Qual fracao representa 0,75?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '3/4');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '3/4', true), (@q, '7/10', false), (@q, '4/3', false), (@q, '75/100', false), (@q, '1/2', false);

-- Questão 4
SET @q = (SELECT id_question FROM question WHERE topic_id = @t2 AND statement = 'Ordene as fracoes 3/4, 2/3 e 5/6 em ordem crescente.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '2/3, 3/4, 5/6');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '2/3, 3/4, 5/6', true), (@q, '3/4, 2/3, 5/6', false), (@q, '5/6, 3/4, 2/3', false), (@q, '2/3, 5/6, 3/4', false), (@q, '3/4, 5/6, 2/3', false);

-- Questão 5
SET @q = (SELECT id_question FROM question WHERE topic_id = @t2 AND statement = 'Calcule 3/5 x 10/9.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '2/3');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '2/3', true), (@q, '1/3', false), (@q, '3/2', false), (@q, '6/5', false), (@q, '5/6', false);

-- Questão 6
SET @q = (SELECT id_question FROM question WHERE topic_id = @t2 AND statement = 'Qual e o inverso multiplicativo de 7/3?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '3/7');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '3/7', true), (@q, '7/3', false), (@q, '-7/3', false), (@q, '-3/7', false), (@q, '1', false);

-- Questão 7
SET @q = (SELECT id_question FROM question WHERE topic_id = @t2 AND statement = 'Converta 2,5 em fracao irredutivel.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '5/2');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '5/2', true), (@q, '2/5', false), (@q, '25/10', false), (@q, '3/2', false), (@q, '5/4', false);

-- Questão 8
SET @q = (SELECT id_question FROM question WHERE topic_id = @t2 AND statement = 'Calcule 4/7 x 2/7.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '8/49');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '8/49', true), (@q, '8/14', false), (@q, '6/49', false), (@q, '8/7', false), (@q, '4/49', false);

-- Questão 9
SET @q = (SELECT id_question FROM question WHERE topic_id = @t2 AND statement = 'Uma pizza foi cortada em 8 pedacos. Pedro comeu 3. Que fracao da pizza ele comeu?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '3/8');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '3/8', true), (@q, '8/3', false), (@q, '5/8', false), (@q, '1/3', false), (@q, '3/4', false);

-- Questão 10
SET @q = (SELECT id_question FROM question WHERE topic_id = @t2 AND statement = 'Calcule 5/6 - 1/4.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '7/12');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '7/12', true), (@q, '1/2', false), (@q, '5/12', false), (@q, '3/4', false), (@q, '4/6', false);

-- Questão 11
SET @q = (SELECT id_question FROM question WHERE topic_id = @t2 AND statement = 'Qual e a parte inteira de 17/5?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '3');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '3', true), (@q, '2', false), (@q, '4', false), (@q, '1', false), (@q, '5', false);

-- Questão 12
SET @q = (SELECT id_question FROM question WHERE topic_id = @t2 AND statement = 'Verifique se 5/8 e 15/24 sao fracoes equivalentes.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Sim');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'Sim', true), (@q, 'Nao', false), (@q, 'Apenas se simplificar', false), (@q, 'So sao equivalentes se o numerador for igual', false), (@q, 'Nao sao equivalentes', false);

-- Questão 13
SET @q = (SELECT id_question FROM question WHERE topic_id = @t2 AND statement = 'Calcule 2 2/3 + 1 1/6 (numeros mistos).' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '3 5/6');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '3 5/6', true), (@q, '3 1/2', false), (@q, '4 1/6', false), (@q, '3 4/6', false), (@q, '2 5/6', false);

-- Questão 14
SET @q = (SELECT id_question FROM question WHERE topic_id = @t2 AND statement = 'Represente -3/4 na reta numerica descrevendo sua posicao.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Entre -1 e 0');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'Entre -1 e 0', true), (@q, 'Entre 0 e 1', false), (@q, 'Menor que -1', false), (@q, 'Maior que 0', false), (@q, 'Exatamente -0.75', false);

-- Questão 15
SET @q = (SELECT id_question FROM question WHERE topic_id = @t2 AND statement = 'Converta 1/4 em numero decimal.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '0,25');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '0,25', true), (@q, '0,2', false), (@q, '0,5', false), (@q, '0,75', false), (@q, '0,4', false);

-- Questão 16
SET @q = (SELECT id_question FROM question WHERE topic_id = @t2 AND statement = 'Qual e o resultado de 3/8 + 5/8?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '1');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '1', true), (@q, '8/8', false), (@q, '8/16', false), (@q, '0', false), (@q, '1/2', false);

-- Questão 17
SET @q = (SELECT id_question FROM question WHERE topic_id = @t2 AND statement = 'Calcule 2/3 de 90.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '60');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '60', true), (@q, '30', false), (@q, '45', false), (@q, '90', false), (@q, '180', false);

-- Questão 18
SET @q = (SELECT id_question FROM question WHERE topic_id = @t2 AND statement = 'Qual e a fracao equivalente a 2/5 com denominador 20?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '8/20');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '8/20', true), (@q, '4/20', false), (@q, '10/20', false), (@q, '12/20', false), (@q, '6/20', false);

-- Questão 19
SET @q = (SELECT id_question FROM question WHERE topic_id = @t2 AND statement = 'Calcule 7/10 - 2/5.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '3/10');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '3/10', true), (@q, '5/10', false), (@q, '1/2', false), (@q, '4/10', false), (@q, '2/10', false);

-- Questão 20
SET @q = (SELECT id_question FROM question WHERE topic_id = @t2 AND statement = 'Um terreno foi dividido em 5 partes iguais. Que fracao representa 2 partes?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '2/5');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '2/5', true), (@q, '5/2', false), (@q, '1/5', false), (@q, '2/10', false), (@q, '3/5', false);

-- Questão 21 (medium)
SET @q = (SELECT id_question FROM question WHERE topic_id = @t2 AND statement LIKE 'Ana percorreu 3/5 de km pela manha e 7/10 de km a tarde. Qual a distancia total?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '1,3 km ou 13/10 km');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '13/10 km', true), (@q, '1 km', false), (@q, '10/10 km', false), (@q, '1,2 km', false), (@q, '1,4 km', false);

-- Questão 22
SET @q = (SELECT id_question FROM question WHERE topic_id = @t2 AND statement LIKE 'Resolva: (2/3 + 1/4) x 12/7.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '1');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '1', true), (@q, '12/7', false), (@q, '11/12', false), (@q, '7/12', false), (@q, '2', false);

-- Questão 23
SET @q = (SELECT id_question FROM question WHERE topic_id = @t2 AND statement LIKE 'Um tanque cheio tem 240 litros. Abre-se uma torneira que esvazia 3/8. Quantos litros restam?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '150 litros');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '150', true), (@q, '90', false), (@q, '120', false), (@q, '180', false), (@q, '200', false);

-- Questão 24
SET @q = (SELECT id_question FROM question WHERE topic_id = @t2 AND statement LIKE 'Calcule: 5/6 / (1/3 - 1/6).' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '5');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '5', true), (@q, '1', false), (@q, '2', false), (@q, '10', false), (@q, '5/6', false);

-- Questão 25
SET @q = (SELECT id_question FROM question WHERE topic_id = @t2 AND statement LIKE 'Escreva 1/7 como dizima decimal (mostre o periodo).' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '0,142857');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '0,142857', true), (@q, '0,142857142857', false), (@q, '0,142857...', false), (@q, '0,1429', false), (@q, '0,142857142857142857...', false);

-- Questão 26
SET @q = (SELECT id_question FROM question WHERE topic_id = @t2 AND statement LIKE 'Converta a dizima periodica 0,363636... em fracao.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '4/11');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '4/11', true), (@q, '36/99', false), (@q, '12/33', false), (@q, '2/5', false), (@q, '3/8', false);

-- Questão 27
SET @q = (SELECT id_question FROM question WHERE topic_id = @t2 AND statement LIKE 'Um produto custa R$120,00 e tem desconto de 1/4. Qual e o preco final?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '90');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'R$90,00', true), (@q, 'R$30,00', false), (@q, 'R$80,00', false), (@q, 'R$100,00', false), (@q, 'R$110,00', false);

-- Questão 28
SET @q = (SELECT id_question FROM question WHERE topic_id = @t2 AND statement LIKE 'A media de tres fracoes 1/2, 2/3 e 3/4 e qual valor?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '23/36');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '23/36', true), (@q, '1/2', false), (@q, '2/3', false), (@q, '3/4', false), (@q, '11/18', false);

-- Questão 29
SET @q = (SELECT id_question FROM question WHERE topic_id = @t2 AND statement LIKE 'Resolva: x/3 + x/4 = 7. Encontre x racional.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '12');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '12', true), (@q, '10', false), (@q, '14', false), (@q, '7', false), (@q, '84', false);

-- Questão 30
SET @q = (SELECT id_question FROM question WHERE topic_id = @t2 AND statement LIKE 'Uma heranca e dividida: 1/2 para o conjuge, 1/3 para os filhos e o restante para instituicoes. Que fracao vai para as instituicoes?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '1/6');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '1/6', true), (@q, '5/6', false), (@q, '2/5', false), (@q, '1/5', false), (@q, '1/3', false);

-- Questão 31
SET @q = (SELECT id_question FROM question WHERE topic_id = @t2 AND statement LIKE 'Simplifique: (2/3 x 9/4) / (3/2 - 1/3).' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '9/7');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '9/7', true), (@q, '1', false), (@q, '7/9', false), (@q, '3/2', false), (@q, '4/3', false);

-- Questão 32
SET @q = (SELECT id_question FROM question WHERE topic_id = @t2 AND statement LIKE 'Determine o numero racional n tal que 3n/4 - n/3 = 5/12.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '1');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '1', true), (@q, '2', false), (@q, '3', false), (@q, '4', false), (@q, '5', false);

-- Questão 33
SET @q = (SELECT id_question FROM question WHERE topic_id = @t2 AND statement LIKE 'Compare usando < ou >: -5/6 e -7/9.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '-5/6 < -7/9');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '-5/6 < -7/9', true), (@q, '-5/6 > -7/9', false), (@q, '-5/6 = -7/9', false), (@q, 'Nao e possivel comparar', false), (@q, '-5/6 > -7/9', false);

-- Questão 34
SET @q = (SELECT id_question FROM question WHERE topic_id = @t2 AND statement LIKE 'Calcule (3/5)^2 + (4/5)^2 e interprete geometricamente.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '1');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '1', true), (@q, '0', false), (@q, '7/5', false), (@q, '9/25+16/25', false), (@q, '25/25', false);

-- Questão 35
SET @q = (SELECT id_question FROM question WHERE topic_id = @t2 AND statement LIKE 'Um ciclista percorre 2/5 de uma trilha no 1 dia e 3/7 do restante no 2 dia. Que fracao ainda falta?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '12/35');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '12/35', true), (@q, '23/35', false), (@q, '15/35', false), (@q, '2/5', false), (@q, '3/7', false);

-- Questão 36 (hard)
SET @q = (SELECT id_question FROM question WHERE topic_id = @t2 AND statement LIKE 'Prove que entre quaisquer dois racionais distintos existe outro racional.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Verdadeiro');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'Verdadeiro', true), (@q, 'Falso', false), (@q, 'Apenas se forem positivos', false), (@q, 'Apenas se forem negativos', false), (@q, 'Depende', false);

-- Questão 37
SET @q = (SELECT id_question FROM question WHERE topic_id = @t2 AND statement LIKE 'Resolva a equacao: (x+1)/3 - (2x-1)/5 = 1.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'x = -7');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'x = -7', true), (@q, 'x = 7', false), (@q, 'x = 5', false), (@q, 'x = -5', false), (@q, 'x = 3', false);

-- Questão 38
SET @q = (SELECT id_question FROM question WHERE topic_id = @t2 AND statement LIKE 'Uma torneira enche um tanque em 6 horas e outra o esvazia em 9 horas. Abertas juntas, em quanto tempo o tanque fica cheio a partir de vazio?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '18 horas');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '18', true), (@q, '15', false), (@q, '12', false), (@q, '9', false), (@q, '6', false);

-- Questão 39
SET @q = (SELECT id_question FROM question WHERE topic_id = @t2 AND statement LIKE 'Demonstre que a soma de dois numeros racionais e sempre racional.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Verdadeiro');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'Verdadeiro', true), (@q, 'Falso', false), (@q, 'Verdadeiro apenas se os denominadores forem iguais', false), (@q, 'Verdadeiro apenas se os numeradores forem inteiros', false), (@q, 'Falso para numeros negativos', false);

-- Questão 40
SET @q = (SELECT id_question FROM question WHERE topic_id = @t2 AND statement LIKE 'Encontre todos os racionais x tais que |x - 1/2| <= 1/3.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '[1/6, 5/6]');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '[1/6, 5/6]', true), (@q, '[0, 1]', false), (@q, '[-1/6, 5/6]', false), (@q, '[-1/3, 2/3]', false), (@q, '[1/3, 2/3]', false);

-- Questão 41
SET @q = (SELECT id_question FROM question WHERE topic_id = @t2 AND statement LIKE 'Calcule a soma da serie 1/2 + 1/4 + 1/8 + ... ate o 10 termo.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '1023/1024');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '1023/1024', true), (@q, '1', false), (@q, '511/512', false), (@q, '1024/1023', false), (@q, '1/2', false);

-- Questão 42
SET @q = (SELECT id_question FROM question WHERE topic_id = @t2 AND statement LIKE 'Se a/b = 2/3 e c/d = 3/4, demonstre que (a+c)/(b+d) esta entre 2/3 e 3/4.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Verdadeiro');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'Verdadeiro', true), (@q, 'Falso', false), (@q, 'Verdadeiro apenas se a,b,c,d positivos', false), (@q, 'Verdadeiro apenas se a+c = 1', false), (@q, 'Falso para qualquer valor', false);

-- Questão 43
SET @q = (SELECT id_question FROM question WHERE topic_id = @t2 AND statement LIKE 'Resolva: (2x/3 - 1)/(x + 1/2) = 4/5, com x diferente de -1/2.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'x = 9/2');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '9/2', true), (@q, '4', false), (@q, '5', false), (@q, '3', false), (@q, '2', false);

-- Questão 44
SET @q = (SELECT id_question FROM question WHERE topic_id = @t2 AND statement LIKE 'Uma conta bancaria rende 1/40 de juros mensais. Comecando com R$800,00, qual o saldo apos 3 meses de juros simples?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '860');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'R$860,00', true), (@q, 'R$820,00', false), (@q, 'R$840,00', false), (@q, 'R$880,00', false), (@q, 'R$900,00', false);

-- Questão 45
SET @q = (SELECT id_question FROM question WHERE topic_id = @t2 AND statement LIKE 'Prove ou refute: todo inteiro e racional, mas nem todo racional e inteiro.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Verdadeiro');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'Verdadeiro', true), (@q, 'Falso', false), (@q, 'Verdadeiro apenas para inteiros positivos', false), (@q, 'Falso porque todo racional e inteiro', false), (@q, 'Verdadeiro apenas para numeros naturais', false);

-- Questão 46
SET @q = (SELECT id_question FROM question WHERE topic_id = @t2 AND statement LIKE 'Dado que x e racional e sqrt(2) e irracional, mostre que x + sqrt(2) e irracional.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Verdadeiro');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'Verdadeiro', true), (@q, 'Falso', false), (@q, 'Depende de x', false), (@q, 'Verdadeiro apenas se x for inteiro', false), (@q, 'Falso se x for irracional', false);

-- Questão 47
SET @q = (SELECT id_question FROM question WHERE topic_id = @t2 AND statement LIKE 'Calcule o produto infinito (1 + 1/2)(1 + 1/4)(1 + 1/16)... e determine se ele converge.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Converge para 2');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'Converge para 2', true), (@q, 'Diverge', false), (@q, 'Converge para 1', false), (@q, 'Converge para 3', false), (@q, 'Converge para e', false);

-- Questão 48
SET @q = (SELECT id_question FROM question WHERE topic_id = @t2 AND statement LIKE 'Prove que sqrt(3) e irracional usando o metodo da contradicao.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Verdadeiro');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'Verdadeiro', true), (@q, 'Falso', false), (@q, 'Verdadeiro apenas para sqrt(2)', false), (@q, 'Falso porque sqrt(3) e racional', false), (@q, 'Verdadeiro apenas para numeros primos', false);

-- Questão 49
SET @q = (SELECT id_question FROM question WHERE topic_id = @t2 AND statement LIKE 'Encontre o menor racional positivo com denominador menor que 10 que seja maior que 7/8.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '8/9');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '8/9', true), (@q, '9/10', false), (@q, '7/8', false), (@q, '5/6', false), (@q, '6/7', false);

-- Questão 50
SET @q = (SELECT id_question FROM question WHERE topic_id = @t2 AND statement LIKE 'Se p/q e uma fracao irredutivel com q > 0, prove que sua representacao decimal e finita se e somente se q tem apenas os fatores primos 2 e 5.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Verdadeiro');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'Verdadeiro', true), (@q, 'Falso', false), (@q, 'Verdadeiro apenas se p for multiplo de 2 ou 5', false), (@q, 'Verdadeiro apenas se q for primo', false), (@q, 'Falso porque toda fracao tem decimal finita', false);

-- ============================================================
-- TÓPICO 3 - Expressoes Algebricas (50 MCQs, 5 alternativas)
-- ============================================================

SET @t3 = (SELECT id_topic FROM topic WHERE name = 'Expressoes Algebricas');

-- Inserir questões (20 easy, 15 medium, 15 hard)
INSERT INTO question (topic_id, statement, stats, difficulty) VALUES
                                                                  (@t3, 'Calcule o valor da expressao 3x + 2 para x = 4.', 'verified', 'easy'),
                                                                  (@t3, 'Simplifique: 5a + 3b - 2a + b.', 'verified', 'easy'),
                                                                  (@t3, 'Identifique os termos semelhantes em: 4x^2 + 3x - x^2 + 2x.', 'verified', 'easy'),
                                                                  (@t3, 'Expanda: 2(x + 3).', 'verified', 'easy'),
                                                                  (@t3, 'Qual e o grau do monomio 5x^3 y^2?', 'verified', 'easy'),
                                                                  (@t3, 'Calcule 2a^2 - 3a + 1 para a = -1.', 'verified', 'easy'),
                                                                  (@t3, 'Some os polinomios (3x + 2) e (x - 5).', 'verified', 'easy'),
                                                                  (@t3, 'Multiplique: 3x . 4x^2.', 'verified', 'easy'),
                                                                  (@t3, 'Subtraia: (5x^2 + 3x - 1) - (2x^2 - x + 4).', 'verified', 'easy'),
                                                                  (@t3, 'Qual e o coeficiente de x^2 em 7x^3 - 4x^2 + x - 9?', 'verified', 'easy'),
                                                                  (@t3, 'Fatore o monomio: 12ab + 18a.', 'verified', 'easy'),
                                                                  (@t3, 'Expanda usando produto notavel: (x + 5)^2.', 'verified', 'easy'),
                                                                  (@t3, 'Expanda: (x - 3)(x + 3).', 'verified', 'easy'),
                                                                  (@t3, 'Para quais valores de x a expressao x^2 - 4 e igual a zero?', 'verified', 'easy'),
                                                                  (@t3, 'Calcule o valor de 2x^2 + x - 3 para x = 2.', 'verified', 'easy'),
                                                                  (@t3, 'Simplifique: 4x^3 / 2x, com x diferente de 0.', 'verified', 'easy'),
                                                                  (@t3, 'Expanda (a + b)^2.', 'verified', 'easy'),
                                                                  (@t3, 'Qual o grau do polinomio 3x^4 - 2x^2 + 7?', 'verified', 'easy'),
                                                                  (@t3, 'Calcule (2x)(3y) para x = 2, y = 3.', 'verified', 'easy'),
                                                                  (@t3, 'Determine o valor numerico de x^3 para x = -2.', 'verified', 'easy'),
                                                                  (@t3, 'Simplifique: (x^2 - 9) / (x + 3), com x diferente de -3.', 'verified', 'medium'),
                                                                  (@t3, 'Expanda e simplifique: (2x - 1)^2 - (2x + 1)^2.', 'verified', 'medium'),
                                                                  (@t3, 'Fatorize completamente: x^2 + 5x + 6.', 'verified', 'medium'),
                                                                  (@t3, 'Divida o polinomio (x^2 + 3x + 2) por (x + 1).', 'verified', 'medium'),
                                                                  (@t3, 'Fatorize usando agrupamento: ax + ay + bx + by.', 'verified', 'medium'),
                                                                  (@t3, 'Simplifique: (2x^2 + 6x) / (4x), com x diferente de 0.', 'not_verified', 'medium'),
                                                                  (@t3, 'Demonstre que (a + b)^2 - (a - b)^2 = 4ab.', 'not_verified', 'medium'),
                                                                  (@t3, 'Fatorize: 4x^2 - 12x + 9.', 'not_verified', 'medium'),
                                                                  (@t3, 'Desenvolva (x + y + z)^2 como soma de termos.', 'not_verified', 'medium'),
                                                                  (@t3, 'Simplifique a fracao algebrica: (x^2 - x - 6) / (x^2 - 4).', 'not_verified', 'medium'),
                                                                  (@t3, 'Fatorize completamente: 2x^3 - 8x.', 'not_verified', 'medium'),
                                                                  (@t3, 'Encontre o resto da divisao de P(x) = x^3 - 4x + 1 por (x - 2) usando o Teorema do Resto.', 'not_verified', 'medium'),
                                                                  (@t3, 'Para x = sqrt(2) - 1, calcule x^2 + 2x.', 'not_verified', 'medium'),
                                                                  (@t3, 'Calcule o valor numerico de x^3 - 2x^2 + x - 3 para x = 2.', 'not_verified', 'medium'),
                                                                  (@t3, 'Dado que a + b = 5 e ab = 3, calcule a^2 + b^2.', 'not_verified', 'medium'),
                                                                  (@t3, 'Demonstre o Teorema do Binomio para n = 3.', 'not_verified', 'hard'),
                                                                  (@t3, 'Fatorize completamente: x^4 - 16.', 'not_verified', 'hard'),
                                                                  (@t3, 'Determine os valores de k para que x^2 + kx + 16 seja um quadrado perfeito.', 'not_verified', 'hard'),
                                                                  (@t3, 'Se P(x) = x^3 + ax^2 + bx - 4 tem raizes x=1 e x=2, determine a e b.', 'not_verified', 'hard'),
                                                                  (@t3, 'Prove que n^2 - n e sempre par para qualquer inteiro n.', 'not_verified', 'hard'),
                                                                  (@t3, 'Fatorize: x^4 - y^4.', 'not_verified', 'hard'),
                                                                  (@t3, 'Determine os zeros reais de P(x) = 6x^3 - 11x^2 - 4x + 4.', 'not_verified', 'hard'),
                                                                  (@t3, 'Simplifique: (a^3 - b^3)/(a - b) + (a^2 - b^2)/(a^2 + ab + b^2).', 'not_verified', 'hard'),
                                                                  (@t3, 'Se P(x) e divisivel por (x - r), mostre que P(r) = 0.', 'not_verified', 'hard'),
                                                                  (@t3, 'Determine todos os inteiros n para os quais n^2 + n + 1 e divisivel por 3.', 'not_verified', 'hard'),
                                                                  (@t3, 'Fatorize completamente x^6 - 1 como produto de polinomios irredutíveis sobre os reais.', 'not_verified', 'hard'),
                                                                  (@t3, 'Prove o Teorema do Fator: (x - a) divide P(x) se e somente se P(a) = 0.', 'not_verified', 'hard'),
                                                                  (@t3, 'Calcule o coeficiente de x^3 na expansao de (2x - 3)^5 pelo Binomio de Newton.', 'not_verified', 'hard'),
                                                                  (@t3, 'Simplifique [(x+y)^2 - (x-y)^2] / [2(x+y)(x-y)].', 'not_verified', 'hard'),
                                                                  (@t3, 'Prove que se a, b, c sao reais e a + b + c = 0, entao a^3 + b^3 + c^3 = 3abc.', 'not_verified', 'hard');

-- ============================================================
-- ALTERNATIVAS PARA O TÓPICO 3 (5 por questão)
-- ============================================================

-- Questão 1
SET @q = (SELECT id_question FROM question WHERE topic_id = @t3 AND statement = 'Calcule o valor da expressao 3x + 2 para x = 4.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '3*4+2=12+2=14');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '14', true), (@q, '10', false), (@q, '12', false), (@q, '16', false), (@q, '18', false);

-- Questão 2
SET @q = (SELECT id_question FROM question WHERE topic_id = @t3 AND statement = 'Simplifique: 5a + 3b - 2a + b.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '5a-2a=3a, 3b+b=4b -> 3a+4b');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '3a+4b', true), (@q, '3a+2b', false), (@q, '7a+4b', false), (@q, '3a-4b', false), (@q, '5a+4b', false);

-- Questão 3
SET @q = (SELECT id_question FROM question WHERE topic_id = @t3 AND statement = 'Identifique os termos semelhantes em: 4x^2 + 3x - x^2 + 2x.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '4x^2 e -x^2; 3x e 2x');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '4x^2 e -x^2; 3x e 2x', true), (@q, '4x^2 e 3x; -x^2 e 2x', false), (@q, '4x^2 e 2x; 3x e -x^2', false), (@q, 'Todos sao semelhantes', false), (@q, 'Nao ha termos semelhantes', false);

-- Questão 4
SET @q = (SELECT id_question FROM question WHERE topic_id = @t3 AND statement = 'Expanda: 2(x + 3).' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '2*x + 2*3 = 2x+6');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '2x+6', true), (@q, '2x+3', false), (@q, 'x+6', false), (@q, '2x-6', false), (@q, 'x+3', false);

-- Questão 5
SET @q = (SELECT id_question FROM question WHERE topic_id = @t3 AND statement = 'Qual e o grau do monomio 5x^3 y^2?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '3+2=5');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '5', true), (@q, '3', false), (@q, '2', false), (@q, '6', false), (@q, '1', false);

-- Questão 6
SET @q = (SELECT id_question FROM question WHERE topic_id = @t3 AND statement = 'Calcule 2a^2 - 3a + 1 para a = -1.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '2*1 -3*(-1)+1 = 2+3+1=6');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '6', true), (@q, '4', false), (@q, '2', false), (@q, '0', false), (@q, '-2', false);

-- Questão 7
SET @q = (SELECT id_question FROM question WHERE topic_id = @t3 AND statement = 'Some os polinomios (3x + 2) e (x - 5).' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '3x+x=4x, 2-5=-3 -> 4x-3');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '4x-3', true), (@q, '4x+3', false), (@q, '2x-3', false), (@q, '2x+3', false), (@q, '4x-7', false);

-- Questão 8
SET @q = (SELECT id_question FROM question WHERE topic_id = @t3 AND statement = 'Multiplique: 3x . 4x^2.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '3*4=12, x*x^2=x^3 -> 12x^3');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '12x^3', true), (@q, '12x^2', false), (@q, '7x^3', false), (@q, '12x', false), (@q, '7x^2', false);

-- Questão 9
SET @q = (SELECT id_question FROM question WHERE topic_id = @t3 AND statement = 'Subtraia: (5x^2 + 3x - 1) - (2x^2 - x + 4).' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '5x^2-2x^2=3x^2, 3x-(-x)=4x, -1-4=-5 -> 3x^2+4x-5');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '3x^2+4x-5', true), (@q, '3x^2+2x-5', false), (@q, '3x^2+4x+5', false), (@q, '3x^2-4x-5', false), (@q, '7x^2+2x-5', false);

-- Questão 10
SET @q = (SELECT id_question FROM question WHERE topic_id = @t3 AND statement = 'Qual e o coeficiente de x^2 em 7x^3 - 4x^2 + x - 9?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '-4');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '-4', true), (@q, '7', false), (@q, '1', false), (@q, '-9', false), (@q, '4', false);

-- Questão 11
SET @q = (SELECT id_question FROM question WHERE topic_id = @t3 AND statement = 'Fatore o monomio: 12ab + 18a.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '6a(2b+3)');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '6a(2b+3)', true), (@q, '6a(2b+3)', false), (@q, '3a(4b+6)', false), (@q, '2a(6b+9)', false), (@q, 'a(12b+18)', false);

-- Questão 12
SET @q = (SELECT id_question FROM question WHERE topic_id = @t3 AND statement = 'Expanda usando produto notavel: (x + 5)^2.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'x^2 + 10x + 25');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'x^2+10x+25', true), (@q, 'x^2+25', false), (@q, 'x^2+5x+25', false), (@q, 'x^2+10x+10', false), (@q, 'x^2+5x+10', false);

-- Questão 13
SET @q = (SELECT id_question FROM question WHERE topic_id = @t3 AND statement = 'Expanda: (x - 3)(x + 3).' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'x^2 - 9');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'x^2-9', true), (@q, 'x^2+9', false), (@q, 'x^2-6x+9', false), (@q, 'x^2+6x+9', false), (@q, 'x^2-3', false);

-- Questão 14
SET @q = (SELECT id_question FROM question WHERE topic_id = @t3 AND statement = 'Para quais valores de x a expressao x^2 - 4 e igual a zero?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'x = 2 e x = -2');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '2 e -2', true), (@q, '2 apenas', false), (@q, '-2 apenas', false), (@q, '4 e -4', false), (@q, '0 e 4', false);

-- Questão 15
SET @q = (SELECT id_question FROM question WHERE topic_id = @t3 AND statement = 'Calcule o valor de 2x^2 + x - 3 para x = 2.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '2*4+2-3=8+2-3=7');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '7', true), (@q, '9', false), (@q, '5', false), (@q, '11', false), (@q, '3', false);

-- Questão 16
SET @q = (SELECT id_question FROM question WHERE topic_id = @t3 AND statement = 'Simplifique: 4x^3 / 2x, com x diferente de 0.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '2x^2');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '2x^2', true), (@q, '2x^3', false), (@q, '2x', false), (@q, '4x^2', false), (@q, 'x^2', false);

-- Questão 17
SET @q = (SELECT id_question FROM question WHERE topic_id = @t3 AND statement = 'Expanda (a + b)^2.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'a^2 + 2ab + b^2');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'a^2+2ab+b^2', true), (@q, 'a^2+b^2', false), (@q, 'a^2-2ab+b^2', false), (@q, '2a+2b', false), (@q, 'a^2+ab+b^2', false);

-- Questão 18
SET @q = (SELECT id_question FROM question WHERE topic_id = @t3 AND statement = 'Qual o grau do polinomio 3x^4 - 2x^2 + 7?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '4');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '4', true), (@q, '3', false), (@q, '2', false), (@q, '1', false), (@q, '0', false);

-- Questão 19
SET @q = (SELECT id_question FROM question WHERE topic_id = @t3 AND statement = 'Calcule (2x)(3y) para x = 2, y = 3.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '2*2 * 3*3 = 4*9=36');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '36', true), (@q, '12', false), (@q, '18', false), (@q, '24', false), (@q, '30', false);

-- Questão 20
SET @q = (SELECT id_question FROM question WHERE topic_id = @t3 AND statement = 'Determine o valor numerico de x^3 para x = -2.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '(-2)^3 = -8');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '-8', true), (@q, '8', false), (@q, '-6', false), (@q, '6', false), (@q, '-2', false);

-- Questão 21 (medium)
SET @q = (SELECT id_question FROM question WHERE topic_id = @t3 AND statement LIKE 'Simplifique: (x^2 - 9) / (x + 3), com x diferente de -3.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '(x-3)(x+3)/(x+3)=x-3');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'x-3', true), (@q, 'x+3', false), (@q, 'x-9', false), (@q, 'x+9', false), (@q, 'x^2-3', false);

-- Questão 22
SET @q = (SELECT id_question FROM question WHERE topic_id = @t3 AND statement LIKE 'Expanda e simplifique: (2x - 1)^2 - (2x + 1)^2.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '-8x');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '-8x', true), (@q, '8x', false), (@q, '0', false), (@q, '-4x', false), (@q, '4x', false);

-- Questão 23
SET @q = (SELECT id_question FROM question WHERE topic_id = @t3 AND statement LIKE 'Fatorize completamente: x^2 + 5x + 6.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '(x+2)(x+3)');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '(x+2)(x+3)', true), (@q, '(x+1)(x+6)', false), (@q, '(x-2)(x-3)', false), (@q, '(x+2)(x-3)', false), (@q, '(x-2)(x+3)', false);

-- Questão 24
SET @q = (SELECT id_question FROM question WHERE topic_id = @t3 AND statement LIKE 'Divida o polinomio (x^2 + 3x + 2) por (x + 1).' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'x+2');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'x+2', true), (@q, 'x+1', false), (@q, 'x-2', false), (@q, '2x+2', false), (@q, 'x^2+2', false);

-- Questão 25
SET @q = (SELECT id_question FROM question WHERE topic_id = @t3 AND statement LIKE 'Fatorize usando agrupamento: ax + ay + bx + by.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '(a+b)(x+y)');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '(a+b)(x+y)', true), (@q, '(a-b)(x+y)', false), (@q, '(a+b)(x-y)', false), (@q, '(a-b)(x-y)', false), (@q, 'a(x+y)+b(x+y)', false);

-- Questão 26
SET @q = (SELECT id_question FROM question WHERE topic_id = @t3 AND statement LIKE 'Simplifique: (2x^2 + 6x) / (4x), com x diferente de 0.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '(x+3)/2');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '(x+3)/2', true), (@q, '2x+6', false), (@q, 'x/2+3', false), (@q, '2x+3', false), (@q, 'x+3', false);

-- Questão 27
SET @q = (SELECT id_question FROM question WHERE topic_id = @t3 AND statement LIKE 'Demonstre que (a + b)^2 - (a - b)^2 = 4ab.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Verdadeiro');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Verdadeiro', true), (@q, 'Falso', false), (@q, 'Falso, resulta 2ab', false), (@q, 'Falso, resulta 0', false), (@q, 'Verdadeiro apenas para a=b', false);

-- Questão 28
SET @q = (SELECT id_question FROM question WHERE topic_id = @t3 AND statement LIKE 'Fatorize: 4x^2 - 12x + 9.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '(2x-3)^2');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '(2x-3)^2', true), (@q, '(2x+3)^2', false), (@q, '(4x-3)^2', false), (@q, '(2x-9)^2', false), (@q, '(x-3)^2', false);

-- Questão 29
SET @q = (SELECT id_question FROM question WHERE topic_id = @t3 AND statement LIKE 'Desenvolva (x + y + z)^2 como soma de termos.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'x^2+y^2+z^2+2xy+2xz+2yz');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'x^2+y^2+z^2+2xy+2xz+2yz', true), (@q, 'x^2+y^2+z^2+xy+xz+yz', false), (@q, 'x^2+y^2+z^2+2xyz', false), (@q, '(x+y+z)^2', false), (@q, 'x^2+y^2+z^2', false);

-- Questão 30
SET @q = (SELECT id_question FROM question WHERE topic_id = @t3 AND statement LIKE 'Simplifique a fracao algebrica: (x^2 - x - 6) / (x^2 - 4).' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '(x-3)/(x-2)');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '(x-3)/(x-2)', true), (@q, '(x+2)/(x-2)', false), (@q, '(x-3)/(x+2)', false), (@q, '(x+3)/(x+2)', false), (@q, '(x-2)/(x+2)', false);

-- Questão 31
SET @q = (SELECT id_question FROM question WHERE topic_id = @t3 AND statement LIKE 'Fatorize completamente: 2x^3 - 8x.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '2x(x-2)(x+2)');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '2x(x-2)(x+2)', true), (@q, '2x(x^2-4)', false), (@q, '2x^3-8x', false), (@q, '2(x^3-4x)', false), (@q, 'x(2x^2-8)', false);

-- Questão 32
SET @q = (SELECT id_question FROM question WHERE topic_id = @t3 AND statement LIKE 'Encontre o resto da divisao de P(x) = x^3 - 4x + 1 por (x - 2) usando o Teorema do Resto.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '1');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '1', true), (@q, '0', false), (@q, '2', false), (@q, '-1', false), (@q, '3', false);

-- Questão 33
SET @q = (SELECT id_question FROM question WHERE topic_id = @t3 AND statement LIKE 'Para x = sqrt(2) - 1, calcule x^2 + 2x.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '1');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '1', true), (@q, '0', false), (@q, '2', false), (@q, '-1', false), (@q, '3', false);

-- Questão 34
SET @q = (SELECT id_question FROM question WHERE topic_id = @t3 AND statement LIKE 'Calcule o valor numerico de x^3 - 2x^2 + x - 3 para x = 2.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '-1');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '-1', true), (@q, '1', false), (@q, '-3', false), (@q, '3', false), (@q, '5', false);

-- Questão 35
SET @q = (SELECT id_question FROM question WHERE topic_id = @t3 AND statement LIKE 'Dado que a + b = 5 e ab = 3, calcule a^2 + b^2.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '19');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '19', true), (@q, '25', false), (@q, '13', false), (@q, '22', false), (@q, '16', false);

-- Questão 36 (hard)
SET @q = (SELECT id_question FROM question WHERE topic_id = @t3 AND statement LIKE 'Demonstre o Teorema do Binomio para n = 3.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '(a+b)^3 = a^3+3a^2b+3ab^2+b^3');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'a^3+3a^2b+3ab^2+b^3', true), (@q, 'a^3+2a^2b+2ab^2+b^3', false), (@q, 'a^3+a^2b+ab^2+b^3', false), (@q, 'a^3+4a^2b+4ab^2+b^3', false), (@q, 'a^3-3a^2b+3ab^2-b^3', false);

-- Questão 37
SET @q = (SELECT id_question FROM question WHERE topic_id = @t3 AND statement LIKE 'Fatorize completamente: x^4 - 16.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '(x^2+4)(x-2)(x+2)');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '(x^2+4)(x-2)(x+2)', true), (@q, '(x^2-4)(x^2+4)', false), (@q, '(x-2)^4', false), (@q, '(x-4)^4', false), (@q, '(x^2-16)', false);

-- Questão 38
SET @q = (SELECT id_question FROM question WHERE topic_id = @t3 AND statement LIKE 'Determine os valores de k para que x^2 + kx + 16 seja um quadrado perfeito.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'k = 8 ou k = -8');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '8 ou -8', true), (@q, '4 ou -4', false), (@q, '16 ou -16', false), (@q, '2 ou -2', false), (@q, '0', false);

-- Questão 39
SET @q = (SELECT id_question FROM question WHERE topic_id = @t3 AND statement LIKE 'Se P(x) = x^3 + ax^2 + bx - 4 tem raizes x=1 e x=2, determine a e b.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'a=-2, b=-1');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'a=-2, b=-1', true), (@q, 'a=2, b=1', false), (@q, 'a=-1, b=-2', false), (@q, 'a=1, b=2', false), (@q, 'a=0, b=0', false);

-- Questão 40
SET @q = (SELECT id_question FROM question WHERE topic_id = @t3 AND statement LIKE 'Prove que n^2 - n e sempre par para qualquer inteiro n.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Verdadeiro');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Verdadeiro', true), (@q, 'Falso', false), (@q, 'Verdadeiro apenas para n par', false), (@q, 'Verdadeiro apenas para n impar', false), (@q, 'Falso para n=0', false);

-- Questão 41
SET @q = (SELECT id_question FROM question WHERE topic_id = @t3 AND statement LIKE 'Fatorize: x^4 - y^4.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '(x^2+y^2)(x-y)(x+y)');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '(x^2+y^2)(x-y)(x+y)', true), (@q, '(x^2-y^2)^2', false), (@q, '(x-y)^4', false), (@q, '(x^4-y^4)', false), (@q, '(x^2-y^2)(x^2+y^2)', false);

-- Questão 42
SET @q = (SELECT id_question FROM question WHERE topic_id = @t3 AND statement LIKE 'Determine os zeros reais de P(x) = 6x^3 - 11x^2 - 4x + 4.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '2, -1/2, 2/3');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '2, -1/2, 2/3', true), (@q, '1, -1, 2', false), (@q, '-2, 1/2, -2/3', false), (@q, '2, 1/2, -2/3', false), (@q, '-2, -1/2, 2/3', false);

-- Questão 43
SET @q = (SELECT id_question FROM question WHERE topic_id = @t3 AND statement LIKE 'Simplifique: (a^3 - b^3)/(a - b) + (a^2 - b^2)/(a^2 + ab + b^2).' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'a+b');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'a+b', true), (@q, 'a-b', false), (@q, 'a^2+b^2', false), (@q, '2a', false), (@q, '2b', false);

-- Questão 44
SET @q = (SELECT id_question FROM question WHERE topic_id = @t3 AND statement LIKE 'Se P(x) e divisivel por (x - r), mostre que P(r) = 0.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Verdadeiro (Teorema do Fator)');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Verdadeiro', true), (@q, 'Falso', false), (@q, 'Verdadeiro apenas se r = 0', false), (@q, 'Verdadeiro apenas se o polinomio for monico', false), (@q, 'Falso para polinomios de grau par', false);

-- Questão 45
SET @q = (SELECT id_question FROM question WHERE topic_id = @t3 AND statement LIKE 'Determine todos os inteiros n para os quais n^2 + n + 1 e divisivel por 3.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'n ≡ 1 mod 3');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'n ≡ 1 mod 3', true), (@q, 'n ≡ 0 mod 3', false), (@q, 'n ≡ 2 mod 3', false), (@q, 'n par', false), (@q, 'n impar', false);

-- Questão 46
SET @q = (SELECT id_question FROM question WHERE topic_id = @t3 AND statement LIKE 'Fatorize completamente x^6 - 1 como produto de polinomios irredutíveis sobre os reais.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '(x-1)(x+1)(x^2+x+1)(x^2-x+1)');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '(x-1)(x+1)(x^2+x+1)(x^2-x+1)', true), (@q, '(x-1)^6', false), (@q, '(x^3-1)(x^3+1)', false), (@q, '(x^2-1)(x^4+x^2+1)', false), (@q, '(x-1)(x+1)(x^2+1)(x^2-1)', false);

-- Questão 47
SET @q = (SELECT id_question FROM question WHERE topic_id = @t3 AND statement LIKE 'Prove o Teorema do Fator: (x - a) divide P(x) se e somente se P(a) = 0.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Verdadeiro');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Verdadeiro', true), (@q, 'Falso', false), (@q, 'Verdadeiro apenas se a for inteiro', false), (@q, 'Falso para polinomios de grau 1', false), (@q, 'Verdadeiro apenas se P for monico', false);

-- Questão 48
SET @q = (SELECT id_question FROM question WHERE topic_id = @t3 AND statement LIKE 'Calcule o coeficiente de x^3 na expansao de (2x - 3)^5 pelo Binomio de Newton.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '720');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '720', true), (@q, '240', false), (@q, '-720', false), (@q, '-240', false), (@q, '360', false);

-- Questão 49
SET @q = (SELECT id_question FROM question WHERE topic_id = @t3 AND statement LIKE 'Simplifique [(x+y)^2 - (x-y)^2] / [2(x+y)(x-y)].' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '1/(x-y)');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '1/(x-y)', true), (@q, '1/(x+y)', false), (@q, '2/(x-y)', false), (@q, '2/(x+y)', false), (@q, '0', false);

-- Questão 50
SET @q = (SELECT id_question FROM question WHERE topic_id = @t3 AND statement LIKE 'Prove que se a, b, c sao reais e a + b + c = 0, entao a^3 + b^3 + c^3 = 3abc.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Verdadeiro');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Verdadeiro', true), (@q, 'Falso', false), (@q, 'Verdadeiro apenas se a=b=c=0', false), (@q, 'Verdadeiro apenas se um deles for zero', false), (@q, 'Falso para numeros negativos', false);

-- ============================================================
-- TÓPICO 4 - Equacoes do 1 Grau (50 MCQs, 5 alternativas)
-- ============================================================

SET @t4 = (SELECT id_topic FROM topic WHERE name = 'Equacoes do 1 Grau');

INSERT INTO question (topic_id, statement, stats, difficulty) VALUES
                                                                  (@t4, 'Resolva: x + 5 = 12.', 'verified', 'easy'),
                                                                  (@t4, 'Resolva: 3x = 21.', 'verified', 'easy'),
                                                                  (@t4, 'Resolva: 2x - 4 = 10.', 'verified', 'easy'),
                                                                  (@t4, 'Resolva: x/3 = 7.', 'verified', 'easy'),
                                                                  (@t4, 'Encontre x: 4x + 1 = 2x + 9.', 'verified', 'easy'),
                                                                  (@t4, 'Resolva: 5 - x = 3.', 'verified', 'easy'),
                                                                  (@t4, 'Resolva: -3x = 15.', 'verified', 'easy'),
                                                                  (@t4, 'A soma de um numero com 8 e 23. Qual e o numero?', 'verified', 'easy'),
                                                                  (@t4, 'Resolva: 2(x + 3) = 14.', 'verified', 'easy'),
                                                                  (@t4, 'Resolva: x/2 + 1 = 4.', 'verified', 'easy'),
                                                                  (@t4, 'Verifique se x = 3 e solucao de 5x - 2 = 13.', 'verified', 'easy'),
                                                                  (@t4, 'A idade de Luis e o dobro da de Bia. A soma das idades e 36. Qual e a idade de cada um?', 'verified', 'easy'),
                                                                  (@t4, 'Resolva: 7x - 3 = 4x + 9.', 'verified', 'easy'),
                                                                  (@t4, 'Resolva: -(x - 2) = 5.', 'verified', 'easy'),
                                                                  (@t4, 'Resolva: 10x = 0.', 'verified', 'easy'),
                                                                  (@t4, 'Resolva: x + 3x = 16.', 'verified', 'easy'),
                                                                  (@t4, 'Um numero acrescido de 15 e igual a 40. Qual e o numero?', 'verified', 'easy'),
                                                                  (@t4, 'Resolva: 2x + 7 = 19.', 'verified', 'easy'),
                                                                  (@t4, 'O triplo de um numero e 57. Qual e o numero?', 'verified', 'easy'),
                                                                  (@t4, 'Resolva: x - 12 = -4.', 'verified', 'easy'),
                                                                  (@t4, 'Resolva: (x + 1)/2 = (2x - 3)/5.', 'verified', 'medium'),
                                                                  (@t4, 'Um fazendeiro tem galinhas e coelhos totalizando 30 cabecas e 82 patas. Quantos de cada?', 'verified', 'medium'),
                                                                  (@t4, 'Resolva a inequacao: 3x - 5 < 7, e represente na reta.', 'verified', 'medium'),
                                                                  (@t4, 'Resolva o sistema: { x + y = 10 ; x - y = 4 }.', 'verified', 'medium'),
                                                                  (@t4, 'Dois trens partem em sentidos opostos a 80 km/h e 100 km/h. Em quanto tempo estarao a 540 km?', 'verified', 'medium'),
                                                                  (@t4, 'Para quais valores de a a equacao ax = 6 nao tem solucao?', 'not_verified', 'medium'),
                                                                  (@t4, 'Um produto sofre aumentos sucessivos de 20% e 10%. Qual o percentual total de aumento?', 'not_verified', 'medium'),
                                                                  (@t4, 'Resolva: |2x - 3| = 7.', 'not_verified', 'medium'),
                                                                  (@t4, 'Dois socios dividem R$8.400,00 na proporcao 2:5. Quanto recebe cada um?', 'not_verified', 'medium'),
                                                                  (@t4, 'Resolva o sistema por substituicao: { 3x + y = 11 ; x - 2y = 0 }.', 'not_verified', 'medium'),
                                                                  (@t4, 'Resolva: (3x+1)/4 - (x-2)/3 = 1/2.', 'not_verified', 'medium'),
                                                                  (@t4, 'A que temperatura a escala Celsius e Fahrenheit mostram o mesmo valor? (F = 9C/5 + 32)', 'not_verified', 'medium'),
                                                                  (@t4, 'Resolva: |x - 2| + |x + 1| = 5.', 'not_verified', 'medium'),
                                                                  (@t4, 'Resolva: 2(x - 3) + 3(x + 1) = 5x - 3 e classifique a equacao.', 'not_verified', 'medium'),
                                                                  (@t4, 'Dois socios investem R$12.000 juntos. O primeiro investe R$2.000 a mais que o segundo. Quanto cada um investiu?', 'not_verified', 'medium'),
                                                                  (@t4, 'Resolva o sistema 3x3: { x+y+z=6 ; 2x-y+z=3 ; x+2y-z=4 }.', 'not_verified', 'hard'),
                                                                  (@t4, 'Um capital rende juros simples de 2% ao mes. Em quantos meses um capital de R$5.000 se tornara R$6.200?', 'not_verified', 'hard'),
                                                                  (@t4, 'Prove que a equacao ax + b = 0 tem exatamente uma solucao se e somente se a diferente de 0.', 'not_verified', 'hard'),
                                                                  (@t4, 'Resolva e analise: (x-1)/(x+1) + 2/(x-1) = 4/(x^2-1), com x diferente de +-1.', 'not_verified', 'hard'),
                                                                  (@t4, 'Uma torneira A enche um tanque em 4h; B em 6h; C o esvazia em 8h. Abertas juntas a partir de vazio, quando fica cheio?', 'not_verified', 'hard'),
                                                                  (@t4, 'Encontre todos os inteiros x tais que 3x e congruente a 2 (mod 5).', 'not_verified', 'hard'),
                                                                  (@t4, 'Dois carros A e B estao a 420 km de distancia e se aproximam. A vai a 90 km/h e sai 30 min depois de B, que vai a 80 km/h. Onde se encontram?', 'not_verified', 'hard'),
                                                                  (@t4, 'Mostre que se a > 0, a inequacao ax > b tem solucao {x > b/a}, e se a < 0, tem solucao {x < b/a}.', 'not_verified', 'hard'),
                                                                  (@t4, 'Resolva o sistema { 2x + 3y = 7 ; 4x + 6y = 14 } e classifique-o.', 'not_verified', 'hard'),
                                                                  (@t4, 'Um trem de 200 m viaja a 72 km/h. Em quanto tempo ele atravessa um tunel de 1.300 m?', 'not_verified', 'hard'),
                                                                  (@t4, 'Resolva: floor(x) + x = 3,5, onde floor(x) e a parte inteira de x.', 'not_verified', 'hard'),
                                                                  (@t4, 'Determine todos os reais x tais que |3x - 1| <= |x + 5|.', 'not_verified', 'hard'),
                                                                  (@t4, 'Resolva o sistema { x + 2y - z = 3 ; 2x - y + 3z = 7 ; x + y + z = 5 } usando escalonamento.', 'not_verified', 'hard'),
                                                                  (@t4, 'Prove que se a equacao ax + b = cx + d tem infinitas solucoes, entao a = c e b = d.', 'not_verified', 'hard'),
                                                                  (@t4, 'Uma mistura de duas solucoes: a primeira tem 30% de sal e a segunda 10%. Quantos litros de cada sao necessarios para obter 20 litros a 18%?', 'not_verified', 'hard');


-- ============================================================
-- ALTERNATIVAS TÓPICO 4
-- ============================================================

-- Questão 1
SET @q = (SELECT id_question FROM question WHERE topic_id = @t4 AND statement LIKE 'Resolva: x + 5 = 12%' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'x = 12-5 = 7');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '7', true), (@q, '5', false), (@q, '6', false), (@q, '8', false), (@q, '4', false);

-- Questão 2
SET @q = (SELECT id_question FROM question WHERE topic_id = @t4 AND statement LIKE 'Resolva: 3x = 21%' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'x = 21/3 = 7');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '7', true), (@q, '6', false), (@q, '8', false), (@q, '9', false), (@q, '5', false);

-- Questão 3
SET @q = (SELECT id_question FROM question WHERE topic_id = @t4 AND statement LIKE 'Resolva: 2x - 4 = 10%' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '2x = 14 => x=7');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '7', true), (@q, '3', false), (@q, '5', false), (@q, '9', false), (@q, '4', false);

-- Questão 4
SET @q = (SELECT id_question FROM question WHERE topic_id = @t4 AND statement LIKE 'Resolva: x/3 = 7%' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'x = 7*3 = 21');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '21', true), (@q, '4', false), (@q, '10', false), (@q, '24', false), (@q, '18', false);

-- Questão 5
SET @q = (SELECT id_question FROM question WHERE topic_id = @t4 AND statement LIKE 'Encontre x: 4x + 1 = 2x + 9%' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '4x-2x = 9-1 => 2x=8 => x=4');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '4', true), (@q, '2', false), (@q, '3', false), (@q, '5', false), (@q, '6', false);

-- Questão 6
SET @q = (SELECT id_question FROM question WHERE topic_id = @t4 AND statement LIKE 'Resolva: 5 - x = 3%' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '-x = 3-5 => -x=-2 => x=2');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '2', true), (@q, '-2', false), (@q, '8', false), (@q, '1', false), (@q, '3', false);

-- Questão 7
SET @q = (SELECT id_question FROM question WHERE topic_id = @t4 AND statement LIKE 'Resolva: -3x = 15%' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'x = 15/(-3) = -5');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '-5', true), (@q, '5', false), (@q, '-3', false), (@q, '3', false), (@q, '0', false);

-- Questão 8
SET @q = (SELECT id_question FROM question WHERE topic_id = @t4 AND statement LIKE 'A soma de um numero com 8 e 23%' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'x+8=23 => x=15');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '15', true), (@q, '31', false), (@q, '20', false), (@q, '16', false), (@q, '14', false);

-- Questão 9
SET @q = (SELECT id_question FROM question WHERE topic_id = @t4 AND statement LIKE 'Resolva: 2(x + 3) = 14%' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '2x+6=14 => 2x=8 => x=4');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '4', true), (@q, '5', false), (@q, '6', false), (@q, '3', false), (@q, '2', false);

-- Questão 10
SET @q = (SELECT id_question FROM question WHERE topic_id = @t4 AND statement LIKE 'Resolva: x/2 + 1 = 4%' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'x/2 = 3 => x=6');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '6', true), (@q, '4', false), (@q, '5', false), (@q, '7', false), (@q, '8', false);

-- Questão 11
SET @q = (SELECT id_question FROM question WHERE topic_id = @t4 AND statement LIKE 'Verifique se x = 3 e solucao de 5x - 2 = 13%' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '5*3-2=15-2=13 => sim');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Sim', true), (@q, 'Nao', false), (@q, 'Talvez', false), (@q, 'Apenas se x=2', false), (@q, 'Apenas se x=4', false);

-- Questão 12
SET @q = (SELECT id_question FROM question WHERE topic_id = @t4 AND statement LIKE 'A idade de Luis e o dobro da de Bia%' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'L=2B, L+B=36 => 3B=36 => B=12, L=24');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Luis 24, Bia 12', true), (@q, 'Luis 18, Bia 18', false), (@q, 'Luis 20, Bia 16', false), (@q, 'Luis 30, Bia 6', false), (@q, 'Luis 12, Bia 24', false);

-- Questão 13
SET @q = (SELECT id_question FROM question WHERE topic_id = @t4 AND statement LIKE 'Resolva: 7x - 3 = 4x + 9%' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '7x-4x=9+3 => 3x=12 => x=4');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '4', true), (@q, '3', false), (@q, '5', false), (@q, '6', false), (@q, '2', false);

-- Questão 14
SET @q = (SELECT id_question FROM question WHERE topic_id = @t4 AND statement LIKE 'Resolva: -(x - 2) = 5%' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '-x+2=5 => -x=3 => x=-3');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '-3', true), (@q, '3', false), (@q, '7', false), (@q, '-7', false), (@q, '1', false);

-- Questão 15
SET @q = (SELECT id_question FROM question WHERE topic_id = @t4 AND statement LIKE 'Resolva: 10x = 0%' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'x = 0/10 = 0');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '0', true), (@q, '1', false), (@q, '10', false), (@q, '-10', false), (@q, 'Nao tem solucao', false);

-- Questão 16
SET @q = (SELECT id_question FROM question WHERE topic_id = @t4 AND statement LIKE 'Resolva: x + 3x = 16%' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '4x=16 => x=4');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '4', true), (@q, '3', false), (@q, '5', false), (@q, '2', false), (@q, '6', false);

-- Questão 17
SET @q = (SELECT id_question FROM question WHERE topic_id = @t4 AND statement LIKE 'Um numero acrescido de 15 e igual a 40%' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'x+15=40 => x=25');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '25', true), (@q, '15', false), (@q, '55', false), (@q, '30', false), (@q, '20', false);

-- Questão 18
SET @q = (SELECT id_question FROM question WHERE topic_id = @t4 AND statement LIKE 'Resolva: 2x + 7 = 19%' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '2x=12 => x=6');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '6', true), (@q, '5', false), (@q, '7', false), (@q, '8', false), (@q, '4', false);

-- Questão 19
SET @q = (SELECT id_question FROM question WHERE topic_id = @t4 AND statement LIKE 'O triplo de um numero e 57%' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '3x=57 => x=19');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '19', true), (@q, '20', false), (@q, '18', false), (@q, '17', false), (@q, '21', false);

-- Questão 20
SET @q = (SELECT id_question FROM question WHERE topic_id = @t4 AND statement LIKE 'Resolva: x - 12 = -4%' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'x = 12-4 = 8');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '8', true), (@q, '4', false), (@q, '-8', false), (@q, '16', false), (@q, '12', false);

-- Questão 21
SET @q = (SELECT id_question FROM question WHERE topic_id = @t4 AND statement LIKE 'Resolva: (x + 1)/2 = (2x - 3)/5%' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '5(x+1)=2(2x-3) => 5x+5=4x-6 => x=-11');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '-11', true), (@q, '11', false), (@q, '1', false), (@q, '-1', false), (@q, '0', false);

-- Questão 22
SET @q = (SELECT id_question FROM question WHERE topic_id = @t4 AND statement LIKE 'Um fazendeiro tem galinhas e coelhos totalizando 30 cabecas e 82 patas%' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'G+C=30, 2G+4C=82 => 2G+4(30-G)=82 => 2G+120-4G=82 => -2G=-38 => G=19, C=11');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '19 galinhas, 11 coelhos', true), (@q, '11 galinhas, 19 coelhos', false), (@q, '20 galinhas, 10 coelhos', false), (@q, '15 galinhas, 15 coelhos', false), (@q, '10 galinhas, 20 coelhos', false);

-- Questão 23
SET @q = (SELECT id_question FROM question WHERE topic_id = @t4 AND statement LIKE 'Resolva a inequacao: 3x - 5 < 7%' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '3x < 12 => x < 4');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'x < 4', true), (@q, 'x > 4', false), (@q, 'x <= 4', false), (@q, 'x >= 4', false), (@q, 'x = 4', false);

-- Questão 24
SET @q = (SELECT id_question FROM question WHERE topic_id = @t4 AND statement LIKE 'Resolva o sistema: { x + y = 10 ; x - y = 4 }%' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '2x=14 => x=7, y=3');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'x=7, y=3', true), (@q, 'x=3, y=7', false), (@q, 'x=6, y=4', false), (@q, 'x=4, y=6', false), (@q, 'x=5, y=5', false);

-- Questão 25
SET @q = (SELECT id_question FROM question WHERE topic_id = @t4 AND statement LIKE 'Dois trens partem em sentidos opostos a 80 km/h e 100 km/h%' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Velocidade relativa = 180 km/h, tempo = 540/180 = 3h');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '3 horas', true), (@q, '2 horas', false), (@q, '4 horas', false), (@q, '5 horas', false), (@q, '6 horas', false);

-- Questão 26
SET @q = (SELECT id_question FROM question WHERE topic_id = @t4 AND statement LIKE 'Para quais valores de a a equacao ax = 6 nao tem solucao?%' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'a = 0');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'a = 0', true), (@q, 'a = 1', false), (@q, 'a = 6', false), (@q, 'a = -1', false), (@q, 'a = 2', false);

-- Questão 27
SET @q = (SELECT id_question FROM question WHERE topic_id = @t4 AND statement LIKE 'Um produto sofre aumentos sucessivos de 20% e 10%' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '1,20 * 1,10 = 1,32 => 32%');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '32%', true), (@q, '30%', false), (@q, '25%', false), (@q, '28%', false), (@q, '35%', false);

-- Questão 28
SET @q = (SELECT id_question FROM question WHERE topic_id = @t4 AND statement LIKE 'Resolva: |2x - 3| = 7%' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '2x-3=7 => x=5; 2x-3=-7 => x=-2');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'x = 5 ou x = -2', true), (@q, 'x = 5 apenas', false), (@q, 'x = -2 apenas', false), (@q, 'x = 2 ou x = -5', false), (@q, 'x = 10 ou x = -4', false);

-- Questão 29
SET @q = (SELECT id_question FROM question WHERE topic_id = @t4 AND statement LIKE 'Dois socios dividem R$8.400,00 na proporcao 2:5%' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '2k+5k=7k=8400 => k=1200 => 2400 e 6000');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'R$2.400 e R$6.000', true), (@q, 'R$2.800 e R$5.600', false), (@q, 'R$3.000 e R$5.400', false), (@q, 'R$1.200 e R$7.200', false), (@q, 'R$4.200 e R$4.200', false);

-- Questão 30
SET @q = (SELECT id_question FROM question WHERE topic_id = @t4 AND statement LIKE 'Resolva o sistema por substituicao: { 3x + y = 11 ; x - 2y = 0 }%' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'x=2y => 3(2y)+y=11 => 7y=11 => y=11/7, x=22/7');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'x=22/7, y=11/7', true), (@q, 'x=11/7, y=22/7', false), (@q, 'x=2, y=1', false), (@q, 'x=1, y=2', false), (@q, 'x=3, y=1', false);

-- Questão 31
SET @q = (SELECT id_question FROM question WHERE topic_id = @t4 AND statement LIKE 'Resolva: (3x+1)/4 - (x-2)/3 = 1/2%' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'MMC=12 => 3(3x+1)-4(x-2)=6 => 9x+3-4x+8=6 => 5x+11=6 => 5x=-5 => x=-1');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '-1', true), (@q, '1', false), (@q, '0', false), (@q, '2', false), (@q, '-2', false);

-- Questão 32
SET @q = (SELECT id_question FROM question WHERE topic_id = @t4 AND statement LIKE 'A que temperatura a escala Celsius e Fahrenheit mostram o mesmo valor%' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'C = 9C/5+32 => C - 9C/5 = 32 => -4C/5=32 => C=-40');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '-40', true), (@q, '0', false), (@q, '100', false), (@q, '32', false), (@q, '-20', false);

-- Questão 33
SET @q = (SELECT id_question FROM question WHERE topic_id = @t4 AND statement LIKE 'Resolva: |x - 2| + |x + 1| = 5%' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Solucoes: x = -2 ou x = 3');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'x = -2 ou x = 3', true), (@q, 'x = 2 ou x = -3', false), (@q, 'x = -1 ou x = 4', false), (@q, 'x = 0 ou x = 5', false), (@q, 'x = 1 ou x = 2', false);

-- Questão 34
SET @q = (SELECT id_question FROM question WHERE topic_id = @t4 AND statement LIKE 'Resolva: 2(x - 3) + 3(x + 1) = 5x - 3 e classifique%' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '2x-6+3x+3=5x-3 => 5x-3=5x-3 => identidade');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Infinitas solucoes', true), (@q, 'Uma solucao', false), (@q, 'Nenhuma solucao', false), (@q, 'x=0', false), (@q, 'x=3', false);

-- Questão 35
SET @q = (SELECT id_question FROM question WHERE topic_id = @t4 AND statement LIKE 'Dois socios investem R$12.000 juntos. O primeiro investe R$2.000 a mais que o segundo%' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'x+(x+2000)=12000 => 2x=10000 => x=5000, x+2000=7000');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'R$7.000 e R$5.000', true), (@q, 'R$6.000 e R$6.000', false), (@q, 'R$8.000 e R$4.000', false), (@q, 'R$10.000 e R$2.000', false), (@q, 'R$9.000 e R$3.000', false);

-- Questão 36
SET @q = (SELECT id_question FROM question WHERE topic_id = @t4 AND statement LIKE 'Resolva o sistema 3x3: { x+y+z=6 ; 2x-y+z=3 ; x+2y-z=4 }%' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Solucao: x=1, y=2, z=3');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'x=1, y=2, z=3', true), (@q, 'x=2, y=1, z=3', false), (@q, 'x=3, y=2, z=1', false), (@q, 'x=2, y=3, z=1', false), (@q, 'x=1, y=3, z=2', false);

-- Questão 37
SET @q = (SELECT id_question FROM question WHERE topic_id = @t4 AND statement LIKE 'Um capital rende juros simples de 2% ao mes. Em quantos meses%' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'J = 1200 = 5000*0,02*t => 1200 = 100t => t = 12');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '12 meses', true), (@q, '10 meses', false), (@q, '15 meses', false), (@q, '8 meses', false), (@q, '6 meses', false);

-- Questão 38
SET @q = (SELECT id_question FROM question WHERE topic_id = @t4 AND statement LIKE 'Prove que a equacao ax + b = 0 tem exatamente uma solucao se e somente se a diferente de 0%' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Verdadeiro');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Verdadeiro', true), (@q, 'Falso', false), (@q, 'Verdadeiro apenas se a>0', false), (@q, 'Verdadeiro apenas se b=0', false), (@q, 'Falso se a=0', false);

-- Questão 39
SET @q = (SELECT id_question FROM question WHERE topic_id = @t4 AND statement LIKE 'Resolva e analise: (x-1)/(x+1) + 2/(x-1) = 4/(x^2-1)%' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Multiplica por (x^2-1): (x-1)^2 + 2(x+1) = 4 => x^2+3=4 => x^2=1 => x=±1, mas nao pode => sem solucao');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Sem solucao', true), (@q, 'x=1', false), (@q, 'x=-1', false), (@q, 'x=0', false), (@q, 'x=2', false);

-- Questão 40
SET @q = (SELECT id_question FROM question WHERE topic_id = @t4 AND statement LIKE 'Uma torneira A enche um tanque em 4h; B em 6h; C o esvazia em 8h%' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Taxa: 1/4+1/6-1/8 = (6+4-3)/24 = 7/24 => tempo = 24/7 h');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '24/7 horas', true), (@q, '4 horas', false), (@q, '3 horas', false), (@q, '5 horas', false), (@q, '6 horas', false);

-- Questão 41
SET @q = (SELECT id_question FROM question WHERE topic_id = @t4 AND statement LIKE 'Encontre todos os inteiros x tais que 3x e congruente a 2 (mod 5)%' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '3x ≡ 2 mod5 => multiplica por inverso de 3 (que é 2) => x ≡ 4 mod5');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'x ≡ 4 (mod 5)', true), (@q, 'x ≡ 1 (mod 5)', false), (@q, 'x ≡ 2 (mod 5)', false), (@q, 'x ≡ 3 (mod 5)', false), (@q, 'x ≡ 0 (mod 5)', false);

-- Questão 42
SET @q = (SELECT id_question FROM question WHERE topic_id = @t4 AND statement LIKE 'Dois carros A e B estao a 420 km de distancia e se aproximam%' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'B sai primeiro: em 0,5h percorre 40km. Distancia restante 380km, velocidade relativa 170km/h, tempo 380/170 ≈ 2,235h. Posicao a partir de A: 90*(38/17) ≈ 201,18 km');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Aproximadamente 201 km do ponto de partida de A', true), (@q, '200 km', false), (@q, '220 km', false), (@q, '180 km', false), (@q, '240 km', false);

-- Questão 43
SET @q = (SELECT id_question FROM question WHERE topic_id = @t4 AND statement LIKE 'Mostre que se a > 0, a inequacao ax > b tem solucao {x > b/a}%' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Verdadeiro');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Verdadeiro', true), (@q, 'Falso', false), (@q, 'Verdadeiro apenas para b>0', false), (@q, 'Verdadeiro apenas para a=1', false), (@q, 'Falso quando a=0', false);

-- Questão 44
SET @q = (SELECT id_question FROM question WHERE topic_id = @t4 AND statement LIKE 'Resolva o sistema { 2x + 3y = 7 ; 4x + 6y = 14 } e classifique-o%' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Segunda equacao = 2*(primeira) => infinitas solucoes');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Infinitas solucoes', true), (@q, 'Uma solucao', false), (@q, 'Nenhuma solucao', false), (@q, 'Solucao unica (0, 7/3)', false), (@q, 'Sistema impossivel', false);

-- Questão 45
SET @q = (SELECT id_question FROM question WHERE topic_id = @t4 AND statement LIKE 'Um trem de 200 m viaja a 72 km/h. Em quanto tempo ele atravessa um tunel de 1.300 m%' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Distancia total = 200+1300=1500m = 1,5km, velocidade 72km/h = 20m/s, tempo = 1500/20 = 75s');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '75 segundos', true), (@q, '65 segundos', false), (@q, '85 segundos', false), (@q, '90 segundos', false), (@q, '60 segundos', false);

-- Questão 46
SET @q = (SELECT id_question FROM question WHERE topic_id = @t4 AND statement LIKE 'Resolva: floor(x) + x = 3,5%' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Seja n = floor(x), n + x = 3,5 => x = 3,5 - n. Como n ≤ x < n+1 => n ≤ 3,5-n < n+1 => 2n ≤ 3,5 < 2n+1 => n=1 => x=2,5');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'x = 2,5', true), (@q, 'x = 1,5', false), (@q, 'x = 3,5', false), (@q, 'x = 2,0', false), (@q, 'x = 3,0', false);

-- Questão 47
SET @q = (SELECT id_question FROM question WHERE topic_id = @t4 AND statement LIKE 'Determine todos os reais x tais que |3x - 1| <= |x + 5|%' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Elevando ao quadrado: (3x-1)^2 <= (x+5)^2 => 8x^2-16x-24<=0 => x^2-2x-3<=0 => -1 <= x <= 3');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '[-1, 3]', true), (@q, '(-∞, -1] ∪ [3, ∞)', false), (@q, '[-3, 1]', false), (@q, '[0, 4]', false), (@q, '[-2, 2]', false);

-- Questão 48
SET @q = (SELECT id_question FROM question WHERE topic_id = @t4 AND statement LIKE 'Resolva o sistema { x + 2y - z = 3 ; 2x - y + 3z = 7 ; x + y + z = 5 } usando escalonamento%' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Solucao: x=1, y=1, z=3');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '(1,1,3)', true), (@q, '(2,1,2)', false), (@q, '(1,2,2)', false), (@q, '(3,1,1)', false), (@q, '(0,2,3)', false);

-- Questão 49
SET @q = (SELECT id_question FROM question WHERE topic_id = @t4 AND statement LIKE 'Prove que se a equacao ax + b = cx + d tem infinitas solucoes, entao a = c e b = d%' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Verdadeiro');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Verdadeiro', true), (@q, 'Falso', false), (@q, 'Verdadeiro apenas se a=c', false), (@q, 'Verdadeiro apenas se b=d', false), (@q, 'Falso, pode ter infinitas solucoes mesmo com a≠c', false);

-- Questão 50
SET @q = (SELECT id_question FROM question WHERE topic_id = @t4 AND statement LIKE 'Uma mistura de duas solucoes: a primeira tem 30% de sal e a segunda 10%%' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'x+y=20, 0,3x+0,1y=3,6 => 0,3x+0,1(20-x)=3,6 => 0,3x+2-0,1x=3,6 => 0,2x=1,6 => x=8, y=12');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '8L de 30% e 12L de 10%', true), (@q, '12L de 30% e 8L de 10%', false), (@q, '10L de cada', false), (@q, '6L de 30% e 14L de 10%', false), (@q, '14L de 30% e 6L de 10%', false);
-- ============================================================
-- TÓPICO 5 - Equacoes do 2 Grau (50 MCQs, 5 alternativas)
-- ============================================================

SET @t5 = (SELECT id_topic FROM topic WHERE name = 'Equacoes do 2 Grau');

-- Inserir questões (20 easy, 15 medium, 15 hard)
INSERT INTO question (topic_id, statement, stats, difficulty) VALUES
                                                                  (@t5, 'Resolva: x^2 - 4 = 0.', 'verified', 'easy'),
                                                                  (@t5, 'Calcule o discriminante (delta) de x^2 - 5x + 6 = 0.', 'verified', 'easy'),
                                                                  (@t5, 'Resolva: x^2 + 2x + 1 = 0.', 'verified', 'easy'),
                                                                  (@t5, 'Resolva: 2x^2 - 8 = 0.', 'verified', 'easy'),
                                                                  (@t5, 'Determine as raizes de x^2 - 3x = 0.', 'verified', 'easy'),
                                                                  (@t5, 'Para que valores de k a equacao x^2 - kx + 9 = 0 tem raizes reais iguais?', 'verified', 'easy'),
                                                                  (@t5, 'Resolva: x^2 - 7x + 12 = 0.', 'verified', 'easy'),
                                                                  (@t5, 'Identifique os coeficientes a, b, c em 5x^2 + 3x - 2 = 0.', 'verified', 'easy'),
                                                                  (@t5, 'Resolva por fatoracao: x^2 - x - 6 = 0.', 'verified', 'easy'),
                                                                  (@t5, 'Classifique o discriminante de x^2 + x + 1 = 0.', 'verified', 'easy'),
                                                                  (@t5, 'Determine a soma e o produto das raizes de 3x^2 - 5x + 2 = 0.', 'verified', 'easy'),
                                                                  (@t5, 'Resolva por completacao de quadrados: x^2 - 6x + 5 = 0.', 'verified', 'easy'),
                                                                  (@t5, 'Escreva uma equacao do 2 grau cujas raizes sao 3 e -5.', 'verified', 'easy'),
                                                                  (@t5, 'Resolva: (x - 2)^2 = 9.', 'verified', 'easy'),
                                                                  (@t5, 'Resolva: x^2 = 25.', 'verified', 'easy'),
                                                                  (@t5, 'Calcule o vertice da parabola y = x^2 - 4x + 3.', 'verified', 'easy'),
                                                                  (@t5, 'Resolva: x^2 - 9 = 0.', 'verified', 'easy'),
                                                                  (@t5, 'Determine as raizes de x^2 + 5x = 0.', 'verified', 'easy'),
                                                                  (@t5, 'Resolva: x^2 - 6x + 9 = 0.', 'verified', 'easy'),
                                                                  (@t5, 'Para que valores de m a equacao x^2 + 2x + m = 0 nao tem raizes reais?', 'verified', 'easy'),
                                                                  (@t5, 'A area de um retangulo e 84 cm^2 e o comprimento excede a largura em 5 cm. Encontre as dimensoes.', 'verified', 'medium'),
                                                                  (@t5, 'Resolva: x^2 - 4x + 4 = (x-2)(x+3).', 'verified', 'medium'),
                                                                  (@t5, 'Para que valores de k a equacao x^2 - 2kx + k + 2 = 0 tem raizes positivas?', 'verified', 'medium'),
                                                                  (@t5, 'Resolva a inequacao: x^2 - 5x + 4 <= 0.', 'verified', 'medium'),
                                                                  (@t5, 'Um objeto e lancado verticalmente e sua altura e h(t) = -5t^2 + 20t. Quando atinge a altura maxima?', 'verified', 'medium'),
                                                                  (@t5, 'Resolva o sistema: { x + y = 5 ; x^2 + y^2 = 13 }.', 'not_verified', 'medium'),
                                                                  (@t5, 'Resolva: |x^2 - 4| = 5.', 'not_verified', 'medium'),
                                                                  (@t5, 'Um numero positivo e tal que o dobro de seu quadrado menos 5 vezes ele vale 12. Qual e o numero?', 'not_verified', 'medium'),
                                                                  (@t5, 'Escreva a equacao cuja soma de raizes e -3 e produto e -10.', 'not_verified', 'medium'),
                                                                  (@t5, 'Resolva: 3x^2 - 5x + 1 = 0 (raizes exatas).', 'not_verified', 'medium'),
                                                                  (@t5, 'Resolva a inequacao: 2x^2 + x - 3 > 0.', 'not_verified', 'medium'),
                                                                  (@t5, 'Determine para quais k o sistema { y = x^2 ; y = kx + 2 } tem dois pontos de intersecao.', 'not_verified', 'medium'),
                                                                  (@t5, 'A soma dos quadrados de dois numeros consecutivos e 85. Quais sao eles?', 'not_verified', 'medium'),
                                                                  (@t5, 'Resolva: x^2 - (sqrt(2)+sqrt(3))x + sqrt(6) = 0.', 'not_verified', 'medium'),
                                                                  (@t5, 'Determine o maior e o menor valor de y = -x^2 + 4x + 5 no intervalo [0, 5].', 'not_verified', 'medium'),
                                                                  (@t5, 'Prove que se r1 e r2 sao raizes de ax^2+bx+c=0, entao a(x-r1)(x-r2) = ax^2+bx+c.', 'not_verified', 'hard'),
                                                                  (@t5, 'Determine os valores reais de m para que x^4 - mx^2 + 1 = 0 tenha 4 raizes reais distintas.', 'not_verified', 'hard'),
                                                                  (@t5, 'Resolva o sistema: { x^2 + y^2 = 25 ; x^2 - y^2 = 7 }.', 'not_verified', 'hard'),
                                                                  (@t5, 'Mostre que para a > 0, a equacao ax^2+bx+c=0 tem raizes reais se e somente se b^2 >= 4ac.', 'not_verified', 'hard'),
                                                                  (@t5, 'Determine todos os reais k para que x^2 + kx + k > 0 para todo x real.', 'not_verified', 'hard'),
                                                                  (@t5, 'Resolva a equacao biquadrada: x^4 - 13x^2 + 36 = 0.', 'not_verified', 'hard'),
                                                                  (@t5, 'Um foguete tem altura h(t) = -4,9t^2 + 49t + 5. Qual e o tempo de voo completo?', 'not_verified', 'hard'),
                                                                  (@t5, 'Para quais k a equacao x^2 + (k-1)x + k^2 - 4 = 0 tem raizes de sinais opostos?', 'not_verified', 'hard'),
                                                                  (@t5, 'Resolva: (x^2 - 5x + 4)/(x - 2) = x - 3, com x diferente de 2.', 'not_verified', 'hard'),
                                                                  (@t5, 'Determine o maior valor de k inteiro para que x^2 - kx + (k^2 - 5) = 0 tenha raizes reais.', 'not_verified', 'hard'),
                                                                  (@t5, 'Prove que se delta < 0, a expressao ax^2+bx+c tem o mesmo sinal de a para todo x real.', 'not_verified', 'hard'),
                                                                  (@t5, 'Resolva o sistema: { x^2 + xy = 6 ; xy + y^2 = 3 }.', 'not_verified', 'hard'),
                                                                  (@t5, 'Encontre os parametros a e b tais que ax^2 + bx + 1 = 0 tenha raizes 2 e 1/2.', 'not_verified', 'hard'),
                                                                  (@t5, 'Determine todos os inteiros n para os quais n^2 - 7n + 12 < 0.', 'not_verified', 'hard'),
                                                                  (@t5, 'Prove que se as raizes de x^2 + px + q = 0 sao reais, entao p^2 >= 4q.', 'not_verified', 'hard');

-- ============================================================
-- ALTERNATIVAS TÓPICO 5 (5 alternativas por questão)
-- ============================================================

-- 1
SET @q = (SELECT id_question FROM question WHERE topic_id = @t5 AND statement = 'Resolva: x^2 - 4 = 0.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'x^2=4 => x=±2');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'x = 2 ou x = -2', true), (@q, 'x = 2 apenas', false), (@q, 'x = -2 apenas', false), (@q, 'x = 4 ou x = -4', false), (@q, 'x = 0', false);

-- 2
SET @q = (SELECT id_question FROM question WHERE topic_id = @t5 AND statement = 'Calcule o discriminante (delta) de x^2 - 5x + 6 = 0.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Δ = (-5)^2 - 4*1*6 = 25-24=1');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '1', true), (@q, '0', false), (@q, '4', false), (@q, '49', false), (@q, '-1', false);

-- 3
SET @q = (SELECT id_question FROM question WHERE topic_id = @t5 AND statement = 'Resolva: x^2 + 2x + 1 = 0.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '(x+1)^2=0 => x=-1 (dupla)');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'x = -1 (raiz dupla)', true), (@q, 'x = 1', false), (@q, 'x = -1 e x = 1', false), (@q, 'x = 0', false), (@q, 'Sem raizes reais', false);

-- 4
SET @q = (SELECT id_question FROM question WHERE topic_id = @t5 AND statement = 'Resolva: 2x^2 - 8 = 0.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '2x^2=8 => x^2=4 => x=±2');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'x = 2 ou x = -2', true), (@q, 'x = 2 apenas', false), (@q, 'x = -2 apenas', false), (@q, 'x = 4 ou x = -4', false), (@q, 'x = 0', false);

-- 5
SET @q = (SELECT id_question FROM question WHERE topic_id = @t5 AND statement = 'Determine as raizes de x^2 - 3x = 0.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'x(x-3)=0 => x=0 ou x=3');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'x = 0 ou x = 3', true), (@q, 'x = 0 apenas', false), (@q, 'x = 3 apenas', false), (@q, 'x = 0 ou x = -3', false), (@q, 'x = -3 ou x = 3', false);

-- 6
SET @q = (SELECT id_question FROM question WHERE topic_id = @t5 AND statement = 'Para que valores de k a equacao x^2 - kx + 9 = 0 tem raizes reais iguais?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Δ = k^2 - 36 = 0 => k=±6');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'k = 6 ou k = -6', true), (@q, 'k = 6 apenas', false), (@q, 'k = -6 apenas', false), (@q, 'k = 3 ou k = -3', false), (@q, 'k = 0', false);

-- 7
SET @q = (SELECT id_question FROM question WHERE topic_id = @t5 AND statement = 'Resolva: x^2 - 7x + 12 = 0.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '(x-3)(x-4)=0 => x=3 ou x=4');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'x = 3 ou x = 4', true), (@q, 'x = -3 ou x = -4', false), (@q, 'x = 2 ou x = 6', false), (@q, 'x = 1 ou x = 12', false), (@q, 'x = 7 ± 1', false);

-- 8
SET @q = (SELECT id_question FROM question WHERE topic_id = @t5 AND statement = 'Identifique os coeficientes a, b, c em 5x^2 + 3x - 2 = 0.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'a=5, b=3, c=-2');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'a=5, b=3, c=-2', true), (@q, 'a=5, b=3, c=2', false), (@q, 'a=5, b=-3, c=2', false), (@q, 'a=5, b=3, c=0', false), (@q, 'a=5, b=-3, c=-2', false);

-- 9
SET @q = (SELECT id_question FROM question WHERE topic_id = @t5 AND statement = 'Resolva por fatoracao: x^2 - x - 6 = 0.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '(x-3)(x+2)=0 => x=3 ou x=-2');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'x = 3 ou x = -2', true), (@q, 'x = -3 ou x = 2', false), (@q, 'x = 3 ou x = 2', false), (@q, 'x = -3 ou x = -2', false), (@q, 'x = 6 ou x = -1', false);

-- 10
SET @q = (SELECT id_question FROM question WHERE topic_id = @t5 AND statement = 'Classifique o discriminante de x^2 + x + 1 = 0.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Δ = 1-4 = -3 < 0');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Negativo', true), (@q, 'Positivo', false), (@q, 'Zero', false), (@q, 'Nao real', false), (@q, 'Indefinido', false);

-- 11
SET @q = (SELECT id_question FROM question WHERE topic_id = @t5 AND statement = 'Determine a soma e o produto das raizes de 3x^2 - 5x + 2 = 0.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Soma = 5/3, produto = 2/3');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'S=5/3, P=2/3', true), (@q, 'S=5, P=2', false), (@q, 'S=-5/3, P=2/3', false), (@q, 'S=5/3, P=-2/3', false), (@q, 'S= -5, P= -2', false);

-- 12
SET @q = (SELECT id_question FROM question WHERE topic_id = @t5 AND statement = 'Resolva por completacao de quadrados: x^2 - 6x + 5 = 0.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '(x-3)^2 -4=0 => (x-3)^2=4 => x-3=±2 => x=5 ou x=1');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'x = 5 ou x = 1', true), (@q, 'x = -5 ou x = -1', false), (@q, 'x = 3 ± 2', false), (@q, 'x = 6 ou x = 0', false), (@q, 'x = 2 ou x = 4', false);

-- 13
SET @q = (SELECT id_question FROM question WHERE topic_id = @t5 AND statement = 'Escreva uma equacao do 2 grau cujas raizes sao 3 e -5.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '(x-3)(x+5)=0 => x^2+2x-15=0');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'x^2 + 2x - 15 = 0', true), (@q, 'x^2 - 2x - 15 = 0', false), (@q, 'x^2 + 2x + 15 = 0', false), (@q, 'x^2 - 2x + 15 = 0', false), (@q, 'x^2 - 15 = 0', false);

-- 14
SET @q = (SELECT id_question FROM question WHERE topic_id = @t5 AND statement = 'Resolva: (x - 2)^2 = 9.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'x-2=±3 => x=5 ou x=-1');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'x = 5 ou x = -1', true), (@q, 'x = 5 apenas', false), (@q, 'x = -1 apenas', false), (@q, 'x = 2 ± 3', false), (@q, 'x = 9 ou x = -9', false);

-- 15
SET @q = (SELECT id_question FROM question WHERE topic_id = @t5 AND statement = 'Resolva: x^2 = 25.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'x = ±5');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'x = 5 ou x = -5', true), (@q, 'x = 5 apenas', false), (@q, 'x = -5 apenas', false), (@q, 'x = 25 ou x = -25', false), (@q, 'x = 0', false);

-- 16
SET @q = (SELECT id_question FROM question WHERE topic_id = @t5 AND statement = 'Calcule o vertice da parabola y = x^2 - 4x + 3.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'xv = -b/(2a)=4/2=2, yv=4-8+3=-1 => (2,-1)');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '(2, -1)', true), (@q, '(-2, -1)', false), (@q, '(2, 1)', false), (@q, '(4, 3)', false), (@q, '(0, 3)', false);

-- 17
SET @q = (SELECT id_question FROM question WHERE topic_id = @t5 AND statement = 'Resolva: x^2 - 9 = 0.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'x^2=9 => x=±3');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'x = 3 ou x = -3', true), (@q, 'x = 3 apenas', false), (@q, 'x = -3 apenas', false), (@q, 'x = 9 ou x = -9', false), (@q, 'x = 0', false);

-- 18
SET @q = (SELECT id_question FROM question WHERE topic_id = @t5 AND statement = 'Determine as raizes de x^2 + 5x = 0.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'x(x+5)=0 => x=0 ou x=-5');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'x = 0 ou x = -5', true), (@q, 'x = 0 ou x = 5', false), (@q, 'x = 5 ou x = -5', false), (@q, 'x = 0 apenas', false), (@q, 'x = -5 apenas', false);

-- 19
SET @q = (SELECT id_question FROM question WHERE topic_id = @t5 AND statement = 'Resolva: x^2 - 6x + 9 = 0.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '(x-3)^2=0 => x=3 (dupla)');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'x = 3 (raiz dupla)', true), (@q, 'x = -3', false), (@q, 'x = 3 ou x = -3', false), (@q, 'x = 0', false), (@q, 'x = 6', false);

-- 20
SET @q = (SELECT id_question FROM question WHERE topic_id = @t5 AND statement = 'Para que valores de m a equacao x^2 + 2x + m = 0 nao tem raizes reais?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Δ = 4 - 4m < 0 => 4 < 4m => m > 1');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'm > 1', true), (@q, 'm < 1', false), (@q, 'm >= 1', false), (@q, 'm <= 1', false), (@q, 'm = 1', false);

-- 21 (medium)
SET @q = (SELECT id_question FROM question WHERE topic_id = @t5 AND statement LIKE 'A area de um retangulo e 84 cm^2 e o comprimento excede a largura em 5 cm. Encontre as dimensoes.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'x(x+5)=84 => x^2+5x-84=0 => x=7 => dimensoes 7 e 12');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '7 cm e 12 cm', true), (@q, '6 cm e 14 cm', false), (@q, '8 cm e 10,5 cm', false), (@q, '4 cm e 21 cm', false), (@q, '9 cm e 9,33 cm', false);

-- 22
SET @q = (SELECT id_question FROM question WHERE topic_id = @t5 AND statement LIKE 'Resolva: x^2 - 4x + 4 = (x-2)(x+3).' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'x^2-4x+4 = x^2+x-6 => -4x-4 = x-6 => -5x = -2 => x=0,4');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'x = 0,4', true), (@q, 'x = 0', false), (@q, 'x = 1', false), (@q, 'x = -1', false), (@q, 'x = 2', false);

-- 23
SET @q = (SELECT id_question FROM question WHERE topic_id = @t5 AND statement LIKE 'Para que valores de k a equacao x^2 - 2kx + k + 2 = 0 tem raizes positivas?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Δ>=0, soma>0, produto>0 => k^2 - k -2 >=0 => (k-2)(k+1)>=0 => k<=-1 ou k>=2; soma=2k>0 => k>0; produto=k+2>0 => k>-2. Interseccao: k>=2');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'k >= 2', true), (@q, 'k <= -1', false), (@q, 'k > 0', false), (@q, 'k < -2', false), (@q, '-1 <= k <= 2', false);

-- 24
SET @q = (SELECT id_question FROM question WHERE topic_id = @t5 AND statement LIKE 'Resolva a inequacao: x^2 - 5x + 4 <= 0.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Raizes 1 e 4, parabola p/ cima => [1,4]');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '[1, 4]', true), (@q, '(-∞, 1] ∪ [4, ∞)', false), (@q, '(1, 4)', false), (@q, '(-∞, 1) ∪ (4, ∞)', false), (@q, 'x = 1 ou x = 4', false);

-- 25
SET @q = (SELECT id_question FROM question WHERE topic_id = @t5 AND statement LIKE 'Um objeto e lancado verticalmente e sua altura e h(t) = -5t^2 + 20t. Quando atinge a altura maxima?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 't = -b/(2a) = -20/(2*(-5)) = 2s');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 't = 2 s', true), (@q, 't = 4 s', false), (@q, 't = 1 s', false), (@q, 't = 0 s', false), (@q, 't = 20 s', false);

-- 26
SET @q = (SELECT id_question FROM question WHERE topic_id = @t5 AND statement LIKE 'Resolva o sistema: { x + y = 5 ; x^2 + y^2 = 13 }.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'y=5-x => x^2+(5-x)^2=13 => 2x^2-10x+25=13 => 2x^2-10x+12=0 => x^2-5x+6=0 => x=2 ou 3 => pares (2,3) e (3,2)');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '(2,3) e (3,2)', true), (@q, '(1,4) e (4,1)', false), (@q, '(0,5) e (5,0)', false), (@q, '(2,3) apenas', false), (@q, '(-1,6) e (6,-1)', false);

-- 27
SET @q = (SELECT id_question FROM question WHERE topic_id = @t5 AND statement LIKE 'Resolva: |x^2 - 4| = 5.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'x^2-4=5 => x^2=9 => x=±3; ou x^2-4=-5 => x^2=-1 => sem solucao real');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'x = 3 ou x = -3', true), (@q, 'x = ±1', false), (@q, 'x = ±√9', false), (@q, 'x = 0', false), (@q, 'x = ±5', false);

-- 28
SET @q = (SELECT id_question FROM question WHERE topic_id = @t5 AND statement LIKE 'Um numero positivo e tal que o dobro de seu quadrado menos 5 vezes ele vale 12. Qual e o numero?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '2x^2 -5x = 12 => 2x^2-5x-12=0 => Δ=25+96=121 => x = (5±11)/4 => x=4 ou x=-1,5 => positivo: 4');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '4', true), (@q, '3', false), (@q, '5', false), (@q, '6', false), (@q, '2', false);

-- 29
SET @q = (SELECT id_question FROM question WHERE topic_id = @t5 AND statement LIKE 'Escreva a equacao cuja soma de raizes e -3 e produto e -10.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'x^2 - Sx + P = 0 => x^2 +3x -10 =0');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'x^2 + 3x - 10 = 0', true), (@q, 'x^2 - 3x - 10 = 0', false), (@q, 'x^2 + 3x + 10 = 0', false), (@q, 'x^2 - 3x + 10 = 0', false), (@q, 'x^2 - 10x + 3 = 0', false);

-- 30
SET @q = (SELECT id_question FROM question WHERE topic_id = @t5 AND statement LIKE 'Resolva: 3x^2 - 5x + 1 = 0 (raizes exatas).' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Δ=25-12=13 => x = (5 ± √13)/6');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '(5 ± √13)/6', true), (@q, '(5 ± √13)/2', false), (@q, '(5 ± √13)/3', false), (@q, '( -5 ± √13)/6', false), (@q, '(5 ± 13)/6', false);

-- 31
SET @q = (SELECT id_question FROM question WHERE topic_id = @t5 AND statement LIKE 'Resolva a inequacao: 2x^2 + x - 3 > 0.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Raizes: x = [-1 ± √(1+24)]/(4) = [-1 ± 5]/4 => x=1 ou x=-1,5; parabola p/ cima => x<-1,5 ou x>1');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'x < -1,5 ou x > 1', true), (@q, '-1,5 < x < 1', false), (@q, 'x ≤ -1,5 ou x ≥ 1', false), (@q, 'x = -1,5 ou x = 1', false), (@q, 'x > 0', false);

-- 32
SET @q = (SELECT id_question FROM question WHERE topic_id = @t5 AND statement LIKE 'Determine para quais k o sistema { y = x^2 ; y = kx + 2 } tem dois pontos de intersecao.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'x^2 = kx+2 => x^2 - kx -2 =0 => Δ = k^2+8 >0 sempre => sempre dois pontos reais distintos');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Todos os k reais', true), (@q, 'k > 0', false), (@q, 'k < 0', false), (@q, 'k ≠ 0', false), (@q, 'k > 2', false);

-- 33
SET @q = (SELECT id_question FROM question WHERE topic_id = @t5 AND statement LIKE 'A soma dos quadrados de dois numeros consecutivos e 85. Quais sao eles?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'n^2+(n+1)^2=85 => 2n^2+2n+1=85 => 2n^2+2n-84=0 => n^2+n-42=0 => n=6 ou n=-7 => pares: 6 e 7 ou -7 e -6');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '6 e 7 ou -7 e -6', true), (@q, '6 e 7 apenas', false), (@q, '9 e 10', false), (@q, '4 e 5', false), (@q, '8 e 9', false);

-- 34
SET @q = (SELECT id_question FROM question WHERE topic_id = @t5 AND statement LIKE 'Resolva: x^2 - (sqrt(2)+sqrt(3))x + sqrt(6) = 0.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Produto = √6, soma = √2+√3 => raizes são √2 e √3');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'x = √2 ou x = √3', true), (@q, 'x = √2 apenas', false), (@q, 'x = √3 apenas', false), (@q, 'x = √5', false), (@q, 'x = √6', false);

-- 35
SET @q = (SELECT id_question FROM question WHERE topic_id = @t5 AND statement LIKE 'Determine o maior e o menor valor de y = -x^2 + 4x + 5 no intervalo [0, 5].' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Vertice em x=2, y=9; extremos: x=0 -> 5, x=5 -> -25+20+5=0; max=9, min=0');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'máx = 9, mín = 0', true), (@q, 'máx = 9, mín = 5', false), (@q, 'máx = 5, mín = 0', false), (@q, 'máx = 8, mín = 1', false), (@q, 'máx = 9, mín = -25', false);

-- 36 (hard)
SET @q = (SELECT id_question FROM question WHERE topic_id = @t5 AND statement LIKE 'Prove que se r1 e r2 sao raizes de ax^2+bx+c=0, entao a(x-r1)(x-r2) = ax^2+bx+c.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Verdadeiro');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Verdadeiro', true), (@q, 'Falso', false), (@q, 'Verdadeiro apenas se a=1', false), (@q, 'Verdadeiro apenas se as raizes forem reais', false), (@q, 'Falso para raizes complexas', false);

-- 37
SET @q = (SELECT id_question FROM question WHERE topic_id = @t5 AND statement LIKE 'Determine os valores reais de m para que x^4 - mx^2 + 1 = 0 tenha 4 raizes reais distintas.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Faz y=x^2, y^2 - my +1=0. Para x ter 4 raizes reais distintas, y deve ter duas raizes reais positivas distintas: Δ>0, S>0, P>0 => m^2-4>0 => m>2 ou m<-2; S=m>0 => m>2; P=1>0 => m>2');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'm > 2', true), (@q, 'm < -2', false), (@q, '|m| > 2', false), (@q, 'm > 0', false), (@q, 'm > 1', false);

-- 38
SET @q = (SELECT id_question FROM question WHERE topic_id = @t5 AND statement LIKE 'Resolva o sistema: { x^2 + y^2 = 25 ; x^2 - y^2 = 7 }.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Somando: 2x^2=32 => x^2=16 => x=±4, y^2=9 => y=±3');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '(4,3), (4,-3), (-4,3), (-4,-3)', true), (@q, '(5,0) e (0,5)', false), (@q, '(4,3) apenas', false), (@q, '(±4, ±3) sem repetir', false), (@q, '(5,0)', false);

-- 39
SET @q = (SELECT id_question FROM question WHERE topic_id = @t5 AND statement LIKE 'Mostre que para a > 0, a equacao ax^2+bx+c=0 tem raizes reais se e somente se b^2 >= 4ac.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Verdadeiro');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Verdadeiro', true), (@q, 'Falso', false), (@q, 'Verdadeiro apenas para a=1', false), (@q, 'Verdadeiro apenas para c=0', false), (@q, 'Falso se a<0', false);

-- 40
SET @q = (SELECT id_question FROM question WHERE topic_id = @t5 AND statement LIKE 'Determine todos os reais k para que x^2 + kx + k > 0 para todo x real.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Δ < 0 e a>0 => k^2 - 4k < 0 => k(k-4) < 0 => 0 < k < 4');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '0 < k < 4', true), (@q, 'k < 0 ou k > 4', false), (@q, 'k ≤ 0 ou k ≥ 4', false), (@q, 'k > 0', false), (@q, 'k < 4', false);

-- 41
SET @q = (SELECT id_question FROM question WHERE topic_id = @t5 AND statement LIKE 'Resolva a equacao biquadrada: x^4 - 13x^2 + 36 = 0.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'y=x^2 => y^2-13y+36=0 => y=4 ou y=9 => x=±2, ±3');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'x = ±2, ±3', true), (@q, 'x = ±4, ±9', false), (@q, 'x = ±√4, ±√9', false), (@q, 'x = ±6', false), (@q, 'x = ±1, ±6', false);

-- 42
SET @q = (SELECT id_question FROM question WHERE topic_id = @t5 AND statement LIKE 'Um foguete tem altura h(t) = -4,9t^2 + 49t + 5. Qual e o tempo de voo completo?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'h=0 => -4,9t^2+49t+5=0 => 4,9t^2-49t-5=0 => Δ=2401+98=2499 => t = (49 ± √2499)/(9,8) ≈ (49 ± 50)/9,8 => t ≈ 10,1s (positivo)');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Aproximadamente 10,1 s', true), (@q, '10 s', false), (@q, '9,8 s', false), (@q, '5 s', false), (@q, '2 s', false);

-- 43
SET @q = (SELECT id_question FROM question WHERE topic_id = @t5 AND statement LIKE 'Para quais k a equacao x^2 + (k-1)x + k^2 - 4 = 0 tem raizes de sinais opostos?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Produto < 0 => k^2-4 < 0 => -2 < k < 2; e Δ > 0: (k-1)^2 -4(k^2-4) >0 => k^2 -2k+1 -4k^2+16 >0 => -3k^2 -2k+17>0 => 3k^2+2k-17<0 => k entre raízes aprox -2,7 e 2,1. Interseccao com (-2,2) => (-2,2)');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '-2 < k < 2', true), (@q, 'k < -2 ou k > 2', false), (@q, 'k > 0', false), (@q, 'k < 0', false), (@q, 'k = 0', false);

-- 44
SET @q = (SELECT id_question FROM question WHERE topic_id = @t5 AND statement LIKE 'Resolva: (x^2 - 5x + 4)/(x - 2) = x - 3, com x diferente de 2.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'x^2-5x+4 = (x-3)(x-2) => x^2-5x+4 = x^2-5x+6 => 4=6 => impossível');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Sem solucao', true), (@q, 'x = 2', false), (@q, 'x = 0', false), (@q, 'x = 1', false), (@q, 'x = 4', false);

-- 45
SET @q = (SELECT id_question FROM question WHERE topic_id = @t5 AND statement LIKE 'Determine o maior valor de k inteiro para que x^2 - kx + (k^2 - 5) = 0 tenha raizes reais.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Δ >= 0 => k^2 -4(k^2-5) >=0 => k^2 -4k^2+20 >=0 => -3k^2+20>=0 => 3k^2 <=20 => |k| <= √(20/3) ≈ 2,58 => k inteiro: -2,-1,0,1,2 => maior=2');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '2', true), (@q, '1', false), (@q, '0', false), (@q, '3', false), (@q, '-2', false);

-- 46
SET @q = (SELECT id_question FROM question WHERE topic_id = @t5 AND statement LIKE 'Prove que se delta < 0, a expressao ax^2+bx+c tem o mesmo sinal de a para todo x real.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Verdadeiro');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Verdadeiro', true), (@q, 'Falso', false), (@q, 'Verdadeiro apenas para a > 0', false), (@q, 'Verdadeiro apenas para a < 0', false), (@q, 'Depende do valor de x', false);

-- 47
SET @q = (SELECT id_question FROM question WHERE topic_id = @t5 AND statement LIKE 'Resolva o sistema: { x^2 + xy = 6 ; xy + y^2 = 3 }.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Somando: x^2+2xy+y^2=9 => (x+y)^2=9 => x+y=±3. Subtraindo: x^2 - y^2 =3 => (x-y)(x+y)=3. Se x+y=3 => x-y=1 => x=2,y=1. Se x+y=-3 => x-y=-1 => x=-2,y=-1.');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '(2,1) e (-2,-1)', true), (@q, '(1,2) e (-1,-2)', false), (@q, '(3,0) e (0,3)', false), (@q, '(√6,0)', false), (@q, '(2,1) apenas', false);

-- 48
SET @q = (SELECT id_question FROM question WHERE topic_id = @t5 AND statement LIKE 'Encontre os parametros a e b tais que ax^2 + bx + 1 = 0 tenha raizes 2 e 1/2.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Soma = 2 + 1/2 = 5/2 = -b/a; Produto = 1 = 1/a => a=1, b= -5/2');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'a=1, b=-5/2', true), (@q, 'a=2, b=-5', false), (@q, 'a=-1, b=5/2', false), (@q, 'a=1, b=5/2', false), (@q, 'a=2, b=5', false);

-- 49
SET @q = (SELECT id_question FROM question WHERE topic_id = @t5 AND statement LIKE 'Determine todos os inteiros n para os quais n^2 - 7n + 12 < 0.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Raizes 3 e 4, parabola p/ cima => 3 < n < 4 => nenhum inteiro');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Nenhum', true), (@q, 'n = 3 ou 4', false), (@q, 'n = 3', false), (@q, 'n = 4', false), (@q, 'n = 5', false);

-- 50
SET @q = (SELECT id_question FROM question WHERE topic_id = @t5 AND statement LIKE 'Prove que se as raizes de x^2 + px + q = 0 sao reais, entao p^2 >= 4q.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Verdadeiro (Δ = p^2 - 4q >= 0)');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Verdadeiro', true), (@q, 'Falso', false), (@q, 'Verdadeiro apenas para p positivo', false), (@q, 'Verdadeiro apenas para q negativo', false), (@q, 'Verdadeiro apenas se as raizes forem distintas', false);

-- ============================================================
-- TÓPICO 6 - Geometria Plana (50 MCQs, 5 alternativas)
-- ============================================================

SET @t6 = (SELECT id_topic FROM topic WHERE name = 'Geometria Plana');

-- Inserir questões (20 easy, 15 medium, 15 hard)
INSERT INTO question (topic_id, statement, stats, difficulty) VALUES
                                                                  (@t6, 'Calcule a area de um retangulo de 8 cm por 5 cm.', 'verified', 'easy'),
                                                                  (@t6, 'Qual e o perimetro de um quadrado de lado 7 cm?', 'verified', 'easy'),
                                                                  (@t6, 'Calcule a area de um triangulo de base 10 cm e altura 6 cm.', 'verified', 'easy'),
                                                                  (@t6, 'Qual e a area de um circulo de raio 4 cm? (use pi = 3,14)', 'verified', 'easy'),
                                                                  (@t6, 'Quantos graus tem a soma dos angulos internos de um pentagono?', 'verified', 'easy'),
                                                                  (@t6, 'Um angulo mede 65 graus. Qual e o seu complemento?', 'verified', 'easy'),
                                                                  (@t6, 'Dois angulos suplementares somam 180 graus. Um deles mede 110. Qual e o outro?', 'verified', 'easy'),
                                                                  (@t6, 'Calcule a hipotenusa de um triangulo retangulo com catetos 3 e 4.', 'verified', 'easy'),
                                                                  (@t6, 'Qual e o perimetro de um circulo de diametro 10 cm?', 'verified', 'easy'),
                                                                  (@t6, 'Defina o que e um quadrilatero e de dois exemplos.', 'verified', 'easy'),
                                                                  (@t6, 'Classifique os triangulos quanto aos lados.', 'verified', 'easy'),
                                                                  (@t6, 'Calcule a area de um trapezio com bases 8 e 12 cm e altura 5 cm.', 'verified', 'easy'),
                                                                  (@t6, 'Quantos eixos de simetria tem um quadrado?', 'verified', 'easy'),
                                                                  (@t6, 'Um angulo e o triplo do seu complemento. Qual e o valor desse angulo?', 'verified', 'easy'),
                                                                  (@t6, 'Quantos graus tem a soma dos angulos internos de um hexagono?', 'verified', 'easy'),
                                                                  (@t6, 'Qual e a area de um paralelogramo de base 10 cm e altura 7 cm?', 'verified', 'easy'),
                                                                  (@t6, 'Dois angulos sao opostos pelo vertice. Um mede 55 graus. Qual e o outro?', 'verified', 'easy'),
                                                                  (@t6, 'Qual e a medida do angulo externo de um triangulo equilatero?', 'verified', 'easy'),
                                                                  (@t6, 'Calcule o perimetro de um triangulo com lados 5, 12 e 13 cm.', 'verified', 'easy'),
                                                                  (@t6, 'Qual e a area de um losango com diagonais de 6 cm e 8 cm?', 'verified', 'easy'),
                                                                  (@t6, 'Calcule a area do setor circular com raio 6 cm e angulo central de 90 graus.', 'verified', 'medium'),
                                                                  (@t6, 'Dois triangulos semelhantes tem lados 3, 4, 5 e 6, 8, 10. Qual e a razao de semelhanca?', 'verified', 'medium'),
                                                                  (@t6, 'Prove que a soma dos angulos internos de qualquer triangulo e 180 graus.', 'verified', 'medium'),
                                                                  (@t6, 'Calcule a diagonal de um retangulo de lados 5 cm e 12 cm.', 'verified', 'medium'),
                                                                  (@t6, 'Usando o Teorema de Tales, calcule x se os segmentos paralelos dividem as retas em 3, 5 e x, 8.', 'verified', 'medium'),
                                                                  (@t6, 'Calcule a area da regiao sombreada entre dois circulos concentricos de raios 5 e 3 cm.', 'not_verified', 'medium'),
                                                                  (@t6, 'Um hexagono regular tem lado 4 cm. Calcule sua area e perimetro.', 'not_verified', 'medium'),
                                                                  (@t6, 'Um losango tem diagonais de 10 cm e 24 cm. Calcule sua area e o lado.', 'not_verified', 'medium'),
                                                                  (@t6, 'Calcule o angulo central de um poligono regular de 12 lados.', 'not_verified', 'medium'),
                                                                  (@t6, 'Calcule a area de um triangulo com lados 5, 7 e 8 cm usando a formula de Heron.', 'not_verified', 'medium'),
                                                                  (@t6, 'Quantas diagonais tem um poligono convexo de 10 lados?', 'not_verified', 'medium'),
                                                                  (@t6, 'Um circulo esta inscrito em um quadrado de lado 6 cm. Qual e a area entre o circulo e o quadrado?', 'not_verified', 'medium'),
                                                                  (@t6, 'Dados dois triangulos com angulos iguais, prove que eles sao semelhantes.', 'not_verified', 'medium'),
                                                                  (@t6, 'Calcule a area de um triangulo equilatero de lado 8 cm.', 'not_verified', 'medium'),
                                                                  (@t6, 'Um poligono regular de 8 lados tem lado 3 cm. Calcule seu perimetro e a soma de seus angulos internos.', 'not_verified', 'medium'),
                                                                  (@t6, 'Demonstre o Teorema de Pitagoras usando triangulos semelhantes.', 'not_verified', 'hard'),
                                                                  (@t6, 'Calcule a area maxima de um retangulo inscrito em um circulo de raio R.', 'not_verified', 'hard'),
                                                                  (@t6, 'Prove que a area de um triangulo equilatero de lado a e (a^2 * sqrt(3)) / 4.', 'not_verified', 'hard'),
                                                                  (@t6, 'Um poligono regular de n lados e inscrito num circulo de raio R. Derive a formula de sua area.', 'not_verified', 'hard'),
                                                                  (@t6, 'Demonstre que todo angulo inscrito numa semicircunferencia e reto.', 'not_verified', 'hard'),
                                                                  (@t6, 'Prove que a soma dos angulos externos de qualquer poligono convexo e 360 graus.', 'not_verified', 'hard'),
                                                                  (@t6, 'Um triangulo tem angulos em progressao aritmetica. Prove que um deles e necessariamente 60 graus.', 'not_verified', 'hard'),
                                                                  (@t6, 'Determine o raio do circulo inscrito em um triangulo de lados 3, 4 e 5.', 'not_verified', 'hard'),
                                                                  (@t6, 'Calcule a area de um poligono com vertices (0,0), (4,0), (4,3), (2,5), (0,3) usando a formula de Gauss.', 'not_verified', 'hard'),
                                                                  (@t6, 'Demonstre que os tres medianos de um triangulo sao concorrentes e se intersectam a 2/3 de cada vertice.', 'not_verified', 'hard'),
                                                                  (@t6, 'Prove o Teorema de Ptolomeu: em um quadrilatero ciclico, o produto das diagonais e igual a soma dos produtos dos lados opostos.', 'not_verified', 'hard'),
                                                                  (@t6, 'Quatro quadrados iguais de lado 2 cm formam uma figura em L. Qual e o perimetro total?', 'not_verified', 'hard'),
                                                                  (@t6, 'Prove que em qualquer triangulo, a bissetriz de um angulo divide o lado oposto na razao dos outros dois lados.', 'not_verified', 'hard'),
                                                                  (@t6, 'Calcule o raio do circulo circunscrito a um triangulo de lados 5, 12 e 13.', 'not_verified', 'hard'),
                                                                  (@t6, 'Prove que a area de um poligono convexo inscrito num circulo de raio R e maxima quando o poligono e regular.', 'not_verified', 'hard');

-- ============================================================
-- ALTERNATIVAS TÓPICO 6 (5 alternativas por questão)
-- ============================================================

-- 1
SET @q = (SELECT id_question FROM question WHERE topic_id = @t6 AND statement = 'Calcule a area de um retangulo de 8 cm por 5 cm.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Area = base x altura = 8*5 = 40 cm²');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '40 cm²', true), (@q, '13 cm²', false), (@q, '26 cm²', false), (@q, '45 cm²', false), (@q, '30 cm²', false);

-- 2
SET @q = (SELECT id_question FROM question WHERE topic_id = @t6 AND statement = 'Qual e o perimetro de um quadrado de lado 7 cm?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Perimetro = 4*lado = 28 cm');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '28 cm', true), (@q, '14 cm', false), (@q, '21 cm', false), (@q, '49 cm', false), (@q, '35 cm', false);

-- 3
SET @q = (SELECT id_question FROM question WHERE topic_id = @t6 AND statement = 'Calcule a area de um triangulo de base 10 cm e altura 6 cm.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Area = (base * altura)/2 = (10*6)/2 = 30 cm²');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '30 cm²', true), (@q, '20 cm²', false), (@q, '60 cm²', false), (@q, '16 cm²', false), (@q, '40 cm²', false);

-- 4
SET @q = (SELECT id_question FROM question WHERE topic_id = @t6 AND statement = 'Qual e a area de um circulo de raio 4 cm? (use pi = 3,14)' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Area = π*r² = 3,14*16 = 50,24 cm²');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '50,24 cm²', true), (@q, '12,56 cm²', false), (@q, '25,12 cm²', false), (@q, '100,48 cm²', false), (@q, '200,96 cm²', false);

-- 5
SET @q = (SELECT id_question FROM question WHERE topic_id = @t6 AND statement = 'Quantos graus tem a soma dos angulos internos de um pentagono?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Soma = (n-2)*180 = 3*180 = 540°');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '540°', true), (@q, '360°', false), (@q, '450°', false), (@q, '720°', false), (@q, '630°', false);

-- 6
SET @q = (SELECT id_question FROM question WHERE topic_id = @t6 AND statement = 'Um angulo mede 65 graus. Qual e o seu complemento?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Complemento = 90 - 65 = 25°');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '25°', true), (@q, '115°', false), (@q, '35°', false), (@q, '15°', false), (@q, '45°', false);

-- 7
SET @q = (SELECT id_question FROM question WHERE topic_id = @t6 AND statement = 'Dois angulos suplementares somam 180 graus. Um deles mede 110. Qual e o outro?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Suplemento = 180 - 110 = 70°');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '70°', true), (@q, '20°', false), (@q, '90°', false), (@q, '110°', false), (@q, '80°', false);

-- 8
SET @q = (SELECT id_question FROM question WHERE topic_id = @t6 AND statement = 'Calcule a hipotenusa de um triangulo retangulo com catetos 3 e 4.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'hip² = 3²+4² = 9+16=25 => hip = 5');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '5', true), (@q, '7', false), (@q, '6', false), (@q, '4', false), (@q, '8', false);

-- 9
SET @q = (SELECT id_question FROM question WHERE topic_id = @t6 AND statement = 'Qual e o perimetro de um circulo de diametro 10 cm?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Perimetro = π * diâmetro = 3,14*10 = 31,4 cm');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '31,4 cm', true), (@q, '15,7 cm', false), (@q, '62,8 cm', false), (@q, '78,5 cm', false), (@q, '314 cm', false);

-- 10
SET @q = (SELECT id_question FROM question WHERE topic_id = @t6 AND statement = 'Defina o que e um quadrilatero e de dois exemplos.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Polígono de 4 lados; exemplos: quadrado, retângulo');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Polígono de 4 lados', true), (@q, 'Polígono de 3 lados', false), (@q, 'Polígono de 5 lados', false), (@q, 'Figura sem lados', false), (@q, 'Círculo', false);

-- 11
SET @q = (SELECT id_question FROM question WHERE topic_id = @t6 AND statement = 'Classifique os triangulos quanto aos lados.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Equilátero, isósceles, escaleno');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Equilátero, isósceles, escaleno', true), (@q, 'Acutângulo, retângulo, obtusângulo', false), (@q, 'Equilátero, retângulo, escaleno', false), (@q, 'Isósceles, acutângulo, obtusângulo', false), (@q, 'Equilátero, isósceles, retângulo', false);

-- 12
SET @q = (SELECT id_question FROM question WHERE topic_id = @t6 AND statement = 'Calcule a area de um trapezio com bases 8 e 12 cm e altura 5 cm.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Area = (B+b)*h/2 = (8+12)*5/2 = 20*5/2 = 50 cm²');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '50 cm²', true), (@q, '40 cm²', false), (@q, '60 cm²', false), (@q, '100 cm²', false), (@q, '20 cm²', false);

-- 13
SET @q = (SELECT id_question FROM question WHERE topic_id = @t6 AND statement = 'Quantos eixos de simetria tem um quadrado?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Quadrado tem 4 eixos: 2 diagonais e 2 medianas');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '4', true), (@q, '2', false), (@q, '1', false), (@q, '0', false), (@q, '8', false);

-- 14
SET @q = (SELECT id_question FROM question WHERE topic_id = @t6 AND statement = 'Um angulo e o triplo do seu complemento. Qual e o valor desse angulo?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'x = 3(90-x) => x = 270-3x => 4x=270 => x=67,5°');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '67,5°', true), (@q, '45°', false), (@q, '30°', false), (@q, '60°', false), (@q, '90°', false);

-- 15
SET @q = (SELECT id_question FROM question WHERE topic_id = @t6 AND statement = 'Quantos graus tem a soma dos angulos internos de um hexagono?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '(6-2)*180 = 4*180 = 720°');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '720°', true), (@q, '540°', false), (@q, '900°', false), (@q, '360°', false), (@q, '1080°', false);

-- 16
SET @q = (SELECT id_question FROM question WHERE topic_id = @t6 AND statement = 'Qual e a area de um paralelogramo de base 10 cm e altura 7 cm?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Area = base * altura = 70 cm²');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '70 cm²', true), (@q, '35 cm²', false), (@q, '140 cm²', false), (@q, '17 cm²', false), (@q, '100 cm²', false);

-- 17
SET @q = (SELECT id_question FROM question WHERE topic_id = @t6 AND statement = 'Dois angulos sao opostos pelo vertice. Um mede 55 graus. Qual e o outro?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Opostos pelo vértice são iguais => 55°');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '55°', true), (@q, '125°', false), (@q, '35°', false), (@q, '45°', false), (@q, '90°', false);

-- 18
SET @q = (SELECT id_question FROM question WHERE topic_id = @t6 AND statement = 'Qual e a medida do angulo externo de um triangulo equilatero?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Interno = 60°, externo = 180-60 = 120°');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '120°', true), (@q, '60°', false), (@q, '90°', false), (@q, '30°', false), (@q, '180°', false);

-- 19
SET @q = (SELECT id_question FROM question WHERE topic_id = @t6 AND statement = 'Calcule o perimetro de um triangulo com lados 5, 12 e 13 cm.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Perímetro = 5+12+13 = 30 cm');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '30 cm', true), (@q, '25 cm', false), (@q, '20 cm', false), (@q, '35 cm', false), (@q, '40 cm', false);

-- 20
SET @q = (SELECT id_question FROM question WHERE topic_id = @t6 AND statement = 'Qual e a area de um losango com diagonais de 6 cm e 8 cm?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Area = (D*d)/2 = (6*8)/2 = 24 cm²');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '24 cm²', true), (@q, '48 cm²', false), (@q, '12 cm²', false), (@q, '14 cm²', false), (@q, '28 cm²', false);

-- 21 (medium)
SET @q = (SELECT id_question FROM question WHERE topic_id = @t6 AND statement LIKE 'Calcule a area do setor circular com raio 6 cm e angulo central de 90 graus.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Area setor = (θ/360)*πr² = (90/360)*π*36 = (1/4)*36π = 9π ≈ 28,26 cm²');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '28,26 cm²', true), (@q, '113,04 cm²', false), (@q, '56,52 cm²', false), (@q, '9 cm²', false), (@q, '18,84 cm²', false);

-- 22
SET @q = (SELECT id_question FROM question WHERE topic_id = @t6 AND statement LIKE 'Dois triangulos semelhantes tem lados 3, 4, 5 e 6, 8, 10. Qual e a razao de semelhanca?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Razão = 6/3 = 8/4 = 10/5 = 2');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '2', true), (@q, '1/2', false), (@q, '3', false), (@q, '1/3', false), (@q, '4', false);

-- 23
SET @q = (SELECT id_question FROM question WHERE topic_id = @t6 AND statement LIKE 'Prove que a soma dos angulos internos de qualquer triangulo e 180 graus.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Verdadeiro');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Verdadeiro', true), (@q, 'Falso', false), (@q, 'Depende do triângulo', false), (@q, 'Soma 360°', false), (@q, 'Soma 90°', false);

-- 24
SET @q = (SELECT id_question FROM question WHERE topic_id = @t6 AND statement LIKE 'Calcule a diagonal de um retangulo de lados 5 cm e 12 cm.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'diag² = 5²+12² = 25+144=169 => diag=13 cm');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '13 cm', true), (@q, '17 cm', false), (@q, '15 cm', false), (@q, '10 cm', false), (@q, '12 cm', false);

-- 25
SET @q = (SELECT id_question FROM question WHERE topic_id = @t6 AND statement LIKE 'Usando o Teorema de Tales, calcule x se os segmentos paralelos dividem as retas em 3, 5 e x, 8.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '3/5 = x/8 => x = (3*8)/5 = 24/5 = 4,8');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '4,8', true), (@q, '5', false), (@q, '4', false), (@q, '6', false), (@q, '3,2', false);

-- 26
SET @q = (SELECT id_question FROM question WHERE topic_id = @t6 AND statement LIKE 'Calcule a area da regiao sombreada entre dois circulos concentricos de raios 5 e 3 cm.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Area coroa = π(R² - r²) = π(25-9)=16π ≈ 50,24 cm²');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '50,24 cm²', true), (@q, '25,12 cm²', false), (@q, '16 cm²', false), (@q, '34 cm²', false), (@q, '64 cm²', false);

-- 27
SET @q = (SELECT id_question FROM question WHERE topic_id = @t6 AND statement LIKE 'Um hexagono regular tem lado 4 cm. Calcule sua area e perimetro.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Perimetro=24 cm, Area = (3√3/2)*l² = (3*1,732/2)*16 = 2,598*16 ≈ 41,57 cm²');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'P=24 cm, A≈41,57 cm²', true), (@q, 'P=24 cm, A=24 cm²', false), (@q, 'P=12 cm, A=16 cm²', false), (@q, 'P=36 cm, A=64 cm²', false), (@q, 'P=24 cm, A=32 cm²', false);

-- 28
SET @q = (SELECT id_question FROM question WHERE topic_id = @t6 AND statement LIKE 'Um losango tem diagonais de 10 cm e 24 cm. Calcule sua area e o lado.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Area= (10*24)/2=120 cm², lado = √((10/2)²+(24/2)²)=√(25+144)=√169=13 cm');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'A=120 cm², l=13 cm', true), (@q, 'A=240 cm², l=13 cm', false), (@q, 'A=120 cm², l=26 cm', false), (@q, 'A=60 cm², l=12 cm', false), (@q, 'A=120 cm², l=15 cm', false);

-- 29
SET @q = (SELECT id_question FROM question WHERE topic_id = @t6 AND statement LIKE 'Calcule o angulo central de um poligono regular de 12 lados.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Angulo central = 360/n = 360/12 = 30°');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '30°', true), (@q, '45°', false), (@q, '60°', false), (@q, '15°', false), (@q, '90°', false);

-- 30
SET @q = (SELECT id_question FROM question WHERE topic_id = @t6 AND statement LIKE 'Calcule a area de um triangulo com lados 5, 7 e 8 cm usando a formula de Heron.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 's=(5+7+8)/2=10, A=√[10*(10-5)*(10-7)*(10-8)]=√[10*5*3*2]=√300=10√3 ≈ 17,32 cm²');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '10√3 cm²', true), (@q, '20 cm²', false), (@q, '15 cm²', false), (@q, '5√3 cm²', false), (@q, '20√3 cm²', false);

-- 31
SET @q = (SELECT id_question FROM question WHERE topic_id = @t6 AND statement LIKE 'Quantas diagonais tem um poligono convexo de 10 lados?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'd = n(n-3)/2 = 10*7/2 = 35');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '35', true), (@q, '45', false), (@q, '25', false), (@q, '30', false), (@q, '40', false);

-- 32
SET @q = (SELECT id_question FROM question WHERE topic_id = @t6 AND statement LIKE 'Um circulo esta inscrito em um quadrado de lado 6 cm. Qual e a area entre o circulo e o quadrado?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Area quadrado=36, raio=3, area circulo=π*9=28,26, diferença=7,74 cm²');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '7,74 cm²', true), (@q, '9 cm²', false), (@q, '10 cm²', false), (@q, '36-9π', false), (@q, '8 cm²', false);

-- 33
SET @q = (SELECT id_question FROM question WHERE topic_id = @t6 AND statement LIKE 'Dados dois triangulos com angulos iguais, prove que eles sao semelhantes.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Verdadeiro (AA)');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Verdadeiro', true), (@q, 'Falso', false), (@q, 'Apenas se os lados forem proporcionais', false), (@q, 'Apenas se forem congruentes', false), (@q, 'Depende do tamanho', false);

-- 34
SET @q = (SELECT id_question FROM question WHERE topic_id = @t6 AND statement LIKE 'Calcule a area de um triangulo equilatero de lado 8 cm.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'A = (√3/4)*l² = (1,732/4)*64 = 0,433*64 = 27,71 cm²');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '16√3 cm²', true), (@q, '8√3 cm²', false), (@q, '32√3 cm²', false), (@q, '64√3 cm²', false), (@q, '12√3 cm²', false);

-- 35
SET @q = (SELECT id_question FROM question WHERE topic_id = @t6 AND statement LIKE 'Um poligono regular de 8 lados tem lado 3 cm. Calcule seu perimetro e a soma de seus angulos internos.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Perimetro = 8*3=24 cm, Soma internos=(8-2)*180=1080°');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'P=24 cm, Si=1080°', true), (@q, 'P=24 cm, Si=720°', false), (@q, 'P=24 cm, Si=1440°', false), (@q, 'P=32 cm, Si=1080°', false), (@q, 'P=24 cm, Si=900°', false);

-- 36 (hard)
SET @q = (SELECT id_question FROM question WHERE topic_id = @t6 AND statement LIKE 'Demonstre o Teorema de Pitagoras usando triangulos semelhantes.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Verdadeiro');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Verdadeiro', true), (@q, 'Falso', false), (@q, 'Não é possível', false), (@q, 'Só com áreas', false), (@q, 'Verdadeiro apenas para triângulos retângulos isósceles', false);

-- 37
SET @q = (SELECT id_question FROM question WHERE topic_id = @t6 AND statement LIKE 'Calcule a area maxima de um retangulo inscrito em um circulo de raio R.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Área máxima = 2R² (quadrado de diagonal 2R, lado R√2)');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '2R²', true), (@q, 'R²', false), (@q, 'πR²', false), (@q, '4R²', false), (@q, 'R²/2', false);

-- 38
SET @q = (SELECT id_question FROM question WHERE topic_id = @t6 AND statement LIKE 'Prove que a area de um triangulo equilatero de lado a e (a^2 * sqrt(3)) / 4.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Verdadeiro');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Verdadeiro', true), (@q, 'Falso', false), (@q, 'Correto apenas para a=1', false), (@q, 'A área é a²√3/2', false), (@q, 'A área é a²/4', false);

-- 39
SET @q = (SELECT id_question FROM question WHERE topic_id = @t6 AND statement LIKE 'Um poligono regular de n lados e inscrito num circulo de raio R. Derive a formula de sua area.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'A = (n/2) R² sen(2π/n)');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '(n/2)R² sen(2π/n)', true), (@q, 'nR² sen(π/n)', false), (@q, '(n/2)R² sen(π/n)', false), (@q, 'πR²', false), (@q, 'nR² cos(π/n)', false);

-- 40
SET @q = (SELECT id_question FROM question WHERE topic_id = @t6 AND statement LIKE 'Demonstre que todo angulo inscrito numa semicircunferencia e reto.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Verdadeiro (Teorema de Tales)');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Verdadeiro', true), (@q, 'Falso', false), (@q, 'Apenas para ângulos centrais', false), (@q, 'Apenas para diâmetro horizontal', false), (@q, 'É obtuso', false);

-- 41
SET @q = (SELECT id_question FROM question WHERE topic_id = @t6 AND statement LIKE 'Prove que a soma dos angulos externos de qualquer poligono convexo e 360 graus.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Verdadeiro');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Verdadeiro', true), (@q, 'Falso', false), (@q, 'Soma = 180(n-2)', false), (@q, 'Soma = 180n', false), (@q, 'Depende do polígono', false);

-- 42
SET @q = (SELECT id_question FROM question WHERE topic_id = @t6 AND statement LIKE 'Um triangulo tem angulos em progressao aritmetica. Prove que um deles e necessariamente 60 graus.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Verdadeiro: a-d, a, a+d => soma 3a=180 => a=60');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Verdadeiro', true), (@q, 'Falso', false), (@q, 'Pode ser 45°', false), (@q, 'Depende da razão', false), (@q, 'Sempre o maior é 60°', false);

-- 43
SET @q = (SELECT id_question FROM question WHERE topic_id = @t6 AND statement LIKE 'Determine o raio do circulo inscrito em um triangulo de lados 3, 4 e 5.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'r = A/s, A=6, s=6 => r=1');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '1', true), (@q, '2', false), (@q, '1,5', false), (@q, '0,5', false), (@q, '3', false);

-- 44
SET @q = (SELECT id_question FROM question WHERE topic_id = @t6 AND statement LIKE 'Calcule a area de um poligono com vertices (0,0), (4,0), (4,3), (2,5), (0,3) usando a formula de Gauss.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Soma1 = 0*0+4*3+4*5+2*3+0*0 = 0+12+20+6+0=38; Soma2 = 0*4+0*4+3*2+5*0+3*0 = 0+0+6+0+0=6; Area = |38-6|/2 = 16');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '16', true), (@q, '20', false), (@q, '12', false), (@q, '24', false), (@q, '32', false);

-- 45
SET @q = (SELECT id_question FROM question WHERE topic_id = @t6 AND statement LIKE 'Demonstre que os tres medianos de um triangulo sao concorrentes e se intersectam a 2/3 de cada vertice.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Verdadeiro (Baricentro)');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Verdadeiro', true), (@q, 'Falso', false), (@q, 'Concorrem no ortocentro', false), (@q, 'Se intersectam no incentro', false), (@q, 'Apenas em triângulos equiláteros', false);

-- 46
SET @q = (SELECT id_question FROM question WHERE topic_id = @t6 AND statement LIKE 'Prove o Teorema de Ptolomeu: em um quadrilatero ciclico, o produto das diagonais e igual a soma dos produtos dos lados opostos.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Verdadeiro');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Verdadeiro', true), (@q, 'Falso', false), (@q, 'Válido apenas para retângulos', false), (@q, 'Válido apenas para quadrados', false), (@q, 'É o teorema de Pitágoras', false);

-- 47
SET @q = (SELECT id_question FROM question WHERE topic_id = @t6 AND statement LIKE 'Quatro quadrados iguais de lado 2 cm formam uma figura em L. Qual e o perimetro total?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Perímetro da figura em L (4 quadrados formando um L 3x2) = contar arestas externas: 10 lados de 2 cm = 20 cm');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '20 cm', true), (@q, '16 cm', false), (@q, '24 cm', false), (@q, '18 cm', false), (@q, '32 cm', false);

-- 48
SET @q = (SELECT id_question FROM question WHERE topic_id = @t6 AND statement LIKE 'Prove que em qualquer triangulo, a bissetriz de um angulo divide o lado oposto na razao dos outros dois lados.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Verdadeiro (Teorema da bissetriz interna)');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Verdadeiro', true), (@q, 'Falso', false), (@q, 'Divide ao meio', false), (@q, 'Divide na razão dos ângulos', false), (@q, 'Apenas no triângulo equilátero', false);

-- 49
SET @q = (SELECT id_question FROM question WHERE topic_id = @t6 AND statement LIKE 'Calcule o raio do circulo circunscrito a um triangulo de lados 5, 12 e 13.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Triângulo retângulo (5-12-13), hipotenusa = 13, raio circunscrito = hip/2 = 6,5');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '6,5', true), (@q, '5', false), (@q, '12', false), (@q, '13', false), (@q, '7,5', false);

-- 50
SET @q = (SELECT id_question FROM question WHERE topic_id = @t6 AND statement LIKE 'Prove que a area de um poligono convexo inscrito num circulo de raio R e maxima quando o poligono e regular.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Verdadeiro');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Verdadeiro', true), (@q, 'Falso', false), (@q, 'Máximo para o quadrado', false), (@q, 'Máximo para o triângulo', false), (@q, 'Depende do número de lados', false);

-- ============================================================
-- TÓPICO 7 - Geometria Espacial (50 MCQs, 5 alternativas)
-- ============================================================

SET @t7 = (SELECT id_topic FROM topic WHERE name = 'Geometria Espacial');

-- Inserir questões (20 easy, 15 medium, 15 hard)
INSERT INTO question (topic_id, statement, stats, difficulty) VALUES
                                                                  (@t7, 'Calcule o volume de um cubo de aresta 3 cm.', 'verified', 'easy'),
                                                                  (@t7, 'Qual e a area total de um cubo de aresta 5 cm?', 'verified', 'easy'),
                                                                  (@t7, 'Calcule o volume de um paralelepipedo 4 cm x 3 cm x 6 cm.', 'verified', 'easy'),
                                                                  (@t7, 'Qual e o volume de uma esfera de raio 6 cm? (use pi = 3,14)', 'verified', 'easy'),
                                                                  (@t7, 'Quantos vertices, arestas e faces tem um cubo?', 'verified', 'easy'),
                                                                  (@t7, 'Calcule a area lateral de um cilindro de raio 3 cm e altura 10 cm.', 'verified', 'easy'),
                                                                  (@t7, 'Um cone tem raio 4 cm e altura 3 cm. Calcule sua geratriz.', 'verified', 'easy'),
                                                                  (@t7, 'Qual a diferenca entre prisma e piramide?', 'verified', 'easy'),
                                                                  (@t7, 'Verifique a relacao de Euler para um tetraedro: V - A + F = 2.', 'verified', 'easy'),
                                                                  (@t7, 'Calcule o volume de um cone de raio 6 cm e altura 8 cm.', 'verified', 'easy'),
                                                                  (@t7, 'Um cilindro de raio 4 cm e altura 9 cm esta cheio de agua. Qual e o volume de agua?', 'verified', 'easy'),
                                                                  (@t7, 'Classifique os poliedros convexos regulares (solidos platonicos).', 'verified', 'easy'),
                                                                  (@t7, 'Calcule a area da superficie de uma esfera de raio 5 cm.', 'verified', 'easy'),
                                                                  (@t7, 'Defina planificacao de um solido geometrico e de um exemplo.', 'verified', 'easy'),
                                                                  (@t7, 'Calcule o volume de uma piramide de base quadrada de lado 6 cm e altura 4 cm.', 'verified', 'easy'),
                                                                  (@t7, 'Quantas faces, vertices e arestas tem um tetraedro?', 'verified', 'easy'),
                                                                  (@t7, 'Qual e a area da base de um cilindro de raio 5 cm?', 'verified', 'easy'),
                                                                  (@t7, 'Calcule o volume de uma esfera de raio 3 cm (deixe em termos de pi).', 'verified', 'easy'),
                                                                  (@t7, 'Calcule a area total de um cilindro de raio 2 cm e altura 6 cm.', 'verified', 'easy'),
                                                                  (@t7, 'Quantas faces tem um cubo? E um octaedro?', 'verified', 'easy'),
                                                                  (@t7, 'Um cilindro e um cone tem a mesma base e altura. Qual e a razao entre seus volumes?', 'verified', 'medium'),
                                                                  (@t7, 'Calcule a area total de um cone de raio 5 cm e geratriz 13 cm.', 'verified', 'medium'),
                                                                  (@t7, 'Dois cubos tem arestas na razao 2:3. Qual e a razao entre seus volumes?', 'verified', 'medium'),
                                                                  (@t7, 'Calcule o volume de um tronco de cone de raios 3 e 6 cm e altura 4 cm.', 'verified', 'medium'),
                                                                  (@t7, 'Uma esfera esta inscrita em um cubo de aresta 10 cm. Qual e a razao entre o volume da esfera e do cubo?', 'verified', 'medium'),
                                                                  (@t7, 'Calcule o volume do solido gerado pela rotacao do triangulo retangulo de catetos 3 e 4 cm em torno do cateto maior.', 'not_verified', 'medium'),
                                                                  (@t7, 'Dois solidos semelhantes tem razao de semelhanca k. Qual e a razao entre seus volumes?', 'not_verified', 'medium'),
                                                                  (@t7, 'Calcule a diagonal do espaco de um paralelepipedo 3 x 4 x 12 cm.', 'not_verified', 'medium'),
                                                                  (@t7, 'Um aquario cilindrico de raio 30 cm e altura 50 cm esta 80% cheio. Qual o volume de agua?', 'not_verified', 'medium'),
                                                                  (@t7, 'Determine o raio de uma esfera cujo volume numerico e igual a sua area de superficie.', 'not_verified', 'medium'),
                                                                  (@t7, 'Uma piramide de base quadrada de lado 8 cm tem faces laterais equilateras. Calcule sua altura e volume.', 'not_verified', 'medium'),
                                                                  (@t7, 'Calcule o volume e a area total de um prisma hexagonal regular de lado 4 cm e altura 10 cm.', 'not_verified', 'medium'),
                                                                  (@t7, 'Um cone e inscrito numa esfera de raio R. Qual deve ser a altura do cone para que seu volume seja maximo?', 'not_verified', 'medium'),
                                                                  (@t7, 'Calcule a area da superficie lateral de uma piramide quadrada de base 6 cm e altura 4 cm.', 'not_verified', 'medium'),
                                                                  (@t7, 'Dois cilindros tem a mesma altura mas raios na razao 1:3. Qual e a razao entre seus volumes?', 'not_verified', 'medium'),
                                                                  (@t7, 'Derive a formula da area de superficie de uma esfera integrando fatias circulares.', 'not_verified', 'hard'),
                                                                  (@t7, 'Prove que entre todos os solidos de mesma area de superficie, a esfera tem o maior volume.', 'not_verified', 'hard'),
                                                                  (@t7, 'Calcule o volume da regiao de intersecao de dois cilindros ortogonais de mesmo raio R.', 'not_verified', 'hard'),
                                                                  (@t7, 'Determine o volume de um solido de revolucao gerado pela regiao entre y=x^2 e y=x, rotacionada em torno do eixo x.', 'not_verified', 'hard'),
                                                                  (@t7, 'Prove a relacao de Euler V - A + F = 2 para qualquer poliedro convexo.', 'not_verified', 'hard'),
                                                                  (@t7, 'Calcule o volume de um elipsoide de semi-eixos a=3, b=4, c=5.', 'not_verified', 'hard'),
                                                                  (@t7, 'Determine a distancia entre duas retas reversas no espaco a partir de vetores diretores e pontos.', 'not_verified', 'hard'),
                                                                  (@t7, 'Calcule a area da superficie do toro gerado pela rotacao de um circulo de raio r a distancia R do eixo (R>r).', 'not_verified', 'hard'),
                                                                  (@t7, 'Derive a formula de Cavalieri e aplique-a para provar que a esfera e o cilindro de mesma altura e raio tem volumes na razao 2:3.', 'not_verified', 'hard'),
                                                                  (@t7, 'Prove que todo poliedro convexo pode ser decomposto em tetraedros.', 'not_verified', 'hard'),
                                                                  (@t7, 'Um icosaedro tem aresta a. Derive a formula de seu volume.', 'not_verified', 'hard'),
                                                                  (@t7, 'Calcule o volume do solido gerado pela rotacao de y = sqrt(x) entre x=0 e x=4 em torno do eixo x.', 'not_verified', 'hard'),
                                                                  (@t7, 'Prove que a piramide de maior volume inscrita numa esfera de raio R e a piramide regular de base quadrada.', 'not_verified', 'hard'),
                                                                  (@t7, 'Determine o angulo diedro de um tetraedro regular.', 'not_verified', 'hard'),
                                                                  (@t7, 'Calcule a area da superficie e o volume de um tronco de piramide quadrada com bases de lados 4 e 8 cm e altura 6 cm.', 'not_verified', 'hard');

-- ============================================================
-- ALTERNATIVAS TÓPICO 7 (5 alternativas por questão)
-- ============================================================

-- 1
SET @q = (SELECT id_question FROM question WHERE topic_id = @t7 AND statement = 'Calcule o volume de um cubo de aresta 3 cm.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'V = a³ = 27 cm³');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '27 cm³', true), (@q, '9 cm³', false), (@q, '18 cm³', false), (@q, '54 cm³', false), (@q, '36 cm³', false);

-- 2
SET @q = (SELECT id_question FROM question WHERE topic_id = @t7 AND statement = 'Qual e a area total de um cubo de aresta 5 cm?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'A = 6a² = 6*25 = 150 cm²');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '150 cm²', true), (@q, '25 cm²', false), (@q, '100 cm²', false), (@q, '125 cm²', false), (@q, '175 cm²', false);

-- 3
SET @q = (SELECT id_question FROM question WHERE topic_id = @t7 AND statement = 'Calcule o volume de um paralelepipedo 4 cm x 3 cm x 6 cm.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'V = 4*3*6 = 72 cm³');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '72 cm³', true), (@q, '36 cm³', false), (@q, '48 cm³', false), (@q, '96 cm³', false), (@q, '84 cm³', false);

-- 4
SET @q = (SELECT id_question FROM question WHERE topic_id = @t7 AND statement = 'Qual e o volume de uma esfera de raio 6 cm? (use pi = 3,14)' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'V = (4/3)πr³ = (4/3)*3,14*216 = 904,32 cm³');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '904,32 cm³', true), (@q, '150,72 cm³', false), (@q, '452,16 cm³', false), (@q, '1130,40 cm³', false), (@q, '678,24 cm³', false);

-- 5
SET @q = (SELECT id_question FROM question WHERE topic_id = @t7 AND statement = 'Quantos vertices, arestas e faces tem um cubo?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '8 vértices, 12 arestas, 6 faces');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '8V, 12A, 6F', true), (@q, '6V, 10A, 6F', false), (@q, '8V, 10A, 6F', false), (@q, '6V, 12A, 8F', false), (@q, '8V, 12A, 8F', false);

-- 6
SET @q = (SELECT id_question FROM question WHERE topic_id = @t7 AND statement = 'Calcule a area lateral de um cilindro de raio 3 cm e altura 10 cm.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Al = 2πrh = 2*3,14*3*10 = 188,4 cm²');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '188,4 cm²', true), (@q, '94,2 cm²', false), (@q, '282,6 cm²', false), (@q, '150,72 cm²', false), (@q, '200 cm²', false);

-- 7
SET @q = (SELECT id_question FROM question WHERE topic_id = @t7 AND statement = 'Um cone tem raio 4 cm e altura 3 cm. Calcule sua geratriz.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'g = √(r²+h²) = √(16+9)=√25=5 cm');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '5 cm', true), (@q, '4 cm', false), (@q, '3 cm', false), (@q, '7 cm', false), (@q, '6 cm', false);

-- 8
SET @q = (SELECT id_question FROM question WHERE topic_id = @t7 AND statement = 'Qual a diferenca entre prisma e piramide?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Prisma: duas bases paralelas; pirâmide: uma base e vértice oposto');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Prisma tem duas bases, pirâmide tem uma', true), (@q, 'Prisma tem uma base, pirâmide tem duas', false), (@q, 'Ambos têm duas bases', false), (@q, 'Prisma é redondo, pirâmide é poliedro', false), (@q, 'Não há diferença', false);

-- 9
SET @q = (SELECT id_question FROM question WHERE topic_id = @t7 AND statement = 'Verifique a relacao de Euler para um tetraedro: V - A + F = 2.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Tetraedro: V=4, A=6, F=4 => 4-6+4=2');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Verdadeiro', true), (@q, 'Falso', false), (@q, 'Soma = 0', false), (@q, 'Soma = 4', false), (@q, 'Soma = 1', false);

-- 10
SET @q = (SELECT id_question FROM question WHERE topic_id = @t7 AND statement = 'Calcule o volume de um cone de raio 6 cm e altura 8 cm.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'V = (1/3)πr²h = (1/3)*3,14*36*8 = 301,44 cm³');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '301,44 cm³', true), (@q, '904,32 cm³', false), (@q, '150,72 cm³', false), (@q, '100,48 cm³', false), (@q, '200,96 cm³', false);

-- 11
SET @q = (SELECT id_question FROM question WHERE topic_id = @t7 AND statement = 'Um cilindro de raio 4 cm e altura 9 cm esta cheio de agua. Qual e o volume de agua?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'V = πr²h = 3,14*16*9 = 452,16 cm³');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '452,16 cm³', true), (@q, '226,08 cm³', false), (@q, '904,32 cm³', false), (@q, '150,72 cm³', false), (@q, '113,04 cm³', false);

-- 12
SET @q = (SELECT id_question FROM question WHERE topic_id = @t7 AND statement = 'Classifique os poliedros convexos regulares (solidos platonicos).' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Tetraedro, cubo, octaedro, dodecaedro, icosaedro');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '5 sólidos: tetraedro, cubo, octaedro, dodecaedro, icosaedro', true), (@q, '4 sólidos', false), (@q, '6 sólidos', false), (@q, '3 sólidos', false), (@q, '7 sólidos', false);

-- 13
SET @q = (SELECT id_question FROM question WHERE topic_id = @t7 AND statement = 'Calcule a area da superficie de uma esfera de raio 5 cm.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'A = 4πr² = 4*3,14*25 = 314 cm²');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '314 cm²', true), (@q, '78,5 cm²', false), (@q, '157 cm²', false), (@q, '628 cm²', false), (@q, '100 cm²', false);

-- 14
SET @q = (SELECT id_question FROM question WHERE topic_id = @t7 AND statement = 'Defina planificacao de um solido geometrico e de um exemplo.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Representação das faces em um plano; ex: planificação do cubo');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Superfície aberta do sólido', true), (@q, 'Cálculo do volume', false), (@q, 'Projeção ortogonal', false), (@q, 'Corte transversal', false), (@q, 'Rotações', false);

-- 15
SET @q = (SELECT id_question FROM question WHERE topic_id = @t7 AND statement = 'Calcule o volume de uma piramide de base quadrada de lado 6 cm e altura 4 cm.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'V = (1/3)*Ab*h = (1/3)*36*4 = 48 cm³');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '48 cm³', true), (@q, '72 cm³', false), (@q, '36 cm³', false), (@q, '24 cm³', false), (@q, '96 cm³', false);

-- 16
SET @q = (SELECT id_question FROM question WHERE topic_id = @t7 AND statement = 'Quantas faces, vertices e arestas tem um tetraedro?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '4 faces, 4 vértices, 6 arestas');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '4F, 4V, 6A', true), (@q, '6F, 4V, 4A', false), (@q, '4F, 6V, 4A', false), (@q, '6F, 6V, 4A', false), (@q, '4F, 8V, 6A', false);

-- 17
SET @q = (SELECT id_question FROM question WHERE topic_id = @t7 AND statement = 'Qual e a area da base de um cilindro de raio 5 cm?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Ab = πr² = 3,14*25 = 78,5 cm²');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '78,5 cm²', true), (@q, '31,4 cm²', false), (@q, '157 cm²', false), (@q, '25 cm²', false), (@q, '50 cm²', false);

-- 18
SET @q = (SELECT id_question FROM question WHERE topic_id = @t7 AND statement = 'Calcule o volume de uma esfera de raio 3 cm (deixe em termos de pi).' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'V = (4/3)π*27 = 36π cm³');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '36π cm³', true), (@q, '12π cm³', false), (@q, '24π cm³', false), (@q, '48π cm³', false), (@q, '9π cm³', false);

-- 19
SET @q = (SELECT id_question FROM question WHERE topic_id = @t7 AND statement = 'Calcule a area total de um cilindro de raio 2 cm e altura 6 cm.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'At = 2πr(r+h) = 2*3,14*2*(2+6)=12,56*8=100,48 cm²');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '100,48 cm²', true), (@q, '50,24 cm²', false), (@q, '75,36 cm²', false), (@q, '125,6 cm²', false), (@q, '150,72 cm²', false);

-- 20
SET @q = (SELECT id_question FROM question WHERE topic_id = @t7 AND statement = 'Quantas faces tem um cubo? E um octaedro?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Cubo: 6 faces; octaedro: 8 faces');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '6 e 8', true), (@q, '8 e 6', false), (@q, '4 e 8', false), (@q, '6 e 6', false), (@q, '8 e 8', false);

-- 21 (medium)
SET @q = (SELECT id_question FROM question WHERE topic_id = @t7 AND statement LIKE 'Um cilindro e um cone tem a mesma base e altura. Qual e a razao entre seus volumes?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Vcil/Vcon = 3');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '3:1', true), (@q, '1:3', false), (@q, '1:1', false), (@q, '2:1', false), (@q, 'π:1', false);

-- 22
SET @q = (SELECT id_question FROM question WHERE topic_id = @t7 AND statement LIKE 'Calcule a area total de um cone de raio 5 cm e geratriz 13 cm.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'At = πr(r+g) = 3,14*5*(5+13)=15,7*18=282,6 cm²');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '282,6 cm²', true), (@q, '188,4 cm²', false), (@q, '204,1 cm²', false), (@q, '157 cm²', false), (@q, '314 cm²', false);

-- 23
SET @q = (SELECT id_question FROM question WHERE topic_id = @t7 AND statement LIKE 'Dois cubos tem arestas na razao 2:3. Qual e a razao entre seus volumes?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Razão dos volumes = (2/3)³ = 8/27');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '8:27', true), (@q, '4:9', false), (@q, '2:3', false), (@q, '1:1', false), (@q, '27:8', false);

-- 24
SET @q = (SELECT id_question FROM question WHERE topic_id = @t7 AND statement LIKE 'Calcule o volume de um tronco de cone de raios 3 e 6 cm e altura 4 cm.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'V = (πh/3)(R²+Rr+r²) = (3,14*4/3)*(36+18+9)=4,1867*63≈263,76 cm³');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '≈264 cm³', true), (@q, '131,88 cm³', false), (@q, '527,52 cm³', false), (@q, '100 cm³', false), (@q, '200 cm³', false);

-- 25
SET @q = (SELECT id_question FROM question WHERE topic_id = @t7 AND statement LIKE 'Uma esfera esta inscrita em um cubo de aresta 10 cm. Qual e a razao entre o volume da esfera e do cubo?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Vesf = (4/3)π*125 ≈ 523,6; Vcub=1000; razão≈0,5236');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'π/6', true), (@q, 'π/4', false), (@q, 'π/8', false), (@q, 'π/3', false), (@q, '2π/3', false);

-- 26
SET @q = (SELECT id_question FROM question WHERE topic_id = @t7 AND statement LIKE 'Calcule o volume do solido gerado pela rotacao do triangulo retangulo de catetos 3 e 4 cm em torno do cateto maior.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Rotação do cateto 4 (maior) => cone com r=3, h=4, V= (1/3)π*9*4=12π ≈37,68 cm³');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '12π cm³', true), (@q, '16π cm³', false), (@q, '9π cm³', false), (@q, '36π cm³', false), (@q, '48π cm³', false);

-- 27
SET @q = (SELECT id_question FROM question WHERE topic_id = @t7 AND statement LIKE 'Dois solidos semelhantes tem razao de semelhanca k. Qual e a razao entre seus volumes?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'k³');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'k³', true), (@q, 'k²', false), (@q, 'k', false), (@q, '2k', false), (@q, '3k', false);

-- 28
SET @q = (SELECT id_question FROM question WHERE topic_id = @t7 AND statement LIKE 'Calcule a diagonal do espaco de um paralelepipedo 3 x 4 x 12 cm.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'd = √(3²+4²+12²) = √(9+16+144)=√169=13 cm');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '13 cm', true), (@q, '5 cm', false), (@q, '15 cm', false), (@q, '12 cm', false), (@q, '10 cm', false);

-- 29
SET @q = (SELECT id_question FROM question WHERE topic_id = @t7 AND statement LIKE 'Um aquario cilindrico de raio 30 cm e altura 50 cm esta 80% cheio. Qual o volume de agua?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Vtotal = π*900*50=141300 cm³, 80% = 113040 cm³ = 113,04 L');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '113,04 L', true), (@q, '141,3 L', false), (@q, '90 L', false), (@q, '100 L', false), (@q, '80 L', false);

-- 30
SET @q = (SELECT id_question FROM question WHERE topic_id = @t7 AND statement LIKE 'Determine o raio de uma esfera cujo volume numerico e igual a sua area de superficie.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '(4/3)πr³ = 4πr² => r/3 = 1 => r=3');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '3', true), (@q, '1', false), (@q, '2', false), (@q, '4', false), (@q, '5', false);

-- 31
SET @q = (SELECT id_question FROM question WHERE topic_id = @t7 AND statement LIKE 'Uma piramide de base quadrada de lado 8 cm tem faces laterais equilateras. Calcule sua altura e volume.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Aresta lateral = 8, altura da face = √(8²-4²)=√48=4√3, altura pirâmide = √((4√3)²-4²)=√(48-16)=√32=4√2, V= (1/3)*64*4√2 = (256√2)/3 cm³');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'h=4√2, V=256√2/3', true), (@q, 'h=4√3, V=256√3/3', false), (@q, 'h=8, V=512/3', false), (@q, 'h=4, V=256/3', false), (@q, 'h=8√2, V=512√2/3', false);

-- 32
SET @q = (SELECT id_question FROM question WHERE topic_id = @t7 AND statement LIKE 'Calcule o volume e a area total de um prisma hexagonal regular de lado 4 cm e altura 10 cm.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Ab = 6*(√3/4)*16 = 24√3 ≈ 41,57; V = 24√3*10 = 240√3 ≈ 415,7 cm³; At = 2Ab + 6*4*10 = 48√3 + 240 ≈ 323,1 cm²');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'V=240√3, At=240+48√3', true), (@q, 'V=240, At=240', false), (@q, 'V=240√3, At=240', false), (@q, 'V=240, At=48√3+240', false), (@q, 'V=480√3, At=480', false);

-- 33
SET @q = (SELECT id_question FROM question WHERE topic_id = @t7 AND statement LIKE 'Um cone e inscrito numa esfera de raio R. Qual deve ser a altura do cone para que seu volume seja maximo?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'h = 4R/3');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '4R/3', true), (@q, 'R', false), (@q, '2R/3', false), (@q, 'R/2', false), (@q, '3R/2', false);

-- 34
SET @q = (SELECT id_question FROM question WHERE topic_id = @t7 AND statement LIKE 'Calcule a area da superficie lateral de uma piramide quadrada de base 6 cm e altura 4 cm.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Altura da face = √(4²+3²)=5, área lateral = 4*(1/2*6*5)=60 cm²');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '60 cm²', true), (@q, '48 cm²', false), (@q, '72 cm²', false), (@q, '84 cm²', false), (@q, '30 cm²', false);

-- 35
SET @q = (SELECT id_question FROM question WHERE topic_id = @t7 AND statement LIKE 'Dois cilindros tem a mesma altura mas raios na razao 1:3. Qual e a razao entre seus volumes?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Volumes proporcionais ao quadrado do raio: 1:9');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '1:9', true), (@q, '1:3', false), (@q, '3:1', false), (@q, '9:1', false), (@q, '1:1', false);

-- 36 (hard)
SET @q = (SELECT id_question FROM question WHERE topic_id = @t7 AND statement LIKE 'Derive a formula da area de superficie de uma esfera integrando fatias circulares.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'A = 4πR²');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '4πR²', true), (@q, '2πR²', false), (@q, 'πR²', false), (@q, '8πR²', false), (@q, '6πR²', false);

-- 37
SET @q = (SELECT id_question FROM question WHERE topic_id = @t7 AND statement LIKE 'Prove que entre todos os solidos de mesma area de superficie, a esfera tem o maior volume.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Verdadeiro (desigualdade isoperimétrica)');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Verdadeiro', true), (@q, 'Falso', false), (@q, 'Verdadeiro apenas para poliedros', false), (@q, 'Verdadeiro apenas para cilindros', false), (@q, 'O cubo tem maior volume', false);

-- 38
SET @q = (SELECT id_question FROM question WHERE topic_id = @t7 AND statement LIKE 'Calcule o volume da regiao de intersecao de dois cilindros ortogonais de mesmo raio R.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'V = (16/3)R³');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '(16/3)R³', true), (@q, '(8/3)R³', false), (@q, '4R³', false), (@q, '8R³', false), (@q, '(4/3)πR³', false);

-- 39
SET @q = (SELECT id_question FROM question WHERE topic_id = @t7 AND statement LIKE 'Determine o volume de um solido de revolucao gerado pela regiao entre y=x^2 e y=x, rotacionada em torno do eixo x.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'V = π∫₀¹ (x² - x⁴)dx = π(1/3 - 1/5)=π(2/15) = 2π/15');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '2π/15', true), (@q, 'π/15', false), (@q, '4π/15', false), (@q, 'π/30', false), (@q, 'π/5', false);

-- 40
SET @q = (SELECT id_question FROM question WHERE topic_id = @t7 AND statement LIKE 'Prove a relacao de Euler V - A + F = 2 para qualquer poliedro convexo.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Verdadeiro');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Verdadeiro', true), (@q, 'Falso', false), (@q, 'Válido apenas para poliedros regulares', false), (@q, 'Soma = 0', false), (@q, 'Válido apenas para prismas', false);

-- 41
SET @q = (SELECT id_question FROM question WHERE topic_id = @t7 AND statement LIKE 'Calcule o volume de um elipsoide de semi-eixos a=3, b=4, c=5.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'V = (4/3)πabc = (4/3)π*3*4*5 = 80π ≈ 251,2');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '80π', true), (@q, '60π', false), (@q, '120π', false), (@q, '20π', false), (@q, '240π', false);

-- 42
SET @q = (SELECT id_question FROM question WHERE topic_id = @t7 AND statement LIKE 'Determine a distancia entre duas retas reversas no espaco a partir de vetores diretores e pontos.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'd = |(v1×v2)·(P2-P1)| / |v1×v2|');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '|(v1×v2)·(P2-P1)| / |v1×v2|', true), (@q, '|(v1·v2)|/|v1||v2|', false), (@q, '|P2-P1|·|v1×v2|', false), (@q, '|v1×v2|/|P2-P1|', false), (@q, '|v1·v2|', false);

-- 43
SET @q = (SELECT id_question FROM question WHERE topic_id = @t7 AND statement LIKE 'Calcule a area da superficie do toro gerado pela rotacao de um circulo de raio r a distancia R do eixo (R>r).' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'A = 4π²Rr');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '4π²Rr', true), (@q, '2π²Rr', false), (@q, 'π²Rr', false), (@q, '4πRr', false), (@q, '4πR²', false);

-- 44
SET @q = (SELECT id_question FROM question WHERE topic_id = @t7 AND statement LIKE 'Derive a formula de Cavalieri e aplique-a para provar que a esfera e o cilindro de mesma altura e raio tem volumes na razao 2:3.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Vesf : Vcil = 2:3');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '2:3', true), (@q, '1:2', false), (@q, '3:2', false), (@q, '1:3', false), (@q, 'π:2', false);

-- 45
SET @q = (SELECT id_question FROM question WHERE topic_id = @t7 AND statement LIKE 'Prove que todo poliedro convexo pode ser decomposto em tetraedros.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Verdadeiro');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Verdadeiro', true), (@q, 'Falso', false), (@q, 'Apenas poliedros regulares', false), (@q, 'Apenas prismas', false), (@q, 'Apenas pirâmides', false);

-- 46
SET @q = (SELECT id_question FROM question WHERE topic_id = @t7 AND statement LIKE 'Um icosaedro tem aresta a. Derive a formula de seu volume.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'V = (5(3+√5)/12) a³');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '(5(3+√5)/12)a³', true), (@q, '(5+√5)/4 a³', false), (@q, '5√2/3 a³', false), (@q, '√2/12 a³', false), (@q, '(3+√5)/2 a³', false);

-- 47
SET @q = (SELECT id_question FROM question WHERE topic_id = @t7 AND statement LIKE 'Calcule o volume do solido gerado pela rotacao de y = sqrt(x) entre x=0 e x=4 em torno do eixo x.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'V = π∫₀⁴ (√x)² dx = π∫₀⁴ x dx = π(16/2)=8π');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '8π', true), (@q, '4π', false), (@q, '16π', false), (@q, '2π', false), (@q, '32π', false);

-- 48
SET @q = (SELECT id_question FROM question WHERE topic_id = @t7 AND statement LIKE 'Prove que a piramide de maior volume inscrita numa esfera de raio R e a piramide regular de base quadrada.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Verdadeiro');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Verdadeiro', true), (@q, 'Falso', false), (@q, 'A pirâmide de base triangular', false), (@q, 'A pirâmide de base hexagonal', false), (@q, 'Qualquer pirâmide regular', false);

-- 49
SET @q = (SELECT id_question FROM question WHERE topic_id = @t7 AND statement LIKE 'Determine o angulo diedro de um tetraedro regular.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'arccos(1/3) ≈ 70,53°');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'arccos(1/3)', true), (@q, '60°', false), (@q, '90°', false), (@q, 'arccos(1/2)', false), (@q, 'arccos(1/4)', false);

-- 50
SET @q = (SELECT id_question FROM question WHERE topic_id = @t7 AND statement LIKE 'Calcule a area da superficie e o volume de um tronco de piramide quadrada com bases de lados 4 e 8 cm e altura 6 cm.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Altura da face lateral = √(6²+2²)=√40=2√10, área lateral = 4*( (4+8)/2 *2√10)= 4*12√10=48√10; áreas bases 16 e 64, total = 80+48√10; V = (6/3)*(64+16+√(64*16))=2*(80+32)=224 cm³');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'A=80+48√10, V=224', true), (@q, 'A=80+48√10, V=112', false), (@q, 'A=80+48√10, V=448', false), (@q, 'A=48√10, V=224', false), (@q, 'A=80+48√10, V=336', false);

-- ============================================================
-- TÓPICO 8 - Trigonometria (50 MCQs, 5 alternativas)
-- ============================================================

SET @t8 = (SELECT id_topic FROM topic WHERE name = 'Trigonometria');

-- Inserir questões (20 easy, 15 medium, 15 hard)
INSERT INTO question (topic_id, statement, stats, difficulty) VALUES
                                                                  (@t8, 'Qual e o seno de 30 graus?', 'verified', 'easy'),
                                                                  (@t8, 'Qual e o cosseno de 60 graus?', 'verified', 'easy'),
                                                                  (@t8, 'Calcule a tangente de 45 graus.', 'verified', 'easy'),
                                                                  (@t8, 'Em um triangulo retangulo, o cateto oposto mede 5 cm e a hipotenusa 13 cm. Calcule sen(theta).', 'verified', 'easy'),
                                                                  (@t8, 'Converta 150 graus para radianos.', 'verified', 'easy'),
                                                                  (@t8, 'Converta pi/4 radianos para graus.', 'verified', 'easy'),
                                                                  (@t8, 'Qual e o sinal de cos(120 graus)?', 'verified', 'easy'),
                                                                  (@t8, 'Verifique a identidade: sen^2(theta) + cos^2(theta) = 1 para theta = 30 graus.', 'verified', 'easy'),
                                                                  (@t8, 'Um triangulo tem angulos 30, 60 e 90 graus. Quais sao as relacoes entre seus lados?', 'verified', 'easy'),
                                                                  (@t8, 'Determine o periodo da funcao f(x) = sen(2x).', 'verified', 'easy'),
                                                                  (@t8, 'Qual e a amplitude de f(x) = 3cos(x)?', 'verified', 'easy'),
                                                                  (@t8, 'Em que quadrantes o seno e positivo?', 'verified', 'easy'),
                                                                  (@t8, 'Calcule tg(180 - theta) em termos de tg(theta).', 'verified', 'easy'),
                                                                  (@t8, 'Qual e o valor de sen(90) + cos(0)?', 'verified', 'easy'),
                                                                  (@t8, 'Converta 270 graus para radianos.', 'verified', 'easy'),
                                                                  (@t8, 'Qual e o valor de cos(0)?', 'verified', 'easy'),
                                                                  (@t8, 'Em que quadrante o cosseno e negativo e o seno e positivo?', 'verified', 'easy'),
                                                                  (@t8, 'Calcule sen(60 graus).', 'verified', 'easy'),
                                                                  (@t8, 'Um triangulo retangulo tem hipotenusa 10 cm e um angulo de 30 graus. Qual e o cateto oposto?', 'verified', 'easy'),
                                                                  (@t8, 'Qual e o periodo da funcao f(x) = cos(x)?', 'verified', 'easy'),
                                                                  (@t8, 'Num triangulo com lados 7, 8 e 9 cm, use a Lei dos Cossenos para encontrar o maior angulo.', 'verified', 'medium'),
                                                                  (@t8, 'Resolva a equacao: 2sen(x) - 1 = 0 para 0 <= x < 2pi.', 'verified', 'medium'),
                                                                  (@t8, 'Prove a identidade: sen(A+B) = senA.cosB + cosA.senB.', 'verified', 'medium'),
                                                                  (@t8, 'Calcule cos(75 graus) usando a formula da adicao.', 'verified', 'medium'),
                                                                  (@t8, 'Um observador a 50 m do pe de um predio mede o angulo de elevacao do topo como 60 graus. Qual e a altura?', 'verified', 'medium'),
                                                                  (@t8, 'Resolva: cos(2x) = cos(x) para 0 <= x <= 2pi.', 'not_verified', 'medium'),
                                                                  (@t8, 'Determine o dominio e a imagem de f(x) = arcsen(x).', 'not_verified', 'medium'),
                                                                  (@t8, 'Prove a identidade: tg(2x) = 2tg(x) / (1 - tg^2(x)).', 'not_verified', 'medium'),
                                                                  (@t8, 'Calcule a area do triangulo de lados 6, 8 e angulo entre eles de 30 graus.', 'not_verified', 'medium'),
                                                                  (@t8, 'Resolva: sen(x) + cos(x) = 1 para 0 <= x < 2pi.', 'not_verified', 'medium'),
                                                                  (@t8, 'Determine o valor de sen(15 graus) usando a formula da diferenca.', 'not_verified', 'medium'),
                                                                  (@t8, 'Esboce o grafico de f(x) = 2sen(3x - pi/4), indicando amplitude, periodo e fase.', 'not_verified', 'medium'),
                                                                  (@t8, 'Resolva o triangulo escaleno com a=8, B=45 graus e C=75 graus.', 'not_verified', 'medium'),
                                                                  (@t8, 'Prove a Lei dos Senos: a/senA = b/senB = c/senC.', 'not_verified', 'medium'),
                                                                  (@t8, 'Calcule cos(15 graus) usando a formula da diferenca de angulos.', 'not_verified', 'medium'),
                                                                  (@t8, 'Prove que sen(3x) = 3sen(x) - 4sen^3(x).', 'not_verified', 'hard'),
                                                                  (@t8, 'Resolva a inequacao: tg(x) > sqrt(3) para x em [0, 2pi].', 'not_verified', 'hard'),
                                                                  (@t8, 'Demonstre a formula do angulo duplo cos(2x) = cos^2(x) - sen^2(x) a partir da adicao.', 'not_verified', 'hard'),
                                                                  (@t8, 'Um navio navega 40 km em direcao N30L e depois 60 km em direcao N70O. Use a Lei dos Cossenos para achar a distancia ao ponto de partida.', 'not_verified', 'hard'),
                                                                  (@t8, 'Resolva: sen^2(x) - 3sen(x)cos(x) + 2cos^2(x) = 0.', 'not_verified', 'hard'),
                                                                  (@t8, 'Calcule a integral de 0 a pi/2 de sen^2(x)dx usando identidade trigonometrica.', 'not_verified', 'hard'),
                                                                  (@t8, 'Determine todos os x em [0, 2pi] tais que sen(x) = cos(2x).', 'not_verified', 'hard'),
                                                                  (@t8, 'Prove a Lei dos Cossenos a partir do Teorema de Pitagoras e projecoes.', 'not_verified', 'hard'),
                                                                  (@t8, 'Use a formula de Euler e^(i*theta) = cos(theta) + i*sen(theta) para derivar as formulas de adicao.', 'not_verified', 'hard'),
                                                                  (@t8, 'Resolva o sistema: { sen(x) + cos(y) = 1 ; cos(x) + sen(y) = 1 } para x, y em [0, 2pi].', 'not_verified', 'hard'),
                                                                  (@t8, 'Prove que a soma sen(x) + sen(3x) + sen(5x) + ... + sen((2n-1)x) = sen^2(nx)/sen(x).', 'not_verified', 'hard'),
                                                                  (@t8, 'Calcule tg(pi/12) sem usar calculadora.', 'not_verified', 'hard'),
                                                                  (@t8, 'Prove que cos(pi/5) = (1 + sqrt(5))/4 usando equacoes de 2 grau.', 'not_verified', 'hard'),
                                                                  (@t8, 'Resolva 4sen(x)cos(x) - 2sen(x) - 2cos(x) + 1 = 0 para x em [0, 2pi].', 'not_verified', 'hard'),
                                                                  (@t8, 'Derive a formula da area de um triangulo qualquer como (1/2)ab.sen(C) e demonstre usando alturas.', 'not_verified', 'hard');

-- ============================================================
-- ALTERNATIVAS TÓPICO 8 (5 alternativas por questão)
-- ============================================================

-- 1
SET @q = (SELECT id_question FROM question WHERE topic_id = @t8 AND statement = 'Qual e o seno de 30 graus?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'sen 30° = 1/2');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '1/2', true), (@q, '√3/2', false), (@q, '√2/2', false), (@q, '1', false), (@q, '0', false);

-- 2
SET @q = (SELECT id_question FROM question WHERE topic_id = @t8 AND statement = 'Qual e o cosseno de 60 graus?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'cos 60° = 1/2');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '1/2', true), (@q, '√3/2', false), (@q, '√2/2', false), (@q, '1', false), (@q, '0', false);

-- 3
SET @q = (SELECT id_question FROM question WHERE topic_id = @t8 AND statement = 'Calcule a tangente de 45 graus.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'tg 45° = 1');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '1', true), (@q, '0', false), (@q, '√3', false), (@q, '1/2', false), (@q, '√3/3', false);

-- 4
SET @q = (SELECT id_question FROM question WHERE topic_id = @t8 AND statement = 'Em um triangulo retangulo, o cateto oposto mede 5 cm e a hipotenusa 13 cm. Calcule sen(theta).' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'sen = oposto/hip = 5/13');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '5/13', true), (@q, '12/13', false), (@q, '5/12', false), (@q, '13/5', false), (@q, '12/5', false);

-- 5
SET @q = (SELECT id_question FROM question WHERE topic_id = @t8 AND statement = 'Converta 150 graus para radianos.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '150 * π/180 = 5π/6');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '5π/6', true), (@q, 'π/3', false), (@q, '2π/3', false), (@q, 'π/6', false), (@q, '5π/3', false);

-- 6
SET @q = (SELECT id_question FROM question WHERE topic_id = @t8 AND statement = 'Converta pi/4 radianos para graus.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'π/4 * 180/π = 45°');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '45°', true), (@q, '30°', false), (@q, '60°', false), (@q, '90°', false), (@q, '15°', false);

-- 7
SET @q = (SELECT id_question FROM question WHERE topic_id = @t8 AND statement = 'Qual e o sinal de cos(120 graus)?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '120° está no 2º quadrante, cos negativo');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Negativo', true), (@q, 'Positivo', false), (@q, 'Zero', false), (@q, 'Maior que 1', false), (@q, 'Menor que -1', false);

-- 8
SET @q = (SELECT id_question FROM question WHERE topic_id = @t8 AND statement = 'Verifique a identidade: sen^2(theta) + cos^2(theta) = 1 para theta = 30 graus.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '(1/2)² + (√3/2)² = 1/4+3/4=1');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Verdadeiro', true), (@q, 'Falso', false), (@q, 'Só vale para 0°', false), (@q, 'Só vale para 90°', false), (@q, 'Nunca é verdade', false);

-- 9
SET @q = (SELECT id_question FROM question WHERE topic_id = @t8 AND statement = 'Um triangulo tem angulos 30, 60 e 90 graus. Quais sao as relacoes entre seus lados?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Lados opostos a 30°, 60°, 90°: a, a√3, 2a');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '1 : √3 : 2', true), (@q, '1 : 1 : √2', false), (@q, '3 : 4 : 5', false), (@q, '1 : 1 : 1', false), (@q, '1 : √2 : √3', false);

-- 10
SET @q = (SELECT id_question FROM question WHERE topic_id = @t8 AND statement = 'Determine o periodo da funcao f(x) = sen(2x).' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Período = 2π/2 = π');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'π', true), (@q, '2π', false), (@q, 'π/2', false), (@q, '4π', false), (@q, 'π/4', false);

-- 11
SET @q = (SELECT id_question FROM question WHERE topic_id = @t8 AND statement = 'Qual e a amplitude de f(x) = 3cos(x)?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Amplitude = |3| = 3');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '3', true), (@q, '1', false), (@q, '2', false), (@q, '4', false), (@q, '0', false);

-- 12
SET @q = (SELECT id_question FROM question WHERE topic_id = @t8 AND statement = 'Em que quadrantes o seno e positivo?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'seno positivo no 1º e 2º quadrantes');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '1º e 2º', true), (@q, '1º e 3º', false), (@q, '2º e 3º', false), (@q, '2º e 4º', false), (@q, '1º e 4º', false);

-- 13
SET @q = (SELECT id_question FROM question WHERE topic_id = @t8 AND statement = 'Calcule tg(180 - theta) em termos de tg(theta).' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'tg(180°-θ) = -tgθ');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '-tgθ', true), (@q, 'tgθ', false), (@q, 'cotgθ', false), (@q, '-cotgθ', false), (@q, '0', false);

-- 14
SET @q = (SELECT id_question FROM question WHERE topic_id = @t8 AND statement = 'Qual e o valor de sen(90) + cos(0)?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'sen90°=1, cos0°=1, soma=2');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '2', true), (@q, '1', false), (@q, '0', false), (@q, '√2', false), (@q, '√3', false);

-- 15
SET @q = (SELECT id_question FROM question WHERE topic_id = @t8 AND statement = 'Converta 270 graus para radianos.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '270 * π/180 = 3π/2');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '3π/2', true), (@q, 'π/2', false), (@q, 'π', false), (@q, '2π', false), (@q, '5π/2', false);

-- 16
SET @q = (SELECT id_question FROM question WHERE topic_id = @t8 AND statement = 'Qual e o valor de cos(0)?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'cos0° = 1');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '1', true), (@q, '0', false), (@q, '-1', false), (@q, '1/2', false), (@q, '√2/2', false);

-- 17
SET @q = (SELECT id_question FROM question WHERE topic_id = @t8 AND statement = 'Em que quadrante o cosseno e negativo e o seno e positivo?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '2º quadrante: cos negativo, sen positivo');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '2º', true), (@q, '1º', false), (@q, '3º', false), (@q, '4º', false), (@q, 'Nenhum', false);

-- 18
SET @q = (SELECT id_question FROM question WHERE topic_id = @t8 AND statement = 'Calcule sen(60 graus).' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'sen60° = √3/2');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '√3/2', true), (@q, '1/2', false), (@q, '√2/2', false), (@q, '1', false), (@q, '0', false);

-- 19
SET @q = (SELECT id_question FROM question WHERE topic_id = @t8 AND statement = 'Um triangulo retangulo tem hipotenusa 10 cm e um angulo de 30 graus. Qual e o cateto oposto?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'cateto oposto = hip * sen30° = 10 * 1/2 = 5 cm');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '5 cm', true), (@q, '10√3/2 cm', false), (@q, '10√3/3 cm', false), (@q, '8,66 cm', false), (@q, '10 cm', false);

-- 20
SET @q = (SELECT id_question FROM question WHERE topic_id = @t8 AND statement = 'Qual e o periodo da funcao f(x) = cos(x)?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Período fundamental = 2π');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '2π', true), (@q, 'π', false), (@q, 'π/2', false), (@q, '4π', false), (@q, '1', false);

-- 21 (medium)
SET @q = (SELECT id_question FROM question WHERE topic_id = @t8 AND statement LIKE 'Num triangulo com lados 7, 8 e 9 cm, use a Lei dos Cossenos para encontrar o maior angulo.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Maior lado = 9, cosC = (7²+8²-9²)/(2*7*8) = (49+64-81)/112 = 32/112=2/7 => C≈73,4°');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'arccos(2/7)', true), (@q, 'arccos(1/7)', false), (@q, 'arccos(3/7)', false), (@q, 'arccos(4/7)', false), (@q, 'arccos(5/7)', false);

-- 22
SET @q = (SELECT id_question FROM question WHERE topic_id = @t8 AND statement LIKE 'Resolva a equacao: 2sen(x) - 1 = 0 para 0 <= x < 2pi.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'sen x = 1/2 => x = π/6 e 5π/6');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'π/6, 5π/6', true), (@q, 'π/6, 7π/6', false), (@q, 'π/3, 5π/3', false), (@q, 'π/3, 2π/3', false), (@q, 'π/6, 11π/6', false);

-- 23
SET @q = (SELECT id_question FROM question WHERE topic_id = @t8 AND statement LIKE 'Prove a identidade: sen(A+B) = senA.cosB + cosA.senB.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Verdadeiro');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Verdadeiro', true), (@q, 'Falso', false), (@q, 'senA.senB + cosA.cosB', false), (@q, 'cosA.cosB - senA.senB', false), (@q, 'senA.cosB - cosA.senB', false);

-- 24
SET @q = (SELECT id_question FROM question WHERE topic_id = @t8 AND statement LIKE 'Calcule cos(75 graus) usando a formula da adicao.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'cos75° = cos(45+30)=cos45.cos30 - sen45.sen30 = (√2/2)*(√3/2) - (√2/2)*(1/2)= (√6-√2)/4');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '(√6-√2)/4', true), (@q, '(√6+√2)/4', false), (@q, '(√2-√6)/4', false), (@q, '√6/4', false), (@q, '√2/4', false);

-- 25
SET @q = (SELECT id_question FROM question WHERE topic_id = @t8 AND statement LIKE 'Um observador a 50 m do pe de um predio mede o angulo de elevacao do topo como 60 graus. Qual e a altura?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'tg60° = h/50 => h = 50√3 ≈ 86,6 m');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '50√3 m', true), (@q, '50/√3 m', false), (@q, '25√3 m', false), (@q, '100√3 m', false), (@q, '50 m', false);

-- 26
SET @q = (SELECT id_question FROM question WHERE topic_id = @t8 AND statement LIKE 'Resolva: cos(2x) = cos(x) para 0 <= x <= 2pi.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'cos2x - cosx=0 => -2sen(3x/2)sen(x/2)=0 => sen(3x/2)=0 => x=0,2π/3,4π/3,2π; sen(x/2)=0 => x=0,2π => S={0,2π/3,4π/3,2π}');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '0, 2π/3, 4π/3, 2π', true), (@q, '0, π/3, 5π/3, 2π', false), (@q, 'π/2, 3π/2', false), (@q, 'π/3, π, 5π/3', false), (@q, '0, π', false);

-- 27
SET @q = (SELECT id_question FROM question WHERE topic_id = @t8 AND statement LIKE 'Determine o dominio e a imagem de f(x) = arcsen(x).' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Domínio: [-1,1], Imagem: [-π/2, π/2]');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'D=[-1,1], Im=[-π/2,π/2]', true), (@q, 'D=[-1,1], Im=[0,π]', false), (@q, 'D=R, Im=[-π/2,π/2]', false), (@q, 'D=[-1,1], Im=R', false), (@q, 'D=R, Im=R', false);

-- 28
SET @q = (SELECT id_question FROM question WHERE topic_id = @t8 AND statement LIKE 'Prove a identidade: tg(2x) = 2tg(x) / (1 - tg^2(x)).' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Verdadeiro');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Verdadeiro', true), (@q, 'Falso', false), (@q, '2tg/(1+tg²)', false), (@q, '(1-tg²)/2tg', false), (@q, 'tg²x', false);

-- 29
SET @q = (SELECT id_question FROM question WHERE topic_id = @t8 AND statement LIKE 'Calcule a area do triangulo de lados 6, 8 e angulo entre eles de 30 graus.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'A = (1/2)*6*8*sen30° = 24*0,5 = 12');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '12', true), (@q, '24', false), (@q, '48', false), (@q, '6', false), (@q, '18', false);

-- 30
SET @q = (SELECT id_question FROM question WHERE topic_id = @t8 AND statement LIKE 'Resolva: sen(x) + cos(x) = 1 para 0 <= x < 2pi.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Multiplica por √2/2: sen(x+π/4)=√2/2 => x+π/4=π/4 ou 3π/4 => x=0 ou π/2');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '0, π/2', true), (@q, 'π/4, 3π/4', false), (@q, 'π/2, π', false), (@q, '0, π/4', false), (@q, 'π/2, 3π/2', false);

-- 31
SET @q = (SELECT id_question FROM question WHERE topic_id = @t8 AND statement LIKE 'Determine o valor de sen(15 graus) usando a formula da diferenca.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'sen15° = sen(45-30)= sen45cos30 - cos45sen30 = (√2/2)(√3/2) - (√2/2)(1/2)= (√6-√2)/4');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '(√6-√2)/4', true), (@q, '(√6+√2)/4', false), (@q, '(√2-√6)/4', false), (@q, '√6/4', false), (@q, '√2/4', false);

-- 32
SET @q = (SELECT id_question FROM question WHERE topic_id = @t8 AND statement LIKE 'Esboce o grafico de f(x) = 2sen(3x - pi/4), indicando amplitude, periodo e fase.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Amplitude=2, Período=2π/3, Fase=π/12 (para a direita)');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'A=2, T=2π/3, fase=π/12', true), (@q, 'A=2, T=2π/3, fase=π/4', false), (@q, 'A=2, T=π, fase=π/12', false), (@q, 'A=1, T=2π/3, fase=π/12', false), (@q, 'A=2, T=π/3, fase=π/12', false);

-- 33
SET @q = (SELECT id_question FROM question WHERE topic_id = @t8 AND statement LIKE 'Resolva o triangulo escaleno com a=8, B=45 graus e C=75 graus.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'A=60°, lei dos senos: b = a*senB/senA = 8*(√2/2)/(√3/2)= 8√2/√3 = (8√6)/3; c = a*senC/senA = 8*sen75°/(√3/2)');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'A=60°, b=8√2/√3, c=8√2*sen75°', true), (@q, 'A=60°, b=8√3/2, c=8√2', false), (@q, 'A=75°, b=8√2, c=8√3', false), (@q, 'A=45°, b=8√3/2, c=8√2', false), (@q, 'A=60°, b=8√3, c=8', false);

-- 34
SET @q = (SELECT id_question FROM question WHERE topic_id = @t8 AND statement LIKE 'Prove a Lei dos Senos: a/senA = b/senB = c/senC.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Verdadeiro');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Verdadeiro', true), (@q, 'Falso', false), (@q, 'Vale apenas para triângulos retângulos', false), (@q, 'a/senA = b/senB, mas não c', false), (@q, 'a/senA = 2R', false);

-- 35
SET @q = (SELECT id_question FROM question WHERE topic_id = @t8 AND statement LIKE 'Calcule cos(15 graus) usando a formula da diferenca de angulos.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'cos15° = cos(45-30)= cos45cos30+sen45sen30 = (√2/2)(√3/2)+(√2/2)(1/2)= (√6+√2)/4');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '(√6+√2)/4', true), (@q, '(√6-√2)/4', false), (@q, '√6/4', false), (@q, '√2/4', false), (@q, '√3/4', false);

-- 36 (hard)
SET @q = (SELECT id_question FROM question WHERE topic_id = @t8 AND statement LIKE 'Prove que sen(3x) = 3sen(x) - 4sen^3(x).' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Verdadeiro');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Verdadeiro', true), (@q, 'Falso', false), (@q, '3sen(x) + 4sen³(x)', false), (@q, '4sen³ - 3sen', false), (@q, 'sen(3x)=4senx', false);

-- 37
SET @q = (SELECT id_question FROM question WHERE topic_id = @t8 AND statement LIKE 'Resolva a inequacao: tg(x) > sqrt(3) para x em [0, 2pi].' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'tg x > √3 => x ∈ (π/3, π/2) ∪ (4π/3, 3π/2)');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '(π/3, π/2) ∪ (4π/3, 3π/2)', true), (@q, '(π/3, π/2) ∪ (π, 4π/3)', false), (@q, '(π/2, 2π/3) ∪ (3π/2, 5π/3)', false), (@q, '(0, π/3) ∪ (π, 4π/3)', false), (@q, '(π/3, π/2) ∪ (π, 3π/2)', false);

-- 38
SET @q = (SELECT id_question FROM question WHERE topic_id = @t8 AND statement LIKE 'Demonstre a formula do angulo duplo cos(2x) = cos^2(x) - sen^2(x) a partir da adicao.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Verdadeiro');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Verdadeiro', true), (@q, 'Falso', false), (@q, 'cos²+sen²', false), (@q, '2cos²-1', false), (@q, '1-2sen²', false);

-- 39
SET @q = (SELECT id_question FROM question WHERE topic_id = @t8 AND statement LIKE 'Um navio navega 40 km em direcao N30L e depois 60 km em direcao N70O. Use a Lei dos Cossenos para achar a distancia ao ponto de partida.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Ângulo entre os deslocamentos: 30°+70°=100°? N30L é 30° a leste do norte, N70O é 70° a oeste do norte => angulo entre = 100°. d²=40²+60²-2*40*60*cos100°');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '√(5200-4800cos100°)', true), (@q, '√(5200+4800cos100°)', false), (@q, '√(10000-4800cos100°)', false), (@q, '√(10000+4800cos100°)', false), (@q, '√(5200-4800sen100°)', false);

-- 40
SET @q = (SELECT id_question FROM question WHERE topic_id = @t8 AND statement LIKE 'Resolva: sen^2(x) - 3sen(x)cos(x) + 2cos^2(x) = 0.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Dividindo por cos²x: tg²x -3tgx+2=0 => (tgx-1)(tgx-2)=0 => tgx=1 ou tgx=2 => x=π/4, 5π/4, arctan2+π, arctan2+2π');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'x = π/4 + kπ e x = arctan2 + kπ', true), (@q, 'x = π/4 + kπ e x = arctan(1/2)+kπ', false), (@q, 'x = π/4 + kπ/2', false), (@q, 'x = π/3 + kπ', false), (@q, 'x = arctan3 + kπ', false);

-- 41
SET @q = (SELECT id_question FROM question WHERE topic_id = @t8 AND statement LIKE 'Calcule a integral de 0 a pi/2 de sen^2(x)dx usando identidade trigonometrica.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'sen²x = (1-cos2x)/2 => ∫₀^{π/2}(1-cos2x)/2 dx = [x/2 - sen2x/4]₀^{π/2}= π/4');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'π/4', true), (@q, 'π/2', false), (@q, 'π/8', false), (@q, '1', false), (@q, '0', false);

-- 42
SET @q = (SELECT id_question FROM question WHERE topic_id = @t8 AND statement LIKE 'Determine todos os x em [0, 2pi] tais que sen(x) = cos(2x).' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'cos2x = 1-2sen²x => senx = 1-2sen²x => 2sen²x+senx-1=0 => senx=1/2 ou senx=-1 => x=π/6,5π/6,3π/2');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'π/6, 5π/6, 3π/2', true), (@q, 'π/6, 5π/6, π/2', false), (@q, 'π/3, 2π/3, 3π/2', false), (@q, 'π/6, 11π/6, 3π/2', false), (@q, 'π/3, 5π/3, π/2', false);

-- 43
SET @q = (SELECT id_question FROM question WHERE topic_id = @t8 AND statement LIKE 'Prove a Lei dos Cossenos a partir do Teorema de Pitagoras e projecoes.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Verdadeiro');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Verdadeiro', true), (@q, 'Falso', false), (@q, 'Válido apenas para ângulos agudos', false), (@q, 'Válido apenas para triângulos retângulos', false), (@q, 'A² = b² + c² - 2bc cosA', false);

-- 44
SET @q = (SELECT id_question FROM question WHERE topic_id = @t8 AND statement LIKE 'Use a formula de Euler e^(i*theta) = cos(theta) + i*sen(theta) para derivar as formulas de adicao.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Verdadeiro');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Verdadeiro', true), (@q, 'Falso', false), (@q, 'Só para ângulos retos', false), (@q, 'Deriva apenas seno', false), (@q, 'Deriva apenas cosseno', false);

-- 45
SET @q = (SELECT id_question FROM question WHERE topic_id = @t8 AND statement LIKE 'Resolva o sistema: { sen(x) + cos(y) = 1 ; cos(x) + sen(y) = 1 } para x, y em [0, 2pi].' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Soluções: x=y=0; x=y=π/2; x=π/2, y=0; x=0, y=π/2');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '(0,0), (π/2,π/2), (0,π/2), (π/2,0)', true), (@q, '(0,0) e (π/2,π/2)', false), (@q, '(π,π) e (0,π/2)', false), (@q, '(π/4,π/4)', false), (@q, '(π,0) e (0,π)', false);

-- 46
SET @q = (SELECT id_question FROM question WHERE topic_id = @t8 AND statement LIKE 'Prove que a soma sen(x) + sen(3x) + sen(5x) + ... + sen((2n-1)x) = sen^2(nx)/sen(x).' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Verdadeiro');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Verdadeiro', true), (@q, 'Falso', false), (@q, 'sen(nx)cos((n-1)x)/senx', false), (@q, 'sen(2nx)/senx', false), (@q, 'cos(nx)sen((n-1)x)/senx', false);

-- 47
SET @q = (SELECT id_question FROM question WHERE topic_id = @t8 AND statement LIKE 'Calcule tg(pi/12) sem usar calculadora.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'tg15° = 2-√3');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '2-√3', true), (@q, '2+√3', false), (@q, '√3-2', false), (@q, '√3/3', false), (@q, '1/(2-√3)', false);

-- 48
SET @q = (SELECT id_question FROM question WHERE topic_id = @t8 AND statement LIKE 'Prove que cos(pi/5) = (1 + sqrt(5))/4 usando equacoes de 2 grau.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Verdadeiro');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Verdadeiro', true), (@q, 'Falso', false), (@q, '(√5-1)/4', false), (@q, '(1-√5)/4', false), (@q, '(3+√5)/4', false);

-- 49
SET @q = (SELECT id_question FROM question WHERE topic_id = @t8 AND statement LIKE 'Resolva 4sen(x)cos(x) - 2sen(x) - 2cos(x) + 1 = 0 para x em [0, 2pi].' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '4senxcosx = 2sen2x, agrupar: (2sen2x+1) -2(senx+cosx)=0; usando t=senx+cosx, t²=1+sen2x, depois resolver...');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'x = π/6, 5π/6, π/2, 3π/2', true), (@q, 'x = π/4, 3π/4, 5π/4, 7π/4', false), (@q, 'x = 0, π/2, π, 3π/2', false), (@q, 'x = π/3, 2π/3, 4π/3, 5π/3', false), (@q, 'x = π/6, 5π/6', false);

-- 50
SET @q = (SELECT id_question FROM question WHERE topic_id = @t8 AND statement LIKE 'Derive a formula da area de um triangulo qualquer como (1/2)ab.sen(C) e demonstre usando alturas.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Verdadeiro');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Verdadeiro', true), (@q, 'Falso', false), (@q, '(1/2)ab.senC é a área', false), (@q, 'A = bc.senA/2', false), (@q, 'A = (a+b+c)/2', false);

-- ============================================================
-- TÓPICO 9 - Probabilidade e Estatistica (50 MCQs, 5 alternativas)
-- ============================================================

SET @t9 = (SELECT id_topic FROM topic WHERE name = 'Probabilidade e Estatistica');

-- Inserir questões (20 easy, 15 medium, 15 hard)
INSERT INTO question (topic_id, statement, stats, difficulty) VALUES
                                                                  (@t9, 'Lanca-se um dado. Qual e a probabilidade de sair o numero 4?', 'verified', 'easy'),
                                                                  (@t9, 'Em uma turma de 30 alunos, 12 sao meninas. Qual e a probabilidade de sortear uma menina?', 'verified', 'easy'),
                                                                  (@t9, 'Calcule a media dos valores: 5, 7, 9, 11, 13.', 'verified', 'easy'),
                                                                  (@t9, 'Qual e a mediana do conjunto {2, 3, 7, 10, 15}?', 'verified', 'easy'),
                                                                  (@t9, 'Qual e a moda de {4, 4, 5, 6, 6, 6, 7}?', 'verified', 'easy'),
                                                                  (@t9, 'Uma moeda e lancada 3 vezes. Qual e a probabilidade de sair cara nas 3 vezes?', 'verified', 'easy'),
                                                                  (@t9, 'Calcule a amplitude do conjunto {3, 7, 8, 14, 21}.', 'verified', 'easy'),
                                                                  (@t9, 'Descreva o espaco amostral do lancamento de dois dados.', 'verified', 'easy'),
                                                                  (@t9, 'O que e probabilidade complementar? De um exemplo.', 'verified', 'easy'),
                                                                  (@t9, 'Em uma urna ha 5 bolas vermelhas e 3 azuis. Qual e a probabilidade de tirar azul?', 'verified', 'easy'),
                                                                  (@t9, 'Calcule a variancia do conjunto {2, 4, 4, 4, 5, 5, 7, 9}.', 'verified', 'easy'),
                                                                  (@t9, 'Qual e a diferenca entre evento simples e composto?', 'verified', 'easy'),
                                                                  (@t9, 'Uma caixa tem 4 bolas numeradas de 1 a 4. Qual e a probabilidade de tirar um numero par?', 'verified', 'easy'),
                                                                  (@t9, 'Calcule a media de {10, 20, 30, 40, 50}.', 'verified', 'easy'),
                                                                  (@t9, 'Qual e a mediana do conjunto {1, 3, 5, 7, 9, 11}?', 'verified', 'easy'),
                                                                  (@t9, 'Em um baralho de 52 cartas, qual e a probabilidade de retirar um as?', 'verified', 'easy'),
                                                                  (@t9, 'Calcule o desvio medio do conjunto {2, 4, 6, 8, 10}.', 'verified', 'easy'),
                                                                  (@t9, 'O que e um histograma de frequencias? Descreva suas principais caracteristicas.', 'verified', 'easy'),
                                                                  (@t9, 'Qual e a probabilidade de lancar uma moeda e cair coroa?', 'verified', 'easy'),
                                                                  (@t9, 'Calcule a media ponderada de {5, 7, 9} com pesos {1, 2, 3}.', 'verified', 'easy'),
                                                                  (@t9, 'Calcule a probabilidade de tirar ao menos um 6 ao lancar dois dados.', 'verified', 'medium'),
                                                                  (@t9, 'Em um experimento binomial com n=10 e p=0,3, calcule P(X=3).', 'verified', 'medium'),
                                                                  (@t9, 'Calcule o desvio padrao de {4, 7, 13, 16} e interprete.', 'verified', 'medium'),
                                                                  (@t9, 'Dois eventos A e B tem P(A)=0,5, P(B)=0,4 e P(A intersecao B)=0,2. Sao independentes?', 'verified', 'medium'),
                                                                  (@t9, 'Calcule P(A|B) dado P(A intersecao B)=0,12 e P(B)=0,3 e interprete.', 'verified', 'medium'),
                                                                  (@t9, 'Um conjunto de 100 notas tem media 70 e desvio padrao 10. Quantos alunos estao entre 60 e 80?', 'not_verified', 'medium'),
                                                                  (@t9, 'Usando o Teorema de Bayes: P(A)=0,3, P(B|A)=0,4, P(B|Ac)=0,2. Calcule P(A|B).', 'not_verified', 'medium'),
                                                                  (@t9, 'Calcule a correlacao de Pearson entre X={1,2,3,4,5} e Y={2,4,5,4,5}.', 'not_verified', 'medium'),
                                                                  (@t9, 'Em um grupo de 20 pessoas, 12 falam ingles e 8 falam espanhol, e 4 falam ambos. Qual e a probabilidade de falar pelo menos um idioma?', 'not_verified', 'medium'),
                                                                  (@t9, 'Uma variavel aleatoria X tem distribuicao geometrica com p=0,25. Calcule P(X<=3).', 'not_verified', 'medium'),
                                                                  (@t9, 'Determine o coeficiente de variacao dos conjuntos A={10,20,30} e B={100,200,300} e compare.', 'not_verified', 'medium'),
                                                                  (@t9, 'Interprete o p-valor de 0,03 em um teste de hipoteses ao nivel de significancia de 5%.', 'not_verified', 'medium'),
                                                                  (@t9, 'Desenhe e interprete um boxplot para o conjunto {1, 3, 4, 5, 5, 7, 9, 10, 11, 14}.', 'not_verified', 'medium'),
                                                                  (@t9, 'Prove que a soma de todas as probabilidades de uma distribuicao discreta e 1.', 'not_verified', 'medium'),
                                                                  (@t9, 'Dois dados sao lancados. Calcule a probabilidade de a soma ser igual a 7.', 'not_verified', 'medium'),
                                                                  (@t9, 'Prove o Teorema de Bayes a partir da definicao de probabilidade condicional.', 'not_verified', 'hard'),
                                                                  (@t9, 'Uma variavel X tem distribuicao normal com mu=50 e sigma=10. Calcule P(40<X<65) usando a tabela Z.', 'not_verified', 'hard'),
                                                                  (@t9, 'Demonstre que E(aX+b) = aE(X) + b para uma variavel aleatoria discreta.', 'not_verified', 'hard'),
                                                                  (@t9, 'Um servidor recebe em media 3 chamadas por minuto (Poisson). Qual e P(X=5) em um minuto?', 'not_verified', 'hard'),
                                                                  (@t9, 'Construa um intervalo de confianca de 95% para a media de uma amostra de 36 valores com media 80 e desvio padrao 12.', 'not_verified', 'hard'),
                                                                  (@t9, 'Prove que Var(X) = E(X^2) - [E(X)]^2.', 'not_verified', 'hard'),
                                                                  (@t9, 'Enuncie e prove o Teorema Central do Limite (versao informal com distribuicao binomial).', 'not_verified', 'hard'),
                                                                  (@t9, 'Dois dados sao lancados 180 vezes. Use a aproximacao normal para calcular P(sair soma 7 entre 25 e 35 vezes).', 'not_verified', 'hard'),
                                                                  (@t9, 'Prove que a mediana minimiza a soma dos desvios absolutos, enquanto a media minimiza os quadraticos.', 'not_verified', 'hard'),
                                                                  (@t9, 'Usando a desigualdade de Chebyshev, determine o limite inferior da probabilidade de X estar dentro de 3 desvios padroes de sua media.', 'not_verified', 'hard'),
                                                                  (@t9, 'Construa e interprete uma carta de controle para um processo com mu=50 e sigma=5.', 'not_verified', 'hard'),
                                                                  (@t9, 'Calcule o coeficiente de determinacao R^2 para uma regressao linear e interprete-o.', 'not_verified', 'hard'),
                                                                  (@t9, 'Prove que se X e Y sao variaveis aleatorias independentes, entao Var(X+Y) = Var(X) + Var(Y).', 'not_verified', 'hard'),
                                                                  (@t9, 'Determine a distribuicao da soma de duas variaveis aleatorias independentes com distribuicao de Poisson de parametros lambda1 e lambda2.', 'not_verified', 'hard'),
                                                                  (@t9, 'Prove a lei dos grandes numeros na forma fraca para variaveis de Bernoulli.', 'not_verified', 'hard');

-- ============================================================
-- ALTERNATIVAS TÓPICO 9 (5 alternativas por questão)
-- ============================================================

-- 1
SET @q = (SELECT id_question FROM question WHERE topic_id = @t9 AND statement = 'Lanca-se um dado. Qual e a probabilidade de sair o numero 4?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '1/6');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '1/6', true), (@q, '1/4', false), (@q, '1/5', false), (@q, '1/3', false), (@q, '1/2', false);

-- 2
SET @q = (SELECT id_question FROM question WHERE topic_id = @t9 AND statement = 'Em uma turma de 30 alunos, 12 sao meninas. Qual e a probabilidade de sortear uma menina?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '12/30 = 2/5');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '2/5', true), (@q, '1/3', false), (@q, '3/5', false), (@q, '2/3', false), (@q, '1/2', false);

-- 3
SET @q = (SELECT id_question FROM question WHERE topic_id = @t9 AND statement = 'Calcule a media dos valores: 5, 7, 9, 11, 13.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '(5+7+9+11+13)/5 = 45/5 = 9');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '9', true), (@q, '7', false), (@q, '8', false), (@q, '10', false), (@q, '11', false);

-- 4
SET @q = (SELECT id_question FROM question WHERE topic_id = @t9 AND statement = 'Qual e a mediana do conjunto {2, 3, 7, 10, 15}?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Mediana = termo central = 7');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '7', true), (@q, '3', false), (@q, '10', false), (@q, '5', false), (@q, '6', false);

-- 5
SET @q = (SELECT id_question FROM question WHERE topic_id = @t9 AND statement = 'Qual e a moda de {4, 4, 5, 6, 6, 6, 7}?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '6 (aparece 3 vezes)');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '6', true), (@q, '4', false), (@q, '5', false), (@q, '7', false), (@q, '4 e 6', false);

-- 6
SET @q = (SELECT id_question FROM question WHERE topic_id = @t9 AND statement = 'Uma moeda e lancada 3 vezes. Qual e a probabilidade de sair cara nas 3 vezes?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'P = (1/2)^3 = 1/8');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '1/8', true), (@q, '1/2', false), (@q, '1/4', false), (@q, '3/8', false), (@q, '1/3', false);

-- 7
SET @q = (SELECT id_question FROM question WHERE topic_id = @t9 AND statement = 'Calcule a amplitude do conjunto {3, 7, 8, 14, 21}.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Amplitude = máx - mín = 21 - 3 = 18');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '18', true), (@q, '17', false), (@q, '19', false), (@q, '15', false), (@q, '20', false);

-- 8
SET @q = (SELECT id_question FROM question WHERE topic_id = @t9 AND statement = 'Descreva o espaco amostral do lancamento de dois dados.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '36 pares ordenados de 1 a 6');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '36 elementos', true), (@q, '12 elementos', false), (@q, '6 elementos', false), (@q, '72 elementos', false), (@q, '18 elementos', false);

-- 9
SET @q = (SELECT id_question FROM question WHERE topic_id = @t9 AND statement = 'O que e probabilidade complementar? De um exemplo.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'P(A) + P(complementar) = 1');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Probabilidade do evento contrário', true), (@q, 'Soma de probabilidades', false), (@q, 'Interseção de eventos', false), (@q, 'Eventos independentes', false), (@q, 'Média ponderada', false);

-- 10
SET @q = (SELECT id_question FROM question WHERE topic_id = @t9 AND statement = 'Em uma urna ha 5 bolas vermelhas e 3 azuis. Qual e a probabilidade de tirar azul?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '3/8');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '3/8', true), (@q, '5/8', false), (@q, '1/3', false), (@q, '1/2', false), (@q, '1/8', false);

-- 11
SET @q = (SELECT id_question FROM question WHERE topic_id = @t9 AND statement = 'Calcule a variancia do conjunto {2, 4, 4, 4, 5, 5, 7, 9}.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Média = 5, variância = Σ(xi-5)²/8 = (9+1+1+1+0+0+4+16)/8 = 32/8=4');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '4', true), (@q, '2', false), (@q, '3', false), (@q, '5', false), (@q, '1', false);

-- 12
SET @q = (SELECT id_question FROM question WHERE topic_id = @t9 AND statement = 'Qual e a diferenca entre evento simples e composto?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Evento simples: um resultado; composto: mais de um resultado');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Simples: único resultado; composto: vários', true), (@q, 'Simples: poucos; composto: muitos', false), (@q, 'Simples: impossível; composto: certo', false), (@q, 'Não há diferença', false), (@q, 'Simples: depende de outro; composto: independente', false);

-- 13
SET @q = (SELECT id_question FROM question WHERE topic_id = @t9 AND statement = 'Uma caixa tem 4 bolas numeradas de 1 a 4. Qual e a probabilidade de tirar um numero par?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Pares: 2 e 4 => 2/4 = 1/2');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '1/2', true), (@q, '1/4', false), (@q, '3/4', false), (@q, '1/3', false), (@q, '2/3', false);

-- 14
SET @q = (SELECT id_question FROM question WHERE topic_id = @t9 AND statement = 'Calcule a media de {10, 20, 30, 40, 50}.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '(10+20+30+40+50)/5 = 150/5 = 30');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '30', true), (@q, '25', false), (@q, '35', false), (@q, '40', false), (@q, '20', false);

-- 15
SET @q = (SELECT id_question FROM question WHERE topic_id = @t9 AND statement = 'Qual e a mediana do conjunto {1, 3, 5, 7, 9, 11}?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Média dos dois centrais: (5+7)/2 = 6');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '6', true), (@q, '5', false), (@q, '7', false), (@q, '6,5', false), (@q, '5,5', false);

-- 16
SET @q = (SELECT id_question FROM question WHERE topic_id = @t9 AND statement = 'Em um baralho de 52 cartas, qual e a probabilidade de retirar um as?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '4/52 = 1/13');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '1/13', true), (@q, '1/4', false), (@q, '4/52', false), (@q, '1/52', false), (@q, '1/26', false);

-- 17
SET @q = (SELECT id_question FROM question WHERE topic_id = @t9 AND statement = 'Calcule o desvio medio do conjunto {2, 4, 6, 8, 10}.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Média = 6, DM = (4+2+0+2+4)/5 = 12/5 = 2,4');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '2,4', true), (@q, '2', false), (@q, '3', false), (@q, '1,5', false), (@q, '4', false);

-- 18
SET @q = (SELECT id_question FROM question WHERE topic_id = @t9 AND statement = 'O que e um histograma de frequencias? Descreva suas principais caracteristicas.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Gráfico de barras para dados contínuos agrupados em classes');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Barras justapostas para distribuição de frequências', true), (@q, 'Gráfico de pontos', false), (@q, 'Diagrama de setores', false), (@q, 'Gráfico de linhas', false), (@q, 'Dispersão', false);

-- 19
SET @q = (SELECT id_question FROM question WHERE topic_id = @t9 AND statement = 'Qual e a probabilidade de lancar uma moeda e cair coroa?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '1/2');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '1/2', true), (@q, '1/4', false), (@q, '1/3', false), (@q, '2/3', false), (@q, '0,5', false);

-- 20
SET @q = (SELECT id_question FROM question WHERE topic_id = @t9 AND statement = 'Calcule a media ponderada de {5, 7, 9} com pesos {1, 2, 3}.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '(5*1+7*2+9*3)/(1+2+3) = (5+14+27)/6 = 46/6 ≈ 7,67');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '46/6', true), (@q, '7', false), (@q, '8', false), (@q, '21', false), (@q, '7,5', false);

-- 21 (medium)
SET @q = (SELECT id_question FROM question WHERE topic_id = @t9 AND statement LIKE 'Calcule a probabilidade de tirar ao menos um 6 ao lancar dois dados.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'P = 1 - (5/6)² = 1 - 25/36 = 11/36');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '11/36', true), (@q, '1/6', false), (@q, '1/3', false), (@q, '1/36', false), (@q, '10/36', false);

-- 22
SET @q = (SELECT id_question FROM question WHERE topic_id = @t9 AND statement LIKE 'Em um experimento binomial com n=10 e p=0,3, calcule P(X=3).' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'C(10,3)*0,3³*0,7⁷ ≈ 120*0,027*0,08235 ≈ 0,2668');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '≈ 0,2668', true), (@q, '0,3', false), (@q, '0,5', false), (@q, '0,2', false), (@q, '0,1', false);

-- 23
SET @q = (SELECT id_question FROM question WHERE topic_id = @t9 AND statement LIKE 'Calcule o desvio padrao de {4, 7, 13, 16} e interprete.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Média=10, var=((6²+3²+3²+6²)/4)= (36+9+9+36)/4=90/4=22,5, dp=√22,5≈4,74');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '≈4,74', true), (@q, '≈5', false), (@q, '≈4', false), (@q, '≈6', false), (@q, '≈3,5', false);

-- 24
SET @q = (SELECT id_question FROM question WHERE topic_id = @t9 AND statement LIKE 'Dois eventos A e B tem P(A)=0,5, P(B)=0,4 e P(A intersecao B)=0,2. Sao independentes?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'P(A)*P(B)=0,5*0,4=0,2 = P(A∩B) => independentes');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Sim', true), (@q, 'Não', false), (@q, 'Depende', false), (@q, 'Mutualmente exclusivos', false), (@q, 'Incompatíveis', false);

-- 25
SET @q = (SELECT id_question FROM question WHERE topic_id = @t9 AND statement LIKE 'Calcule P(A|B) dado P(A intersecao B)=0,12 e P(B)=0,3 e interprete.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'P(A|B)=0,12/0,3=0,4');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '0,4', true), (@q, '0,36', false), (@q, '0,12', false), (@q, '0,5', false), (@q, '0,6', false);

-- 26
SET @q = (SELECT id_question FROM question WHERE topic_id = @t9 AND statement LIKE 'Um conjunto de 100 notas tem media 70 e desvio padrao 10. Quantos alunos estao entre 60 e 80?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Pelo Teorema de Chebyshev ou normal: aproximadamente 68% => 68 alunos');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '~68', true), (@q, '~95', false), (@q, '~50', false), (@q, '~80', false), (@q, '~30', false);

-- 27
SET @q = (SELECT id_question FROM question WHERE topic_id = @t9 AND statement LIKE 'Usando o Teorema de Bayes: P(A)=0,3, P(B|A)=0,4, P(B|Ac)=0,2. Calcule P(A|B).' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'P(B)=0,3*0,4+0,7*0,2=0,12+0,14=0,26; P(A|B)=0,12/0,26≈0,4615');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '0,4615', true), (@q, '0,5', false), (@q, '0,4', false), (@q, '0,3', false), (@q, '0,6', false);

-- 28
SET @q = (SELECT id_question FROM question WHERE topic_id = @t9 AND statement LIKE 'Calcule a correlacao de Pearson entre X={1,2,3,4,5} e Y={2,4,5,4,5}.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'r ≈ 0,9');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '0,9', true), (@q, '0,5', false), (@q, '0,7', false), (@q, '1,0', false), (@q, '0,3', false);

-- 29
SET @q = (SELECT id_question FROM question WHERE topic_id = @t9 AND statement LIKE 'Em um grupo de 20 pessoas, 12 falam ingles e 8 falam espanhol, e 4 falam ambos. Qual e a probabilidade de falar pelo menos um idioma?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '12+8-4=16 => 16/20=0,8');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '0,8', true), (@q, '0,6', false), (@q, '0,7', false), (@q, '0,9', false), (@q, '1,0', false);

-- 30
SET @q = (SELECT id_question FROM question WHERE topic_id = @t9 AND statement LIKE 'Uma variavel aleatoria X tem distribuicao geometrica com p=0,25. Calcule P(X<=3).' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'P = p + qp + q²p = 0,25+0,75*0,25+0,5625*0,25 = 0,25+0,1875+0,1406=0,5781');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '≈0,578', true), (@q, '0,25', false), (@q, '0,5', false), (@q, '0,75', false), (@q, '0,8', false);

-- 31
SET @q = (SELECT id_question FROM question WHERE topic_id = @t9 AND statement LIKE 'Determine o coeficiente de variacao dos conjuntos A={10,20,30} e B={100,200,300} e compare.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'CV = desvio/média; ambos têm CV=0,5');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Iguais', true), (@q, 'CV(A) > CV(B)', false), (@q, 'CV(A) < CV(B)', false), (@q, 'Não pode comparar', false), (@q, 'CV(A)=0,5, CV(B)=0,05', false);

-- 32
SET @q = (SELECT id_question FROM question WHERE topic_id = @t9 AND statement LIKE 'Interprete o p-valor de 0,03 em um teste de hipoteses ao nivel de significancia de 5%.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'p-valor < 0,05 => rejeita H0');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Rejeita H0', true), (@q, 'Aceita H0', false), (@q, 'Inconclusivo', false), (@q, 'p-valor alto', false), (@q, 'Erro tipo II', false);

-- 33
SET @q = (SELECT id_question FROM question WHERE topic_id = @t9 AND statement LIKE 'Desenhe e interprete um boxplot para o conjunto {1, 3, 4, 5, 5, 7, 9, 10, 11, 14}.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Q1=4, Mediana=6, Q3=10, IQR=6, outliers: 1? (limite=4-9=-5, ok), 14? (limite=10+9=19, ok) => sem outliers');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Mediana=6, Q1=4, Q3=10', true), (@q, 'Mediana=5, Q1=4, Q3=9', false), (@q, 'Com outliers', false), (@q, 'Assimétrico à esquerda', false), (@q, 'Assimétrico à direita', false);

-- 34
SET @q = (SELECT id_question FROM question WHERE topic_id = @t9 AND statement LIKE 'Prove que a soma de todas as probabilidades de uma distribuicao discreta e 1.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Verdadeiro (axioma)');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Verdadeiro', true), (@q, 'Falso', false), (@q, 'Soma = 0', false), (@q, 'Soma = n', false), (@q, 'Depende', false);

-- 35
SET @q = (SELECT id_question FROM question WHERE topic_id = @t9 AND statement LIKE 'Dois dados sao lancados. Calcule a probabilidade de a soma ser igual a 7.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Pares: (1,6),(2,5),(3,4),(4,3),(5,2),(6,1) => 6/36=1/6');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '1/6', true), (@q, '1/12', false), (@q, '5/36', false), (@q, '1/36', false), (@q, '1/7', false);

-- 36 (hard)
SET @q = (SELECT id_question FROM question WHERE topic_id = @t9 AND statement LIKE 'Prove o Teorema de Bayes a partir da definicao de probabilidade condicional.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Verdadeiro');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Verdadeiro', true), (@q, 'Falso', false), (@q, 'Apenas para eventos independentes', false), (@q, 'Apenas para variáveis contínuas', false), (@q, 'Não é teorema', false);

-- 37
SET @q = (SELECT id_question FROM question WHERE topic_id = @t9 AND statement LIKE 'Uma variavel X tem distribuicao normal com mu=50 e sigma=10. Calcule P(40<X<65) usando a tabela Z.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Z1=(40-50)/10=-1, Z2=(65-50)/10=1,5 => P≈0,7745');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '0,7745', true), (@q, '0,6827', false), (@q, '0,8413', false), (@q, '0,9332', false), (@q, '0,5', false);

-- 38
SET @q = (SELECT id_question FROM question WHERE topic_id = @t9 AND statement LIKE 'Demonstre que E(aX+b) = aE(X) + b para uma variavel aleatoria discreta.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Verdadeiro (linearidade)');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Verdadeiro', true), (@q, 'Falso', false), (@q, 'Válido apenas para a=1', false), (@q, 'Válido apenas para b=0', false), (@q, 'E(aX+b)=aE(X)', false);

-- 39
SET @q = (SELECT id_question FROM question WHERE topic_id = @t9 AND statement LIKE 'Um servidor recebe em media 3 chamadas por minuto (Poisson). Qual e P(X=5) em um minuto?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'P = e^{-3} * 3^5 / 5! = e^{-3}*243/120 ≈ 0,1008');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '0,1008', true), (@q, '0,224', false), (@q, '0,05', false), (@q, '0,15', false), (@q, '0,2', false);

-- 40
SET @q = (SELECT id_question FROM question WHERE topic_id = @t9 AND statement LIKE 'Construa um intervalo de confianca de 95% para a media de uma amostra de 36 valores com media 80 e desvio padrao 12.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'IC = 80 ± 1,96*(12/6) = 80 ± 3,92 => [76,08; 83,92]');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '[76,08; 83,92]', true), (@q, '[75;85]', false), (@q, '[78;82]', false), (@q, '[70;90]', false), (@q, '[80;80]', false);

-- 41
SET @q = (SELECT id_question FROM question WHERE topic_id = @t9 AND statement LIKE 'Prove que Var(X) = E(X^2) - [E(X)]^2.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Verdadeiro');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Verdadeiro', true), (@q, 'Falso', false), (@q, 'Var = E[(X-μ)^2]', false), (@q, 'Var = E(X^2) + μ^2', false), (@q, 'Var = E(X^2)', false);

-- 42
SET @q = (SELECT id_question FROM question WHERE topic_id = @t9 AND statement LIKE 'Enuncie e prove o Teorema Central do Limite (versao informal com distribuicao binomial).' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Verdadeiro');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Verdadeiro', true), (@q, 'Falso', false), (@q, 'Válido apenas para normal', false), (@q, 'Válido apenas para amostras pequenas', false), (@q, 'Não se aplica à binomial', false);

-- 43
SET @q = (SELECT id_question FROM question WHERE topic_id = @t9 AND statement LIKE 'Dois dados sao lancados 180 vezes. Use a aproximacao normal para calcular P(sair soma 7 entre 25 e 35 vezes).' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'p=1/6, n=180, μ=30, σ=√(180*1/6*5/6)=√25=5; P(25≤X≤35) = P(-1≤Z≤1) ≈ 0,6827');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '0,6827', true), (@q, '0,9545', false), (@q, '0,5', false), (@q, '0,3', false), (@q, '0,8', false);

-- 44
SET @q = (SELECT id_question FROM question WHERE topic_id = @t9 AND statement LIKE 'Prove que a mediana minimiza a soma dos desvios absolutos, enquanto a media minimiza os quadraticos.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Verdadeiro');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Verdadeiro', true), (@q, 'Falso', false), (@q, 'O contrário', false), (@q, 'Ambos minimizam os mesmos', false), (@q, 'A moda minimiza ambos', false);

-- 45
SET @q = (SELECT id_question FROM question WHERE topic_id = @t9 AND statement LIKE 'Usando a desigualdade de Chebyshev, determine o limite inferior da probabilidade de X estar dentro de 3 desvios padroes de sua media.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'P(|X-μ|<3σ) ≥ 1 - 1/9 = 8/9 ≈ 0,8889');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '8/9', true), (@q, '1/9', false), (@q, '3/4', false), (@q, '1/2', false), (@q, '1', false);

-- 46
SET @q = (SELECT id_question FROM question WHERE topic_id = @t9 AND statement LIKE 'Construa e interprete uma carta de controle para um processo com mu=50 e sigma=5.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Limites: 50±3*5 = [35,65]');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'LSC=65, LIC=35', true), (@q, 'LSC=55, LIC=45', false), (@q, 'LSC=60, LIC=40', false), (@q, 'LSC=50, LIC=50', false), (@q, 'LSC=70, LIC=30', false);

-- 47
SET @q = (SELECT id_question FROM question WHERE topic_id = @t9 AND statement LIKE 'Calcule o coeficiente de determinacao R^2 para uma regressao linear e interprete-o.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'R² = 1 - SQR/SQT, mede proporção da variação explicada');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Proporção da variância explicada', true), (@q, 'Coeficiente angular', false), (@q, 'Coeficiente linear', false), (@q, 'Correlação', false), (@q, 'Erro padrão', false);

-- 48
SET @q = (SELECT id_question FROM question WHERE topic_id = @t9 AND statement LIKE 'Prove que se X e Y sao variaveis aleatorias independentes, entao Var(X+Y) = Var(X) + Var(Y).' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Verdadeiro');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Verdadeiro', true), (@q, 'Falso', false), (@q, 'Var(X)+Var(Y)+2Cov', false), (@q, 'Var(X)-Var(Y)', false), (@q, 'Var(X)*Var(Y)', false);

-- 49
SET @q = (SELECT id_question FROM question WHERE topic_id = @t9 AND statement LIKE 'Determine a distribuicao da soma de duas variaveis aleatorias independentes com distribuicao de Poisson de parametros lambda1 e lambda2.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Poisson com parâmetro λ1+λ2');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Poisson(λ1+λ2)', true), (@q, 'Normal', false), (@q, 'Binomial', false), (@q, 'Geométrica', false), (@q, 'Exponencial', false);

-- 50
SET @q = (SELECT id_question FROM question WHERE topic_id = @t9 AND statement LIKE 'Prove a lei dos grandes numeros na forma fraca para variaveis de Bernoulli.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Verdadeiro');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Verdadeiro', true), (@q, 'Falso', false), (@q, 'Válido apenas para normal', false), (@q, 'Válido apenas para grandes amostras', false), (@q, 'Não se aplica a Bernoulli', false);

-- ============================================================
-- TÓPICO 10 - Progressoes Aritmeticas e Geometricas (50 MCQs, 5 alternativas)
-- ============================================================

SET @t10 = (SELECT id_topic FROM topic WHERE name = 'Progressoes Aritmeticas e Geometricas');

-- Inserir questões (20 easy, 15 medium, 15 hard)
INSERT INTO question (topic_id, statement, stats, difficulty) VALUES
                                                                  (@t10, 'Determine o 10 termo da PA (2, 5, 8, ...).', 'verified', 'easy'),
                                                                  (@t10, 'Qual e a razao da PA (-3, 1, 5, 9, ...)?', 'verified', 'easy'),
                                                                  (@t10, 'Calcule a soma dos 20 primeiros termos da PA (1, 3, 5, ...).', 'verified', 'easy'),
                                                                  (@t10, 'Determine o 6 termo da PG (2, 6, 18, ...).', 'verified', 'easy'),
                                                                  (@t10, 'Qual e a razao da PG (5, 10, 20, 40, ...)?', 'verified', 'easy'),
                                                                  (@t10, 'Quantos termos tem a PA (4, 7, 10, ..., 100)?', 'verified', 'easy'),
                                                                  (@t10, 'Tres numeros formam uma PA. A soma deles e 21 e o maior e o dobro do menor. Determine-os.', 'verified', 'easy'),
                                                                  (@t10, 'Calcule a soma dos 8 primeiros termos da PG (1, 2, 4, ...).', 'verified', 'easy'),
                                                                  (@t10, 'Interpole 3 meios aritmeticos entre 5 e 25.', 'verified', 'easy'),
                                                                  (@t10, 'Uma PG tem a1=3 e a4=81. Determine a razao.', 'verified', 'easy'),
                                                                  (@t10, 'A soma dos n primeiros inteiros positivos e n(n+1)/2. Calcule para n=100.', 'verified', 'easy'),
                                                                  (@t10, 'Uma PG tem a1=2 e razao 1/2. Calcule a soma dos infinitos termos.', 'verified', 'easy'),
                                                                  (@t10, 'Interpole 2 meios geometricos entre 2 e 54.', 'verified', 'easy'),
                                                                  (@t10, 'Tres termos consecutivos de uma PA tem soma 15 e produto 80. Quais sao?', 'verified', 'easy'),
                                                                  (@t10, 'Qual e o 5 termo da PA (10, 7, 4, ...)?', 'verified', 'easy'),
                                                                  (@t10, 'Calcule a soma dos 10 primeiros termos da PA (3, 6, 9, ...).', 'verified', 'easy'),
                                                                  (@t10, 'Qual e o 4 termo da PG (1, 3, 9, ...)?', 'verified', 'easy'),
                                                                  (@t10, 'Determine a razao de uma PA onde a1=5 e a5=17.', 'verified', 'easy'),
                                                                  (@t10, 'Calcule a soma dos 6 primeiros termos da PG (2, 4, 8, ...).', 'verified', 'easy'),
                                                                  (@t10, 'Em uma PA com razao 3, o terceiro termo e 11. Qual e o primeiro?', 'verified', 'easy'),
                                                                  (@t10, 'A soma dos n termos de uma PA e Sn = 3n^2 + 2n. Determine o termo geral an.', 'verified', 'medium'),
                                                                  (@t10, 'Uma empresa tem lucro de R$10.000 em janeiro e cresce 5% ao mes. Qual o lucro em dezembro?', 'verified', 'medium'),
                                                                  (@t10, 'Calcule a soma 1 + 1/2 + 1/4 + 1/8 + ... (PG infinita).', 'verified', 'medium'),
                                                                  (@t10, 'Um capital de R$1.000 e aplicado a juros compostos de 10% ao ano. Quanto tera apos 5 anos?', 'verified', 'medium'),
                                                                  (@t10, 'Determine x para que (x, x+3, x+9) seja PG.', 'verified', 'medium'),
                                                                  (@t10, 'Prove que a soma dos termos de uma PA finita e n vezes a media aritmetica dos extremos.', 'not_verified', 'medium'),
                                                                  (@t10, 'Uma PA tem a1=5 e S10=140. Determine a razao e o 10 termo.', 'not_verified', 'medium'),
                                                                  (@t10, 'Calcule: 1 + 2 + 4 + ... + 2^20 usando a formula da PG.', 'not_verified', 'medium'),
                                                                  (@t10, 'Determine os valores de k para que (k-1, 3k, 5k+2) seja PA.', 'not_verified', 'medium'),
                                                                  (@t10, 'Uma bola e lancada de 8 m e quica sempre atingindo 3/4 da altura anterior. Qual e a distancia total percorrida?', 'not_verified', 'medium'),
                                                                  (@t10, 'Calcule a soma: 3 + 6 + 9 + ... + 300.', 'not_verified', 'medium'),
                                                                  (@t10, 'Determine se a sequencia an = n^2 forma PA, PG ou nenhuma das duas.', 'not_verified', 'medium'),
                                                                  (@t10, 'Prove que numa PG positiva com razao r diferente de 1, log(an) forma uma PA.', 'not_verified', 'medium'),
                                                                  (@t10, 'Uma PA tem a3=10 e a7=22. Determine a1 e a razao.', 'not_verified', 'medium'),
                                                                  (@t10, 'Prove que se (a, b, c) e PA, entao (a^2, b^2, c^2) nao e necessariamente PA.', 'not_verified', 'medium'),
                                                                  (@t10, 'Prove que a soma de n termos de uma PG de razao r diferente de 1 e Sn = a1(r^n - 1)/(r - 1).', 'not_verified', 'hard'),
                                                                  (@t10, 'A soma de uma PG infinita decrescente e 12 e a1=4. Determine a razao e o 5 termo.', 'not_verified', 'hard'),
                                                                  (@t10, 'Prove que se os termos de uma PA sao positivos, sua media geometrica e menor ou igual a media aritmetica.', 'not_verified', 'hard'),
                                                                  (@t10, 'Determine todos os x reais para que (2^x, 2^(2x+1), 2^(3x+2)) seja PA.', 'not_verified', 'hard'),
                                                                  (@t10, 'Um emprestimo de R$50.000 e pago em 24 prestacoes mensais iguais a 3% de juros compostos. Calcule o valor da prestacao.', 'not_verified', 'hard'),
                                                                  (@t10, 'Prove por inducao que 1 + 2 + 3 + ... + n = n(n+1)/2.', 'not_verified', 'hard'),
                                                                  (@t10, 'Dois investimentos: PA crescendo R$500/mes partindo de R$5.000; PG crescendo 5%/mes partindo de R$4.000. Em que mes a PG supera a PA?', 'not_verified', 'hard'),
                                                                  (@t10, 'Determine o numero de termos de uma PG com a1=2, razao 3 e soma 242.', 'not_verified', 'hard'),
                                                                  (@t10, 'Prove que entre quaisquer dois termos de uma PG positiva, o produto e igual ao quadrado de qualquer meio geometrico entre eles.', 'not_verified', 'hard'),
                                                                  (@t10, 'Usando somatorio, calcule a soma 1.2 + 2.3 + 3.4 + ... + n(n+1).', 'not_verified', 'hard'),
                                                                  (@t10, 'Derive a formula do valor futuro de uma anuidade ordinaria usando PG.', 'not_verified', 'hard'),
                                                                  (@t10, 'Prove que toda PG com termos positivos pode ser convertida em PA tomando o logaritmo de cada termo.', 'not_verified', 'hard'),
                                                                  (@t10, 'Determine para quais valores reais de r a PG de razao r tem soma finita.', 'not_verified', 'hard'),
                                                                  (@t10, 'Calcule a soma 1/1.2 + 1/2.3 + 1/3.4 + ... + 1/n(n+1) e determine seu limite quando n tende ao infinito.', 'not_verified', 'hard'),
                                                                  (@t10, 'Prove que se a1, a2, a3, ..., an e uma PA de termos positivos, entao a1.an = a2.a(n-1) = ... (produtos de termos equidistantes dos extremos sao iguais).', 'not_verified', 'hard');

-- ============================================================
-- ALTERNATIVAS TÓPICO 10 (5 alternativas por questão)
-- ============================================================

-- 1
SET @q = (SELECT id_question FROM question WHERE topic_id = @t10 AND statement = 'Determine o 10 termo da PA (2, 5, 8, ...).' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'a10 = a1 + 9r = 2 + 9*3 = 29');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '29', true), (@q, '26', false), (@q, '27', false), (@q, '32', false), (@q, '30', false);

-- 2
SET @q = (SELECT id_question FROM question WHERE topic_id = @t10 AND statement = 'Qual e a razao da PA (-3, 1, 5, 9, ...)?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'r = 1 - (-3) = 4');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '4', true), (@q, '2', false), (@q, '3', false), (@q, '1', false), (@q, '5', false);

-- 3
SET @q = (SELECT id_question FROM question WHERE topic_id = @t10 AND statement = 'Calcule a soma dos 20 primeiros termos da PA (1, 3, 5, ...).' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'a1=1, r=2, a20=1+19*2=39, S20=20*(1+39)/2=400');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '400', true), (@q, '200', false), (@q, '380', false), (@q, '420', false), (@q, '360', false);

-- 4
SET @q = (SELECT id_question FROM question WHERE topic_id = @t10 AND statement = 'Determine o 6 termo da PG (2, 6, 18, ...).' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'a1=2, q=3, a6=2*3^5=2*243=486');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '486', true), (@q, '162', false), (@q, '243', false), (@q, '729', false), (@q, '972', false);

-- 5
SET @q = (SELECT id_question FROM question WHERE topic_id = @t10 AND statement = 'Qual e a razao da PG (5, 10, 20, 40, ...)?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'q = 10/5 = 2');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '2', true), (@q, '5', false), (@q, '3', false), (@q, '1/2', false), (@q, '10', false);

-- 6
SET @q = (SELECT id_question FROM question WHERE topic_id = @t10 AND statement = 'Quantos termos tem a PA (4, 7, 10, ..., 100)?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'an = 4+(n-1)*3=100 => 3n-3=96 => 3n=99 => n=33');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '33', true), (@q, '32', false), (@q, '34', false), (@q, '30', false), (@q, '35', false);

-- 7
SET @q = (SELECT id_question FROM question WHERE topic_id = @t10 AND statement = 'Tres numeros formam uma PA. A soma deles e 21 e o maior e o dobro do menor. Determine-os.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Sejam x-r, x, x+r: soma 3x=21 => x=7; maior = 7+r = 2(7-r) => 7+r=14-2r => 3r=7 => r=7/3 => números: 14/3, 7, 28/3');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '14/3, 7, 28/3', true), (@q, '5,7,9', false), (@q, '3,7,11', false), (@q, '6,7,8', false), (@q, '4,7,10', false);

-- 8
SET @q = (SELECT id_question FROM question WHERE topic_id = @t10 AND statement = 'Calcule a soma dos 8 primeiros termos da PG (1, 2, 4, ...).' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'a1=1, q=2, S8 = (2^8 -1)/(2-1) = 255');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '255', true), (@q, '127', false), (@q, '511', false), (@q, '128', false), (@q, '256', false);

-- 9
SET @q = (SELECT id_question FROM question WHERE topic_id = @t10 AND statement = 'Interpole 3 meios aritmeticos entre 5 e 25.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'PA com 5 termos: a1=5, a5=25 => r = (25-5)/4=5 => PA: 5,10,15,20,25');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '10,15,20', true), (@q, '5,10,15,20', false), (@q, '15,20,25', false), (@q, '10,15,20,25', false), (@q, '5,10,15', false);

-- 10
SET @q = (SELECT id_question FROM question WHERE topic_id = @t10 AND statement = 'Uma PG tem a1=3 e a4=81. Determine a razao.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'a4 = 3*q^3 = 81 => q^3=27 => q=3');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '3', true), (@q, '2', false), (@q, '4', false), (@q, '6', false), (@q, '9', false);

-- 11
SET @q = (SELECT id_question FROM question WHERE topic_id = @t10 AND statement = 'A soma dos n primeiros inteiros positivos e n(n+1)/2. Calcule para n=100.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '100*101/2 = 5050');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '5050', true), (@q, '5000', false), (@q, '5100', false), (@q, '4900', false), (@q, '5150', false);

-- 12
SET @q = (SELECT id_question FROM question WHERE topic_id = @t10 AND statement = 'Uma PG tem a1=2 e razao 1/2. Calcule a soma dos infinitos termos.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'S∞ = a1/(1-q) = 2/(1-1/2) = 2/(1/2)=4');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '4', true), (@q, '2', false), (@q, '3', false), (@q, '1', false), (@q, '8', false);

-- 13
SET @q = (SELECT id_question FROM question WHERE topic_id = @t10 AND statement = 'Interpole 2 meios geometricos entre 2 e 54.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'PG com 4 termos: a1=2, a4=54 => 2*q^3=54 => q^3=27 => q=3 => PG: 2,6,18,54');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '6,18', true), (@q, '4,12', false), (@q, '9,27', false), (@q, '3,9', false), (@q, '6,12', false);

-- 14
SET @q = (SELECT id_question FROM question WHERE topic_id = @t10 AND statement = 'Tres termos consecutivos de uma PA tem soma 15 e produto 80. Quais sao?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Sejam x-r, x, x+r: soma 3x=15 => x=5; produto (5-r)*5*(5+r)=80 => 25 - r² =16 => r²=9 => r=±3 => termos: 2,5,8');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '2,5,8', true), (@q, '1,5,9', false), (@q, '3,5,7', false), (@q, '4,5,6', false), (@q, '0,5,10', false);

-- 15
SET @q = (SELECT id_question FROM question WHERE topic_id = @t10 AND statement = 'Qual e o 5 termo da PA (10, 7, 4, ...)?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'a1=10, r=-3, a5=10+4*(-3)=10-12=-2');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '-2', true), (@q, '2', false), (@q, '-4', false), (@q, '0', false), (@q, '1', false);

-- 16
SET @q = (SELECT id_question FROM question WHERE topic_id = @t10 AND statement = 'Calcule a soma dos 10 primeiros termos da PA (3, 6, 9, ...).' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'a1=3, r=3, a10=30, S10=10*(3+30)/2=5*33=165');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '165', true), (@q, '150', false), (@q, '180', false), (@q, '135', false), (@q, '195', false);

-- 17
SET @q = (SELECT id_question FROM question WHERE topic_id = @t10 AND statement = 'Qual e o 4 termo da PG (1, 3, 9, ...)?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'a1=1, q=3, a4=1*3^3=27');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '27', true), (@q, '9', false), (@q, '18', false), (@q, '81', false), (@q, '12', false);

-- 18
SET @q = (SELECT id_question FROM question WHERE topic_id = @t10 AND statement = 'Determine a razao de uma PA onde a1=5 e a5=17.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'a5 = 5 + 4r = 17 => 4r=12 => r=3');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '3', true), (@q, '2', false), (@q, '4', false), (@q, '5', false), (@q, '6', false);

-- 19
SET @q = (SELECT id_question FROM question WHERE topic_id = @t10 AND statement = 'Calcule a soma dos 6 primeiros termos da PG (2, 4, 8, ...).' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'a1=2, q=2, S6 = 2*(2^6-1)/(2-1)=2*(64-1)=126');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '126', true), (@q, '62', false), (@q, '254', false), (@q, '64', false), (@q, '128', false);

-- 20
SET @q = (SELECT id_question FROM question WHERE topic_id = @t10 AND statement = 'Em uma PA com razao 3, o terceiro termo e 11. Qual e o primeiro?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'a3 = a1 + 2*3 = 11 => a1 + 6 = 11 => a1 = 5');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '5', true), (@q, '3', false), (@q, '4', false), (@q, '6', false), (@q, '7', false);

-- 21 (medium)
SET @q = (SELECT id_question FROM question WHERE topic_id = @t10 AND statement LIKE 'A soma dos n termos de uma PA e Sn = 3n^2 + 2n. Determine o termo geral an.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'an = Sn - S(n-1) = 3n²+2n - [3(n-1)²+2(n-1)] = 3n²+2n - [3n²-6n+3+2n-2] = 3n²+2n - 3n²+6n-3-2n+2 = 6n-1');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '6n-1', true), (@q, '6n+1', false), (@q, '3n-1', false), (@q, '3n+1', false), (@q, '6n-5', false);

-- 22
SET @q = (SELECT id_question FROM question WHERE topic_id = @t10 AND statement LIKE 'Uma empresa tem lucro de R$10.000 em janeiro e cresce 5% ao mes. Qual o lucro em dezembro?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'PG: a1=10000, q=1,05, a12 = 10000 * 1,05^11 ≈ 10000*1,71034 = 17103,40');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '≈ 17103', true), (@q, '15000', false), (@q, '20000', false), (@q, '16000', false), (@q, '18000', false);

-- 23
SET @q = (SELECT id_question FROM question WHERE topic_id = @t10 AND statement LIKE 'Calcule a soma 1 + 1/2 + 1/4 + 1/8 + ... (PG infinita).' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'a1=1, q=1/2, S∞ = 1/(1-1/2)=2');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '2', true), (@q, '1', false), (@q, '1,5', false), (@q, '2,5', false), (@q, '∞', false);

-- 24
SET @q = (SELECT id_question FROM question WHERE topic_id = @t10 AND statement LIKE 'Um capital de R$1.000 e aplicado a juros compostos de 10% ao ano. Quanto tera apos 5 anos?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'M = 1000 * (1,1)^5 ≈ 1000 * 1,61051 = 1610,51');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '1610,51', true), (@q, '1500', false), (@q, '1600', false), (@q, '1700', false), (@q, '1650', false);

-- 25
SET @q = (SELECT id_question FROM question WHERE topic_id = @t10 AND statement LIKE 'Determine x para que (x, x+3, x+9) seja PG.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '(x+3)^2 = x(x+9) => x²+6x+9 = x²+9x => 6x+9=9x => 9=3x => x=3');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '3', true), (@q, '0', false), (@q, '6', false), (@q, '9', false), (@q, '1', false);

-- 26
SET @q = (SELECT id_question FROM question WHERE topic_id = @t10 AND statement LIKE 'Prove que a soma dos termos de uma PA finita e n vezes a media aritmetica dos extremos.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Verdadeiro');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Verdadeiro', true), (@q, 'Falso', false), (@q, 'n vezes a média dos termos centrais', false), (@q, 'n vezes a média de todos', false), (@q, 'n vezes o primeiro termo', false);

-- 27
SET @q = (SELECT id_question FROM question WHERE topic_id = @t10 AND statement LIKE 'Uma PA tem a1=5 e S10=140. Determine a razao e o 10 termo.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'S10 = 10*(2*5+9r)/2 = 5*(10+9r)=140 => 50+45r=140 => 45r=90 => r=2; a10=5+9*2=23');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'r=2, a10=23', true), (@q, 'r=3, a10=32', false), (@q, 'r=1, a10=14', false), (@q, 'r=2, a10=25', false), (@q, 'r=4, a10=41', false);

-- 28
SET @q = (SELECT id_question FROM question WHERE topic_id = @t10 AND statement LIKE 'Calcule: 1 + 2 + 4 + ... + 2^20 usando a formula da PG.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'S = 2^21 - 1 = 2097152 - 1 = 2097151');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '2097151', true), (@q, '1048575', false), (@q, '4194303', false), (@q, '2^21', false), (@q, '2^20', false);

-- 29
SET @q = (SELECT id_question FROM question WHERE topic_id = @t10 AND statement LIKE 'Determine os valores de k para que (k-1, 3k, 5k+2) seja PA.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '3k - (k-1) = (5k+2) - 3k => 3k - k + 1 = 5k+2-3k => 2k+1=2k+2 => 1=2 => impossível => nenhum k');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Nenhum', true), (@q, 'k=1', false), (@q, 'k=0', false), (@q, 'k=-1', false), (@q, 'k qualquer', false);

-- 30
SET @q = (SELECT id_question FROM question WHERE topic_id = @t10 AND statement LIKE 'Uma bola e lancada de 8 m e quica sempre atingindo 3/4 da altura anterior. Qual e a distancia total percorrida?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Distância total = 8 + 2*(8*3/4 + 8*(3/4)² + ...) = 8 + 2*(6/(1-3/4)) = 8 + 2*24 = 56 m');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '56 m', true), (@q, '32 m', false), (@q, '48 m', false), (@q, '64 m', false), (@q, '40 m', false);

-- 31
SET @q = (SELECT id_question FROM question WHERE topic_id = @t10 AND statement LIKE 'Calcule a soma: 3 + 6 + 9 + ... + 300.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'PA: a1=3, an=300, r=3 => n = (300-3)/3+1=100 => S100 = 100*(3+300)/2 = 50*303=15150');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '15150', true), (@q, '15100', false), (@q, '15200', false), (@q, '15000', false), (@q, '15300', false);

-- 32
SET @q = (SELECT id_question FROM question WHERE topic_id = @t10 AND statement LIKE 'Determine se a sequencia an = n^2 forma PA, PG ou nenhuma das duas.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Diferenças: 1,3,5,... variam => não é PA; razões: 4/1=4, 9/4=2,25,... variam => não é PG');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Nenhuma', true), (@q, 'PA', false), (@q, 'PG', false), (@q, 'PA e PG', false), (@q, 'PA de 2ª ordem', false);

-- 33
SET @q = (SELECT id_question FROM question WHERE topic_id = @t10 AND statement LIKE 'Prove que numa PG positiva com razao r diferente de 1, log(an) forma uma PA.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Verdadeiro');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Verdadeiro', true), (@q, 'Falso', false), (@q, 'Forma uma PG', false), (@q, 'Forma uma constante', false), (@q, 'Depende de r', false);

-- 34
SET @q = (SELECT id_question FROM question WHERE topic_id = @t10 AND statement LIKE 'Uma PA tem a3=10 e a7=22. Determine a1 e a razao.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'a7=a3+4r => 22=10+4r => r=3; a3=a1+2r => 10=a1+6 => a1=4');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'a1=4, r=3', true), (@q, 'a1=5, r=3', false), (@q, 'a1=4, r=2', false), (@q, 'a1=6, r=4', false), (@q, 'a1=3, r=3', false);

-- 35
SET @q = (SELECT id_question FROM question WHERE topic_id = @t10 AND statement LIKE 'Prove que se (a, b, c) e PA, entao (a^2, b^2, c^2) nao e necessariamente PA.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Verdadeiro');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Verdadeiro', true), (@q, 'Falso', false), (@q, 'Sempre é PA', false), (@q, 'Nunca é PA', false), (@q, 'É PG', false);

-- 36 (hard)
SET @q = (SELECT id_question FROM question WHERE topic_id = @t10 AND statement LIKE 'Prove que a soma de n termos de uma PG de razao r diferente de 1 e Sn = a1(r^n - 1)/(r - 1).' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Verdadeiro');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Verdadeiro', true), (@q, 'Falso', false), (@q, 'a1(1-r^n)/(1-r)', false), (@q, 'a1(r^n-1)/(r-1)', false), (@q, 'a1(1-r^n)/(r-1)', false);

-- 37
SET @q = (SELECT id_question FROM question WHERE topic_id = @t10 AND statement LIKE 'A soma de uma PG infinita decrescente e 12 e a1=4. Determine a razao e o 5 termo.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'S∞=4/(1-q)=12 => 12(1-q)=4 => 1-q=1/3 => q=2/3; a5=4*(2/3)^4=4*16/81=64/81');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'q=2/3, a5=64/81', true), (@q, 'q=1/3, a5=4/81', false), (@q, 'q=3/4, a5=81/64', false), (@q, 'q=1/2, a5=1/4', false), (@q, 'q=3/2, a5=81/4', false);

-- 38
SET @q = (SELECT id_question FROM question WHERE topic_id = @t10 AND statement LIKE 'Prove que se os termos de uma PA sao positivos, sua media geometrica e menor ou igual a media aritmetica.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Verdadeiro (desigualdade MA ≥ MG)');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Verdadeiro', true), (@q, 'Falso', false), (@q, 'MA = MG sempre', false), (@q, 'MG ≥ MA', false), (@q, 'Depende da PA', false);

-- 39
SET @q = (SELECT id_question FROM question WHERE topic_id = @t10 AND statement LIKE 'Determine todos os x reais para que (2^x, 2^(2x+1), 2^(3x+2)) seja PA.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '2^(2x+1) - 2^x = 2^(3x+2) - 2^(2x+1) => 2^x(2^(x+1)-1) = 2^(2x+1)(2^x -1) => 2^x(2*2^x-1) = 2^(2x+1)(2^x-1) => Simplificando, x=0 ou x=... solução única x=0');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'x = 0', true), (@q, 'x = 1', false), (@q, 'x = -1', false), (@q, 'x = 2', false), (@q, 'x = 1/2', false);

-- 40
SET @q = (SELECT id_question FROM question WHERE topic_id = @t10 AND statement LIKE 'Um emprestimo de R$50.000 e pago em 24 prestacoes mensais iguais a 3% de juros compostos. Calcule o valor da prestacao.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'P = 50000 * (0,03 * 1,03^24) / (1,03^24 - 1) ≈ 50000 * 0,0604 ≈ 3020');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '≈ 3020', true), (@q, '≈ 2500', false), (@q, '≈ 3500', false), (@q, '≈ 2000', false), (@q, '≈ 4000', false);

-- 41
SET @q = (SELECT id_question FROM question WHERE topic_id = @t10 AND statement LIKE 'Prove por inducao que 1 + 2 + 3 + ... + n = n(n+1)/2.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Verdadeiro');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Verdadeiro', true), (@q, 'Falso', false), (@q, 'n(n-1)/2', false), (@q, '(n+1)(n+2)/2', false), (@q, 'n²/2', false);

-- 42
SET @q = (SELECT id_question FROM question WHERE topic_id = @t10 AND statement LIKE 'Dois investimentos: PA crescendo R$500/mes partindo de R$5.000; PG crescendo 5%/mes partindo de R$4.000. Em que mes a PG supera a PA?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'PA: 5000+(n-1)*500; PG: 4000*1,05^(n-1); testando n=5: PA=7000, PG=4862; n=10: PA=9500, PG=6205; n=15: PA=12000, PG=7919; n=20: PA=14500, PG=10105; n=25: PA=17000, PG=12895; n=30: PA=19500, PG=16455; n=35: PA=22000, PG=21000; n=36: PA=22500, PG=22050; n=37: PA=23000, PG=23153 => supera no mês 37');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '37', true), (@q, '30', false), (@q, '40', false), (@q, '25', false), (@q, '35', false);

-- 43
SET @q = (SELECT id_question FROM question WHERE topic_id = @t10 AND statement LIKE 'Determine o numero de termos de uma PG com a1=2, razao 3 e soma 242.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'S_n = 2(3^n -1)/(3-1)=3^n -1 =242 => 3^n=243 => n=5');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '5', true), (@q, '4', false), (@q, '6', false), (@q, '3', false), (@q, '7', false);

-- 44
SET @q = (SELECT id_question FROM question WHERE topic_id = @t10 AND statement LIKE 'Prove que entre quaisquer dois termos de uma PG positiva, o produto e igual ao quadrado de qualquer meio geometrico entre eles.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Verdadeiro');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Verdadeiro', true), (@q, 'Falso', false), (@q, 'Válido apenas para meios aritméticos', false), (@q, 'Válido apenas para três termos', false), (@q, 'O produto é a média geométrica', false);

-- 45
SET @q = (SELECT id_question FROM question WHERE topic_id = @t10 AND statement LIKE 'Usando somatorio, calcule a soma 1.2 + 2.3 + 3.4 + ... + n(n+1).' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '∑ k(k+1) = ∑(k²+k) = n(n+1)(2n+1)/6 + n(n+1)/2 = n(n+1)(n+2)/3');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'n(n+1)(n+2)/3', true), (@q, 'n(n+1)/2', false), (@q, 'n(n+1)(2n+1)/6', false), (@q, 'n²(n+1)/2', false), (@q, 'n(n+1)(n+2)/6', false);

-- 46
SET @q = (SELECT id_question FROM question WHERE topic_id = @t10 AND statement LIKE 'Derive a formula do valor futuro de uma anuidade ordinaria usando PG.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'FV = P * [(1+i)^n -1]/i');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'P[(1+i)^n-1]/i', true), (@q, 'P[(1+i)^n]/i', false), (@q, 'P[(1-i)^n-1]/i', false), (@q, 'P[(1+i)^n+1]/i', false), (@q, 'P[(1+i)^n-1]', false);

-- 47
SET @q = (SELECT id_question FROM question WHERE topic_id = @t10 AND statement LIKE 'Prove que toda PG com termos positivos pode ser convertida em PA tomando o logaritmo de cada termo.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Verdadeiro');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Verdadeiro', true), (@q, 'Falso', false), (@q, 'Apenas se a1>0', false), (@q, 'Apenas se q>1', false), (@q, 'Gera uma PG', false);

-- 48
SET @q = (SELECT id_question FROM question WHERE topic_id = @t10 AND statement LIKE 'Determine para quais valores reais de r a PG de razao r tem soma finita.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '|r| < 1');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '|r| < 1', true), (@q, '|r| > 1', false), (@q, 'r = 1', false), (@q, 'r ≠ 1', false), (@q, 'r = 0', false);

-- 49
SET @q = (SELECT id_question FROM question WHERE topic_id = @t10 AND statement LIKE 'Calcule a soma 1/1.2 + 1/2.3 + 1/3.4 + ... + 1/n(n+1) e determine seu limite quando n tende ao infinito.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, '1/k(k+1) = 1/k - 1/(k+1); soma telescópica = 1 - 1/(n+1); limite = 1');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, '1', true), (@q, '0', false), (@q, '1/2', false), (@q, '2', false), (@q, '∞', false);

-- 50
SET @q = (SELECT id_question FROM question WHERE topic_id = @t10 AND statement LIKE 'Prove que se a1, a2, a3, ..., an e uma PA de termos positivos, entao a1.an = a2.a(n-1) = ... (produtos de termos equidistantes dos extremos sao iguais).' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES (@q, 'Verdadeiro');
INSERT INTO alternative (question_id, text, is_correct) VALUES (@q, 'Verdadeiro', true), (@q, 'Falso', false), (@q, 'Válido apenas para n ímpar', false), (@q, 'Válido apenas para n par', false), (@q, 'Produtos são diferentes', false);