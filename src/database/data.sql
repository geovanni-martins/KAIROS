-- dados

-- users
INSERT INTO user (name, email, senha, user_type) VALUES
                                                     ('João Silva',  'joao@email.com',   '123456', 'STUDENT'),
                                                     ('Maria Souza', 'maria@email.com',  '123456', 'STUDENT'),
                                                     ('Carlos Lima', 'carlos@email.com', '123456', 'MODERATOR'),
                                                     ('Admin Root',  'admin@email.com',  '123456', 'ADMIN');

-- students
INSERT INTO student (id_student, current_streak, bigger_streak) VALUES
                                                                    (1, 3, 10),
                                                                    (2, 0, 5);

-- moderator
INSERT INTO moderator (id_moderator, subject_owner) VALUES
    (3, 'MATH');

-- admin
INSERT INTO admin (id_admin) VALUES (4);

-- topics (sem difficulty)
INSERT INTO topic (name, subject) VALUES
                                      ('Frações',              'MATH'),
                                      ('Equações de 1º grau',  'MATH'),
                                      ('Equações de 2º grau',  'MATH'),
                                      ('Porcentagem',          'MATH'),
                                      ('Regra de Três',        'MATH'),
                                      ('Geometria Plana',      'MATH'),
                                      ('Trigonometria',        'MATH'),
                                      ('Funções',              'MATH'),
                                      ('Sistemas de Equações', 'MATH'),
                                      ('Números Inteiros',     'MATH'),
                                      ('Potenciação',          'MATH'),
                                      ('Radiciação',           'MATH'),
                                      ('MMC e MDC',            'MATH');

-- pré-requisitos
INSERT INTO topic_pre_requirements (topic_id, pre_requirement_id) VALUES
                                                                      (3,  2),
                                                                      (2,  1),
                                                                      (4,  1),
                                                                      (5,  4),
                                                                      (7,  6),
                                                                      (8,  2),
                                                                      (9,  2),
                                                                      (12, 11),
                                                                      (13, 1);

-- QUESTÕES (todas NOT_VERIFIED, com difficulty por questão)

-- FRAÇÕES (topic_id = 1)
INSERT INTO question (topic_id, statement, stats, difficulty) VALUES
                                                                  (1, 'Quanto é 1/2 + 1/4?',                   'NOT_VERIFIED', 'EASY'),
                                                                  (1, 'Simplifique 6/9.',                       'NOT_VERIFIED', 'EASY'),
                                                                  (1, 'Calcule 2/3 + 1/6.',                     'NOT_VERIFIED', 'EASY'),
                                                                  (1, 'Simplifique a fração 15/25.',            'NOT_VERIFIED', 'EASY'),
                                                                  (1, 'Quanto é 3/4 de 80?',                    'NOT_VERIFIED', 'MEDIUM'),
                                                                  (1, 'Calcule 5/6 - 1/3.',                     'NOT_VERIFIED', 'EASY'),
                                                                  (1, 'Qual fração é equivalente a 0,75?',      'NOT_VERIFIED', 'EASY'),
                                                                  (1, 'Divida 3/4 por 1/2.',                    'NOT_VERIFIED', 'MEDIUM'),
                                                                  (1, 'Calcule 2/5 × 5/8.',                     'NOT_VERIFIED', 'MEDIUM'),
                                                                  (1, 'Qual é o resultado de 7/8 - 3/8?',       'NOT_VERIFIED', 'EASY');

