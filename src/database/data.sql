SET NAMES utf8mb4;

-- ============================================================
-- ALTERNATIVAS FALTANTES
-- Cobre todas as questões easy/verified que ainda não têm
-- multiple_choice_question + alternative inseridas.
-- ============================================================

-- -------------------------------------------------------
-- TÓPICO 1 – Números Naturais e Operações
-- (questões 1–5 já existem; completar 6–14)
-- -------------------------------------------------------

-- Q6: antecessor de 500
SET @q = (SELECT id_question FROM question WHERE statement = 'Qual é o antecessor de 500?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'O antecessor de n é n-1. Logo, antecessor de 500 é 499.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '498', false), (@q, '499', true), (@q, '500', false), (@q, '501', false);

-- Q7: 1.025 por extenso
SET @q = (SELECT id_question FROM question WHERE statement = 'Escreva por extenso o número 1.025.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, '1.025 = 1 milhar + 0 centenas + 2 dezenas + 5 unidades = mil e vinte e cinco.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'Um mil e dois', false),
                                                            (@q, 'Mil e vinte e cinco', true),
                                                            (@q, 'Dez mil e vinte e cinco', false),
                                                            (@q, 'Mil e duzentos e cinco', false);

-- Q8: maior número natural com 3 algarismos
SET @q = (SELECT id_question FROM question WHERE statement = 'Qual é o maior número natural com 3 algarismos?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Números com 3 algarismos vão de 100 a 999. O maior é 999.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '899', false), (@q, '989', false), (@q, '999', true), (@q, '1000', false);

-- Q9: dezenas em 370
SET @q = (SELECT id_question FROM question WHERE statement = 'Quantas dezenas há em 370?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, '370 ÷ 10 = 37. Há 37 dezenas em 370.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '3', false), (@q, '7', false), (@q, '37', true), (@q, '370', false);

-- Q10: 18²
SET @q = (SELECT id_question FROM question WHERE statement = 'Calcule 18² (dezoito ao quadrado).' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, '18² = 18 × 18 = (20-2)² = 400 - 80 + 4 = 324.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '144', false), (@q, '256', false), (@q, '324', true), (@q, '360', false);

-- Q11: resto de 50 ÷ 7
SET @q = (SELECT id_question FROM question WHERE statement = 'Qual é o resto da divisão de 50 por 7?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, '7 × 7 = 49. 50 - 49 = 1. O resto é 1.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '0', false), (@q, '1', true), (@q, '2', false), (@q, '6', false);

-- Q12: 42 par ou ímpar
SET @q = (SELECT id_question FROM question WHERE statement = 'O número 42 é par ou ímpar? Justifique.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Um número é par se é divisível por 2. 42 ÷ 2 = 21, sem resto. Logo, 42 é par.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'Ímpar, pois termina em 2', false),
                                                            (@q, 'Par, pois é divisível por 2', true),
                                                            (@q, 'Par, pois é divisível por 4', false),
                                                            (@q, 'Ímpar, pois sua soma de algarismos é ímpar', false);

-- Q13: MMC de 4 e 6
SET @q = (SELECT id_question FROM question WHERE statement = 'Qual é o MMC de 4 e 6?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, '4 = 2². 6 = 2 × 3. MMC = 2² × 3 = 12.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '2', false), (@q, '6', false), (@q, '12', true), (@q, '24', false);

-- Q14: MDC de 18 e 24
SET @q = (SELECT id_question FROM question WHERE statement = 'Qual é o MDC de 18 e 24?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, '18 = 2 × 3². 24 = 2³ × 3. MDC = 2 × 3 = 6.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '2', false), (@q, '3', false), (@q, '6', true), (@q, '18', false);

-- -------------------------------------------------------
-- TÓPICO 2 – Frações e Números Racionais
-- (questões 1–3 já existem; completar 4–14)
-- -------------------------------------------------------

-- Q4: ordenar 3/4, 2/3, 5/6
SET @q = (SELECT id_question FROM question WHERE statement = 'Ordene as frações 3/4, 2/3 e 5/6 em ordem crescente.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'MMC(4,3,6)=12. 3/4=9/12; 2/3=8/12; 5/6=10/12. Ordem crescente: 2/3 < 3/4 < 5/6.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '3/4 < 2/3 < 5/6', false),
                                                            (@q, '5/6 < 3/4 < 2/3', false),
                                                            (@q, '2/3 < 3/4 < 5/6', true),
                                                            (@q, '2/3 < 5/6 < 3/4', false);

-- Q5: 3/5 × 10/9
SET @q = (SELECT id_question FROM question WHERE statement = 'Calcule 3/5 × 10/9.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, '3/5 × 10/9 = 30/45. Simplificando pelo MDC 15: 30/45 = 2/3.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '1/3', false), (@q, '2/3', true), (@q, '3/2', false), (@q, '30/45', false);

-- Q6: inverso multiplicativo de 7/3
SET @q = (SELECT id_question FROM question WHERE statement = 'Qual é o inverso multiplicativo de 7/3?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'O inverso multiplicativo de a/b é b/a. O inverso de 7/3 é 3/7, pois 7/3 × 3/7 = 1.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '7/3', false), (@q, '-7/3', false), (@q, '3/7', true), (@q, '-3/7', false);

-- Q7: converter 2,5 em fração
SET @q = (SELECT id_question FROM question WHERE statement = 'Converta 2,5 em fração irredutível.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, '2,5 = 25/10. MDC(25,10)=5. 25/5=5 e 10/5=2. Logo: 5/2.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '25/10', false), (@q, '5/2', true), (@q, '2/5', false), (@q, '10/5', false);

-- Q8: 4/7 ÷ 2/7
SET @q = (SELECT id_question FROM question WHERE statement = 'Calcule 4/7 ÷ 2/7.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, '4/7 ÷ 2/7 = 4/7 × 7/2 = 28/14 = 2.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '1/2', false), (@q, '8/49', false), (@q, '2', true), (@q, '4/14', false);

-- Q9: fração que Pedro comeu da pizza
SET @q = (SELECT id_question FROM question WHERE statement = 'Uma pizza foi cortada em 8 pedaços. Pedro comeu 3 pedaços. Que fração da pizza ele comeu?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Pedro comeu 3 de 8 pedaços iguais, portanto a fração é 3/8.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '1/3', false), (@q, '3/8', true), (@q, '5/8', false), (@q, '3/5', false);

-- Q10: 5/6 - 1/4
SET @q = (SELECT id_question FROM question WHERE statement = 'Calcule 5/6 - 1/4.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'MMC(6,4)=12. 5/6=10/12; 1/4=3/12. 10/12 - 3/12 = 7/12.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '4/2', false), (@q, '1/2', false), (@q, '7/12', true), (@q, '5/12', false);

-- Q11: parte inteira de 17/5
SET @q = (SELECT id_question FROM question WHERE statement = 'Qual é a parte inteira de 17/5?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, '17 ÷ 5 = 3 com resto 2. A parte inteira é 3.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '2', false), (@q, '3', true), (@q, '4', false), (@q, '5', false);

-- Q12: -3/4 na reta numérica
SET @q = (SELECT id_question FROM question WHERE statement = 'Represente -3/4 na reta numérica descrevendo sua posição.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, '-3/4 = -0,75. Está entre -1 e 0, a três quartos de distância do 0 em direção ao -1.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'Entre 0 e 1, a 3/4 do 0', false),
                                                            (@q, 'Entre -1 e 0, a 3/4 de distância do 0 em direção ao -1', true),
                                                            (@q, 'Exatamente em -1', false),
                                                            (@q, 'Entre -2 e -1', false);

-- Q13: frações equivalentes 5/8 e 15/24
SET @q = (SELECT id_question FROM question WHERE statement = 'Verifique se 5/8 e 15/24 são frações equivalentes.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, '15/24: MDC(15,24)=3. 15/3=5 e 24/3=8. Logo 15/24 = 5/8. São equivalentes.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'Não, pois 5 × 24 ≠ 8 × 15', false),
                                                            (@q, 'Sim, pois 15/24 simplifica para 5/8', true),
                                                            (@q, 'Não, pois os numeradores são diferentes', false),
                                                            (@q, 'Sim, mas apenas por coincidência', false);

-- Q14: 2 2/3 + 1 1/6
SET @q = (SELECT id_question FROM question WHERE statement = 'Calcule 2 2/3 + 1 1/6 (números mistos).' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, '2 2/3 = 8/3; 1 1/6 = 7/6. MMC(3,6)=6. 8/3=16/6. 16/6+7/6=23/6 = 3 5/6.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '3 1/2', false), (@q, '3 5/6', true), (@q, '4 1/6', false), (@q, '23/9', false);

-- -------------------------------------------------------
-- TÓPICO 3 – Expressões Algébricas
-- (questões 1–2 já existem; completar 3–14)
-- -------------------------------------------------------

-- Q3: termos semelhantes em 4x²+3x-x²+2x
SET @q = (SELECT id_question FROM question WHERE statement = 'Identifique os termos semelhantes em: 4x² + 3x - x² + 2x.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Termos em x²: 4x² e -x². Termos em x: 3x e 2x. Resultado simplificado: 3x² + 5x.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '4x² e 2x são semelhantes', false),
                                                            (@q, '4x² com -x², e 3x com 2x', true),
                                                            (@q, 'Não há termos semelhantes', false),
                                                            (@q, 'Apenas 3x e 2x são semelhantes', false);

-- Q4: expandir 2(x+3)
SET @q = (SELECT id_question FROM question WHERE statement = 'Expanda: 2(x + 3).' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Pela propriedade distributiva: 2·x + 2·3 = 2x + 6.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '2x + 3', false), (@q, 'x + 6', false), (@q, '2x + 6', true), (@q, '2x + 5', false);

-- Q5: grau do monômio 5x³y²
SET @q = (SELECT id_question FROM question WHERE statement = 'Qual é o grau do monômio 5x³y²?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'O grau de um monômio é a soma dos expoentes das variáveis: 3 + 2 = 5.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '2', false), (@q, '3', false), (@q, '5', true), (@q, '6', false);

-- Q6: 2a²-3a+1 para a=-1
SET @q = (SELECT id_question FROM question WHERE statement = 'Calcule 2a² - 3a + 1 para a = -1.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, '2(-1)² - 3(-1) + 1 = 2(1) + 3 + 1 = 2 + 3 + 1 = 6.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '-4', false), (@q, '0', false), (@q, '4', false), (@q, '6', true);

-- Q7: somar (3x+2) e (x-5)
SET @q = (SELECT id_question FROM question WHERE statement = 'Some os polinômios (3x + 2) e (x - 5).' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, '(3x+2) + (x-5) = 3x + x + 2 - 5 = 4x - 3.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '4x + 7', false), (@q, '4x - 3', true), (@q, '3x - 3', false), (@q, '4x + 3', false);

-- Q8: 3x × 4x²
SET @q = (SELECT id_question FROM question WHERE statement = 'Multiplique: 3x × 4x².' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, '3x × 4x² = (3×4)(x^{1+2}) = 12x³.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '7x²', false), (@q, '12x²', false), (@q, '12x³', true), (@q, '7x³', false);

-- Q9: subtrair (5x²+3x-1)-(2x²-x+4)
SET @q = (SELECT id_question FROM question WHERE statement = 'Subtraia: (5x² + 3x - 1) - (2x² - x + 4).' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, '5x²-2x² = 3x²; 3x-(-x) = 4x; -1-4 = -5. Resultado: 3x² + 4x - 5.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '3x² + 2x - 5', false),
                                                            (@q, '3x² + 4x - 5', true),
                                                            (@q, '3x² - 4x - 5', false),
                                                            (@q, '7x² + 4x - 5', false);

-- Q10: coeficiente de x² em 7x³-4x²+x-9
SET @q = (SELECT id_question FROM question WHERE statement = 'Qual é o coeficiente de x² em 7x³ - 4x² + x - 9?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'O termo com x² é -4x². O coeficiente (número que multiplica x²) é -4.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '7', false), (@q, '-9', false), (@q, '1', false), (@q, '-4', true);

-- Q11: fatorar 12ab + 18a
SET @q = (SELECT id_question FROM question WHERE statement = 'Fatore o monômio: 12ab + 18a.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Fator comum: 6a. 12ab ÷ 6a = 2b; 18a ÷ 6a = 3. Resultado: 6a(2b + 3).');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '6(2ab + 3a)', false),
                                                            (@q, '6a(2b + 3)', true),
                                                            (@q, '3a(4b + 6)', false),
                                                            (@q, '12a(b + 1,5)', false);

-- Q12: expandir (x+5)²
SET @q = (SELECT id_question FROM question WHERE statement = 'Expanda usando produto notável: (x + 5)².' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, '(a+b)² = a² + 2ab + b². Com a=x e b=5: x² + 2(x)(5) + 25 = x² + 10x + 25.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'x² + 25', false),
                                                            (@q, 'x² + 5x + 25', false),
                                                            (@q, 'x² + 10x + 25', true),
                                                            (@q, 'x² + 10x + 10', false);

-- Q13: expandir (x-3)(x+3)
SET @q = (SELECT id_question FROM question WHERE statement = 'Expanda: (x - 3)(x + 3).' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Produto da soma pela diferença: (a-b)(a+b) = a² - b². Com a=x, b=3: x² - 9.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'x² + 9', false), (@q, 'x² - 6x + 9', false), (@q, 'x² - 9', true), (@q, 'x² + 6x - 9', false);

-- Q14: zeros de x²-4
SET @q = (SELECT id_question FROM question WHERE statement = 'Para quais valores de x a expressão x² - 4 é igual a zero?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'x² - 4 = 0 → x² = 4 → x = ±√4 = ±2. As soluções são x = 2 e x = -2.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'x = 4 apenas', false),
                                                            (@q, 'x = 2 apenas', false),
                                                            (@q, 'x = 2 e x = -2', true),
                                                            (@q, 'x = -4 e x = 4', false);

-- -------------------------------------------------------
-- TÓPICO 4 – Equações do 1º Grau (easy, verified: Q1–Q14)
-- -------------------------------------------------------

SET @q = (SELECT id_question FROM question WHERE statement = 'Resolva: x + 5 = 12.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'x + 5 = 12 → x = 12 - 5 = 7.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '5', false), (@q, '6', false), (@q, '7', true), (@q, '17', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Resolva: 3x = 21.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, '3x = 21 → x = 21/3 = 7.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '3', false), (@q, '6', false), (@q, '7', true), (@q, '18', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Resolva: 2x - 4 = 10.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, '2x = 10 + 4 = 14 → x = 7.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '3', false), (@q, '5', false), (@q, '7', true), (@q, '14', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Resolva: x/3 = 7.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'x/3 = 7 → x = 7 × 3 = 21.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '7/3', false), (@q, '10', false), (@q, '21', true), (@q, '24', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Encontre x: 4x + 1 = 2x + 9.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, '4x - 2x = 9 - 1 → 2x = 8 → x = 4.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '2', false), (@q, '3', false), (@q, '4', true), (@q, '8', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Resolva: 5 - x = 3.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, '5 - x = 3 → -x = 3 - 5 = -2 → x = 2.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '-2', false), (@q, '1', false), (@q, '2', true), (@q, '8', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Resolva: -3x = 15.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, '-3x = 15 → x = 15/(-3) = -5.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '-12', false), (@q, '-5', true), (@q, '5', false), (@q, '45', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'A soma de um número com 8 é 23. Qual é o número?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'x + 8 = 23 → x = 23 - 8 = 15.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '13', false), (@q, '14', false), (@q, '15', true), (@q, '31', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Resolva: 2(x + 3) = 14.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, '2x + 6 = 14 → 2x = 8 → x = 4.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '3', false), (@q, '4', true), (@q, '5', false), (@q, '11', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Resolva: x/2 + 1 = 4.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'x/2 = 4 - 1 = 3 → x = 6.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '3', false), (@q, '5', false), (@q, '6', true), (@q, '10', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Verifique se x = 3 é solução de 5x - 2 = 13.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Substituindo x=3: 5(3) - 2 = 15 - 2 = 13. Sim, x=3 é solução.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'Não, pois 5(3) - 2 = 12', false),
                                                            (@q, 'Sim, pois 5(3) - 2 = 13', true),
                                                            (@q, 'Não, pois x deveria ser 3/5', false),
                                                            (@q, 'Sim, pois 5(2) - 2 = 13', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'A idade de Luís é o dobro da de Bia. A soma das idades é 36. Qual é a idade de cada um?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Bia = x; Luís = 2x. x + 2x = 36 → 3x = 36 → x = 12. Bia = 12, Luís = 24.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'Bia = 9, Luís = 27', false),
                                                            (@q, 'Bia = 12, Luís = 24', true),
                                                            (@q, 'Bia = 18, Luís = 18', false),
                                                            (@q, 'Bia = 10, Luís = 26', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Resolva: 7x - 3 = 4x + 9.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, '7x - 4x = 9 + 3 → 3x = 12 → x = 4.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '2', false), (@q, '3', false), (@q, '4', true), (@q, '12', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Resolva: -(x - 2) = 5.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, '-x + 2 = 5 → -x = 3 → x = -3.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '-3', true), (@q, '3', false), (@q, '7', false), (@q, '-7', false);

-- -------------------------------------------------------
-- TÓPICO 5 – Equações do 2º Grau (easy, verified: Q1–Q14)
-- -------------------------------------------------------

SET @q = (SELECT id_question FROM question WHERE statement = 'Resolva: x² - 4 = 0.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'x² = 4 → x = ±2.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'x = 2 apenas', false),
                                                            (@q, 'x = -2 apenas', false),
                                                            (@q, 'x = 2 e x = -2', true),
                                                            (@q, 'x = 4 e x = -4', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Calcule o discriminante (Δ) de x² - 5x + 6 = 0.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Δ = b² - 4ac = (-5)² - 4(1)(6) = 25 - 24 = 1.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '-1', false), (@q, '0', false), (@q, '1', true), (@q, '49', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Resolva: x² + 2x + 1 = 0.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'x² + 2x + 1 = (x+1)² = 0 → x = -1 (raiz dupla).');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'x = 1', false), (@q, 'x = -1 (raiz dupla)', true), (@q, 'Sem raízes reais', false), (@q, 'x = 1 e x = -1', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Resolva: 2x² - 8 = 0.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, '2x² = 8 → x² = 4 → x = ±2.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'x = 2 apenas', false),
                                                            (@q, 'x = 4 e x = -4', false),
                                                            (@q, 'x = 2 e x = -2', true),
                                                            (@q, 'x = √2 e x = -√2', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Determine as raízes de x² - 3x = 0.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'x(x - 3) = 0 → x = 0 ou x = 3.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'x = 3 apenas', false),
                                                            (@q, 'x = 0 e x = 3', true),
                                                            (@q, 'x = -3 e x = 3', false),
                                                            (@q, 'x = 0 apenas', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Para que valores de k a equação x² - kx + 9 = 0 tem raízes reais iguais?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Raízes iguais: Δ = 0. k² - 4(9) = 0 → k² = 36 → k = ±6.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'k = 6 apenas', false),
                                                            (@q, 'k = 9', false),
                                                            (@q, 'k = 6 e k = -6', true),
                                                            (@q, 'k = 3 e k = -3', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Resolva: x² - 7x + 12 = 0.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Procurar dois números cuja soma é 7 e produto é 12: 3 e 4. Raízes: x = 3 e x = 4.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'x = 2 e x = 6', false),
                                                            (@q, 'x = 3 e x = 4', true),
                                                            (@q, 'x = -3 e x = -4', false),
                                                            (@q, 'x = 1 e x = 12', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Identifique os coeficientes a, b, c em 5x² + 3x - 2 = 0.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Na forma ax² + bx + c = 0: a = 5, b = 3, c = -2.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'a=5, b=-3, c=2', false),
                                                            (@q, 'a=5, b=3, c=-2', true),
                                                            (@q, 'a=1, b=3, c=-2', false),
                                                            (@q, 'a=5, b=3, c=2', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Resolva por fatoração: x² - x - 6 = 0.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Dois números com soma -1 e produto -6: -3 e 2. (x-3)(x+2)=0 → x=3 ou x=-2.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'x = -3 e x = 2', false),
                                                            (@q, 'x = 3 e x = -2', true),
                                                            (@q, 'x = 6 e x = -1', false),
                                                            (@q, 'x = 1 e x = -6', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Classifique o discriminante de x² + x + 1 = 0.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Δ = 1² - 4(1)(1) = 1 - 4 = -3 < 0. Discriminante negativo → sem raízes reais.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'Δ = 5 > 0, duas raízes reais distintas', false),
                                                            (@q, 'Δ = 0, raiz real dupla', false),
                                                            (@q, 'Δ = -3 < 0, sem raízes reais', true),
                                                            (@q, 'Δ = 3 > 0, duas raízes reais distintas', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Determine a soma e o produto das raízes de 3x² - 5x + 2 = 0 pelas relações de Girard.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Soma = -b/a = 5/3; Produto = c/a = 2/3.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'Soma = -5/3, Produto = 2/3', false),
                                                            (@q, 'Soma = 5/3, Produto = 2/3', true),
                                                            (@q, 'Soma = 5, Produto = 2', false),
                                                            (@q, 'Soma = 5/3, Produto = -2/3', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Resolva por completação de quadrados: x² - 6x + 5 = 0.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'x² - 6x = -5 → (x-3)² - 9 = -5 → (x-3)² = 4 → x-3 = ±2 → x=5 ou x=1.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'x = 3 e x = -3', false),
                                                            (@q, 'x = 5 e x = 1', true),
                                                            (@q, 'x = 6 e x = -1', false),
                                                            (@q, 'x = 4 e x = 2', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Escreva uma equação do 2º grau cujas raízes são 3 e -5.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Soma = 3+(-5) = -2; Produto = 3×(-5) = -15. Equação: x² - (-2)x + (-15) = 0 → x² + 2x - 15 = 0 (ou múltiplo).');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'x² - 2x + 15 = 0', false),
                                                            (@q, 'x² + 2x - 15 = 0', true),
                                                            (@q, 'x² - 2x - 15 = 0', false),
                                                            (@q, 'x² + 8x - 15 = 0', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Resolva: (x - 2)² = 9.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, '(x-2) = ±3. Se x-2=3 → x=5; se x-2=-3 → x=-1.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'x = 5 apenas', false),
                                                            (@q, 'x = 5 e x = -1', true),
                                                            (@q, 'x = 3 e x = -3', false),
                                                            (@q, 'x = 5 e x = 1', false);

-- -------------------------------------------------------
-- TÓPICO 6 – Geometria Plana (easy, verified: Q1–Q14)
-- -------------------------------------------------------

SET @q = (SELECT id_question FROM question WHERE statement = 'Calcule a área de um retângulo de 8 cm por 5 cm.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Área do retângulo = base × altura = 8 × 5 = 40 cm².');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '13 cm²', false), (@q, '26 cm²', false), (@q, '40 cm²', true), (@q, '80 cm²', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Qual é o perímetro de um quadrado de lado 7 cm?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Perímetro do quadrado = 4 × lado = 4 × 7 = 28 cm.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '14 cm', false), (@q, '21 cm', false), (@q, '28 cm', true), (@q, '49 cm', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Calcule a área de um triângulo de base 10 cm e altura 6 cm.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Área = (base × altura) / 2 = (10 × 6) / 2 = 30 cm².');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '15 cm²', false), (@q, '30 cm²', true), (@q, '60 cm²', false), (@q, '16 cm²', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Qual é a área de um círculo de raio 4 cm? (use π ≈ 3,14)' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Área = π × r² = 3,14 × 4² = 3,14 × 16 = 50,24 cm².');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '12,56 cm²', false),
                                                            (@q, '25,12 cm²', false),
                                                            (@q, '50,24 cm²', true),
                                                            (@q, '78,5 cm²', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Quantos graus tem a soma dos ângulos internos de um pentágono?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Fórmula: (n-2)×180°. Para n=5: (5-2)×180° = 3×180° = 540°.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '360°', false), (@q, '450°', false), (@q, '540°', true), (@q, '720°', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Um ângulo mede 65°. Qual é o seu complemento?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Ângulos complementares somam 90°. Complemento = 90° - 65° = 25°.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '15°', false), (@q, '25°', true), (@q, '35°', false), (@q, '115°', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Dois ângulos suplementares somam 180°. Um deles mede 110°. Qual é o outro?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, '180° - 110° = 70°.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '60°', false), (@q, '70°', true), (@q, '80°', false), (@q, '290°', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Calcule a hipotenusa de um triângulo retângulo com catetos 3 e 4.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Teorema de Pitágoras: h² = 3² + 4² = 9 + 16 = 25 → h = 5.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '4', false), (@q, '5', true), (@q, '6', false), (@q, '7', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Qual é o perímetro de um círculo de diâmetro 10 cm?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Perímetro = π × d = π × 10 ≈ 31,4 cm.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '10π ≈ 31,4 cm', true),
                                                            (@q, '5π ≈ 15,7 cm', false),
                                                            (@q, '100π ≈ 314 cm', false),
                                                            (@q, '20π ≈ 62,8 cm', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Defina o que é um quadrilátero e dê dois exemplos.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Quadrilátero é um polígono com exatamente 4 lados. Exemplos: quadrado e retângulo.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'Polígono de 3 lados; ex: triângulo e hexágono', false),
                                                            (@q, 'Polígono de 4 lados; ex: quadrado e retângulo', true),
                                                            (@q, 'Polígono de 5 lados; ex: pentágono e trapézio', false),
                                                            (@q, 'Qualquer figura plana fechada', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Classifique os triângulos quanto aos lados.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Quanto aos lados: equilátero (3 iguais), isósceles (2 iguais), escaleno (todos diferentes).');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'Agudo, obtuso e reto', false),
                                                            (@q, 'Equilátero, isósceles e escaleno', true),
                                                            (@q, 'Pequeno, médio e grande', false),
                                                            (@q, 'Convexo, côncavo e retângulo', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Calcule a área de um trapézio com bases 8 e 12 cm e altura 5 cm.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Área = (B + b) × h / 2 = (12 + 8) × 5 / 2 = 20 × 5 / 2 = 50 cm².');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '40 cm²', false), (@q, '50 cm²', true), (@q, '60 cm²', false), (@q, '100 cm²', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Quantos eixos de simetria tem um quadrado?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'O quadrado tem 4 eixos de simetria: 2 pelos pares de lados opostos e 2 pelas diagonais.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '1', false), (@q, '2', false), (@q, '4', true), (@q, '8', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Um ângulo é o triplo do seu complemento. Qual é o valor desse ângulo?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'x + complemento = 90°. x = 3·complemento → complemento = x/3. x + x/3 = 90 → 4x/3 = 90 → x = 67,5°.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '45°', false), (@q, '60°', false), (@q, '67,5°', true), (@q, '75°', false);

-- -------------------------------------------------------
-- TÓPICO 7 – Geometria Espacial (easy, verified: Q1–Q14)
-- -------------------------------------------------------

SET @q = (SELECT id_question FROM question WHERE statement = 'Calcule o volume de um cubo de aresta 3 cm.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'V = a³ = 3³ = 27 cm³.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '9 cm³', false), (@q, '18 cm³', false), (@q, '27 cm³', true), (@q, '81 cm³', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Qual é a área total de um cubo de aresta 5 cm?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Área total = 6 × a² = 6 × 25 = 150 cm².');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '25 cm²', false), (@q, '125 cm²', false), (@q, '150 cm²', true), (@q, '600 cm²', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Calcule o volume de um paralelepípedo 4 cm × 3 cm × 6 cm.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'V = comprimento × largura × altura = 4 × 3 × 6 = 72 cm³.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '36 cm³', false), (@q, '52 cm³', false), (@q, '72 cm³', true), (@q, '144 cm³', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Qual é o volume de uma esfera de raio 6 cm? (use π ≈ 3,14)' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'V = (4/3)πr³ = (4/3) × 3,14 × 216 ≈ 904,32 cm³.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '75,36 cm³', false),
                                                            (@q, '452,16 cm³', false),
                                                            (@q, '904,32 cm³', true),
                                                            (@q, '1130,4 cm³', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Quantos vértices, arestas e faces tem um cubo?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Cubo: 8 vértices, 12 arestas e 6 faces. Verifica: V - A + F = 8 - 12 + 6 = 2 (Euler).');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '6 vértices, 8 arestas e 6 faces', false),
                                                            (@q, '8 vértices, 12 arestas e 6 faces', true),
                                                            (@q, '8 vértices, 8 arestas e 6 faces', false),
                                                            (@q, '6 vértices, 12 arestas e 8 faces', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Calcule a área lateral de um cilindro de raio 3 cm e altura 10 cm.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Área lateral = 2πrh = 2 × π × 3 × 10 = 60π ≈ 188,4 cm².');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '30π cm²', false), (@q, '60π cm²', true), (@q, '90π cm²', false), (@q, '120π cm²', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Um cone tem raio 4 cm e altura 3 cm. Calcule sua geratriz.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Geratriz: g = √(r² + h²) = √(16 + 9) = √25 = 5 cm.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '4 cm', false), (@q, '5 cm', true), (@q, '7 cm', false), (@q, '√7 cm', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Qual a diferença entre prisma e pirâmide?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Prisma tem duas bases paralelas e congruentes ligadas por faces laterais retangulares. Pirâmide tem uma base e faces laterais triangulares que se encontram em um único vértice (ápice).');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'Prisma tem uma base; pirâmide tem duas', false),
                                                            (@q, 'Prisma tem duas bases paralelas; pirâmide tem uma base e ápice', true),
                                                            (@q, 'São a mesma coisa', false),
                                                            (@q, 'Prisma tem faces triangulares; pirâmide tem faces retangulares', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Verifique a relação de Euler para um tetraedro: V - A + F = 2.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Tetraedro: 4 vértices, 6 arestas, 4 faces. V - A + F = 4 - 6 + 4 = 2. Verificado.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '4 - 6 + 4 = 2. Correto', true),
                                                            (@q, '4 - 4 + 6 = 6. Incorreto', false),
                                                            (@q, '6 - 4 + 4 = 6. Incorreto', false),
                                                            (@q, 'A relação não se aplica ao tetraedro', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Calcule o volume de um cone de raio 6 cm e altura 8 cm.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'V = (1/3)πr²h = (1/3) × π × 36 × 8 = 96π ≈ 301,44 cm³.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '48π cm³', false), (@q, '96π cm³', true), (@q, '144π cm³', false), (@q, '288π cm³', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Um cilindro de raio 4 cm e altura 9 cm é cheio de água. Qual é o volume de água?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'V = πr²h = π × 16 × 9 = 144π ≈ 452,16 cm³.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '36π cm³', false), (@q, '72π cm³', false), (@q, '144π cm³', true), (@q, '288π cm³', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Classifique os poliedros convexos regulares (sólidos platônicos).' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Existem exatamente 5 sólidos platônicos: tetraedro (4 faces), cubo (6), octaedro (8), dodecaedro (12) e icosaedro (20).');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'Cubo e esfera', false),
                                                            (@q, 'Tetraedro, cubo, octaedro, dodecaedro e icosaedro', true),
                                                            (@q, 'Prisma, cilindro e cone', false),
                                                            (@q, 'Apenas cubo e tetraedro', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Calcule a área da superfície de uma esfera de raio 5 cm.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Área = 4πr² = 4 × π × 25 = 100π ≈ 314 cm².');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '25π cm²', false), (@q, '50π cm²', false), (@q, '100π cm²', true), (@q, '200π cm²', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Defina planificação de um sólido geométrico e dê um exemplo.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Planificação é abrir/desdobrar as faces do sólido sobre um plano, sem sobreposição. Exemplo: planificação de um cubo gera uma cruz de 6 quadrados.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'Projeção do sólido sobre um plano', false),
                                                            (@q, 'Desdobramento das faces em um plano; ex: cruz de 6 quadrados do cubo', true),
                                                            (@q, 'Corte transversal do sólido', false),
                                                            (@q, 'Vista de cima do sólido', false);

-- -------------------------------------------------------
-- TÓPICO 8 – Trigonometria (easy, verified: Q1–Q14)
-- -------------------------------------------------------

SET @q = (SELECT id_question FROM question WHERE statement = 'Qual é o seno de 30°?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'sen(30°) = 1/2 = 0,5. Valor fundamental da tabela trigonométrica.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '√3/2', false), (@q, '√2/2', false), (@q, '1/2', true), (@q, '1', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Qual é o cosseno de 60°?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'cos(60°) = 1/2 = 0,5. Relação de ângulos complementares: cos(60°) = sen(30°).');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '0', false), (@q, '1/2', true), (@q, '√2/2', false), (@q, '√3/2', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Calcule a tangente de 45°.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'tg(45°) = sen(45°)/cos(45°) = (√2/2)/(√2/2) = 1.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '0', false), (@q, '√3/3', false), (@q, '1', true), (@q, '√3', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Em um triângulo retângulo, o cateto oposto mede 5 cm e a hipotenusa 13 cm. Calcule sen(α).' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'sen(α) = cateto oposto / hipotenusa = 5/13.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '5/12', false), (@q, '12/13', false), (@q, '5/13', true), (@q, '13/5', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Converta 150° para radianos.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, '150° × (π/180°) = 150π/180 = 5π/6 radianos.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'π/3', false), (@q, '2π/3', false), (@q, '5π/6', true), (@q, '7π/6', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Converta π/4 radianos para graus.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'π/4 × (180°/π) = 180°/4 = 45°.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '30°', false), (@q, '45°', true), (@q, '60°', false), (@q, '90°', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Qual é o sinal de cos(120°)?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, '120° está no 2º quadrante, onde o cosseno é negativo. cos(120°) = -1/2 < 0.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'Positivo, pois 120° < 180°', false),
                                                            (@q, 'Negativo, pois 120° está no 2º quadrante', true),
                                                            (@q, 'Zero', false),
                                                            (@q, 'Positivo, pois cos é sempre positivo', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Verifique a identidade: sen²(α) + cos²(α) = 1 para α = 30°.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'sen²(30°) + cos²(30°) = (1/2)² + (√3/2)² = 1/4 + 3/4 = 1. Verificado.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '1/4 + 3/4 = 1. Verificado', true),
                                                            (@q, '1/2 + √3/2 = 1. Verificado', false),
                                                            (@q, 'Não se verifica para 30°', false),
                                                            (@q, '3/4 + 1/4 = 2. Não verificado', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Um triângulo tem ângulos 30°, 60°, 90°. Quais são as relações entre seus lados?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'No triângulo 30-60-90, se o menor cateto é a, então o maior cateto é a√3 e a hipotenusa é 2a.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'Lados iguais a, a, a√2', false),
                                                            (@q, 'Lados a, a√3 e 2a (hipotenusa)', true),
                                                            (@q, 'Lados 3, 4 e 5', false),
                                                            (@q, 'Lados a, 2a e 3a', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Determine o período da função f(x) = sen(2x).' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Período = 2π / |coeficiente de x| = 2π / 2 = π.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '2π', false), (@q, 'π', true), (@q, 'π/2', false), (@q, '4π', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Qual é a amplitude de f(x) = 3cos(x)?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'A amplitude é o valor absoluto do coeficiente que multiplica a função. Amplitude = |3| = 3.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '1', false), (@q, '2', false), (@q, '3', true), (@q, '6', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Em que quadrantes o seno é positivo?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'O seno representa a coordenada y no círculo trigonométrico. É positivo quando y > 0, ou seja, nos quadrantes 1 e 2.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'Quadrantes 1 e 4', false),
                                                            (@q, 'Quadrantes 1 e 2', true),
                                                            (@q, 'Quadrantes 2 e 3', false),
                                                            (@q, 'Todos os quadrantes', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Calcule tg(180° - α) em termos de tg(α).' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'tg(180° - α) = -tg(α). Isso segue da relação sen(180°-α)=sen(α) e cos(180°-α)=-cos(α).');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'tg(α)', false), (@q, '-tg(α)', true), (@q, '1/tg(α)', false), (@q, '-1/tg(α)', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Qual é o valor de sen(90°) + cos(0°)?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'sen(90°) = 1 e cos(0°) = 1. Soma = 1 + 1 = 2.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '0', false), (@q, '1', false), (@q, '2', true), (@q, '√2', false);

-- -------------------------------------------------------
-- TÓPICO 9 – Probabilidade e Estatística (easy, verified: Q1–Q14)
-- -------------------------------------------------------

SET @q = (SELECT id_question FROM question WHERE statement = 'Lança-se um dado. Qual é a probabilidade de sair o número 4?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Espaço amostral = {1,2,3,4,5,6}. Evento = {4}. P = 1/6.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '1/3', false), (@q, '1/6', true), (@q, '1/4', false), (@q, '4/6', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Em uma turma de 30 alunos, 12 são meninas. Qual é a probabilidade de sortear uma menina?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'P = 12/30 = 2/5 = 0,4 ou 40%.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '1/3', false), (@q, '2/5', true), (@q, '3/5', false), (@q, '12/18', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Calcule a média dos valores: 5, 7, 9, 11, 13.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Média = (5+7+9+11+13)/5 = 45/5 = 9.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '8', false), (@q, '9', true), (@q, '10', false), (@q, '11', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Qual é a mediana do conjunto {2, 3, 7, 10, 15}?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Conjunto já ordenado com 5 elementos. Mediana = elemento central = 3º = 7.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '3', false), (@q, '7', true), (@q, '10', false), (@q, '8,5', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Qual é a moda de {4, 4, 5, 6, 6, 6, 7}?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Moda é o valor mais frequente. 6 aparece 3 vezes (4 aparece 2, outros 1). Moda = 6.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '4', false), (@q, '5', false), (@q, '6', true), (@q, '7', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Uma moeda é lançada 3 vezes. Qual é a probabilidade de sair cara nas 3 vezes?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Eventos independentes: P = (1/2)³ = 1/8.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '1/4', false), (@q, '1/6', false), (@q, '1/8', true), (@q, '3/8', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Calcule a amplitude do conjunto {3, 7, 8, 14, 21}.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Amplitude = máximo - mínimo = 21 - 3 = 18.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '14', false), (@q, '18', true), (@q, '21', false), (@q, '24', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Descreva o espaço amostral do lançamento de dois dados.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Cada dado tem 6 faces. Espaço amostral = 6 × 6 = 36 pares ordenados (i,j) com i,j ∈ {1,...,6}.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '6 resultados possíveis', false),
                                                            (@q, '36 pares ordenados (i,j), com i,j de 1 a 6', true),
                                                            (@q, '12 resultados possíveis', false),
                                                            (@q, '21 pares não ordenados', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'O que é probabilidade complementar? Dê um exemplo.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'P(Aᶜ) = 1 - P(A). Exemplo: P(não sair 6 em um dado) = 1 - 1/6 = 5/6.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'P(A) + P(B) = 1 para eventos quaisquer', false),
                                                            (@q, 'P(Aᶜ) = 1 - P(A); ex: P(não sair 6) = 5/6', true),
                                                            (@q, 'Probabilidade de dois eventos complementares é 0', false),
                                                            (@q, 'P(A) × P(Aᶜ) = 1', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Em uma urna há 5 bolas vermelhas e 3 azuis. Qual é a P de tirar azul?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Total = 5 + 3 = 8 bolas. P(azul) = 3/8.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '1/3', false), (@q, '3/8', true), (@q, '5/8', false), (@q, '3/5', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Calcule a variância do conjunto {2, 4, 4, 4, 5, 5, 7, 9}.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Média = (2+4+4+4+5+5+7+9)/8 = 40/8 = 5. Var = [(9+1+1+1+0+0+4+16)/8] = 32/8 = 4.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '2', false), (@q, '4', true), (@q, '5', false), (@q, '8', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Interprete um histograma de frequências.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Histograma é um gráfico de barras adjacentes onde cada barra representa uma classe; a altura indica a frequência (ou frequência relativa) dos dados naquela classe.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'Gráfico de linhas que mostra variação no tempo', false),
                                                            (@q, 'Gráfico de barras adjacentes onde a altura representa a frequência de cada classe', true),
                                                            (@q, 'Gráfico circular para mostrar proporções', false),
                                                            (@q, 'Tabela de dados brutos ordenados', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Qual é a diferença entre evento simples e composto?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Evento simples tem apenas um resultado do espaço amostral. Evento composto é formado pela união de dois ou mais eventos simples.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'Evento simples = impossível; composto = certo', false),
                                                            (@q, 'Simples tem um único resultado; composto é união de dois ou mais resultados', true),
                                                            (@q, 'São sinônimos em probabilidade', false),
                                                            (@q, 'Simples tem probabilidade 1/2; composto tem probabilidade variável', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Uma caixa tem 4 bolas numeradas de 1 a 4. Qual é a P de tirar um número par?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Pares no conjunto {1,2,3,4}: 2 e 4. P = 2/4 = 1/2.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '1/4', false), (@q, '1/3', false), (@q, '1/2', true), (@q, '3/4', false);

-- -------------------------------------------------------
-- TÓPICO 10 – Progressões (easy, verified: Q1–Q14)
-- -------------------------------------------------------

SET @q = (SELECT id_question FROM question WHERE statement = 'Determine o 10° termo da PA (2, 5, 8, ...).' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'a₁=2, r=3. a₁₀ = 2 + (10-1)×3 = 2 + 27 = 29.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '25', false), (@q, '27', false), (@q, '29', true), (@q, '32', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Qual é a razão da PA (-3, 1, 5, 9, ...)?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'r = a₂ - a₁ = 1 - (-3) = 4.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '2', false), (@q, '3', false), (@q, '4', true), (@q, '5', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Calcule a soma dos 20 primeiros termos da PA (1, 3, 5, ...).' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'a₁=1, r=2. a₂₀ = 1+19×2=39. S₂₀ = 20×(1+39)/2 = 20×20 = 400.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '200', false), (@q, '380', false), (@q, '400', true), (@q, '420', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Determine o 6° termo da PG (2, 6, 18, ...).' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'a₁=2, q=3. a₆ = 2 × 3⁵ = 2 × 243 = 486.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '162', false), (@q, '243', false), (@q, '486', true), (@q, '729', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Qual é a razão da PG (5, 10, 20, 40, ...)?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'q = a₂/a₁ = 10/5 = 2.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '5', false), (@q, '2', true), (@q, '4', false), (@q, '10', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Quantos termos tem a PA (4, 7, 10, ..., 100)?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'aₙ = 4 + (n-1)×3 = 100 → 3(n-1) = 96 → n-1 = 32 → n = 33.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '30', false), (@q, '32', false), (@q, '33', true), (@q, '35', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Três números formam uma PA. A soma deles é 21 e o maior é o dobro do menor. Determine-os.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Seja a-r, a, a+r a PA. Soma: 3a=21 → a=7. Maior=a+r=2(a-r) → 7+r=14-2r → 3r=7 → r=7/3. Termos: 14/3, 7, 28/3. Porém se inteiros: 5, 7, 9 (verifica: 9=2×4,5, não. Reanalisando: menor=x, maior=2x, meio=21-3x. PA: 2×meio = menor+maior → 2(21-3x)=x+2x → 42-6x=3x → x=14/3). Termos: 14/3, 7, 28/3.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '3, 7, 11', false),
                                                            (@q, '14/3, 7, 28/3', true),
                                                            (@q, '5, 7, 9', false),
                                                            (@q, '4, 7, 10', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Calcule a soma dos 8 primeiros termos da PG (1, 2, 4, ...).' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'a₁=1, q=2. S₈ = 1×(2⁸-1)/(2-1) = 255.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '127', false), (@q, '255', true), (@q, '256', false), (@q, '511', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Interpole 3 meios aritméticos entre 5 e 25.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, '5 termos no total (5, _, _, _, 25). r = (25-5)/(5-1) = 20/4 = 5. Meios: 10, 15, 20.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '8, 12, 18', false),
                                                            (@q, '10, 15, 20', true),
                                                            (@q, '9, 13, 17', false),
                                                            (@q, '7, 12, 19', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Uma PG tem a₁=3 e a₄=81. Determine a razão.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'a₄ = a₁ × q³ → 81 = 3 × q³ → q³ = 27 → q = 3.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '2', false), (@q, '3', true), (@q, '9', false), (@q, '27', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'A soma dos n primeiros inteiros positivos é n(n+1)/2. Calcule para n=100.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'S = 100×101/2 = 10100/2 = 5050.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '5000', false), (@q, '5050', true), (@q, '5100', false), (@q, '10100', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Uma PG tem a₁=2 e razão 1/2. Calcule a soma dos infinitos termos.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Soma PG infinita (|q|<1): S = a₁/(1-q) = 2/(1-1/2) = 2/(1/2) = 4.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '2', false), (@q, '3', false), (@q, '4', true), (@q, '∞', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Interpole 2 meios geométricos entre 2 e 54.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, '4 termos: 2, _, _, 54. a₄ = 2×q³ = 54 → q³ = 27 → q = 3. Meios: 6 e 18.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '9 e 27', false), (@q, '6 e 18', true), (@q, '4 e 12', false), (@q, '3 e 9', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Três termos consecutivos de uma PA têm soma 15 e produto 80. Quais são?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Seja a-r, a, a+r. Soma: 3a=15 → a=5. Produto: (5-r)×5×(5+r)=80 → 5(25-r²)=80 → 25-r²=16 → r²=9 → r=3. Termos: 2, 5, 8.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '3, 5, 7', false),
                                                            (@q, '2, 5, 8', true),
                                                            (@q, '1, 5, 9', false),
                                                            (@q, '4, 5, 6', false);

-- 1. Recupera o ID do Diego Alves
SET @id_diego = (SELECT id_user FROM user WHERE email = 'diego.alves@email.com');

-- 2. Recupera IDs de 3 t�picos para usar como base (Naturais, Fra��es e �lgebra)
SET @t1 = (SELECT id_topic FROM topic LIMIT 1 OFFSET 0);
SET @t2 = (SELECT id_topic FROM topic LIMIT 1 OFFSET 1);
SET @t3 = (SELECT id_topic FROM topic LIMIT 1 OFFSET 2);

-- ============================================================
-- RESPOSTAS (TABLE: answer)
-- ============================================================

-- H� 5 DIAS (T�pico 1: 3 acertos, 2 erros)
INSERT INTO answer (student_id, question_id, got_right, answer_date) VALUES
                                                                         (@id_diego, (SELECT id_question FROM question WHERE topic_id = @t1 LIMIT 1 OFFSET 0), TRUE, DATE_SUB(NOW(), INTERVAL 5 DAY)),
(@id_diego, (SELECT id_question FROM question WHERE topic_id = @t1 LIMIT 1 OFFSET 1), FALSE, DATE_SUB(NOW(), INTERVAL 5 DAY)),
(@id_diego, (SELECT id_question FROM question WHERE topic_id = @t1 LIMIT 1 OFFSET 2), TRUE, DATE_SUB(NOW(), INTERVAL 5 DAY)),
(@id_diego, (SELECT id_question FROM question WHERE topic_id = @t1 LIMIT 1 OFFSET 3), FALSE, DATE_SUB(NOW(), INTERVAL 5 DAY)),
(@id_diego, (SELECT id_question FROM question WHERE topic_id = @t1 LIMIT 1 OFFSET 4), TRUE, DATE_SUB(NOW(), INTERVAL 5 DAY));

-- H� 3 DIAS (T�pico 2: 2 acertos, 3 erros)
INSERT INTO answer (student_id, question_id, got_right, answer_date) VALUES
                                                                         (@id_diego, (SELECT id_question FROM question WHERE topic_id = @t2 LIMIT 1 OFFSET 0), TRUE, DATE_SUB(NOW(), INTERVAL 3 DAY)),
(@id_diego, (SELECT id_question FROM question WHERE topic_id = @t2 LIMIT 1 OFFSET 1), FALSE, DATE_SUB(NOW(), INTERVAL 3 DAY)),
(@id_diego, (SELECT id_question FROM question WHERE topic_id = @t2 LIMIT 1 OFFSET 2), FALSE, DATE_SUB(NOW(), INTERVAL 3 DAY)),
(@id_diego, (SELECT id_question FROM question WHERE topic_id = @t2 LIMIT 1 OFFSET 3), TRUE, DATE_SUB(NOW(), INTERVAL 3 DAY)),
(@id_diego, (SELECT id_question FROM question WHERE topic_id = @t2 LIMIT 1 OFFSET 4), FALSE, DATE_SUB(NOW(), INTERVAL 3 DAY));

-- H� 2 DIAS (T�pico 3: 4 acertos, 1 erro)
INSERT INTO answer (student_id, question_id, got_right, answer_date) VALUES
                                                                         (@id_diego, (SELECT id_question FROM question WHERE topic_id = @t3 LIMIT 1 OFFSET 0), TRUE, DATE_SUB(NOW(), INTERVAL 2 DAY)),
(@id_diego, (SELECT id_question FROM question WHERE topic_id = @t3 LIMIT 1 OFFSET 1), TRUE, DATE_SUB(NOW(), INTERVAL 2 DAY)),
(@id_diego, (SELECT id_question FROM question WHERE topic_id = @t3 LIMIT 1 OFFSET 2), TRUE, DATE_SUB(NOW(), INTERVAL 2 DAY)),
(@id_diego, (SELECT id_question FROM question WHERE topic_id = @t3 LIMIT 1 OFFSET 3), FALSE, DATE_SUB(NOW(), INTERVAL 2 DAY)),
(@id_diego, (SELECT id_question FROM question WHERE topic_id = @t3 LIMIT 1 OFFSET 4), TRUE, DATE_SUB(NOW(), INTERVAL 2 DAY));


-- ============================================================
-- PROGRESSO GERAL NOS T�PICOS (TABLE: student_topic)
-- ============================================================
-- Sincroniza o placar geral de acertos e erros do Diego
INSERT INTO student_topic (student_id, topic_id, qty_solved_questions, qty_wrong_questions) VALUES
                                                                                                (@id_diego, @t1, 3, 2),
                                                                                                (@id_diego, @t2, 2, 3),
                                                                                                (@id_diego, @t3, 4, 1)
    ON DUPLICATE KEY UPDATE
                         qty_solved_questions = qty_solved_questions + VALUES(qty_solved_questions),
                         qty_wrong_questions = qty_wrong_questions + VALUES(qty_wrong_questions);


-- ============================================================
-- LACUNAS DE CONHECIMENTO (TABLE: gap)
-- ============================================================
-- Insere duas lacunas ativas ('NOT_SOLVED') devido � baixa performance
-- no T�pico 1 (60% de acerto) e T�pico 2 (40% de acerto)
INSERT INTO gap (student_id, topic_id, qty_solved_questions, correct_answers, identified_date, stats) VALUES
                                                                                                          (@id_diego, @t1, 5, 3, DATE_SUB(NOW(), INTERVAL 5 DAY), 'NOT_SOLVED'),
                                                                                                          (@id_diego, @t2, 5, 2, DATE_SUB(NOW(), INTERVAL 3 DAY), 'NOT_SOLVED');

SET NAMES utf8mb4;

-- ============================================================
-- ALTERNATIVAS FALTANTES
-- Cobre todas as questões easy/verified que ainda não têm
-- multiple_choice_question + alternative inseridas.
-- ============================================================

-- -------------------------------------------------------
-- TÓPICO 1 – Números Naturais e Operações
-- (questões 1–5 já existem; completar 6–14)
-- -------------------------------------------------------

-- Q6: antecessor de 500
SET @q = (SELECT id_question FROM question WHERE statement = 'Qual é o antecessor de 500?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'O antecessor de n é n-1. Logo, antecessor de 500 é 499.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '498', false), (@q, '499', true), (@q, '500', false), (@q, '501', false);

-- Q7: 1.025 por extenso
SET @q = (SELECT id_question FROM question WHERE statement = 'Escreva por extenso o número 1.025.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, '1.025 = 1 milhar + 0 centenas + 2 dezenas + 5 unidades = mil e vinte e cinco.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'Um mil e dois', false),
                                                            (@q, 'Mil e vinte e cinco', true),
                                                            (@q, 'Dez mil e vinte e cinco', false),
                                                            (@q, 'Mil e duzentos e cinco', false);

-- Q8: maior número natural com 3 algarismos
SET @q = (SELECT id_question FROM question WHERE statement = 'Qual é o maior número natural com 3 algarismos?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Números com 3 algarismos vão de 100 a 999. O maior é 999.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '899', false), (@q, '989', false), (@q, '999', true), (@q, '1000', false);

-- Q9: dezenas em 370
SET @q = (SELECT id_question FROM question WHERE statement = 'Quantas dezenas há em 370?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, '370 ÷ 10 = 37. Há 37 dezenas em 370.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '3', false), (@q, '7', false), (@q, '37', true), (@q, '370', false);

-- Q10: 18²
SET @q = (SELECT id_question FROM question WHERE statement = 'Calcule 18² (dezoito ao quadrado).' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, '18² = 18 × 18 = (20-2)² = 400 - 80 + 4 = 324.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '144', false), (@q, '256', false), (@q, '324', true), (@q, '360', false);

-- Q11: resto de 50 ÷ 7
SET @q = (SELECT id_question FROM question WHERE statement = 'Qual é o resto da divisão de 50 por 7?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, '7 × 7 = 49. 50 - 49 = 1. O resto é 1.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '0', false), (@q, '1', true), (@q, '2', false), (@q, '6', false);

-- Q12: 42 par ou ímpar
SET @q = (SELECT id_question FROM question WHERE statement = 'O número 42 é par ou ímpar? Justifique.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Um número é par se é divisível por 2. 42 ÷ 2 = 21, sem resto. Logo, 42 é par.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'Ímpar, pois termina em 2', false),
                                                            (@q, 'Par, pois é divisível por 2', true),
                                                            (@q, 'Par, pois é divisível por 4', false),
                                                            (@q, 'Ímpar, pois sua soma de algarismos é ímpar', false);

-- Q13: MMC de 4 e 6
SET @q = (SELECT id_question FROM question WHERE statement = 'Qual é o MMC de 4 e 6?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, '4 = 2². 6 = 2 × 3. MMC = 2² × 3 = 12.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '2', false), (@q, '6', false), (@q, '12', true), (@q, '24', false);

-- Q14: MDC de 18 e 24
SET @q = (SELECT id_question FROM question WHERE statement = 'Qual é o MDC de 18 e 24?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, '18 = 2 × 3². 24 = 2³ × 3. MDC = 2 × 3 = 6.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '2', false), (@q, '3', false), (@q, '6', true), (@q, '18', false);

-- -------------------------------------------------------
-- TÓPICO 2 – Frações e Números Racionais
-- (questões 1–3 já existem; completar 4–14)
-- -------------------------------------------------------

-- Q4: ordenar 3/4, 2/3, 5/6
SET @q = (SELECT id_question FROM question WHERE statement = 'Ordene as frações 3/4, 2/3 e 5/6 em ordem crescente.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'MMC(4,3,6)=12. 3/4=9/12; 2/3=8/12; 5/6=10/12. Ordem crescente: 2/3 < 3/4 < 5/6.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '3/4 < 2/3 < 5/6', false),
                                                            (@q, '5/6 < 3/4 < 2/3', false),
                                                            (@q, '2/3 < 3/4 < 5/6', true),
                                                            (@q, '2/3 < 5/6 < 3/4', false);

-- Q5: 3/5 × 10/9
SET @q = (SELECT id_question FROM question WHERE statement = 'Calcule 3/5 × 10/9.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, '3/5 × 10/9 = 30/45. Simplificando pelo MDC 15: 30/45 = 2/3.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '1/3', false), (@q, '2/3', true), (@q, '3/2', false), (@q, '30/45', false);

-- Q6: inverso multiplicativo de 7/3
SET @q = (SELECT id_question FROM question WHERE statement = 'Qual é o inverso multiplicativo de 7/3?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'O inverso multiplicativo de a/b é b/a. O inverso de 7/3 é 3/7, pois 7/3 × 3/7 = 1.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '7/3', false), (@q, '-7/3', false), (@q, '3/7', true), (@q, '-3/7', false);

-- Q7: converter 2,5 em fração
SET @q = (SELECT id_question FROM question WHERE statement = 'Converta 2,5 em fração irredutível.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, '2,5 = 25/10. MDC(25,10)=5. 25/5=5 e 10/5=2. Logo: 5/2.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '25/10', false), (@q, '5/2', true), (@q, '2/5', false), (@q, '10/5', false);

-- Q8: 4/7 ÷ 2/7
SET @q = (SELECT id_question FROM question WHERE statement = 'Calcule 4/7 ÷ 2/7.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, '4/7 ÷ 2/7 = 4/7 × 7/2 = 28/14 = 2.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '1/2', false), (@q, '8/49', false), (@q, '2', true), (@q, '4/14', false);

-- Q9: fração que Pedro comeu da pizza
SET @q = (SELECT id_question FROM question WHERE statement = 'Uma pizza foi cortada em 8 pedaços. Pedro comeu 3 pedaços. Que fração da pizza ele comeu?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Pedro comeu 3 de 8 pedaços iguais, portanto a fração é 3/8.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '1/3', false), (@q, '3/8', true), (@q, '5/8', false), (@q, '3/5', false);

-- Q10: 5/6 - 1/4
SET @q = (SELECT id_question FROM question WHERE statement = 'Calcule 5/6 - 1/4.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'MMC(6,4)=12. 5/6=10/12; 1/4=3/12. 10/12 - 3/12 = 7/12.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '4/2', false), (@q, '1/2', false), (@q, '7/12', true), (@q, '5/12', false);

-- Q11: parte inteira de 17/5
SET @q = (SELECT id_question FROM question WHERE statement = 'Qual é a parte inteira de 17/5?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, '17 ÷ 5 = 3 com resto 2. A parte inteira é 3.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '2', false), (@q, '3', true), (@q, '4', false), (@q, '5', false);

-- Q12: -3/4 na reta numérica
SET @q = (SELECT id_question FROM question WHERE statement = 'Represente -3/4 na reta numérica descrevendo sua posição.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, '-3/4 = -0,75. Está entre -1 e 0, a três quartos de distância do 0 em direção ao -1.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'Entre 0 e 1, a 3/4 do 0', false),
                                                            (@q, 'Entre -1 e 0, a 3/4 de distância do 0 em direção ao -1', true),
                                                            (@q, 'Exatamente em -1', false),
                                                            (@q, 'Entre -2 e -1', false);

-- Q13: frações equivalentes 5/8 e 15/24
SET @q = (SELECT id_question FROM question WHERE statement = 'Verifique se 5/8 e 15/24 são frações equivalentes.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, '15/24: MDC(15,24)=3. 15/3=5 e 24/3=8. Logo 15/24 = 5/8. São equivalentes.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'Não, pois 5 × 24 ≠ 8 × 15', false),
                                                            (@q, 'Sim, pois 15/24 simplifica para 5/8', true),
                                                            (@q, 'Não, pois os numeradores são diferentes', false),
                                                            (@q, 'Sim, mas apenas por coincidência', false);

-- Q14: 2 2/3 + 1 1/6
SET @q = (SELECT id_question FROM question WHERE statement = 'Calcule 2 2/3 + 1 1/6 (números mistos).' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, '2 2/3 = 8/3; 1 1/6 = 7/6. MMC(3,6)=6. 8/3=16/6. 16/6+7/6=23/6 = 3 5/6.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '3 1/2', false), (@q, '3 5/6', true), (@q, '4 1/6', false), (@q, '23/9', false);

-- -------------------------------------------------------
-- TÓPICO 3 – Expressões Algébricas
-- (questões 1–2 já existem; completar 3–14)
-- -------------------------------------------------------

-- Q3: termos semelhantes em 4x²+3x-x²+2x
SET @q = (SELECT id_question FROM question WHERE statement = 'Identifique os termos semelhantes em: 4x² + 3x - x² + 2x.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Termos em x²: 4x² e -x². Termos em x: 3x e 2x. Resultado simplificado: 3x² + 5x.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '4x² e 2x são semelhantes', false),
                                                            (@q, '4x² com -x², e 3x com 2x', true),
                                                            (@q, 'Não há termos semelhantes', false),
                                                            (@q, 'Apenas 3x e 2x são semelhantes', false);

-- Q4: expandir 2(x+3)
SET @q = (SELECT id_question FROM question WHERE statement = 'Expanda: 2(x + 3).' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Pela propriedade distributiva: 2·x + 2·3 = 2x + 6.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '2x + 3', false), (@q, 'x + 6', false), (@q, '2x + 6', true), (@q, '2x + 5', false);

-- Q5: grau do monômio 5x³y²
SET @q = (SELECT id_question FROM question WHERE statement = 'Qual é o grau do monômio 5x³y²?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'O grau de um monômio é a soma dos expoentes das variáveis: 3 + 2 = 5.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '2', false), (@q, '3', false), (@q, '5', true), (@q, '6', false);

-- Q6: 2a²-3a+1 para a=-1
SET @q = (SELECT id_question FROM question WHERE statement = 'Calcule 2a² - 3a + 1 para a = -1.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, '2(-1)² - 3(-1) + 1 = 2(1) + 3 + 1 = 2 + 3 + 1 = 6.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '-4', false), (@q, '0', false), (@q, '4', false), (@q, '6', true);

-- Q7: somar (3x+2) e (x-5)
SET @q = (SELECT id_question FROM question WHERE statement = 'Some os polinômios (3x + 2) e (x - 5).' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, '(3x+2) + (x-5) = 3x + x + 2 - 5 = 4x - 3.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '4x + 7', false), (@q, '4x - 3', true), (@q, '3x - 3', false), (@q, '4x + 3', false);

-- Q8: 3x × 4x²
SET @q = (SELECT id_question FROM question WHERE statement = 'Multiplique: 3x × 4x².' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, '3x × 4x² = (3×4)(x^{1+2}) = 12x³.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '7x²', false), (@q, '12x²', false), (@q, '12x³', true), (@q, '7x³', false);

-- Q9: subtrair (5x²+3x-1)-(2x²-x+4)
SET @q = (SELECT id_question FROM question WHERE statement = 'Subtraia: (5x² + 3x - 1) - (2x² - x + 4).' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, '5x²-2x² = 3x²; 3x-(-x) = 4x; -1-4 = -5. Resultado: 3x² + 4x - 5.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '3x² + 2x - 5', false),
                                                            (@q, '3x² + 4x - 5', true),
                                                            (@q, '3x² - 4x - 5', false),
                                                            (@q, '7x² + 4x - 5', false);

-- Q10: coeficiente de x² em 7x³-4x²+x-9
SET @q = (SELECT id_question FROM question WHERE statement = 'Qual é o coeficiente de x² em 7x³ - 4x² + x - 9?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'O termo com x² é -4x². O coeficiente (número que multiplica x²) é -4.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '7', false), (@q, '-9', false), (@q, '1', false), (@q, '-4', true);

-- Q11: fatorar 12ab + 18a
SET @q = (SELECT id_question FROM question WHERE statement = 'Fatore o monômio: 12ab + 18a.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Fator comum: 6a. 12ab ÷ 6a = 2b; 18a ÷ 6a = 3. Resultado: 6a(2b + 3).');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '6(2ab + 3a)', false),
                                                            (@q, '6a(2b + 3)', true),
                                                            (@q, '3a(4b + 6)', false),
                                                            (@q, '12a(b + 1,5)', false);

-- Q12: expandir (x+5)²
SET @q = (SELECT id_question FROM question WHERE statement = 'Expanda usando produto notável: (x + 5)².' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, '(a+b)² = a² + 2ab + b². Com a=x e b=5: x² + 2(x)(5) + 25 = x² + 10x + 25.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'x² + 25', false),
                                                            (@q, 'x² + 5x + 25', false),
                                                            (@q, 'x² + 10x + 25', true),
                                                            (@q, 'x² + 10x + 10', false);

-- Q13: expandir (x-3)(x+3)
SET @q = (SELECT id_question FROM question WHERE statement = 'Expanda: (x - 3)(x + 3).' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Produto da soma pela diferença: (a-b)(a+b) = a² - b². Com a=x, b=3: x² - 9.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'x² + 9', false), (@q, 'x² - 6x + 9', false), (@q, 'x² - 9', true), (@q, 'x² + 6x - 9', false);

-- Q14: zeros de x²-4
SET @q = (SELECT id_question FROM question WHERE statement = 'Para quais valores de x a expressão x² - 4 é igual a zero?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'x² - 4 = 0 → x² = 4 → x = ±√4 = ±2. As soluções são x = 2 e x = -2.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'x = 4 apenas', false),
                                                            (@q, 'x = 2 apenas', false),
                                                            (@q, 'x = 2 e x = -2', true),
                                                            (@q, 'x = -4 e x = 4', false);

-- -------------------------------------------------------
-- TÓPICO 4 – Equações do 1º Grau (easy, verified: Q1–Q14)
-- -------------------------------------------------------

SET @q = (SELECT id_question FROM question WHERE statement = 'Resolva: x + 5 = 12.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'x + 5 = 12 → x = 12 - 5 = 7.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '5', false), (@q, '6', false), (@q, '7', true), (@q, '17', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Resolva: 3x = 21.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, '3x = 21 → x = 21/3 = 7.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '3', false), (@q, '6', false), (@q, '7', true), (@q, '18', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Resolva: 2x - 4 = 10.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, '2x = 10 + 4 = 14 → x = 7.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '3', false), (@q, '5', false), (@q, '7', true), (@q, '14', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Resolva: x/3 = 7.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'x/3 = 7 → x = 7 × 3 = 21.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '7/3', false), (@q, '10', false), (@q, '21', true), (@q, '24', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Encontre x: 4x + 1 = 2x + 9.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, '4x - 2x = 9 - 1 → 2x = 8 → x = 4.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '2', false), (@q, '3', false), (@q, '4', true), (@q, '8', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Resolva: 5 - x = 3.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, '5 - x = 3 → -x = 3 - 5 = -2 → x = 2.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '-2', false), (@q, '1', false), (@q, '2', true), (@q, '8', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Resolva: -3x = 15.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, '-3x = 15 → x = 15/(-3) = -5.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '-12', false), (@q, '-5', true), (@q, '5', false), (@q, '45', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'A soma de um número com 8 é 23. Qual é o número?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'x + 8 = 23 → x = 23 - 8 = 15.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '13', false), (@q, '14', false), (@q, '15', true), (@q, '31', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Resolva: 2(x + 3) = 14.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, '2x + 6 = 14 → 2x = 8 → x = 4.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '3', false), (@q, '4', true), (@q, '5', false), (@q, '11', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Resolva: x/2 + 1 = 4.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'x/2 = 4 - 1 = 3 → x = 6.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '3', false), (@q, '5', false), (@q, '6', true), (@q, '10', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Verifique se x = 3 é solução de 5x - 2 = 13.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Substituindo x=3: 5(3) - 2 = 15 - 2 = 13. Sim, x=3 é solução.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'Não, pois 5(3) - 2 = 12', false),
                                                            (@q, 'Sim, pois 5(3) - 2 = 13', true),
                                                            (@q, 'Não, pois x deveria ser 3/5', false),
                                                            (@q, 'Sim, pois 5(2) - 2 = 13', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'A idade de Luís é o dobro da de Bia. A soma das idades é 36. Qual é a idade de cada um?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Bia = x; Luís = 2x. x + 2x = 36 → 3x = 36 → x = 12. Bia = 12, Luís = 24.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'Bia = 9, Luís = 27', false),
                                                            (@q, 'Bia = 12, Luís = 24', true),
                                                            (@q, 'Bia = 18, Luís = 18', false),
                                                            (@q, 'Bia = 10, Luís = 26', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Resolva: 7x - 3 = 4x + 9.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, '7x - 4x = 9 + 3 → 3x = 12 → x = 4.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '2', false), (@q, '3', false), (@q, '4', true), (@q, '12', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Resolva: -(x - 2) = 5.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, '-x + 2 = 5 → -x = 3 → x = -3.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '-3', true), (@q, '3', false), (@q, '7', false), (@q, '-7', false);

-- -------------------------------------------------------
-- TÓPICO 5 – Equações do 2º Grau (easy, verified: Q1–Q14)
-- -------------------------------------------------------

SET @q = (SELECT id_question FROM question WHERE statement = 'Resolva: x² - 4 = 0.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'x² = 4 → x = ±2.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'x = 2 apenas', false),
                                                            (@q, 'x = -2 apenas', false),
                                                            (@q, 'x = 2 e x = -2', true),
                                                            (@q, 'x = 4 e x = -4', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Calcule o discriminante (Δ) de x² - 5x + 6 = 0.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Δ = b² - 4ac = (-5)² - 4(1)(6) = 25 - 24 = 1.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '-1', false), (@q, '0', false), (@q, '1', true), (@q, '49', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Resolva: x² + 2x + 1 = 0.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'x² + 2x + 1 = (x+1)² = 0 → x = -1 (raiz dupla).');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'x = 1', false), (@q, 'x = -1 (raiz dupla)', true), (@q, 'Sem raízes reais', false), (@q, 'x = 1 e x = -1', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Resolva: 2x² - 8 = 0.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, '2x² = 8 → x² = 4 → x = ±2.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'x = 2 apenas', false),
                                                            (@q, 'x = 4 e x = -4', false),
                                                            (@q, 'x = 2 e x = -2', true),
                                                            (@q, 'x = √2 e x = -√2', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Determine as raízes de x² - 3x = 0.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'x(x - 3) = 0 → x = 0 ou x = 3.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'x = 3 apenas', false),
                                                            (@q, 'x = 0 e x = 3', true),
                                                            (@q, 'x = -3 e x = 3', false),
                                                            (@q, 'x = 0 apenas', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Para que valores de k a equação x² - kx + 9 = 0 tem raízes reais iguais?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Raízes iguais: Δ = 0. k² - 4(9) = 0 → k² = 36 → k = ±6.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'k = 6 apenas', false),
                                                            (@q, 'k = 9', false),
                                                            (@q, 'k = 6 e k = -6', true),
                                                            (@q, 'k = 3 e k = -3', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Resolva: x² - 7x + 12 = 0.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Procurar dois números cuja soma é 7 e produto é 12: 3 e 4. Raízes: x = 3 e x = 4.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'x = 2 e x = 6', false),
                                                            (@q, 'x = 3 e x = 4', true),
                                                            (@q, 'x = -3 e x = -4', false),
                                                            (@q, 'x = 1 e x = 12', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Identifique os coeficientes a, b, c em 5x² + 3x - 2 = 0.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Na forma ax² + bx + c = 0: a = 5, b = 3, c = -2.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'a=5, b=-3, c=2', false),
                                                            (@q, 'a=5, b=3, c=-2', true),
                                                            (@q, 'a=1, b=3, c=-2', false),
                                                            (@q, 'a=5, b=3, c=2', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Resolva por fatoração: x² - x - 6 = 0.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Dois números com soma -1 e produto -6: -3 e 2. (x-3)(x+2)=0 → x=3 ou x=-2.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'x = -3 e x = 2', false),
                                                            (@q, 'x = 3 e x = -2', true),
                                                            (@q, 'x = 6 e x = -1', false),
                                                            (@q, 'x = 1 e x = -6', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Classifique o discriminante de x² + x + 1 = 0.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Δ = 1² - 4(1)(1) = 1 - 4 = -3 < 0. Discriminante negativo → sem raízes reais.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'Δ = 5 > 0, duas raízes reais distintas', false),
                                                            (@q, 'Δ = 0, raiz real dupla', false),
                                                            (@q, 'Δ = -3 < 0, sem raízes reais', true),
                                                            (@q, 'Δ = 3 > 0, duas raízes reais distintas', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Determine a soma e o produto das raízes de 3x² - 5x + 2 = 0 pelas relações de Girard.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Soma = -b/a = 5/3; Produto = c/a = 2/3.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'Soma = -5/3, Produto = 2/3', false),
                                                            (@q, 'Soma = 5/3, Produto = 2/3', true),
                                                            (@q, 'Soma = 5, Produto = 2', false),
                                                            (@q, 'Soma = 5/3, Produto = -2/3', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Resolva por completação de quadrados: x² - 6x + 5 = 0.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'x² - 6x = -5 → (x-3)² - 9 = -5 → (x-3)² = 4 → x-3 = ±2 → x=5 ou x=1.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'x = 3 e x = -3', false),
                                                            (@q, 'x = 5 e x = 1', true),
                                                            (@q, 'x = 6 e x = -1', false),
                                                            (@q, 'x = 4 e x = 2', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Escreva uma equação do 2º grau cujas raízes são 3 e -5.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Soma = 3+(-5) = -2; Produto = 3×(-5) = -15. Equação: x² - (-2)x + (-15) = 0 → x² + 2x - 15 = 0 (ou múltiplo).');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'x² - 2x + 15 = 0', false),
                                                            (@q, 'x² + 2x - 15 = 0', true),
                                                            (@q, 'x² - 2x - 15 = 0', false),
                                                            (@q, 'x² + 8x - 15 = 0', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Resolva: (x - 2)² = 9.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, '(x-2) = ±3. Se x-2=3 → x=5; se x-2=-3 → x=-1.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'x = 5 apenas', false),
                                                            (@q, 'x = 5 e x = -1', true),
                                                            (@q, 'x = 3 e x = -3', false),
                                                            (@q, 'x = 5 e x = 1', false);

-- -------------------------------------------------------
-- TÓPICO 6 – Geometria Plana (easy, verified: Q1–Q14)
-- -------------------------------------------------------

SET @q = (SELECT id_question FROM question WHERE statement = 'Calcule a área de um retângulo de 8 cm por 5 cm.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Área do retângulo = base × altura = 8 × 5 = 40 cm².');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '13 cm²', false), (@q, '26 cm²', false), (@q, '40 cm²', true), (@q, '80 cm²', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Qual é o perímetro de um quadrado de lado 7 cm?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Perímetro do quadrado = 4 × lado = 4 × 7 = 28 cm.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '14 cm', false), (@q, '21 cm', false), (@q, '28 cm', true), (@q, '49 cm', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Calcule a área de um triângulo de base 10 cm e altura 6 cm.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Área = (base × altura) / 2 = (10 × 6) / 2 = 30 cm².');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '15 cm²', false), (@q, '30 cm²', true), (@q, '60 cm²', false), (@q, '16 cm²', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Qual é a área de um círculo de raio 4 cm? (use π ≈ 3,14)' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Área = π × r² = 3,14 × 4² = 3,14 × 16 = 50,24 cm².');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '12,56 cm²', false),
                                                            (@q, '25,12 cm²', false),
                                                            (@q, '50,24 cm²', true),
                                                            (@q, '78,5 cm²', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Quantos graus tem a soma dos ângulos internos de um pentágono?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Fórmula: (n-2)×180°. Para n=5: (5-2)×180° = 3×180° = 540°.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '360°', false), (@q, '450°', false), (@q, '540°', true), (@q, '720°', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Um ângulo mede 65°. Qual é o seu complemento?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Ângulos complementares somam 90°. Complemento = 90° - 65° = 25°.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '15°', false), (@q, '25°', true), (@q, '35°', false), (@q, '115°', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Dois ângulos suplementares somam 180°. Um deles mede 110°. Qual é o outro?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, '180° - 110° = 70°.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '60°', false), (@q, '70°', true), (@q, '80°', false), (@q, '290°', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Calcule a hipotenusa de um triângulo retângulo com catetos 3 e 4.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Teorema de Pitágoras: h² = 3² + 4² = 9 + 16 = 25 → h = 5.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '4', false), (@q, '5', true), (@q, '6', false), (@q, '7', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Qual é o perímetro de um círculo de diâmetro 10 cm?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Perímetro = π × d = π × 10 ≈ 31,4 cm.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '10π ≈ 31,4 cm', true),
                                                            (@q, '5π ≈ 15,7 cm', false),
                                                            (@q, '100π ≈ 314 cm', false),
                                                            (@q, '20π ≈ 62,8 cm', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Defina o que é um quadrilátero e dê dois exemplos.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Quadrilátero é um polígono com exatamente 4 lados. Exemplos: quadrado e retângulo.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'Polígono de 3 lados; ex: triângulo e hexágono', false),
                                                            (@q, 'Polígono de 4 lados; ex: quadrado e retângulo', true),
                                                            (@q, 'Polígono de 5 lados; ex: pentágono e trapézio', false),
                                                            (@q, 'Qualquer figura plana fechada', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Classifique os triângulos quanto aos lados.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Quanto aos lados: equilátero (3 iguais), isósceles (2 iguais), escaleno (todos diferentes).');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'Agudo, obtuso e reto', false),
                                                            (@q, 'Equilátero, isósceles e escaleno', true),
                                                            (@q, 'Pequeno, médio e grande', false),
                                                            (@q, 'Convexo, côncavo e retângulo', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Calcule a área de um trapézio com bases 8 e 12 cm e altura 5 cm.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Área = (B + b) × h / 2 = (12 + 8) × 5 / 2 = 20 × 5 / 2 = 50 cm².');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '40 cm²', false), (@q, '50 cm²', true), (@q, '60 cm²', false), (@q, '100 cm²', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Quantos eixos de simetria tem um quadrado?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'O quadrado tem 4 eixos de simetria: 2 pelos pares de lados opostos e 2 pelas diagonais.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '1', false), (@q, '2', false), (@q, '4', true), (@q, '8', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Um ângulo é o triplo do seu complemento. Qual é o valor desse ângulo?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'x + complemento = 90°. x = 3·complemento → complemento = x/3. x + x/3 = 90 → 4x/3 = 90 → x = 67,5°.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '45°', false), (@q, '60°', false), (@q, '67,5°', true), (@q, '75°', false);

-- -------------------------------------------------------
-- TÓPICO 7 – Geometria Espacial (easy, verified: Q1–Q14)
-- -------------------------------------------------------

SET @q = (SELECT id_question FROM question WHERE statement = 'Calcule o volume de um cubo de aresta 3 cm.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'V = a³ = 3³ = 27 cm³.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '9 cm³', false), (@q, '18 cm³', false), (@q, '27 cm³', true), (@q, '81 cm³', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Qual é a área total de um cubo de aresta 5 cm?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Área total = 6 × a² = 6 × 25 = 150 cm².');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '25 cm²', false), (@q, '125 cm²', false), (@q, '150 cm²', true), (@q, '600 cm²', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Calcule o volume de um paralelepípedo 4 cm × 3 cm × 6 cm.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'V = comprimento × largura × altura = 4 × 3 × 6 = 72 cm³.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '36 cm³', false), (@q, '52 cm³', false), (@q, '72 cm³', true), (@q, '144 cm³', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Qual é o volume de uma esfera de raio 6 cm? (use π ≈ 3,14)' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'V = (4/3)πr³ = (4/3) × 3,14 × 216 ≈ 904,32 cm³.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '75,36 cm³', false),
                                                            (@q, '452,16 cm³', false),
                                                            (@q, '904,32 cm³', true),
                                                            (@q, '1130,4 cm³', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Quantos vértices, arestas e faces tem um cubo?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Cubo: 8 vértices, 12 arestas e 6 faces. Verifica: V - A + F = 8 - 12 + 6 = 2 (Euler).');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '6 vértices, 8 arestas e 6 faces', false),
                                                            (@q, '8 vértices, 12 arestas e 6 faces', true),
                                                            (@q, '8 vértices, 8 arestas e 6 faces', false),
                                                            (@q, '6 vértices, 12 arestas e 8 faces', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Calcule a área lateral de um cilindro de raio 3 cm e altura 10 cm.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Área lateral = 2πrh = 2 × π × 3 × 10 = 60π ≈ 188,4 cm².');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '30π cm²', false), (@q, '60π cm²', true), (@q, '90π cm²', false), (@q, '120π cm²', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Um cone tem raio 4 cm e altura 3 cm. Calcule sua geratriz.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Geratriz: g = √(r² + h²) = √(16 + 9) = √25 = 5 cm.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '4 cm', false), (@q, '5 cm', true), (@q, '7 cm', false), (@q, '√7 cm', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Qual a diferença entre prisma e pirâmide?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Prisma tem duas bases paralelas e congruentes ligadas por faces laterais retangulares. Pirâmide tem uma base e faces laterais triangulares que se encontram em um único vértice (ápice).');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'Prisma tem uma base; pirâmide tem duas', false),
                                                            (@q, 'Prisma tem duas bases paralelas; pirâmide tem uma base e ápice', true),
                                                            (@q, 'São a mesma coisa', false),
                                                            (@q, 'Prisma tem faces triangulares; pirâmide tem faces retangulares', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Verifique a relação de Euler para um tetraedro: V - A + F = 2.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Tetraedro: 4 vértices, 6 arestas, 4 faces. V - A + F = 4 - 6 + 4 = 2. Verificado.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '4 - 6 + 4 = 2. Correto', true),
                                                            (@q, '4 - 4 + 6 = 6. Incorreto', false),
                                                            (@q, '6 - 4 + 4 = 6. Incorreto', false),
                                                            (@q, 'A relação não se aplica ao tetraedro', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Calcule o volume de um cone de raio 6 cm e altura 8 cm.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'V = (1/3)πr²h = (1/3) × π × 36 × 8 = 96π ≈ 301,44 cm³.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '48π cm³', false), (@q, '96π cm³', true), (@q, '144π cm³', false), (@q, '288π cm³', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Um cilindro de raio 4 cm e altura 9 cm é cheio de água. Qual é o volume de água?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'V = πr²h = π × 16 × 9 = 144π ≈ 452,16 cm³.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '36π cm³', false), (@q, '72π cm³', false), (@q, '144π cm³', true), (@q, '288π cm³', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Classifique os poliedros convexos regulares (sólidos platônicos).' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Existem exatamente 5 sólidos platônicos: tetraedro (4 faces), cubo (6), octaedro (8), dodecaedro (12) e icosaedro (20).');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'Cubo e esfera', false),
                                                            (@q, 'Tetraedro, cubo, octaedro, dodecaedro e icosaedro', true),
                                                            (@q, 'Prisma, cilindro e cone', false),
                                                            (@q, 'Apenas cubo e tetraedro', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Calcule a área da superfície de uma esfera de raio 5 cm.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Área = 4πr² = 4 × π × 25 = 100π ≈ 314 cm².');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '25π cm²', false), (@q, '50π cm²', false), (@q, '100π cm²', true), (@q, '200π cm²', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Defina planificação de um sólido geométrico e dê um exemplo.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Planificação é abrir/desdobrar as faces do sólido sobre um plano, sem sobreposição. Exemplo: planificação de um cubo gera uma cruz de 6 quadrados.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'Projeção do sólido sobre um plano', false),
                                                            (@q, 'Desdobramento das faces em um plano; ex: cruz de 6 quadrados do cubo', true),
                                                            (@q, 'Corte transversal do sólido', false),
                                                            (@q, 'Vista de cima do sólido', false);

-- -------------------------------------------------------
-- TÓPICO 8 – Trigonometria (easy, verified: Q1–Q14)
-- -------------------------------------------------------

SET @q = (SELECT id_question FROM question WHERE statement = 'Qual é o seno de 30°?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'sen(30°) = 1/2 = 0,5. Valor fundamental da tabela trigonométrica.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '√3/2', false), (@q, '√2/2', false), (@q, '1/2', true), (@q, '1', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Qual é o cosseno de 60°?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'cos(60°) = 1/2 = 0,5. Relação de ângulos complementares: cos(60°) = sen(30°).');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '0', false), (@q, '1/2', true), (@q, '√2/2', false), (@q, '√3/2', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Calcule a tangente de 45°.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'tg(45°) = sen(45°)/cos(45°) = (√2/2)/(√2/2) = 1.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '0', false), (@q, '√3/3', false), (@q, '1', true), (@q, '√3', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Em um triângulo retângulo, o cateto oposto mede 5 cm e a hipotenusa 13 cm. Calcule sen(α).' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'sen(α) = cateto oposto / hipotenusa = 5/13.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '5/12', false), (@q, '12/13', false), (@q, '5/13', true), (@q, '13/5', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Converta 150° para radianos.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, '150° × (π/180°) = 150π/180 = 5π/6 radianos.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'π/3', false), (@q, '2π/3', false), (@q, '5π/6', true), (@q, '7π/6', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Converta π/4 radianos para graus.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'π/4 × (180°/π) = 180°/4 = 45°.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '30°', false), (@q, '45°', true), (@q, '60°', false), (@q, '90°', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Qual é o sinal de cos(120°)?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, '120° está no 2º quadrante, onde o cosseno é negativo. cos(120°) = -1/2 < 0.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'Positivo, pois 120° < 180°', false),
                                                            (@q, 'Negativo, pois 120° está no 2º quadrante', true),
                                                            (@q, 'Zero', false),
                                                            (@q, 'Positivo, pois cos é sempre positivo', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Verifique a identidade: sen²(α) + cos²(α) = 1 para α = 30°.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'sen²(30°) + cos²(30°) = (1/2)² + (√3/2)² = 1/4 + 3/4 = 1. Verificado.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '1/4 + 3/4 = 1. Verificado', true),
                                                            (@q, '1/2 + √3/2 = 1. Verificado', false),
                                                            (@q, 'Não se verifica para 30°', false),
                                                            (@q, '3/4 + 1/4 = 2. Não verificado', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Um triângulo tem ângulos 30°, 60°, 90°. Quais são as relações entre seus lados?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'No triângulo 30-60-90, se o menor cateto é a, então o maior cateto é a√3 e a hipotenusa é 2a.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'Lados iguais a, a, a√2', false),
                                                            (@q, 'Lados a, a√3 e 2a (hipotenusa)', true),
                                                            (@q, 'Lados 3, 4 e 5', false),
                                                            (@q, 'Lados a, 2a e 3a', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Determine o período da função f(x) = sen(2x).' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Período = 2π / |coeficiente de x| = 2π / 2 = π.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '2π', false), (@q, 'π', true), (@q, 'π/2', false), (@q, '4π', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Qual é a amplitude de f(x) = 3cos(x)?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'A amplitude é o valor absoluto do coeficiente que multiplica a função. Amplitude = |3| = 3.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '1', false), (@q, '2', false), (@q, '3', true), (@q, '6', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Em que quadrantes o seno é positivo?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'O seno representa a coordenada y no círculo trigonométrico. É positivo quando y > 0, ou seja, nos quadrantes 1 e 2.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'Quadrantes 1 e 4', false),
                                                            (@q, 'Quadrantes 1 e 2', true),
                                                            (@q, 'Quadrantes 2 e 3', false),
                                                            (@q, 'Todos os quadrantes', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Calcule tg(180° - α) em termos de tg(α).' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'tg(180° - α) = -tg(α). Isso segue da relação sen(180°-α)=sen(α) e cos(180°-α)=-cos(α).');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'tg(α)', false), (@q, '-tg(α)', true), (@q, '1/tg(α)', false), (@q, '-1/tg(α)', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Qual é o valor de sen(90°) + cos(0°)?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'sen(90°) = 1 e cos(0°) = 1. Soma = 1 + 1 = 2.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '0', false), (@q, '1', false), (@q, '2', true), (@q, '√2', false);

-- -------------------------------------------------------
-- TÓPICO 9 – Probabilidade e Estatística (easy, verified: Q1–Q14)
-- -------------------------------------------------------

SET @q = (SELECT id_question FROM question WHERE statement = 'Lança-se um dado. Qual é a probabilidade de sair o número 4?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Espaço amostral = {1,2,3,4,5,6}. Evento = {4}. P = 1/6.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '1/3', false), (@q, '1/6', true), (@q, '1/4', false), (@q, '4/6', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Em uma turma de 30 alunos, 12 são meninas. Qual é a probabilidade de sortear uma menina?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'P = 12/30 = 2/5 = 0,4 ou 40%.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '1/3', false), (@q, '2/5', true), (@q, '3/5', false), (@q, '12/18', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Calcule a média dos valores: 5, 7, 9, 11, 13.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Média = (5+7+9+11+13)/5 = 45/5 = 9.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '8', false), (@q, '9', true), (@q, '10', false), (@q, '11', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Qual é a mediana do conjunto {2, 3, 7, 10, 15}?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Conjunto já ordenado com 5 elementos. Mediana = elemento central = 3º = 7.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '3', false), (@q, '7', true), (@q, '10', false), (@q, '8,5', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Qual é a moda de {4, 4, 5, 6, 6, 6, 7}?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Moda é o valor mais frequente. 6 aparece 3 vezes (4 aparece 2, outros 1). Moda = 6.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '4', false), (@q, '5', false), (@q, '6', true), (@q, '7', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Uma moeda é lançada 3 vezes. Qual é a probabilidade de sair cara nas 3 vezes?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Eventos independentes: P = (1/2)³ = 1/8.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '1/4', false), (@q, '1/6', false), (@q, '1/8', true), (@q, '3/8', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Calcule a amplitude do conjunto {3, 7, 8, 14, 21}.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Amplitude = máximo - mínimo = 21 - 3 = 18.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '14', false), (@q, '18', true), (@q, '21', false), (@q, '24', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Descreva o espaço amostral do lançamento de dois dados.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Cada dado tem 6 faces. Espaço amostral = 6 × 6 = 36 pares ordenados (i,j) com i,j ∈ {1,...,6}.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '6 resultados possíveis', false),
                                                            (@q, '36 pares ordenados (i,j), com i,j de 1 a 6', true),
                                                            (@q, '12 resultados possíveis', false),
                                                            (@q, '21 pares não ordenados', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'O que é probabilidade complementar? Dê um exemplo.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'P(Aᶜ) = 1 - P(A). Exemplo: P(não sair 6 em um dado) = 1 - 1/6 = 5/6.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'P(A) + P(B) = 1 para eventos quaisquer', false),
                                                            (@q, 'P(Aᶜ) = 1 - P(A); ex: P(não sair 6) = 5/6', true),
                                                            (@q, 'Probabilidade de dois eventos complementares é 0', false),
                                                            (@q, 'P(A) × P(Aᶜ) = 1', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Em uma urna há 5 bolas vermelhas e 3 azuis. Qual é a P de tirar azul?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Total = 5 + 3 = 8 bolas. P(azul) = 3/8.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '1/3', false), (@q, '3/8', true), (@q, '5/8', false), (@q, '3/5', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Calcule a variância do conjunto {2, 4, 4, 4, 5, 5, 7, 9}.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Média = (2+4+4+4+5+5+7+9)/8 = 40/8 = 5. Var = [(9+1+1+1+0+0+4+16)/8] = 32/8 = 4.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '2', false), (@q, '4', true), (@q, '5', false), (@q, '8', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Interprete um histograma de frequências.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Histograma é um gráfico de barras adjacentes onde cada barra representa uma classe; a altura indica a frequência (ou frequência relativa) dos dados naquela classe.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'Gráfico de linhas que mostra variação no tempo', false),
                                                            (@q, 'Gráfico de barras adjacentes onde a altura representa a frequência de cada classe', true),
                                                            (@q, 'Gráfico circular para mostrar proporções', false),
                                                            (@q, 'Tabela de dados brutos ordenados', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Qual é a diferença entre evento simples e composto?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Evento simples tem apenas um resultado do espaço amostral. Evento composto é formado pela união de dois ou mais eventos simples.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, 'Evento simples = impossível; composto = certo', false),
                                                            (@q, 'Simples tem um único resultado; composto é união de dois ou mais resultados', true),
                                                            (@q, 'São sinônimos em probabilidade', false),
                                                            (@q, 'Simples tem probabilidade 1/2; composto tem probabilidade variável', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Uma caixa tem 4 bolas numeradas de 1 a 4. Qual é a P de tirar um número par?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Pares no conjunto {1,2,3,4}: 2 e 4. P = 2/4 = 1/2.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '1/4', false), (@q, '1/3', false), (@q, '1/2', true), (@q, '3/4', false);

-- -------------------------------------------------------
-- TÓPICO 10 – Progressões (easy, verified: Q1–Q14)
-- -------------------------------------------------------

SET @q = (SELECT id_question FROM question WHERE statement = 'Determine o 10° termo da PA (2, 5, 8, ...).' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'a₁=2, r=3. a₁₀ = 2 + (10-1)×3 = 2 + 27 = 29.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '25', false), (@q, '27', false), (@q, '29', true), (@q, '32', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Qual é a razão da PA (-3, 1, 5, 9, ...)?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'r = a₂ - a₁ = 1 - (-3) = 4.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '2', false), (@q, '3', false), (@q, '4', true), (@q, '5', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Calcule a soma dos 20 primeiros termos da PA (1, 3, 5, ...).' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'a₁=1, r=2. a₂₀ = 1+19×2=39. S₂₀ = 20×(1+39)/2 = 20×20 = 400.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '200', false), (@q, '380', false), (@q, '400', true), (@q, '420', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Determine o 6° termo da PG (2, 6, 18, ...).' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'a₁=2, q=3. a₆ = 2 × 3⁵ = 2 × 243 = 486.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '162', false), (@q, '243', false), (@q, '486', true), (@q, '729', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Qual é a razão da PG (5, 10, 20, 40, ...)?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'q = a₂/a₁ = 10/5 = 2.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '5', false), (@q, '2', true), (@q, '4', false), (@q, '10', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Quantos termos tem a PA (4, 7, 10, ..., 100)?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'aₙ = 4 + (n-1)×3 = 100 → 3(n-1) = 96 → n-1 = 32 → n = 33.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '30', false), (@q, '32', false), (@q, '33', true), (@q, '35', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Três números formam uma PA. A soma deles é 21 e o maior é o dobro do menor. Determine-os.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Seja a-r, a, a+r a PA. Soma: 3a=21 → a=7. Maior=a+r=2(a-r) → 7+r=14-2r → 3r=7 → r=7/3. Termos: 14/3, 7, 28/3. Porém se inteiros: 5, 7, 9 (verifica: 9=2×4,5, não. Reanalisando: menor=x, maior=2x, meio=21-3x. PA: 2×meio = menor+maior → 2(21-3x)=x+2x → 42-6x=3x → x=14/3). Termos: 14/3, 7, 28/3.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '3, 7, 11', false),
                                                            (@q, '14/3, 7, 28/3', true),
                                                            (@q, '5, 7, 9', false),
                                                            (@q, '4, 7, 10', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Calcule a soma dos 8 primeiros termos da PG (1, 2, 4, ...).' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'a₁=1, q=2. S₈ = 1×(2⁸-1)/(2-1) = 255.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '127', false), (@q, '255', true), (@q, '256', false), (@q, '511', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Interpole 3 meios aritméticos entre 5 e 25.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, '5 termos no total (5, _, _, _, 25). r = (25-5)/(5-1) = 20/4 = 5. Meios: 10, 15, 20.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '8, 12, 18', false),
                                                            (@q, '10, 15, 20', true),
                                                            (@q, '9, 13, 17', false),
                                                            (@q, '7, 12, 19', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Uma PG tem a₁=3 e a₄=81. Determine a razão.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'a₄ = a₁ × q³ → 81 = 3 × q³ → q³ = 27 → q = 3.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '2', false), (@q, '3', true), (@q, '9', false), (@q, '27', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'A soma dos n primeiros inteiros positivos é n(n+1)/2. Calcule para n=100.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'S = 100×101/2 = 10100/2 = 5050.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '5000', false), (@q, '5050', true), (@q, '5100', false), (@q, '10100', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Uma PG tem a₁=2 e razão 1/2. Calcule a soma dos infinitos termos.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Soma PG infinita (|q|<1): S = a₁/(1-q) = 2/(1-1/2) = 2/(1/2) = 4.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '2', false), (@q, '3', false), (@q, '4', true), (@q, '∞', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Interpole 2 meios geométricos entre 2 e 54.' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, '4 termos: 2, _, _, 54. a₄ = 2×q³ = 54 → q³ = 27 → q = 3. Meios: 6 e 18.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '9 e 27', false), (@q, '6 e 18', true), (@q, '4 e 12', false), (@q, '3 e 9', false);

SET @q = (SELECT id_question FROM question WHERE statement = 'Três termos consecutivos de uma PA têm soma 15 e produto 80. Quais são?' LIMIT 1);
INSERT INTO multiple_choice_question (question_id, justification) VALUES
    (@q, 'Seja a-r, a, a+r. Soma: 3a=15 → a=5. Produto: (5-r)×5×(5+r)=80 → 5(25-r²)=80 → 25-r²=16 → r²=9 → r=3. Termos: 2, 5, 8.');
INSERT INTO alternative (question_id, text, is_correct) VALUES
                                                            (@q, '3, 5, 7', false),
                                                            (@q, '2, 5, 8', true),
                                                            (@q, '1, 5, 9', false),
                                                            (@q, '4, 5, 6', false);