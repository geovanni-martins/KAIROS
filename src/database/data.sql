USE kairosdb;

-- ============================================================
-- USUÁRIOS BASE (user)
-- Senha de todos: Kairos@2024  →  hash BCrypt gerado externamente
-- (em produção, o hash é gerado pelo register(); aqui usamos um
--  hash BCrypt válido de custo 12 para fins de seed/teste)
-- ============================================================

SET NAMES utf8mb4;
SET CHARACTER SET utf8mb4;
SET character_set_connection = utf8mb4;
ALTER DATABASE kairosDB CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

INSERT INTO user (name, email, password, user_type) VALUES
                                                        ('Admin Geral',       'admin@kairos.com',      '$2a$12$YNV5lQlzWfdvoG9FFfpQReDtq2GifySUvc.1Z8Rf6ARffhW2bLD3e', 'admin'),
                                                        ('Mod Matemática',    'mod.mat@kairos.com',    '$2a$12$dqrhfCN4DrbsYmkSJb3iMOw6mvierQElkinpc2TDs6BzrKNuj6Uqq', 'moderator'),
                                                        ('Mod Álgebra',       'mod.alg@kairos.com',    '$2a$12$vs9ECsl1arutlNqvg62IYOTnWz4IZV1qCZ2jNti8EeFHII1/va9GO', 'moderator'),
                                                        ('Ana Souza',         'ana.souza@email.com',   '$2a$12$6LXsjRBu8G8SQb66pbfdtutVPLQQ0LXtHIScsb/vwpLF/uA5BMvz.', 'student'),
                                                        ('Bruno Lima',        'bruno.lima@email.com',  '$2a$12$rkxnrBrK5ZxT3ZXahHifuO3WtfRPfEP/vXgeZGuagmRyPyYqGxTmG', 'student'),
                                                        ('Carla Mota',        'carla.mota@email.com',  '$2a$12$el6Nn1Z2Kt.HXXuQd2iaJOX26REBtY8U3BVMblRVBvVk2KEUMhnRK', 'student'),
                                                        ('Diego Alves',       'diego.alves@email.com', '$2a$12$ew04xrdQDAAeLBMJrrswPe3AXhRkNiwTSDV2H4t.bXAIB7o2um1Ui', 'student'),
                                                        ('Elena Ferreira',    'elena.f@email.com',     '$2a$12$Rus8Sd6Enw2gc/hQueVyR.pz/nb.5g7i3f/NeCT9lBa7OsnxKQjJq', 'student');

-- Captura os ids reais gerados pelo AUTO_INCREMENT
SET @id_admin  = (SELECT id_user FROM user WHERE email = 'admin@kairos.com');
SET @id_mod1   = (SELECT id_user FROM user WHERE email = 'mod.mat@kairos.com');
SET @id_mod2   = (SELECT id_user FROM user WHERE email = 'mod.alg@kairos.com');
SET @id_alu1   = (SELECT id_user FROM user WHERE email = 'ana.souza@email.com');
SET @id_alu2   = (SELECT id_user FROM user WHERE email = 'bruno.lima@email.com');
SET @id_alu3   = (SELECT id_user FROM user WHERE email = 'carla.mota@email.com');
SET @id_alu4   = (SELECT id_user FROM user WHERE email = 'diego.alves@email.com');
SET @id_alu5   = (SELECT id_user FROM user WHERE email = 'elena.f@email.com');

INSERT INTO admin (id_admin) VALUES (@id_admin);

INSERT INTO moderator (id_moderator, subject_owner) VALUES
                                                        (@id_mod1, 'Matemática Geral'),
                                                        (@id_mod2, 'Álgebra e Funções');

INSERT INTO student (id_student, level, xp) VALUES
                                                (@id_alu1, 3,  520),
                                                (@id_alu2, 1,   80),
                                                (@id_alu3, 5, 1340),
                                                (@id_alu4, 2,  230),
                                                (@id_alu5, 0,   10);

-- ============================================================
-- TÓPICOS (10 tópicos de Matemática)
-- Inseridos individualmente para capturar o LAST_INSERT_ID()
-- ============================================================
INSERT INTO topic (name, subject) VALUES ('Números Naturais e Operações', 'MATH');
SET @t1 = LAST_INSERT_ID();

INSERT INTO topic (name, subject) VALUES ('Frações e Números Racionais', 'MATH');
SET @t2 = LAST_INSERT_ID();

INSERT INTO topic (name, subject) VALUES ('Expressões Algébricas', 'MATH');
SET @t3 = LAST_INSERT_ID();

INSERT INTO topic (name, subject) VALUES ('Equações do 1º Grau', 'MATH');
SET @t4 = LAST_INSERT_ID();

INSERT INTO topic (name, subject) VALUES ('Equações do 2º Grau', 'MATH');
SET @t5 = LAST_INSERT_ID();

INSERT INTO topic (name, subject) VALUES ('Geometria Plana', 'MATH');
SET @t6 = LAST_INSERT_ID();

INSERT INTO topic (name, subject) VALUES ('Geometria Espacial', 'MATH');
SET @t7 = LAST_INSERT_ID();

INSERT INTO topic (name, subject) VALUES ('Trigonometria', 'MATH');
SET @t8 = LAST_INSERT_ID();

INSERT INTO topic (name, subject) VALUES ('Probabilidade e Estatística', 'MATH');
SET @t9 = LAST_INSERT_ID();

INSERT INTO topic (name, subject) VALUES ('Progressões Aritméticas e Geométricas', 'MATH');
SET @t10 = LAST_INSERT_ID();

-- Pré-requisitos entre tópicos
INSERT INTO topic_pre_requirements (topic_id, pre_requirement_id) VALUES
                                                                      (@t2,  @t1),  -- Frações exige Números Naturais
                                                                      (@t3,  @t1),  -- Álgebra exige Números Naturais
                                                                      (@t4,  @t3),  -- Eq. 1º grau exige Álgebra
                                                                      (@t5,  @t4),  -- Eq. 2º grau exige Eq. 1º grau
                                                                      (@t6,  @t1),  -- Geom. Plana exige Números Naturais
                                                                      (@t7,  @t6),  -- Geom. Espacial exige Geom. Plana
                                                                      (@t8,  @t6),  -- Trigonometria exige Geom. Plana
                                                                      (@t9,  @t2),  -- Prob/Estat exige Frações
                                                                      (@t10, @t4);  -- PA/PG exige Eq. 1º grau

-- ============================================================
-- QUESTÕES  (10 tópicos × 40 questões = 400 questões)
-- Distribuição por tópico:  14 easy | 14 medium | 12 hard
-- Stats: 'verified' para as primeiras 20 de cada tópico,
--        'not_verified' para as demais 20.
-- ============================================================