-- EQUAÇÕES DE 1º GRAU (topic_id = 2)
INSERT INTO question (topic_id, statement, stats, difficulty) VALUES
                                                                  (2, 'Resolva: 2x + 4 = 10.',                  'NOT_VERIFIED', 'EASY'),
                                                                  (2, 'Resolva: 3x - 6 = 9.',                   'NOT_VERIFIED', 'EASY'),
                                                                  (2, 'Resolva: x/2 + 3 = 7.',                  'NOT_VERIFIED', 'EASY'),
                                                                  (2, 'Resolva: 5x = 25.',                      'NOT_VERIFIED', 'EASY'),
                                                                  (2, 'Resolva: 2x + 7 = 15.',                  'NOT_VERIFIED', 'EASY'),
                                                                  (2, 'Resolva: 4x - 3 = 2x + 5.',              'NOT_VERIFIED', 'MEDIUM'),
                                                                  (2, 'Resolva: x + 10 = 3x - 2.',              'NOT_VERIFIED', 'MEDIUM'),
                                                                  (2, 'Resolva: 3(x - 2) = 9.',                 'NOT_VERIFIED', 'MEDIUM'),
                                                                  (2, 'Resolva: (x + 4)/2 = 5.',                'NOT_VERIFIED', 'MEDIUM');

-- EQUAÇÕES DE 2º GRAU (topic_id = 3)
INSERT INTO question (topic_id, statement, stats, difficulty) VALUES
                                                                  (3, 'Resolva: x² - 5x + 6 = 0.',              'NOT_VERIFIED', 'MEDIUM'),
                                                                  (3, 'Resolva: x² - 4 = 0.',                   'NOT_VERIFIED', 'EASY'),
                                                                  (3, 'Resolva: x² + 3x + 2 = 0.',              'NOT_VERIFIED', 'MEDIUM'),
                                                                  (3, 'Resolva: x² - 9x + 20 = 0.',             'NOT_VERIFIED', 'MEDIUM'),
                                                                  (3, 'Qual é o discriminante de x² - 6x + 9 = 0?', 'NOT_VERIFIED', 'MEDIUM'),
                                                                  (3, 'Resolva: 2x² - 8 = 0.',                  'NOT_VERIFIED', 'MEDIUM'),
                                                                  (3, 'Resolva: x² + 5x + 6 = 0.',              'NOT_VERIFIED', 'MEDIUM'),
                                                                  (3, 'Resolva: x² - 7x + 12 = 0.',             'NOT_VERIFIED', 'HARD'),
                                                                  (3, 'Qual é a raiz de x² - 4x + 4 = 0?',      'NOT_VERIFIED', 'MEDIUM');

-- PORCENTAGEM (topic_id = 4)
INSERT INTO question (topic_id, statement, stats, difficulty) VALUES
                                                                  (4, 'Quanto é 20% de 150?',                                                          'NOT_VERIFIED', 'EASY'),
                                                                  (4, 'Um produto de R$80 teve 15% de desconto. Qual o novo preço?',                   'NOT_VERIFIED', 'EASY'),
                                                                  (4, 'Um salário de R$2000 teve aumento de 10%. Qual o novo valor?',                  'NOT_VERIFIED', 'EASY'),
                                                                  (4, 'De 200 alunos, 25% foram aprovados. Quantos foram aprovados?',                  'NOT_VERIFIED', 'EASY'),
                                                                  (4, 'Quanto é 35% de 200?',                                                          'NOT_VERIFIED', 'EASY'),
                                                                  (4, 'Se 60 representa 30% de um total, qual é o total?',                             'NOT_VERIFIED', 'MEDIUM'),
                                                                  (4, 'Calcule 150% de 60.',                                                           'NOT_VERIFIED', 'MEDIUM'),
                                                                  (4, 'Um produto foi vendido por R$90 com 10% de desconto. Qual era o preço original?','NOT_VERIFIED', 'MEDIUM'),
                                                                  (4, 'Quanto é 5% de 1000?',                                                          'NOT_VERIFIED', 'EASY');

