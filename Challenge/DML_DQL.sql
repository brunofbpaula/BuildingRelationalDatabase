/* INSER��O DE DADOS */
-- TABELA CLIENTE
INSERT INTO T_POR_CLIENTE VALUES(1, 53116071810, 'Bruno de Paula', 19, '29-09-2004', 'Homem');
INSERT INTO T_POR_CLIENTE VALUES(2, 41983248721, 'Billie Eilish Pirate Baird O''Connell', 21, '18-12-2001', 'Mulher');
INSERT INTO T_POR_CLIENTE VALUES(3, 14157894322, 'Cristiano Ronaldo dos Santos Aveiro', 38, '05-02-1985', 'Homem');
INSERT INTO T_POR_CLIENTE VALUES(4, 77412962187, 'Bartholomew Henry Allen', 34, '14-03-1989', 'Homem');
INSERT INTO T_POR_CLIENTE VALUES(5, 97165489165, 'Light Yagami', 23, '28-02-1986', 'Homem');
INSERT INTO T_POR_CLIENTE VALUES(6, 12345678910, 'Thomas Michael Shelby', 39, '01-01-1890', 'Gangster');
INSERT INTO T_POR_CLIENTE VALUES(7, 12345678910, 'Max Emilian Verstappen', 26, '30-09-1997', 'Homem');
INSERT INTO T_POR_CLIENTE VALUES(8, 41983248721, 'B�rbara de Camargo Geres', 17, '19-04-2006', 'Mulher');
-- TABELA CONTRATO
INSERT INTO T_POR_CONTRATO VALUES(2, 2, 184879, 'Compreensiva', 7200, '01-01-2023', '31-12-2024', NULL);
INSERT INTO T_POR_CONTRATO VALUES(4, 4, 457127, 'Inc�ndio e Roubo/Furto', 2500, '12-08-2021', '31-12-2023', NULL);
INSERT INTO T_POR_CONTRATO VALUES(7, 7, 962314, 'Compreensiva', 17500, '07-05-2020', '30-06-2026', NULL);
-- TABELA VE�CULO
INSERT INTO T_POR_VEICULO VALUES(2, 2, 2, '7BEHT3W79W4F43078', 'Dodge', 'Challenger', 2022, 'RDBLA', 1, 'Gasolina/Etanol');
INSERT INTO T_POR_VEICULO VALUES(4, 4, 4, '1FLAS1H34B1A22762', 'Ferrari', '458 Spider', 2015, 'BA741CC', 0, 'Gasolina/Etanol');
INSERT INTO T_POR_VEICULO VALUES(7, 7, 7, '9REDB7U99U8L49871','Red Bull', 'RB19', 2023, 'MX294VS', 1, 'Etanol-l0');

/* ATUALIZA��O DE DADOS */
UPDATE T_POR_CLIENTE SET nome_completo = 'Bruno Francisco Brito de Paula' WHERE id_cliente = 1;
UPDATE T_POR_CLIENTE SET nr_cpf = 552226 WHERE id_cliente = 1;
UPDATE T_POR_CLIENTE SET idade = 30 WHERE id_cliente = 4;

/* REMO��O DE DADOS */
DELETE FROM T_POR_CLIENTE WHERE id_cliente = 1;
DELETE FROM T_POR_CLIENTE WHERE idade = 23;
DELETE FROM T_POR_CLIENTE WHERE genero = 'Gangster';

/* CONSULTAS */
SELECT * FROM T_POR_CLIENTE;
SELECT * FROM T_POR_CONTRATO;
SELECT * FROM T_POR_VEICULO;
-- CLASSIFICA��O DE DADOS - IDADE CRESCENTE
SELECT * FROM T_POR_CLIENTE ORDER BY idade ASC;
-- FUN��O DO TIPO NUM?RICA SIMPLES - IDs IGUAIS OU MENORES QUE QUATRO
SELECT * FROM T_POR_CLIENTE WHERE id_cliente <= 4;
-- FUN��O DE GRUPO - AGRUPANDO POR G�NERO A QUANTIDADE DE CADA
SELECT genero, COUNT(genero) AS quantidade FROM T_POR_CLIENTE GROUP BY genero ORDER BY quantidade DESC;
-- SUB CONSULTA - CONSULTANDO CONTRATOS DE VE�CULOS COM ANO DE FABRICA��O DE 2020 PARA CIMA
SELECT id_contrato, nm_apolice, tp_cobertura, vl_franquia, dt_inicio, dt_fim 
FROM T_POR_CONTRATO WHERE id_contrato IN (SELECT id_contrato FROM T_POR_VEICULO WHERE nm_ano >= 2020);
-- INNER JOIN - JUNTANDO A TABELA DE CLIENTE E VE�CULO
SELECT A.id_cliente, A.nome_completo, B.marca, B.modelo, B.nm_ano, B.nm_placa 
FROM T_POR_CLIENTE A INNER JOIN T_POR_VEICULO B
ON A.id_cliente = B.id_cliente ORDER BY A.id_cliente;