-- -------------------------------------------------------
-- TÓPICO 1 – Números Naturais e Operações (topic_id = 1)
-- -------------------------------------------------------
INSERT INTO question (topic_id, statement, stats, difficulty) VALUES
-- easy (1-14)
(@t1, 'Quanto é 345 + 278?', 'verified', 'easy'),
(@t1, 'Qual é o resultado de 1000 - 437?', 'verified', 'easy'),
(@t1, 'Calcule 24 × 5.', 'verified', 'easy'),
(@t1, 'Qual é o quociente de 144 ÷ 12?', 'verified', 'easy'),
(@t1, 'Qual é o sucessor de 999?', 'verified', 'easy'),
(@t1, 'Qual é o antecessor de 500?', 'verified', 'easy'),
(@t1, 'Escreva por extenso o número 1.025.', 'verified', 'easy'),
(@t1, 'Qual é o maior número natural com 3 algarismos?', 'verified', 'easy'),
(@t1, 'Quantas dezenas há em 370?', 'verified', 'easy'),
(@t1, 'Calcule 18² (dezoito ao quadrado).', 'verified', 'easy'),
(@t1, 'Qual é o resto da divisão de 50 por 7?', 'verified', 'easy'),
(@t1, 'O número 42 é par ou ímpar? Justifique.', 'verified', 'easy'),
(@t1, 'Qual é o MMC de 4 e 6?', 'verified', 'easy'),
(@t1, 'Qual é o MDC de 18 e 24?', 'verified', 'easy'),
-- medium (15-28)
(@t1, 'Um trem percorre 120 km por hora. Em 3 horas e 30 minutos, quantos km percorre?', 'verified', 'medium'),
(@t1, 'João tem 1.500 reais e gasta 3/5 do valor. Quanto sobra?', 'verified', 'medium'),
(@t1, 'Qual é o 5º múltiplo de 13?', 'verified', 'medium'),
(@t1, 'Um número natural dividido por 8 dá quociente 15 e resto 3. Qual é esse número?', 'verified', 'medium'),
(@t1, 'Encontre todos os divisores de 60.', 'verified', 'medium'),
(@t1, 'Uma fábrica produz 850 peças por dia. Em 22 dias úteis, quantas peças são produzidas?', 'verified', 'medium'),
(@t1, 'Calcule o MMC de 12, 18 e 30.', 'not_verified', 'medium'),
(@t1, 'Calcule o MDC de 48, 72 e 120.', 'not_verified', 'medium'),
(@t1, 'Quantos números naturais ímpares existem entre 100 e 200?', 'not_verified', 'medium'),
(@t1, 'A soma de dois números naturais consecutivos é 157. Quais são eles?', 'not_verified', 'medium'),
(@t1, 'Decompondo 360 em fatores primos, qual é o resultado?', 'not_verified', 'medium'),
(@t1, 'Uma caixa contém 1.224 laranjas. Elas serão distribuídas igualmente em 36 sacolas. Quantas laranjas ficam em cada sacola?', 'not_verified', 'medium'),
(@t1, 'Verifique se 7.896 é divisível por 4 e por 9.', 'not_verified', 'medium'),
(@t1, 'Quantos múltiplos de 7 existem entre 1 e 100?', 'not_verified', 'medium'),
-- hard (29-40)
(@t1, 'Em uma olimpíada, 480 alunos são divididos em equipes do mesmo tamanho. Qual é o maior número possível de alunos por equipe, se deve haver ao menos 5 equipes?', 'not_verified', 'hard'),
(@t1, 'Três lâmpadas piscam juntas e voltam a piscar nos intervalos de 4, 6 e 9 segundos, respectivamente. Após quantos segundos elas voltarão a piscar juntas novamente?', 'not_verified', 'hard'),
(@t1, 'Um número de 4 algarismos é tal que o algarismo das centenas é o triplo do algarismo das unidades, o algarismo dos milhares é 2 e a soma de todos os algarismos é 15. Qual é esse número?', 'not_verified', 'hard'),
(@t1, 'Quantos zeros há no final do produto 1 × 2 × 3 × ... × 25 (25 fatorial)?', 'not_verified', 'hard'),
(@t1, 'O MDC de dois números é 12 e o MMC é 360. Se um dos números é 36, qual é o outro?', 'not_verified', 'hard'),
(@t1, 'Prove que a soma de três números naturais consecutivos é sempre divisível por 3.', 'not_verified', 'hard'),
(@t1, 'Um comerciante tem fardos de 48, 60 e 72 unidades. Ele quer dividir cada fardo em pacotes iguais, sem sobras. Qual é o maior número de unidades que cada pacote pode ter?', 'not_verified', 'hard'),
(@t1, 'Determine o menor número natural que, dividido por 5, deixa resto 3; dividido por 7, deixa resto 2; e dividido por 9, deixa resto 0.', 'not_verified', 'hard'),
(@t1, 'Se n é um número natural, mostre que n(n+1) é sempre par.', 'not_verified', 'hard'),
(@t1, 'Quantos divisores positivos tem o número 2^4 × 3^2 × 5 × 7?', 'not_verified', 'hard'),
(@t1, 'Um tanque é abastecido completamente com 3.024 litros. Ele será dividido em recipientes de 12, 18 ou 24 litros. Qual é o menor número de recipientes necessário se todos devem ser do mesmo tamanho e sem sobras?', 'not_verified', 'hard'),
(@t1, 'Encontre todos os pares (a, b) de números naturais tais que MMC(a,b) = 60 e MDC(a,b) = 6.', 'not_verified', 'hard');

-- -------------------------------------------------------
-- TÓPICO 2 – Frações e Números Racionais (topic_id = 2)
-- -------------------------------------------------------
INSERT INTO question (topic_id, statement, stats, difficulty) VALUES
                                                                  (@t2, 'Simplifique a fração 18/24.', 'verified', 'easy'),
                                                                  (@t2, 'Calcule 1/2 + 1/3.', 'verified', 'easy'),
                                                                  (@t2, 'Qual fração representa 0,75?', 'verified', 'easy'),
                                                                  (@t2, 'Ordene as frações 3/4, 2/3 e 5/6 em ordem crescente.', 'verified', 'easy'),
                                                                  (@t2, 'Calcule 3/5 × 10/9.', 'verified', 'easy'),
                                                                  (@t2, 'Qual é o inverso multiplicativo de 7/3?', 'verified', 'easy'),
                                                                  (@t2, 'Converta 2,5 em fração irredutível.', 'verified', 'easy'),
                                                                  (@t2, 'Calcule 4/7 ÷ 2/7.', 'verified', 'easy'),
                                                                  (@t2, 'Uma pizza foi cortada em 8 pedaços. Pedro comeu 3 pedaços. Que fração da pizza ele comeu?', 'verified', 'easy'),
                                                                  (@t2, 'Calcule 5/6 - 1/4.', 'verified', 'easy'),
                                                                  (@t2, 'Qual é a parte inteira de 17/5?', 'verified', 'easy'),
                                                                  (@t2, 'Represente -3/4 na reta numérica descrevendo sua posição.', 'verified', 'easy'),
                                                                  (@t2, 'Verifique se 5/8 e 15/24 são frações equivalentes.', 'verified', 'easy'),
                                                                  (@t2, 'Calcule 2 2/3 + 1 1/6 (números mistos).', 'verified', 'easy'),
                                                                  (@t2, 'Ana percorreu 3/5 de km pela manhã e 7/10 de km à tarde. Qual a distância total?', 'verified', 'medium'),
                                                                  (@t2, 'Resolva: (2/3 + 1/4) × 12/7.', 'verified', 'medium'),
                                                                  (@t2, 'Um tanque cheio tem 240 litros. Abre-se uma torneira que esvazia 3/8 do tanque. Quantos litros restam?', 'verified', 'medium'),
                                                                  (@t2, 'Calcule: 5/6 ÷ (1/3 - 1/6).', 'verified', 'medium'),
                                                                  (@t2, 'Escreva 1/7 como dízima decimal (mostre o período).', 'verified', 'medium'),
                                                                  (@t2, 'Compare usando < ou >: -5/6 ___ -7/9.', 'verified', 'medium'),
                                                                  (@t2, 'Converta a dízima periódica 0,363636... em fração.', 'not_verified', 'medium'),
                                                                  (@t2, 'Um produto custa R$120,00 e tem desconto de 1/4. Qual é o preço final?', 'not_verified', 'medium'),
                                                                  (@t2, 'Calcule (3/5)² + (4/5)² e interprete geometricamente.', 'not_verified', 'medium'),
                                                                  (@t2, 'A média de três frações 1/2, 2/3 e 3/4 é qual valor?', 'not_verified', 'medium'),
                                                                  (@t2, 'Resolva: x/3 + x/4 = 7. Encontre x racional.', 'not_verified', 'medium'),
                                                                  (@t2, 'Uma herança é dividida: 1/2 para o cônjuge, 1/3 para os filhos e o restante para instituições. Que fração vai para as instituições?', 'not_verified', 'medium'),
                                                                  (@t2, 'Simplifique: (2/3 × 9/4) ÷ (3/2 - 1/3).', 'not_verified', 'medium'),
                                                                  (@t2, 'Determine o número racional n tal que 3n/4 - n/3 = 5/12.', 'not_verified', 'medium'),
                                                                  (@t2, 'Prove que entre quaisquer dois racionais distintos existe outro racional.', 'not_verified', 'hard'),
                                                                  (@t2, 'Resolva a equação com frações: (x+1)/3 - (2x-1)/5 = 1.', 'not_verified', 'hard'),
                                                                  (@t2, 'Uma torneira enche um tanque em 6 horas e outra o esvaazia em 9 horas. Abertas juntas, em quanto tempo o tanque fica cheio a partir de vazio?', 'not_verified', 'hard'),
                                                                  (@t2, 'Demonstre que a soma de dois números racionais é sempre racional.', 'not_verified', 'hard'),
                                                                  (@t2, 'Um ciclista percorre 2/5 de uma trilha no 1º dia e 3/7 do restante no 2º dia. Que fração ainda falta?', 'not_verified', 'hard'),
                                                                  (@t2, 'Encontre todos os racionais x tais que |x - 1/2| ≤ 1/3.', 'not_verified', 'hard'),
                                                                  (@t2, 'Calcule a soma da série 1/2 + 1/4 + 1/8 + ... até o 10º termo.', 'not_verified', 'hard'),
                                                                  (@t2, 'Se a/b = 2/3 e c/d = 3/4, demonstre que (a+c)/(b+d) está entre 2/3 e 3/4.', 'not_verified', 'hard'),
                                                                  (@t2, 'Resolva: (2x/3 - 1)/(x + 1/2) = 4/5, x ≠ -1/2.', 'not_verified', 'hard'),
                                                                  (@t2, 'Uma conta bancária rende 1/40 de juros mensais. Começando com R$800,00, qual o saldo após 3 meses de juros simples?', 'not_verified', 'hard'),
                                                                  (@t2, 'Prove ou refute: todo inteiro é racional, mas nem todo racional é inteiro.', 'not_verified', 'hard'),
                                                                  (@t2, 'Dado que x é racional e √2 é irracional, mostre que x + √2 é irracional.', 'not_verified', 'hard');