-- REGRA DE TRÊS (topic_id = 5)
INSERT INTO question (topic_id, statement, stats, difficulty) VALUES
                                                                  (5, 'Se 3 kg custam R$12, quanto custam 5 kg?',                                                   'NOT_VERIFIED', 'EASY'),
                                                                  (5, '4 operários constroem em 30 dias. Em quantos dias 6 operários fariam o mesmo?',              'NOT_VERIFIED', 'HARD'),
                                                                  (5, 'Um carro percorre 120 km em 2h. Quanto percorre em 5h?',                                     'NOT_VERIFIED', 'EASY'),
                                                                  (5, 'Escala 1:5000. Uma distância de 3 cm no mapa equivale a quantos metros?',                    'NOT_VERIFIED', 'MEDIUM'),
                                                                  (5, '8 torneiras enchem um tanque em 6h. Em quanto tempo 12 torneiras encheriam?',                'NOT_VERIFIED', 'HARD'),
                                                                  (5, 'Se 5 livros custam R$75, quanto custam 8 livros?',                                           'NOT_VERIFIED', 'EASY'),
                                                                  (5, '10 peças produzidas em 4h. Quantas peças em 10h?',                                           'NOT_VERIFIED', 'EASY'),
                                                                  (5, 'Um trem percorre 180 km em 3h. Qual sua velocidade média?',                                  'NOT_VERIFIED', 'MEDIUM');

-- GEOMETRIA PLANA (topic_id = 6)
INSERT INTO question (topic_id, statement, stats, difficulty) VALUES
                                                                  (6, 'Qual é a área de um quadrado com lado 7 cm?',                                   'NOT_VERIFIED', 'EASY'),
                                                                  (6, 'Calcule o perímetro de um retângulo de 8 cm × 5 cm.',                           'NOT_VERIFIED', 'EASY'),
                                                                  (6, 'Área de um triângulo com base 10 cm e altura 6 cm?',                            'NOT_VERIFIED', 'EASY'),
                                                                  (6, 'Área de um círculo com raio 5 cm. (π = 3,14)',                                  'NOT_VERIFIED', 'MEDIUM'),
                                                                  (6, 'Perímetro de um triângulo equilátero com lado 9 cm?',                           'NOT_VERIFIED', 'EASY'),
                                                                  (6, 'Área de um trapézio com bases 6 e 10 e altura 4?',                              'NOT_VERIFIED', 'MEDIUM'),
                                                                  (6, 'Circunferência de um círculo com diâmetro 10. (π = 3,14)',                      'NOT_VERIFIED', 'MEDIUM'),
                                                                  (6, 'A diagonal de um quadrado com lado 4 cm mede quanto? (√2 ≈ 1,41)',              'NOT_VERIFIED', 'HARD');

-- TRIGONOMETRIA (topic_id = 7)
INSERT INTO question (topic_id, statement, stats, difficulty) VALUES
                                                                  (7, 'Em um triângulo retângulo, sen(30°) = ?',                                       'NOT_VERIFIED', 'EASY'),
                                                                  (7, 'Cos(60°) = ?',                                                                  'NOT_VERIFIED', 'EASY'),
                                                                  (7, 'Se a hipotenusa é 10 e um ângulo é 30°, qual é o cateto oposto?',               'NOT_VERIFIED', 'MEDIUM'),
                                                                  (7, 'Tg(45°) = ?',                                                                   'NOT_VERIFIED', 'EASY'),
                                                                  (7, 'Qual é o valor de sen²(x) + cos²(x)?',                                          'NOT_VERIFIED', 'MEDIUM'),
                                                                  (7, 'Em um triângulo retângulo com catetos 3 e 4, qual é a hipotenusa?',              'NOT_VERIFIED', 'MEDIUM'),
                                                                  (7, 'Se sen(x) = 0,6 no 1º quadrante, qual é cos(x)?',                               'NOT_VERIFIED', 'HARD');

-- FUNÇÕES (topic_id = 8)
INSERT INTO question (topic_id, statement, stats, difficulty) VALUES
                                                                  (8, 'f(x) = 2x + 3. Qual é f(4)?',                                                  'NOT_VERIFIED', 'EASY'),
                                                                  (8, 'f(x) = x² - 1. Qual é f(3)?',                                                  'NOT_VERIFIED', 'EASY'),
                                                                  (8, 'Qual é a raiz de f(x) = 3x - 9?',                                              'NOT_VERIFIED', 'EASY'),
                                                                  (8, 'A função f(x) = -x + 5 é crescente ou decrescente?',                            'NOT_VERIFIED', 'EASY'),
                                                                  (8, 'Qual é o coeficiente angular de f(x) = 4x - 7?',                               'NOT_VERIFIED', 'MEDIUM'),
                                                                  (8, 'Para f(x) = x² + 2x + 1, qual é o vértice?',                                   'NOT_VERIFIED', 'HARD'),
                                                                  (8, 'Qual é o domínio de f(x) = 1/(x - 2)?',                                        'NOT_VERIFIED', 'HARD');

-- SISTEMAS DE EQUAÇÕES (topic_id = 9)
INSERT INTO question (topic_id, statement, stats, difficulty) VALUES
                                                                  (9, 'Resolva: x + y = 5 e x - y = 1.',                                              'NOT_VERIFIED', 'EASY'),
                                                                  (9, 'Resolva: 2x + y = 8 e x + y = 5.',                                             'NOT_VERIFIED', 'EASY'),
                                                                  (9, 'Resolva: 3x + 2y = 12 e x + y = 5.',                                           'NOT_VERIFIED', 'MEDIUM'),
                                                                  (9, 'Resolva: x + 2y = 10 e 2x + y = 8.',                                           'NOT_VERIFIED', 'MEDIUM'),
                                                                  (9, 'Se x + y = 7 e xy = 12, quais são x e y?',                                     'NOT_VERIFIED', 'HARD'),
                                                                  (9, 'Resolva: 4x - y = 6 e 2x + y = 9.',                                            'NOT_VERIFIED', 'MEDIUM'),
                                                                  (9, 'Resolva: x/2 + y = 4 e x + y/2 = 5.',                                         'NOT_VERIFIED', 'HARD');

-- NÚMEROS INTEIROS (topic_id = 10)
INSERT INTO question (topic_id, statement, stats, difficulty) VALUES
                                                                  (10, 'Quanto é (-3) × (-4)?',                                                        'NOT_VERIFIED', 'EASY'),
                                                                  (10, 'Calcule: (-8) + 5.',                                                           'NOT_VERIFIED', 'EASY'),
                                                                  (10, 'Quanto é (-2)³?',                                                              'NOT_VERIFIED', 'MEDIUM'),
                                                                  (10, 'Calcule: 15 - (-6).',                                                          'NOT_VERIFIED', 'EASY'),
                                                                  (10, 'Qual é o valor absoluto de -17?',                                              'NOT_VERIFIED', 'EASY'),
                                                                  (10, 'Quanto é (-5) × 3 + 2?',                                                       'NOT_VERIFIED', 'MEDIUM'),
                                                                  (10, 'Resolva: (-4) ÷ (-2) + 3.',                                                    'NOT_VERIFIED', 'MEDIUM');

-- POTENCIAÇÃO (topic_id = 11)
INSERT INTO question (topic_id, statement, stats, difficulty) VALUES
                                                                  (11, 'Quanto é 2⁵?',                                                                 'NOT_VERIFIED', 'EASY'),
                                                                  (11, 'Calcule 3³ × 3².',                                                             'NOT_VERIFIED', 'MEDIUM'),
                                                                  (11, 'Quanto é (2³)²?',                                                              'NOT_VERIFIED', 'MEDIUM'),
                                                                  (11, 'Calcule 5⁰.',                                                                  'NOT_VERIFIED', 'EASY'),
                                                                  (11, 'Quanto é 2⁻³?',                                                                'NOT_VERIFIED', 'HARD'),
                                                                  (11, 'Calcule (3²)³.',                                                               'NOT_VERIFIED', 'MEDIUM'),
                                                                  (11, 'Quanto é 4² + 4³?',                                                            'NOT_VERIFIED', 'EASY');