-- -------------------------------------------------------
-- TÓPICO 3 – Expressões Algébricas (topic_id = 3)
-- -------------------------------------------------------
INSERT INTO question (topic_id, statement, stats, difficulty) VALUES
                                                                  (@t3, 'Calcule o valor da expressão 3x + 2 para x = 4.', 'verified', 'easy'),
                                                                  (@t3, 'Simplifique: 5a + 3b - 2a + b.', 'verified', 'easy'),
                                                                  (@t3, 'Identifique os termos semelhantes em: 4x² + 3x - x² + 2x.', 'verified', 'easy'),
                                                                  (@t3, 'Expanda: 2(x + 3).', 'verified', 'easy'),
                                                                  (@t3, 'Qual é o grau do monômio 5x³y²?', 'verified', 'easy'),
                                                                  (@t3, 'Calcule 2a² - 3a + 1 para a = -1.', 'verified', 'easy'),
                                                                  (@t3, 'Some os polinômios (3x + 2) e (x - 5).', 'verified', 'easy'),
                                                                  (@t3, 'Multiplique: 3x × 4x².', 'verified', 'easy'),
                                                                  (@t3, 'Subtraia: (5x² + 3x - 1) - (2x² - x + 4).', 'verified', 'easy'),
                                                                  (@t3, 'Qual é o coeficiente de x² em 7x³ - 4x² + x - 9?', 'verified', 'easy'),
                                                                  (@t3, 'Fatore o monômio: 12ab + 18a.', 'verified', 'easy'),
                                                                  (@t3, 'Expanda usando produto notável: (x + 5)².', 'verified', 'easy'),
                                                                  (@t3, 'Expanda: (x - 3)(x + 3).', 'verified', 'easy'),
                                                                  (@t3, 'Para quais valores de x a expressão x² - 4 é igual a zero?', 'verified', 'easy'),
                                                                  (@t3, 'Simplifique: (x² - 9) / (x + 3), x ≠ -3.', 'verified', 'medium'),
                                                                  (@t3, 'Expanda e simplifique: (2x - 1)² - (2x + 1)².', 'verified', 'medium'),
                                                                  (@t3, 'Fatorize completamente: x² + 5x + 6.', 'verified', 'medium'),
                                                                  (@t3, 'Calcule o valor numérico de x³ - 2x² + x - 3 para x = 2.', 'verified', 'medium'),
                                                                  (@t3, 'Divida o polinômio (x² + 3x + 2) por (x + 1).', 'verified', 'medium'),
                                                                  (@t3, 'Fatorize usando agrupamento: ax + ay + bx + by.', 'verified', 'medium'),
                                                                  (@t3, 'Simplifique: (2x² + 6x) / (4x), x ≠ 0.', 'not_verified', 'medium'),
                                                                  (@t3, 'Demonstre que (a + b)² - (a - b)² = 4ab.', 'not_verified', 'medium'),
                                                                  (@t3, 'Fatorize: 4x² - 12x + 9.', 'not_verified', 'medium'),
                                                                  (@t3, 'Desenvolva (x + y + z)² como soma de termos.', 'not_verified', 'medium'),
                                                                  (@t3, 'Para x = √2 - 1, calcule x² + 2x.', 'not_verified', 'medium'),
                                                                  (@t3, 'Simplifique a fração algébrica: (x² - x - 6) / (x² - 4).', 'not_verified', 'medium'),
                                                                  (@t3, 'Fatorize completamente: 2x³ - 8x.', 'not_verified', 'medium'),
                                                                  (@t3, 'Encontre o resto da divisão de P(x) = x³ - 4x + 1 por (x - 2) usando o Teorema do Resto.', 'not_verified', 'medium'),
                                                                  (@t3, 'Demonstre o Teorema do Binômio para n = 3.', 'not_verified', 'hard'),
                                                                  (@t3, 'Fatorize completamente: x⁴ - 16.', 'not_verified', 'hard'),
                                                                  (@t3, 'Determine os valores de k para que x² + kx + 16 seja um quadrado perfeito.', 'not_verified', 'hard'),
                                                                  (@t3, 'Simplifique: [(x+y)² - (x-y)²] / [2(x+y)(x-y)].', 'not_verified', 'hard'),
                                                                  (@t3, 'Se P(x) = x³ + ax² + bx - 4 tem raízes x=1 e x=2, determine a e b.', 'not_verified', 'hard'),
                                                                  (@t3, 'Prove que n² - n é sempre par para qualquer inteiro n.', 'not_verified', 'hard'),
                                                                  (@t3, 'Dado que a + b = 5 e ab = 3, calcule a³ + b³.', 'not_verified', 'hard'),
                                                                  (@t3, 'Fatorize: x⁶ - y⁶.', 'not_verified', 'hard'),
                                                                  (@t3, 'Determine os zeros reais de P(x) = 6x³ - 11x² - 4x + 4.', 'not_verified', 'hard'),
                                                                  (@t3, 'Simplifique: (a² - b²)/(a - b) + (a³ - b³)/(a² - b²).', 'not_verified', 'hard'),
                                                                  (@t3, 'Se P(x) é divisível por (x - r), mostre que P(r) = 0.', 'not_verified', 'hard'),
                                                                  (@t3, 'Determine todos os inteiros n para os quais n² + n + 1 é divisível por 3.', 'not_verified', 'hard');

-- -------------------------------------------------------
-- TÓPICO 4 – Equações do 1º Grau (topic_id = 4)
-- -------------------------------------------------------
INSERT INTO question (topic_id, statement, stats, difficulty) VALUES
                                                                  (@t4, 'Resolva: x + 5 = 12.', 'verified', 'easy'),
                                                                  (@t4, 'Resolva: 3x = 21.', 'verified', 'easy'),
                                                                  (@t4, 'Resolva: 2x - 4 = 10.', 'verified', 'easy'),
                                                                  (@t4, 'Resolva: x/3 = 7.', 'verified', 'easy'),
                                                                  (@t4, 'Encontre x: 4x + 1 = 2x + 9.', 'verified', 'easy'),
                                                                  (@t4, 'Resolva: 5 - x = 3.', 'verified', 'easy'),
                                                                  (@t4, 'Resolva: -3x = 15.', 'verified', 'easy'),
                                                                  (@t4, 'A soma de um número com 8 é 23. Qual é o número?', 'verified', 'easy'),
                                                                  (@t4, 'Resolva: 2(x + 3) = 14.', 'verified', 'easy'),
                                                                  (@t4, 'Resolva: x/2 + 1 = 4.', 'verified', 'easy'),
                                                                  (@t4, 'Verifique se x = 3 é solução de 5x - 2 = 13.', 'verified', 'easy'),
                                                                  (@t4, 'A idade de Luís é o dobro da de Bia. A soma das idades é 36. Qual é a idade de cada um?', 'verified', 'easy'),
                                                                  (@t4, 'Resolva: 7x - 3 = 4x + 9.', 'verified', 'easy'),
                                                                  (@t4, 'Resolva: -(x - 2) = 5.', 'verified', 'easy'),
                                                                  (@t4, 'Resolva: (x + 1)/2 = (2x - 3)/5.', 'verified', 'medium'),
                                                                  (@t4, 'Um fazendeiro tem galinhas e coelhos totalizando 30 cabeças e 82 patas. Quantos de cada?', 'verified', 'medium'),
                                                                  (@t4, 'Resolva a inequação: 3x - 5 < 7, e represente na reta.', 'verified', 'medium'),
                                                                  (@t4, 'Resolva o sistema: { x + y = 10 ; x - y = 4 }.', 'verified', 'medium'),
                                                                  (@t4, 'Dois trens partem em sentidos opostos: um a 80 km/h e outro a 100 km/h. Em quanto tempo estarão a 540 km de distância?', 'verified', 'medium'),
                                                                  (@t4, 'Resolva: 2(x - 3) + 3(x + 1) = 5x - 3.', 'verified', 'medium'),
                                                                  (@t4, 'Para quais valores de a a equação ax = 6 não tem solução?', 'not_verified', 'medium'),
                                                                  (@t4, 'Um produto sofre dois aumentos sucessivos de 20% e 10%. Qual o percentual total de aumento?', 'not_verified', 'medium'),
                                                                  (@t4, 'Resolva: |2x - 3| = 7.', 'not_verified', 'medium'),
                                                                  (@t4, 'Dois sócios dividem R$ 8.400,00 na proporção 2:5. Quanto recebe cada um?', 'not_verified', 'medium'),
                                                                  (@t4, 'Resolva o sistema por substituição: { 3x + y = 11 ; x - 2y = 0 }.', 'not_verified', 'medium'),
                                                                  (@t4, 'Resolva: (3x+1)/4 - (x-2)/3 = 1/2.', 'not_verified', 'medium'),
                                                                  (@t4, 'A que temperatura a escala Celsius e Fahrenheit mostram o mesmo valor? (F = 9C/5 + 32)', 'not_verified', 'medium'),
                                                                  (@t4, 'Resolva: |x - 2| + |x + 1| = 5.', 'not_verified', 'medium'),
                                                                  (@t4, 'Resolva o sistema 3×3: { x+y+z=6 ; 2x-y+z=3 ; x+2y-z=4 }.', 'not_verified', 'hard'),
                                                                  (@t4, 'Um capital rende juros simples de 2% ao mês. Em quantos meses um capital de R$5.000 se tornará R$6.200?', 'not_verified', 'hard'),
                                                                  (@t4, 'Prove que a equação ax + b = 0 tem exatamente uma solução se e somente se a ≠ 0.', 'not_verified', 'hard'),
                                                                  (@t4, 'Resolva e analise: (x-1)/(x+1) + 2/(x-1) = 4/(x²-1), x≠±1.', 'not_verified', 'hard'),
                                                                  (@t4, 'Uma torneira A enche um tanque em 4 h; B em 6 h; C o esvazia em 8 h. Abertas juntas a partir de tanque vazio, quando ele fica cheio?', 'not_verified', 'hard'),
                                                                  (@t4, 'Encontre todos os inteiros x tais que 3x ≡ 2 (mod 5).', 'not_verified', 'hard'),
                                                                  (@t4, 'Dois carros, A e B, estão a 420 km de distância e se aproximam. A vai a 90 km/h e sai 30 min depois de B, que vai a 80 km/h. Onde se encontram?', 'not_verified', 'hard'),
                                                                  (@t4, 'Mostre que se a ≠ 0, a inequação ax > b tem solução {x > b/a} se a > 0, e {x < b/a} se a < 0.', 'not_verified', 'hard'),
                                                                  (@t4, 'Resolva o sistema { 2x + 3y = 7 ; 4x + 6y = 14 } e classifique-o.', 'not_verified', 'hard'),
                                                                  (@t4, 'Um trem de 200 m viaja a 72 km/h. Em quanto tempo ele atravessa um túnel de 1.300 m?', 'not_verified', 'hard'),
                                                                  (@t4, 'Resolva: ⌊x⌋ + x = 3,5, onde ⌊x⌋ é a parte inteira de x.', 'not_verified', 'hard'),
                                                                  (@t4, 'Determine todos os reais x tais que |3x - 1| ≤ |x + 5|.', 'not_verified', 'hard');