-- RADICIAÇÃO (topic_id = 12)
INSERT INTO question (topic_id, statement, stats, difficulty) VALUES
                                                                  (12, 'Quanto é √144?',                                                               'NOT_VERIFIED', 'EASY'),
                                                                  (12, 'Calcule ³√27.',                                                                'NOT_VERIFIED', 'MEDIUM'),
                                                                  (12, 'Simplifique √50.',                                                             'NOT_VERIFIED', 'MEDIUM'),
                                                                  (12, 'Quanto é √(9/16)?',                                                            'NOT_VERIFIED', 'MEDIUM'),
                                                                  (12, 'Calcule √81 + √25.',                                                           'NOT_VERIFIED', 'EASY'),
                                                                  (12, 'Quanto é ⁴√16?',                                                               'NOT_VERIFIED', 'HARD'),
                                                                  (12, 'Simplifique √48.',                                                             'NOT_VERIFIED', 'HARD');

-- MMC E MDC (topic_id = 13)
INSERT INTO question (topic_id, statement, stats, difficulty) VALUES
                                                                  (13, 'Qual é o MMC de 4 e 6?',                                                       'NOT_VERIFIED', 'EASY'),
                                                                  (13, 'Qual é o MDC de 12 e 8?',                                                      'NOT_VERIFIED', 'EASY'),
                                                                  (13, 'Qual é o MMC de 3, 4 e 6?',                                                    'NOT_VERIFIED', 'MEDIUM'),
                                                                  (13, 'Qual é o MDC de 24 e 36?',                                                     'NOT_VERIFIED', 'MEDIUM'),
                                                                  (13, 'Dois ônibus partem juntos, um a cada 15 min e outro a cada 20 min. Em quanto tempo partem juntos novamente?', 'NOT_VERIFIED', 'MEDIUM'),
                                                                  (13, 'Qual é o MDC de 45 e 30?',                                                     'NOT_VERIFIED', 'MEDIUM'),
                                                                  (13, 'Qual é o MMC de 5 e 7?',                                                       'NOT_VERIFIED', 'EASY'),
                                                                  (13, 'Qual é o MDC de 100 e 75?',                                                    'NOT_VERIFIED', 'MEDIUM'),
                                                                  (13, 'Qual é o MMC de 6 e 9?',                                                       'NOT_VERIFIED', 'EASY');

-- ============================================================
-- ALTERNATIVAS
-- ============================================================

INSERT INTO alternatives (question_id, text, is_correct) VALUES
-- Q1 (1/2 + 1/4 = 3/4)
(1,  '2/4',  false), (1,  '1/2',  false), (1,  '3/4',  true),
-- Q2 (6/9 = 2/3)
(2,  '1/3',  false), (2,  '3/6',  false), (2,  '2/3',  true),
-- Q3 (2/3 + 1/6 = 5/6)
(3,  '2/3',  false), (3,  '1/2',  false), (3,  '5/6',  true),
-- Q4 (15/25 = 3/5)
(4,  '1/3',  false), (4,  '5/9',  false), (4,  '3/5',  true),
-- Q5 (3/4 de 80 = 60)
(5,  '50',   false), (5,  '45',   false), (5,  '60',   true),
-- Q6 (5/6 - 1/3 = 1/2)
(6,  '1/3',  false), (6,  '2/3',  false), (6,  '1/2',  true),
-- Q7 (0,75 = 3/4)
(7,  '3/5',  false), (7,  '2/3',  false), (7,  '3/4',  true),
-- Q8 (3/4 ÷ 1/2 = 3/2)
(8,  '1/2',  false), (8,  '2/3',  false), (8,  '3/2',  true),
-- Q9 (2/5 × 5/8 = 1/4)
(9,  '1/2',  false), (9,  '2/5',  false), (9,  '1/4',  true),
-- Q10 (7/8 - 3/8 = 1/2)
(10, '3/8',  false), (10, '1/4',  false), (10, '1/2',  true),

-- Q11 (2x+4=10 → x=3)
(11, '2',    false), (11, '4',    false), (11, '3',    true),
-- Q12 (3x-6=9 → x=5)
(12, '3',    false), (12, '4',    false), (12, '5',    true),
-- Q13 (x/2+3=7 → x=8)
(13, '6',    false), (13, '10',   false), (13, '8',    true),
-- Q14 (5x=25 → x=5)
(14, '4',    false), (14, '6',    false), (14, '5',    true),
-- Q15 (2x+7=15 → x=4)
(15, '3',    false), (15, '5',    false), (15, '4',    true),
-- Q16 (4x-3=2x+5 → x=4)
(16, '2',    false), (16, '6',    false), (16, '4',    true),
-- Q17 (x+10=3x-2 → x=6)
(17, '4',    false), (17, '8',    false), (17, '6',    true),
-- Q18 (3(x-2)=9 → x=5)
(18, '3',    false), (18, '7',    false), (18, '5',    true),
-- Q19 ((x+4)/2=5 → x=6)
(19, '4',    false), (19, '8',    false), (19, '6',    true),

-- Q20 (x²-5x+6=0 → x=2 e x=3)
(20, 'x=1 e x=4', false), (20, 'x=2 e x=6', false), (20, 'x=2 e x=3', true),
-- Q21 (x²-4=0 → x=±2)
(21, 'x=±1', false), (21, 'x=±4', false), (21, 'x=±2', true),
-- Q22 (x²+3x+2=0 → x=-1 e x=-2)
(22, 'x=1 e x=2',  false), (22, 'x=-3 e x=1', false), (22, 'x=-1 e x=-2', true),
-- Q23 (x²-9x+20=0 → x=4 e x=5)
(23, 'x=3 e x=6',  false), (23, 'x=2 e x=7',  false), (23, 'x=4 e x=5',   true),
-- Q24 (Δ=0)
(24, 'Δ=9',  false), (24, 'Δ=3',  false), (24, 'Δ=0',  true),
-- Q25 (2x²-8=0 → x=±2)
(25, 'x=±1', false), (25, 'x=±4', false), (25, 'x=±2', true),
-- Q26 (x²+5x+6=0 → x=-2 e x=-3)
(26, 'x=2 e x=3',   false), (26, 'x=-1 e x=-6', false), (26, 'x=-2 e x=-3', true),
-- Q27 (x²-7x+12=0 → x=3 e x=4)
(27, 'x=2 e x=5',   false), (27, 'x=1 e x=6',   false), (27, 'x=3 e x=4',   true),
-- Q28 (x²-4x+4=0 → x=2)
(28, 'x=0', false), (28, 'x=4', false), (28, 'x=2', true),

-- Q29 (20% de 150 = 30)
(29, '20',   false), (29, '25',   false), (29, '30',   true),
-- Q30 (80-15% = 68)
(30, 'R$72', false), (30, 'R$70', false), (30, 'R$68', true),
-- Q31 (2000+10% = 2200)
(31, 'R$2100', false), (31, 'R$2300', false), (31, 'R$2200', true),
-- Q32 (25% de 200 = 50)
(32, '40',   false), (32, '60',   false), (32, '50',   true),
-- Q33 (35% de 200 = 70)
(33, '60',   false), (33, '75',   false), (33, '70',   true),
-- Q34 (total = 200)
(34, '150',  false), (34, '180',  false), (34, '200',  true),
-- Q35 (150% de 60 = 90)
(35, '80',   false), (35, '100',  false), (35, '90',   true),
-- Q36 (preço original = 100)
(36, 'R$95', false), (36, 'R$105', false), (36, 'R$100', true),
-- Q37 (5% de 1000 = 50)
(37, '40',   false), (37, '55',   false), (37, '50',   true),