-- -------------------------------------------------------
-- TÓPICO 5 – Equações do 2º Grau (topic_id = 5)
-- -------------------------------------------------------
INSERT INTO question (topic_id, statement, stats, difficulty) VALUES
                                                                  (@t5, 'Resolva: x² - 4 = 0.', 'verified', 'easy'),
                                                                  (@t5, 'Calcule o discriminante (Δ) de x² - 5x + 6 = 0.', 'verified', 'easy'),
                                                                  (@t5, 'Resolva: x² + 2x + 1 = 0.', 'verified', 'easy'),
                                                                  (@t5, 'Resolva: 2x² - 8 = 0.', 'verified', 'easy'),
                                                                  (@t5, 'Determine as raízes de x² - 3x = 0.', 'verified', 'easy'),
                                                                  (@t5, 'Para que valores de k a equação x² - kx + 9 = 0 tem raízes reais iguais?', 'verified', 'easy'),
                                                                  (@t5, 'Resolva: x² - 7x + 12 = 0.', 'verified', 'easy'),
                                                                  (@t5, 'Identifique os coeficientes a, b, c em 5x² + 3x - 2 = 0.', 'verified', 'easy'),
                                                                  (@t5, 'Resolva por fatoração: x² - x - 6 = 0.', 'verified', 'easy'),
                                                                  (@t5, 'Classifique o discriminante de x² + x + 1 = 0.', 'verified', 'easy'),
                                                                  (@t5, 'Determine a soma e o produto das raízes de 3x² - 5x + 2 = 0 pelas relações de Girard.', 'verified', 'easy'),
                                                                  (@t5, 'Resolva por completação de quadrados: x² - 6x + 5 = 0.', 'verified', 'easy'),
                                                                  (@t5, 'Escreva uma equação do 2º grau cujas raízes são 3 e -5.', 'verified', 'easy'),
                                                                  (@t5, 'Resolva: (x - 2)² = 9.', 'verified', 'easy'),
                                                                  (@t5, 'A área de um retângulo é 84 cm² e o comprimento excede a largura em 5 cm. Encontre as dimensões.', 'verified', 'medium'),
                                                                  (@t5, 'Resolva: x² - 4x + 4 = (x-2)(x+3).', 'verified', 'medium'),
                                                                  (@t5, 'Para que valores de k a equação x² - 2kx + k + 2 = 0 tem raízes positivas?', 'verified', 'medium'),
                                                                  (@t5, 'Resolva a inequação: x² - 5x + 4 ≤ 0.', 'verified', 'medium'),
                                                                  (@t5, 'Determine o vértice da parábola y = x² - 4x + 3.', 'verified', 'medium'),
                                                                  (@t5, 'Um objeto é lançado verticalmente e sua altura é h(t) = -5t² + 20t. Quando atinge a altura máxima?', 'verified', 'medium'),
                                                                  (@t5, 'Resolva o sistema: { x + y = 5 ; x² + y² = 13 }.', 'not_verified', 'medium'),
                                                                  (@t5, 'Resolva: |x² - 4| = 5.', 'not_verified', 'medium'),
                                                                  (@t5, 'Um número positivo é tal que o dobro de seu quadrado menos 5 vezes ele vale 12. Qual é o número?', 'not_verified', 'medium'),
                                                                  (@t5, 'Escreva a equação cuja soma de raízes é -3 e produto é -10.', 'not_verified', 'medium'),
                                                                  (@t5, 'Resolva: 3x² - 5x + 1 = 0 (deixe as raízes em forma de fração exata).', 'not_verified', 'medium'),
                                                                  (@t5, 'Resolva a inequação: 2x² + x - 3 > 0.', 'not_verified', 'medium'),
                                                                  (@t5, 'Determine para quais k o sistema { y = x² ; y = kx + 2 } tem dois pontos de interseção.', 'not_verified', 'medium'),
                                                                  (@t5, 'A soma dos quadrados de dois números consecutivos é 85. Quais são eles?', 'not_verified', 'medium'),
                                                                  (@t5, 'Prove que se r₁ e r₂ são raízes de ax²+bx+c=0, então a(x-r₁)(x-r₂) = ax²+bx+c.', 'not_verified', 'hard'),
                                                                  (@t5, 'Determine os valores reais de m para que x⁴ - mx² + 1 = 0 tenha 4 raízes reais distintas.', 'not_verified', 'hard'),
                                                                  (@t5, 'Resolva o sistema: { x² + y² = 25 ; x² - y² = 7 }.', 'not_verified', 'hard'),
                                                                  (@t5, 'Mostre que para a>0, a equação ax²+bx+c=0 tem raízes reais se e somente se b²≥4ac.', 'not_verified', 'hard'),
                                                                  (@t5, 'Determine todos os reais k para que x² + kx + k > 0 para todo x real.', 'not_verified', 'hard'),
                                                                  (@t5, 'Resolva a equação biquadrada: x⁴ - 13x² + 36 = 0.', 'not_verified', 'hard'),
                                                                  (@t5, 'Um foguete tem altura h(t) = -4,9t² + 49t + 5. Qual é o tempo de voo completo?', 'not_verified', 'hard'),
                                                                  (@t5, 'Para quais k a equação x² + (k-1)x + k² - 4 = 0 tem raízes de sinais opostos?', 'not_verified', 'hard'),
                                                                  (@t5, 'Resolva: (x² - 5x + 4)/(x - 2) = x - 3, x ≠ 2.', 'not_verified', 'hard'),
                                                                  (@t5, 'Determine o maior valor de k inteiro para que x² - kx + (k² - 5) = 0 tenha raízes reais.', 'not_verified', 'hard'),
                                                                  (@t5, 'Prove que se a,b,c são reais e Δ<0, a expressão ax²+bx+c tem o mesmo sinal de a para todo x real.', 'not_verified', 'hard');