-- Q38 (5kg = R$20)
(38, 'R$15', false), (38, 'R$18', false), (38, 'R$20', true),
-- Q39 (20 dias)
(39, '45',   false), (39, '15',   false), (39, '20',   true),
-- Q40 (300 km)
(40, '240',  false), (40, '280',  false), (40, '300',  true),
-- Q41 (150 m)
(41, '100m', false), (41, '200m', false), (41, '150m', true),
-- Q42 (4h)
(42, '3h',   false), (42, '5h',   false), (42, '4h',   true),
-- Q43 (R$120)
(43, 'R$100', false), (43, 'R$115', false), (43, 'R$120', true),
-- Q44 (25 peças)
(44, '20',   false), (44, '30',   false), (44, '25',   true),
-- Q45 (60 km/h)
(45, '45 km/h', false), (45, '90 km/h', false), (45, '60 km/h', true),

-- Q46 (49 cm²)
(46, '28',   false), (46, '42',   false), (46, '49',   true),
-- Q47 (26 cm)
(47, '40',   false), (47, '20',   false), (47, '26',   true),
-- Q48 (30 cm²)
(48, '60',   false), (48, '25',   false), (48, '30',   true),
-- Q49 (78,5 cm²)
(49, '31,4', false), (49, '62,8', false), (49, '78,5', true),
-- Q50 (27 cm)
(50, '18',   false), (50, '36',   false), (50, '27',   true),
-- Q51 (32 cm²)
(51, '24',   false), (51, '40',   false), (51, '32',   true),
-- Q52 (31,4 cm)
(52, '62,8', false), (52, '15,7', false), (52, '31,4', true),
-- Q53 (5,64 cm)
(53, '4,24', false), (53, '8',    false), (53, '5,64', true),

-- Q54 (sen 30° = 0,5)
(54, '0,25', false), (54, '0,75', false), (54, '0,5',  true),
-- Q55 (cos 60° = 0,5)
(55, '0,75', false), (55, '1',    false), (55, '0,5',  true),
-- Q56 (cateto = 5)
(56, '10',   false), (56, '8',    false), (56, '5',    true),
-- Q57 (tg 45° = 1)
(57, '0,5',  false), (57, '1,73', false), (57, '1',    true),
-- Q58 (= 1)
(58, '0',    false), (58, '2',    false), (58, '1',    true),
-- Q59 (hipotenusa = 5)
(59, '6',    false), (59, '7',    false), (59, '5',    true),
-- Q60 (cos x = 0,8)
(60, '0,6',  false), (60, '0,4',  false), (60, '0,8',  true),

-- Q61 (f(4) = 11)
(61, '8',    false), (61, '10',   false), (61, '11',   true),
-- Q62 (f(3) = 8)
(62, '6',    false), (62, '10',   false), (62, '8',    true),
-- Q63 (x = 3)
(63, '1',    false), (63, '9',    false), (63, '3',    true),
-- Q64 (decrescente)
(64, 'Crescente', false), (64, 'Constante', false), (64, 'Decrescente', true),
-- Q65 (coef angular = 4)
(65, '-7',   false), (65, '7',    false), (65, '4',    true),
-- Q66 (vértice = (-1, 0))
(66, '(0, 1)', false), (66, '(1, 0)', false), (66, '(-1, 0)', true),
-- Q67 (x ≠ 2)
(67, 'x ≠ 0', false), (67, 'todos os reais', false), (67, 'x ≠ 2', true),

-- Q68 (x=3, y=2)
(68, 'x=2, y=3', false), (68, 'x=4, y=1', false), (68, 'x=3, y=2', true),
-- Q69 (x=3, y=2)
(69, 'x=4, y=0', false), (69, 'x=2, y=4', false), (69, 'x=3, y=2', true),
-- Q70 (x=2, y=3)
(70, 'x=3, y=2', false), (70, 'x=1, y=4', false), (70, 'x=2, y=3', true),
-- Q71 (x=2, y=4)
(71, 'x=4, y=2', false), (71, 'x=3, y=3', false), (71, 'x=2, y=4', true),
-- Q72 (x=3, y=4)
(72, 'x=2, y=5', false), (72, 'x=6, y=1', false), (72, 'x=3, y=4', true),
-- Q73 (x=2,5, y=4)
(73, 'x=2, y=2', false), (73, 'x=3, y=6', false), (73, 'x=2,5, y=4', true),
-- Q74 (x=4, y=2)
(74, 'x=2, y=4', false), (74, 'x=6, y=1', false), (74, 'x=4, y=2', true),

-- Q75 (12)
(75, '-12',  false), (75, '7',    false), (75, '12',   true),
-- Q76 (-3)
(76, '3',    false), (76, '-13',  false), (76, '-3',   true),
-- Q77 (-8)
(77, '8',    false), (77, '-6',   false), (77, '-8',   true),
-- Q78 (21)
(78, '9',    false), (78, '11',   false), (78, '21',   true),
-- Q79 (17)
(79, '-17',  false), (79, '7',    false), (79, '17',   true),
-- Q80 (-13)
(80, '-17',  false), (80, '-10',  false), (80, '-13',  true),
-- Q81 (5)
(81, '1',    false), (81, '-1',   false), (81, '5',    true),

-- Q82 (32)
(82, '16',   false), (82, '64',   false), (82, '32',   true),
-- Q83 (243)
(83, '27',   false), (83, '81',   false), (83, '243',  true),
-- Q84 (64)
(84, '32',   false), (84, '128',  false), (84, '64',   true),
-- Q85 (1)
(85, '0',    false), (85, '5',    false), (85, '1',    true),
-- Q86 (1/8)
(86, '1/4',  false), (86, '-8',   false), (86, '1/8',  true),
-- Q87 (729)
(87, '81',   false), (87, '243',  false), (87, '729',  true),
-- Q88 (80)
(88, '96',   false), (88, '64',   false), (88, '80',   true),

-- Q89 (12)
(89, '11',   false), (89, '14',   false), (89, '12',   true),
-- Q90 (3)
(90, '9',    false), (90, '6',    false), (90, '3',    true),
-- Q91 (5√2)
(91, '10√2', false), (91, '2√5',  false), (91, '5√2',  true),
-- Q92 (3/4)
(92, '3/8',  false), (92, '9/4',  false), (92, '3/4',  true),
-- Q93 (14)
(93, '12',   false), (93, '16',   false), (93, '14',   true),
-- Q94 (2)
(94, '4',    false), (94, '8',    false), (94, '2',    true),
-- Q95 (4√3)
(95, '2√12', false), (95, '6√2',  false), (95, '4√3',  true),

-- Q96 (12)
(96, '6',    false), (96, '24',   false), (96, '12',   true),
-- Q97 (4)
(97, '2',    false), (97, '8',    false), (97, '4',    true),
-- Q98 (12)
(98, '6',    false), (98, '24',   false), (98, '12',   true),
-- Q99 (12)
(99, '6',    false), (99, '24',   false), (99, '12',   true),
-- Q100 (60 min)
(100, '30 min', false), (100, '45 min', false), (100, '60 min', true),
-- Q101 (15)
(101, '5',   false), (101, '30',  false), (101, '15',  true),
-- Q102 (35)
(102, '12',  false), (102, '25',  false), (102, '35',  true),
-- Q103 (25)
(103, '5',   false), (103, '50',  false), (103, '25',  true),
-- Q104 (18)
(104, '12',  false), (104, '54',  false), (104, '18',  true);