-- -------------------------------------------------------
-- TÓPICO 6 – Geometria Plana (topic_id = 6)
-- -------------------------------------------------------
INSERT INTO question (topic_id, statement, stats, difficulty) VALUES
                                                                  (@t6, 'Calcule a área de um retângulo de 8 cm por 5 cm.', 'verified', 'easy'),
                                                                  (@t6, 'Qual é o perímetro de um quadrado de lado 7 cm?', 'verified', 'easy'),
                                                                  (@t6, 'Calcule a área de um triângulo de base 10 cm e altura 6 cm.', 'verified', 'easy'),
                                                                  (@t6, 'Qual é a área de um círculo de raio 4 cm? (use π ≈ 3,14)', 'verified', 'easy'),
                                                                  (@t6, 'Quantos graus tem a soma dos ângulos internos de um pentágono?', 'verified', 'easy'),
                                                                  (@t6, 'Um ângulo mede 65°. Qual é o seu complemento?', 'verified', 'easy'),
                                                                  (@t6, 'Dois ângulos suplementares somam 180°. Um deles mede 110°. Qual é o outro?', 'verified', 'easy'),
                                                                  (@t6, 'Calcule a hipotenusa de um triângulo retângulo com catetos 3 e 4.', 'verified', 'easy'),
                                                                  (@t6, 'Qual é o perímetro de um círculo de diâmetro 10 cm?', 'verified', 'easy'),
                                                                  (@t6, 'Defina o que é um quadrilátero e dê dois exemplos.', 'verified', 'easy'),
                                                                  (@t6, 'Classifique os triângulos quanto aos lados.', 'verified', 'easy'),
                                                                  (@t6, 'Calcule a área de um trapézio com bases 8 e 12 cm e altura 5 cm.', 'verified', 'easy'),
                                                                  (@t6, 'Quantos eixos de simetria tem um quadrado?', 'verified', 'easy'),
                                                                  (@t6, 'Um ângulo é o triplo do seu complemento. Qual é o valor desse ângulo?', 'verified', 'easy'),
                                                                  (@t6, 'Calcule a área do setor circular com raio 6 cm e ângulo central de 90°.', 'verified', 'medium'),
                                                                  (@t6, 'Dois triângulos semelhantes têm lados de 3,4,5 e 6,8,10. Qual é a razão de semelhança?', 'verified', 'medium'),
                                                                  (@t6, 'Um paralelogramo tem base 12 cm e altura 7 cm. Qual é a sua área?', 'verified', 'medium'),
                                                                  (@t6, 'Prove que a soma dos ângulos internos de qualquer triângulo é 180°.', 'verified', 'medium'),
                                                                  (@t6, 'Calcule a diagonal de um retângulo de lados 5 cm e 12 cm.', 'verified', 'medium'),
                                                                  (@t6, 'Usando o Teorema de Tales, calcule x se os segmentos paralelos dividem as retas em 3, 5 e x, 8.', 'verified', 'medium'),
                                                                  (@t6, 'Calcule a área da região sombreada entre dois círculos concêntricos de raios 5 e 3 cm.', 'not_verified', 'medium'),
                                                                  (@t6, 'Dados dois triângulos com ângulos iguais, prove que eles são semelhantes.', 'not_verified', 'medium'),
                                                                  (@t6, 'Um hexágono regular tem lado 4 cm. Calcule sua área e perímetro.', 'not_verified', 'medium'),
                                                                  (@t6, 'Um losango tem diagonais de 10 cm e 24 cm. Calcule sua área e o lado.', 'not_verified', 'medium'),
                                                                  (@t6, 'Calcule o ângulo central de um polígono regular de 12 lados.', 'not_verified', 'medium'),
                                                                  (@t6, 'Prove que em qualquer triângulo, o quadrado do maior lado é menor que a soma dos quadrados dos outros dois em triângulos acutângulos.', 'not_verified', 'medium'),
                                                                  (@t6, 'Calcule a área de um triângulo com lados 5, 7 e 8 cm usando a fórmula de Heron.', 'not_verified', 'medium'),
                                                                  (@t6, 'Quantas diagonais tem um polígono convexo de n lados? Prove a fórmula.', 'not_verified', 'medium'),
                                                                  (@t6, 'Demonstre o Teorema de Pitágoras usando triângulos semelhantes.', 'not_verified', 'hard'),
                                                                  (@t6, 'Calcule a área máxima de um retângulo inscrito em um círculo de raio R.', 'not_verified', 'hard'),
                                                                  (@t6, 'Prove que a área de um triângulo equilátero de lado a é (a²√3)/4.', 'not_verified', 'hard'),
                                                                  (@t6, 'Um polígono regular de n lados é inscrito num círculo de raio R. Derive a fórmula de sua área.', 'not_verified', 'hard'),
                                                                  (@t6, 'Demonstre que todo ângulo inscrito numa semicircunferência é reto.', 'not_verified', 'hard'),
                                                                  (@t6, 'Quatro quadrados iguais de lado 2 cm formam uma figura L. Qual é o perímetro total?', 'not_verified', 'hard'),
                                                                  (@t6, 'Prove que a soma dos ângulos externos de qualquer polígono convexo é 360°.', 'not_verified', 'hard'),
                                                                  (@t6, 'Um triângulo tem ângulos em progressão aritmética. Prove que um deles é necessariamente 60°.', 'not_verified', 'hard'),
                                                                  (@t6, 'Determine o raio do círculo inscrito em um triângulo de lados 3, 4 e 5.', 'not_verified', 'hard'),
                                                                  (@t6, 'Prove o Teorema de Ptolomeu: em um quadrilátero cíclico, o produto das diagonais é igual à soma dos produtos dos lados opostos.', 'not_verified', 'hard'),
                                                                  (@t6, 'Calcule a área de um polígono com vértices (0,0),(4,0),(4,3),(2,5),(0,3) usando a fórmula de Gauss.', 'not_verified', 'hard'),
                                                                  (@t6, 'Demonstre que os três medianos de um triângulo são concorrentes e se intersectam a 2/3 de cada vértice.', 'not_verified', 'hard');

-- -------------------------------------------------------
-- TÓPICO 7 – Geometria Espacial (topic_id = 7)
-- -------------------------------------------------------
INSERT INTO question (topic_id, statement, stats, difficulty) VALUES
                                                                  (@t7, 'Calcule o volume de um cubo de aresta 3 cm.', 'verified', 'easy'),
                                                                  (@t7, 'Qual é a área total de um cubo de aresta 5 cm?', 'verified', 'easy'),
                                                                  (@t7, 'Calcule o volume de um paralelepípedo 4 cm × 3 cm × 6 cm.', 'verified', 'easy'),
                                                                  (@t7, 'Qual é o volume de uma esfera de raio 6 cm? (use π ≈ 3,14)', 'verified', 'easy'),
                                                                  (@t7, 'Quantos vértices, arestas e faces tem um cubo?', 'verified', 'easy'),
                                                                  (@t7, 'Calcule a área lateral de um cilindro de raio 3 cm e altura 10 cm.', 'verified', 'easy'),
                                                                  (@t7, 'Um cone tem raio 4 cm e altura 3 cm. Calcule sua geratriz.', 'verified', 'easy'),
                                                                  (@t7, 'Qual a diferença entre prisma e pirâmide?', 'verified', 'easy'),
                                                                  (@t7, 'Verifique a relação de Euler para um tetraedro: V - A + F = 2.', 'verified', 'easy'),
                                                                  (@t7, 'Calcule o volume de um cone de raio 6 cm e altura 8 cm.', 'verified', 'easy'),
                                                                  (@t7, 'Um cilindro de raio 4 cm e altura 9 cm é cheio de água. Qual é o volume de água?', 'verified', 'easy'),
                                                                  (@t7, 'Classifique os poliedros convexos regulares (sólidos platônicos).', 'verified', 'easy'),
                                                                  (@t7, 'Calcule a área da superfície de uma esfera de raio 5 cm.', 'verified', 'easy'),
                                                                  (@t7, 'Defina planificação de um sólido geométrico e dê um exemplo.', 'verified', 'easy'),
                                                                  (@t7, 'Calcule o volume de uma pirâmide de base quadrada de lado 6 cm e altura 4 cm.', 'verified', 'medium'),
                                                                  (@t7, 'Um cilindro e um cone têm a mesma base e altura. Qual é a razão entre seus volumes?', 'verified', 'medium'),
                                                                  (@t7, 'Calcule a área total de um cone de raio 5 cm e geratriz 13 cm.', 'verified', 'medium'),
                                                                  (@t7, 'Dois cubos têm arestas na razão 2:3. Qual é a razão entre seus volumes?', 'verified', 'medium'),
                                                                  (@t7, 'Calcule o volume de um tronco de cone de raios 3 e 6 cm e altura 4 cm.', 'verified', 'medium'),
                                                                  (@t7, 'Uma esfera está inscrita em um cubo de aresta 10 cm. Qual é a razão entre o volume da esfera e do cubo?', 'verified', 'medium'),
                                                                  (@t7, 'Calcule o volume do sólido gerado pela rotação do triângulo retângulo de catetos 3 e 4 cm em torno do cateto maior.', 'not_verified', 'medium'),
                                                                  (@t7, 'Prove que o volume de uma pirâmide é 1/3 da área da base vezes a altura.', 'not_verified', 'medium'),
                                                                  (@t7, 'Dois sólidos semelhantes têm razão de semelhança k. Qual é a razão entre seus volumes?', 'not_verified', 'medium'),
                                                                  (@t7, 'Calcule a diagonal do espaço de um paralelepípedo 3 × 4 × 12 cm.', 'not_verified', 'medium'),
                                                                  (@t7, 'Um aquário cilíndrico de raio 30 cm e altura 50 cm está 80% cheio. Qual o volume de água?', 'not_verified', 'medium'),
                                                                  (@t7, 'Calcule o volume e a área total de um prisma hexagonal regular de lado 4 cm e altura 10 cm.', 'not_verified', 'medium'),
                                                                  (@t7, 'Determine o raio de uma esfera cujo volume numérico igual à sua área de superfície.', 'not_verified', 'medium'),
                                                                  (@t7, 'Uma pirâmide de base quadrada de lado 8 cm tem faces laterais equiláteras. Calcule sua altura e volume.', 'not_verified', 'medium'),
                                                                  (@t7, 'Derive a fórmula da área de superfície de uma esfera integrando fatias circulares.', 'not_verified', 'hard'),
                                                                  (@t7, 'Prove que entre todos os sólidos de mesma área de superfície, a esfera tem o maior volume.', 'not_verified', 'hard'),
                                                                  (@t7, 'Calcule o volume da região de interseção de dois cilindros ortogonais de mesmo raio R.', 'not_verified', 'hard'),
                                                                  (@t7, 'Determine o volume de um sólido de revolução gerado pela região entre y=x² e y=x, rotacionada em torno do eixo x.', 'not_verified', 'hard'),
                                                                  (@t7, 'Um icosaedro tem aresta a. Derive a fórmula de seu volume.', 'not_verified', 'hard'),
                                                                  (@t7, 'Prove a relação de Euler V - A + F = 2 para qualquer poliedro convexo.', 'not_verified', 'hard'),
                                                                  (@t7, 'Calcule o volume de um elipsoide de semi-eixos a=3, b=4, c=5.', 'not_verified', 'hard'),
                                                                  (@t7, 'Determine a distância entre duas retas reversas no espaço a partir de vetores diretores e pontos.', 'not_verified', 'hard'),
                                                                  (@t7, 'Um cone é inscrito numa esfera de raio R. Determine as dimensões do cone de maior volume possível.', 'not_verified', 'hard'),
                                                                  (@t7, 'Calcule a área da superfície do toro gerado pela rotação de um círculo de raio r a distância R do eixo (R>r).', 'not_verified', 'hard'),
                                                                  (@t7, 'Derive a fórmula de Cavalieri e aplique-a para provar que a esfera e o cilindro de mesma altura e raio têm volumes na razão 2:3.', 'not_verified', 'hard'),
                                                                  (@t7, 'Prove que todo poliedro convexo pode ser decomposto em tetraedros.', 'not_verified', 'hard');

-- -------------------------------------------------------
-- TÓPICO 8 – Trigonometria (topic_id = 8)
-- -------------------------------------------------------
INSERT INTO question (topic_id, statement, stats, difficulty) VALUES
                                                                  (@t8, 'Qual é o seno de 30°?', 'verified', 'easy'),
                                                                  (@t8, 'Qual é o cosseno de 60°?', 'verified', 'easy'),
                                                                  (@t8, 'Calcule a tangente de 45°.', 'verified', 'easy'),
                                                                  (@t8, 'Em um triângulo retângulo, o cateto oposto mede 5 cm e a hipotenusa 13 cm. Calcule sen(α).', 'verified', 'easy'),
                                                                  (@t8, 'Converta 150° para radianos.', 'verified', 'easy'),
                                                                  (@t8, 'Converta π/4 radianos para graus.', 'verified', 'easy'),
                                                                  (@t8, 'Qual é o sinal de cos(120°)?', 'verified', 'easy'),
                                                                  (@t8, 'Verifique a identidade: sen²(θ) + cos²(θ) = 1 para θ = 30°.', 'verified', 'easy'),
                                                                  (@t8, 'Um triângulo tem ângulos 30°, 60°, 90°. Quais são as relações entre seus lados?', 'verified', 'easy'),
                                                                  (@t8, 'Determine o período da função f(x) = sen(2x).', 'verified', 'easy'),
                                                                  (@t8, 'Qual é a amplitude de f(x) = 3cos(x)?', 'verified', 'easy'),
                                                                  (@t8, 'Em que quadrantes o seno é positivo?', 'verified', 'easy'),
                                                                  (@t8, 'Calcule tg(180° - θ) em termos de tg(θ).', 'verified', 'easy'),
                                                                  (@t8, 'Qual é o valor de sen(90°) + cos(0°)?', 'verified', 'easy'),
                                                                  (@t8, 'Num triângulo com lados 7, 8 e 9 cm, use a Lei dos Cossenos para encontrar o maior ângulo.', 'verified', 'medium'),
                                                                  (@t8, 'Resolva a equação: 2sen(x) - 1 = 0 para 0 ≤ x < 2π.', 'verified', 'medium'),
                                                                  (@t8, 'Prove a identidade: sen(A+B) = senA·cosB + cosA·senB.', 'verified', 'medium'),
                                                                  (@t8, 'Calcule cos(75°) usando a fórmula da adição.', 'verified', 'medium'),
                                                                  (@t8, 'Um observador a 50 m do pé de um prédio mede o ângulo de elevação do topo como 60°. Qual é a altura?', 'verified', 'medium'),
                                                                  (@t8, 'Prove a Lei dos Senos: a/senA = b/senB = c/senC.', 'verified', 'medium'),
                                                                  (@t8, 'Resolva: cos(2x) = cos(x) para 0 ≤ x ≤ 2π.', 'not_verified', 'medium'),
                                                                  (@t8, 'Determine o domínio e a imagem de f(x) = arcsen(x).', 'not_verified', 'medium'),
                                                                  (@t8, 'Prove a identidade: tg(2x) = 2tg(x) / (1 - tg²(x)).', 'not_verified', 'medium'),
                                                                  (@t8, 'Calcule a área do triângulo de lados 6, 8 e ângulo entre eles de 30°.', 'not_verified', 'medium'),
                                                                  (@t8, 'Resolva: sen(x) + cos(x) = 1 para 0 ≤ x < 2π.', 'not_verified', 'medium'),
                                                                  (@t8, 'Determine o valor de sen(15°) usando a fórmula da diferença.', 'not_verified', 'medium'),
                                                                  (@t8, 'Esboce o gráfico de f(x) = 2sen(3x - π/4), indicando amplitude, período e fase.', 'not_verified', 'medium'),
                                                                  (@t8, 'Resolva o triângulo escaleno com a=8, B=45° e C=75° (encontre os lados faltantes e o ângulo A).', 'not_verified', 'medium'),
                                                                  (@t8, 'Prove que sen(3x) = 3sen(x) - 4sen³(x).', 'not_verified', 'hard'),
                                                                  (@t8, 'Resolva a inequação: tg(x) > √3 para x ∈ [0, 2π].', 'not_verified', 'hard'),
                                                                  (@t8, 'Demonstre a fórmula do ângulo duplo cos(2x) = cos²(x) - sen²(x) a partir da adição.', 'not_verified', 'hard'),
                                                                  (@t8, 'Um navio navega 40 km em direção N30°L e depois 60 km em direção N70°O. Use vetores e Lei dos Cossenos para achar a distância ao ponto de partida.', 'not_verified', 'hard'),
                                                                  (@t8, 'Resolva: sen²(x) - 3sen(x)cos(x) + 2cos²(x) = 0.', 'not_verified', 'hard'),
                                                                  (@t8, 'Prove que a soma sen(x) + sen(3x) + sen(5x) + ... + sen((2n-1)x) = sen²(nx)/sen(x).', 'not_verified', 'hard'),
                                                                  (@t8, 'Calcule ∫₀^{π/2} sen²(x) dx usando identidade trigonométrica.', 'not_verified', 'hard'),
                                                                  (@t8, 'Determine todos os x ∈ [0, 2π] tais que sen(x) = cos(2x).', 'not_verified', 'hard'),
                                                                  (@t8, 'Prove a Lei dos Cossenos a partir do Teorema de Pitágoras e projeções.', 'not_verified', 'hard'),
                                                                  (@t8, 'Use a fórmula de Euler e^{iθ} = cos(θ) + i·sen(θ) para derivar as fórmulas de adição.', 'not_verified', 'hard'),
                                                                  (@t8, 'Resolva o sistema: { sen(x) + cos(y) = 1 ; cos(x) + sen(y) = 1 } para x,y ∈ [0, 2π].', 'not_verified', 'hard');

-- -------------------------------------------------------
-- TÓPICO 9 – Probabilidade e Estatística (topic_id = 9)
-- -------------------------------------------------------
INSERT INTO question (topic_id, statement, stats, difficulty) VALUES
                                                                  (@t9, 'Lança-se um dado. Qual é a probabilidade de sair o número 4?', 'verified', 'easy'),
                                                                  (@t9, 'Em uma turma de 30 alunos, 12 são meninas. Qual é a probabilidade de sortear uma menina?', 'verified', 'easy'),
                                                                  (@t9, 'Calcule a média dos valores: 5, 7, 9, 11, 13.', 'verified', 'easy'),
                                                                  (@t9, 'Qual é a mediana do conjunto {2, 3, 7, 10, 15}?', 'verified', 'easy'),
                                                                  (@t9, 'Qual é a moda de {4, 4, 5, 6, 6, 6, 7}?', 'verified', 'easy'),
                                                                  (@t9, 'Uma moeda é lançada 3 vezes. Qual é a probabilidade de sair cara nas 3 vezes?', 'verified', 'easy'),
                                                                  (@t9, 'Calcule a amplitude do conjunto {3, 7, 8, 14, 21}.', 'verified', 'easy'),
                                                                  (@t9, 'Descreva o espaço amostral do lançamento de dois dados.', 'verified', 'easy'),
                                                                  (@t9, 'O que é probabilidade complementar? Dê um exemplo.', 'verified', 'easy'),
                                                                  (@t9, 'Em uma urna há 5 bolas vermelhas e 3 azuis. Qual é a P de tirar azul?', 'verified', 'easy'),
                                                                  (@t9, 'Calcule a variância do conjunto {2, 4, 4, 4, 5, 5, 7, 9}.', 'verified', 'easy'),
                                                                  (@t9, 'Interprete um histograma de frequências.', 'verified', 'easy'),
                                                                  (@t9, 'Qual é a diferença entre evento simples e composto?', 'verified', 'easy'),
                                                                  (@t9, 'Uma caixa tem 4 bolas numeradas de 1 a 4. Qual é a P de tirar um número par?', 'verified', 'easy'),
                                                                  (@t9, 'Calcule a probabilidade de tirar ao menos um 6 ao lançar dois dados.', 'verified', 'medium'),
                                                                  (@t9, 'Em um experimento binomial com n=10 e p=0,3, calcule P(X=3).', 'verified', 'medium'),
                                                                  (@t9, 'Calcule o desvio padrão de {4, 7, 13, 16} e interprete.', 'verified', 'medium'),
                                                                  (@t9, 'Dois eventos A e B têm P(A)=0,5, P(B)=0,4 e P(A∩B)=0,2. São independentes?', 'verified', 'medium'),
                                                                  (@t9, 'Desenhe e interprete um boxplot para o conjunto {1,3,4,5,5,7,9,10,11,14}.', 'verified', 'medium'),
                                                                  (@t9, 'Calcule P(A|B) dado P(A∩B)=0,12 e P(B)=0,3 e interprete.', 'verified', 'medium'),
                                                                  (@t9, 'Um conjunto de 100 notas tem média 70 e desvio padrão 10. Usando o desvio empírico, quantos alunos provavelmente estão entre 60 e 80?', 'not_verified', 'medium'),
                                                                  (@t9, 'Usando o Teorema de Bayes: P(A)=0,3, P(B|A)=0,4, P(B|Aᶜ)=0,2. Calcule P(A|B).', 'not_verified', 'medium'),
                                                                  (@t9, 'Calcule a correlação de Pearson entre X={1,2,3,4,5} e Y={2,4,5,4,5}.', 'not_verified', 'medium'),
                                                                  (@t9, 'Prove que a soma de todos os P(xᵢ) numa distribuição de probabilidade discreta é 1.', 'not_verified', 'medium'),
                                                                  (@t9, 'Em um grupo de 20 pessoas, 12 falam inglês e 8 falam espanhol, e 4 falam ambos. Qual é a P de uma pessoa escolhida ao acaso falar pelo menos um dos idiomas?', 'not_verified', 'medium'),
                                                                  (@t9, 'Uma variável aleatória X tem distribuição geométrica com p=0,25. Calcule P(X≤3).', 'not_verified', 'medium'),
                                                                  (@t9, 'Determine o coeficiente de variação dos conjuntos A={10,20,30} e B={100,200,300} e compare.', 'not_verified', 'medium'),
                                                                  (@t9, 'Interprete o p-valor de 0,03 em um teste de hipóteses ao nível de significância de 5%.', 'not_verified', 'medium'),
                                                                  (@t9, 'Prove o Teorema de Bayes a partir da definição de probabilidade condicional.', 'not_verified', 'hard'),
                                                                  (@t9, 'Uma variável X tem distribuição normal com μ=50 e σ=10. Calcule P(40<X<65) usando a tabela Z.', 'not_verified', 'hard'),
                                                                  (@t9, 'Demonstre que E(aX+b) = aE(X) + b para uma variável aleatória discreta.', 'not_verified', 'hard'),
                                                                  (@t9, 'Um servidor recebe em média 3 chamadas por minuto (Poisson). Qual é P(X=5) em um minuto?', 'not_verified', 'hard'),
                                                                  (@t9, 'Construa um intervalo de confiança de 95% para a média de uma amostra de 36 valores com média 80 e desvio padrão 12.', 'not_verified', 'hard'),
                                                                  (@t9, 'Prove que Var(X) = E(X²) - [E(X)]².', 'not_verified', 'hard'),
                                                                  (@t9, 'Calcule o coeficiente de determinação R² para uma regressão linear com dados de vendas e temperatura.', 'not_verified', 'hard'),
                                                                  (@t9, 'Enuncie e prove o Teorema Central do Limite (versão informal com distribuição binomial).', 'not_verified', 'hard'),
                                                                  (@t9, 'Dois dados são lançados 180 vezes. Use a aproximação normal para calcular P(sair soma 7 entre 25 e 35 vezes).', 'not_verified', 'hard'),
                                                                  (@t9, 'Prove que a mediana minimiza a soma dos desvios absolutos, enquanto a média minimiza os quadráticos.', 'not_verified', 'hard'),
                                                                  (@t9, 'Usando a desigualdade de Chebyshev, determine o limite inferior da probabilidade de X estar dentro de 3 desvios padrões de sua média.', 'not_verified', 'hard'),
                                                                  (@t9, 'Construa e interprete uma carta de controle (control chart) para um processo com μ=50 e σ=5.', 'not_verified', 'hard');

-- -------------------------------------------------------
-- TÓPICO 10 – Progressões Aritméticas e Geométricas (topic_id = 10)
-- -------------------------------------------------------
INSERT INTO question (topic_id, statement, stats, difficulty) VALUES
                                                                  (@t10, 'Determine o 10º termo da PA (2, 5, 8, ...).', 'verified', 'easy'),
                                                                  (@t10, 'Qual é a razão da PA (-3, 1, 5, 9, ...)?', 'verified', 'easy'),
                                                                  (@t10, 'Calcule a soma dos 20 primeiros termos da PA (1, 3, 5, ...).', 'verified', 'easy'),
                                                                  (@t10, 'Determine o 6º termo da PG (2, 6, 18, ...).', 'verified', 'easy'),
                                                                  (@t10, 'Qual é a razão da PG (5, 10, 20, 40, ...)?', 'verified', 'easy'),
                                                                  (@t10, 'Quantos termos tem a PA (4, 7, 10, ..., 100)?', 'verified', 'easy'),
                                                                  (@t10, 'Três números formam uma PA. A soma deles é 21 e o maior é o dobro do menor. Determine-os.', 'verified', 'easy'),
                                                                  (@t10, 'Calcule a soma dos 8 primeiros termos da PG (1, 2, 4, ...).', 'verified', 'easy'),
                                                                  (@t10, 'Interpole 3 meios aritméticos entre 5 e 25.', 'verified', 'easy'),
                                                                  (@t10, 'Uma PG tem a₁=3 e a₄=81. Determine a razão.', 'verified', 'easy'),
                                                                  (@t10, 'A soma dos n primeiros inteiros positivos é n(n+1)/2. Calcule para n=100.', 'verified', 'easy'),
                                                                  (@t10, 'Uma PG tem a₁=2 e razão 1/2. Calcule a soma dos infinitos termos.', 'verified', 'easy'),
                                                                  (@t10, 'Interpole 2 meios geométricos entre 2 e 54.', 'verified', 'easy'),
                                                                  (@t10, 'Três termos consecutivos de uma PA têm soma 15 e produto 80. Quais são?', 'verified', 'easy'),
                                                                  (@t10, 'A soma dos n termos de uma PA é Sn = 3n² + 2n. Determine o termo geral aₙ.', 'verified', 'medium'),
                                                                  (@t10, 'Uma empresa tem lucro de R$10.000 em janeiro e cresce 5% ao mês. Qual o lucro em dezembro?', 'verified', 'medium'),
                                                                  (@t10, 'Calcule a soma 1 + 1/2 + 1/4 + 1/8 + ... (PG infinita).', 'verified', 'medium'),
                                                                  (@t10, 'Prove que se (a, b, c) é PA, então (a², b², c²) não é necessariamente PA.', 'verified', 'medium'),
                                                                  (@t10, 'Um capital de R$1.000 é aplicado a juros compostos de 10% a.a. Quanto terá após 5 anos?', 'verified', 'medium'),
                                                                  (@t10, 'Determine x para que (x, x+3, x+9) seja PG.', 'verified', 'medium'),
                                                                  (@t10, 'Prove que a soma dos termos de uma PA finita é n × (média aritmética dos extremos).', 'not_verified', 'medium'),
                                                                  (@t10, 'Uma PA tem a₁ = 5 e S₁₀ = 140. Determine a razão e o 10º termo.', 'not_verified', 'medium'),
                                                                  (@t10, 'Calcule: 1 + 2 + 4 + ... + 2¹⁰ usando a fórmula da PG.', 'not_verified', 'medium'),
                                                                  (@t10, 'Determine os valores de k para que (k-1, 3k, 5k+2) seja PA.', 'not_verified', 'medium'),
                                                                  (@t10, 'Uma bola é lançada de uma altura de 8 m e quica, sempre atingindo 3/4 da altura anterior. Qual é a distância total percorrida?', 'not_verified', 'medium'),
                                                                  (@t10, 'Numa PG positiva com razão r≠1, prove que log(aₙ) forma uma PA.', 'not_verified', 'medium'),
                                                                  (@t10, 'Calcule a soma: 3 + 6 + 9 + ... + 300.', 'not_verified', 'medium'),
                                                                  (@t10, 'Determine se a sequência aₙ = n² forma PA, PG ou nenhuma das duas.', 'not_verified', 'medium'),
                                                                  (@t10, 'Prove que a soma de n termos de uma PG de razão r≠1 é Sₙ = a₁(rⁿ-1)/(r-1).', 'not_verified', 'hard'),
                                                                  (@t10, 'A soma de uma PG infinita decrescente é 12 e a₁=4. Determine a razão e o 5º termo.', 'not_verified', 'hard'),
                                                                  (@t10, 'Prove que se os termos de uma PA são positivos, sua média geométrica é menor ou igual à média aritmética.', 'not_verified', 'hard'),
                                                                  (@t10, 'Determine todos os x reais para que (2^x, 2^{2x+1}, 2^{3x+2}) seja PA.', 'not_verified', 'hard'),
                                                                  (@t10, 'Um empréstimo de R$50.000 é pago em 24 prestações mensais iguais a 3% de juros compostos. Calcule o valor da prestação.', 'not_verified', 'hard'),
                                                                  (@t10, 'Prove por indução que 1 + 2 + 3 + ... + n = n(n+1)/2.', 'not_verified', 'hard'),
                                                                  (@t10, 'Dois investimentos: PA crescendo R$500/mês partindo de R$5.000; PG crescendo 5%/mês partindo de R$4.000. Em que mês a PG supera a PA?', 'not_verified', 'hard'),
                                                                  (@t10, 'Determine o número de termos de uma PG com a₁=2, razão 3 e soma 242.', 'not_verified', 'hard'),
                                                                  (@t10, 'Prove que entre quaisquer dois termos de uma PG positiva, o produto é igual ao quadrado de qualquer meio geométrico entre eles.', 'not_verified', 'hard'),
                                                                  (@t10, 'Usando o somatório, calcule a soma 1·2 + 2·3 + 3·4 + ... + n(n+1).', 'not_verified', 'hard'),
                                                                  (@t10, 'Derive a fórmula do valor futuro de uma anuidade ordinária usando PG.', 'not_verified', 'hard'),
                                                                  (@t10, 'Prove que toda PG com termos positivos pode ser convertida em PA tomando o logaritmo de cada termo.', 'not_verified', 'hard');

-- ============================================================
-- Múltiplas escolhas – alternativas para as primeiras 5
-- questões de cada tópico (questões easy, verified)
-- ============================================================
-- MÚLTIPLA ESCOLHA
-- Os question_id são buscados pelo enunciado para evitar dependência
-- de AUTO_INCREMENT
-- ============================================================

-- Questão 1 (tópico 1): 345 + 278 = 623
SET @q1 = (SELECT id_question FROM question WHERE statement = 'Quanto é 345 + 278?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q1, 'Somando unidades: 5+8=13, escreve 3 e vai 1. Dezenas: 4+7+1=12, escreve 2 e vai 1. Centenas: 3+2+1=6. Resultado: 623.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q1, '613', false), (@q1, '623', true), (@q1, '633', false), (@q1, '643', false);

-- Questão 2 (tópico 1): 1000 - 437 = 563
SET @q2 = (SELECT id_question FROM question WHERE statement = 'Qual é o resultado de 1000 - 437?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q2, '1000 - 437 = 563. Pode-se verificar: 437 + 563 = 1000.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q2, '543', false), (@q2, '553', false), (@q2, '563', true), (@q2, '573', false);

-- Questão 3 (tópico 1): 24 × 5 = 120
SET @q3 = (SELECT id_question FROM question WHERE statement = 'Calcule 24 × 5.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q3, '24 × 5 = 20×5 + 4×5 = 100 + 20 = 120.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q3, '110', false), (@q3, '115', false), (@q3, '120', true), (@q3, '125', false);

-- Questão 4 (tópico 1): 144 ÷ 12 = 12
SET @q4 = (SELECT id_question FROM question WHERE statement = 'Qual é o quociente de 144 ÷ 12?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q4, '144 ÷ 12 = 12, pois 12 × 12 = 144 (12 é raiz quadrada de 144).');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q4, '10', false), (@q4, '11', false), (@q4, '12', true), (@q4, '13', false);

-- Questão 5 (tópico 1): sucessor de 999 = 1000
SET @q5 = (SELECT id_question FROM question WHERE statement = 'Qual é o sucessor de 999?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q5, 'O sucessor de n é n+1. Logo, sucessor de 999 é 1000.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q5, '998', false), (@q5, '999', false), (@q5, '1000', true), (@q5, '1001', false);

-- Questão 1 do tópico 2: simplifica 18/24
SET @q42 = (SELECT id_question FROM question WHERE statement = 'Simplifique a fração 18/24.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q42, 'MDC(18,24) = 6. Dividindo: 18/6 = 3 e 24/6 = 4. Fração irredutível: 3/4.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q42, '2/3', false), (@q42, '3/4', true), (@q42, '4/6', false), (@q42, '6/8', false);

-- Questão 2 do tópico 2: 1/2 + 1/3 = 5/6
SET @q43 = (SELECT id_question FROM question WHERE statement = 'Calcule 1/2 + 1/3.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q43, 'MMC(2,3)=6. 1/2 = 3/6; 1/3 = 2/6. Soma: 5/6.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q43, '2/5', false), (@q43, '2/6', false), (@q43, '5/6', true), (@q43, '1', false);

-- Questão 3 do tópico 2: 0,75 = 3/4
SET @q44 = (SELECT id_question FROM question WHERE statement = 'Qual fração representa 0,75?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q44, '0,75 = 75/100. MDC(75,100)=25. 75/25=3; 100/25=4. Logo 3/4.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q44, '7/10', false), (@q44, '3/4', true), (@q44, '4/3', false), (@q44, '75/10', false);

-- Questão 1 do tópico 3: 3x+2 para x=4 = 14
SET @q82 = (SELECT id_question FROM question WHERE statement = 'Calcule o valor da expressão 3x + 2 para x = 4.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q82, 'Substituindo x=4: 3(4)+2 = 12+2 = 14.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q82, '10', false), (@q82, '12', false), (@q82, '14', true), (@q82, '16', false);

-- Questão 2 do tópico 3: 5a+3b-2a+b = 3a+4b
SET @q83 = (SELECT id_question FROM question WHERE statement = 'Simplifique: 5a + 3b - 2a + b.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q83, 'Termos em a: 5a - 2a = 3a. Termos em b: 3b + b = 4b. Resultado: 3a + 4b.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q83, '3a + 2b', false), (@q83, '3a + 4b', true), (@q83, '7a + 4b', false), (@q83, '3a - 4b', false);