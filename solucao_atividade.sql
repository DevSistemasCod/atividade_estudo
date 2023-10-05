-- 1) Selecione todos os clientes da tabela cliente que nasceram após 1990.
SELECT * FROM cliente WHERE data_de_nascimento > '1990-12-31';

-- 2) Selecione todos os medicamentos da tabela medicamento com data de validade em 2024.
SELECT * FROM medicamento WHERE data_validade BETWEEN '2024-01-01' AND '2024-12-31';

-- 3) Selecione todos os clientes da tabela cliente que têm "Pessoa" em seus nomes.
SELECT * FROM cliente WHERE nome_cliente LIKE '%Pessoa%';

-- 4)  Conte quantos medicamentos cada fabricante produz.
SELECT codigo_fabricante, COUNT(*) AS quantidade_de_medicamentos
FROM medicamento GROUP BY codigo_fabricante;

-- 5) Selecione o nome e o e-mail dos clientes que nasceram após 2000, ordene-os por nome em ordem decrescente e limite o resultado a 5 registros.
SELECT nome_cliente, email
FROM cliente
WHERE data_de_nascimento > '2000-12-31'
ORDER BY nome_cliente DESC LIMIT 5;

-- Subqueries
-- 6)  Selecione os nomes e os cpf dos clientes que têm endereço em São Paulo.
SELECT nome_cliente AS Cliente , cpf_cliente AS CPF
FROM cliente
WHERE cpf_cliente IN (
    SELECT cpf_cliente FROM cliente_endereco
    WHERE cidade = 'São Paulo'
);

-- 7) Encontre o nome de todos os clientes que compraram o medicamento 'Paracetamol'.
SELECT nome_cliente AS  Nome
FROM cliente
WHERE cpf_cliente IN (
    SELECT cpf_cliente FROM venda
    WHERE codigo_medicamento = 'M001'
);

-- 8) Encontre o nome do medicamento mais antigo registrado no sistema.
SELECT nome AS Medicamento
FROM medicamento
WHERE data_validade = (
    SELECT MIN(data_validade) FROM medicamento
);

-- 9) Conte quantos medicamentos diferentes estão registrados no sistema.
SELECT COUNT(*)  AS "Quantidfade de Medicamentos Diferentes" 
    FROM (SELECT nome FROM medicamento) 
    AS medicamentos_diferentes;

-- INNER JOIN
-- 10) Liste todos os medicamentos com seus nomes e os nomes de seus fabricantes.
SELECT m.nome AS Medicamento, f.nome_fantasia AS Fabricante
FROM medicamento AS m
INNER JOIN fabricante AS f ON m.codigo_fabricante = f.codigo;

-- 11) Liste todas as vendas com as datas de venda e os nomes dos clientes.
SELECT v.data_venda AS "Data de Venda:", c.nome_cliente AS Cliente
FROM venda AS v
INNER JOIN cliente AS c ON v.cpf_cliente = c.cpf_cliente;

-- 12)  Liste os clientes com seus nomes, endereços e números de telefone.
SELECT c.nome_cliente AS Cliente, ce.estado AS Estado, ct.telefone_celular AS Celular
FROM cliente AS c
INNER JOIN cliente_endereco AS ce ON C.cpf_cliente = ce.cpf_cliente
INNER JOIN cliente_telefone AS ct ON C.cpf_cliente = ct.cpf_cliente;

-- LEFT JOIN
-- 13) Liste o codigo, a nome fantasia e o email de todos os fabricantes inclusive os que não estão associados a nenhum medicamento ordene por codigo
SELECT f.codigo, f.nome_fantasia AS Fabricante, f.email
FROM fabricante AS f
LEFT JOIN medicamento AS m ON f.codigo = m.codigo_fabricante
ORDER BY f.codigo;

-- 14) Liste o nome e o cpf de todos os clientes inclusive os que não estão associados a tabela cliente_telefone e cliente_endereco, ordene por cpf.
SELECT c.cpf_cliente As CPF, c.nome_cliente AS Nome
FROM cliente AS c
LEFT JOIN cliente_telefone AS ct ON C.cpf_cliente = ct.cpf_cliente
LEFT JOIN cliente_endereco AS ce ON C.cpf_cliente = ce.cpf_cliente
ORDER BY c.cpf_cliente;

-- RIGHT JOIN:
-- 15)  Liste todos os medicamentos com seus nomes e os nomes de seus fabricantes. Inclua fabricantes sem medicamentos.
SELECT m.nome as Medicamento, f.nome_fantasia AS Fabricante
FROM medicamento AS m
RIGHT JOIN fabricante AS f ON m.codigo_fabricante = f.codigo;

-- 16) Liste os códigos das vendas e os clientes que as fizeram juntamente com os nomes dos clientes.
SELECT v.codigo AS Codigo, c.nome_cliente AS Cliente
FROM venda AS v
RIGHT JOIN cliente AS c ON v.cpf_cliente = c.cpf_cliente;

-- FULL JOIN:
-- 17) Listar todos os endereços dos clientes e os clientes que os possuem juntamente com os nomes dos clientes, concatene todas as colunas de endereço (cidade, bairro, rua e cep) em uma única coluna chamada "Endereco"e em outra coluna o nome do cliente. 
SELECT CONCAT(ce.cidade, ', ',ce.bairro, ', ', ce.rua, ', ', ce.numero, ', ', ce.cep) AS Endereco, c.nome_cliente AS Cliente
FROM cliente_endereco AS ce
LEFT JOIN cliente AS c ON ce.cpf_cliente = c.cpf_cliente

UNION

SELECT CONCAT(ce.cidade, ', ',ce.bairro, ', ', ce.rua, ', ', ce.numero, ', ', ce.cep) AS Endereco, c.nome_cliente AS Cliente
FROM cliente_endereco AS ce
RIGHT JOIN cliente AS c ON ce.cpf_cliente = c.cpf_cliente;

-- 18)  Listar os nomes dos clientes e os códigos de vendas (incluindo clientes sem vendas):
-- Consulta usando LEFT JOIN
SELECT c.nome_cliente AS Cliente, v.codigo AS Codigo
FROM cliente AS c
LEFT JOIN venda AS v ON c.cpf_cliente = v.cpf_cliente

UNION

-- Consulta usando RIGHT JOIN
SELECT c.nome_cliente AS Cliente, v.codigo AS CodigoVenda
FROM cliente AS c
RIGHT JOIN venda AS v ON c.cpf_cliente = v.cpf_cliente;

-- CROSS JOIN
-- 19) Combine todos os medicamentos com todos os fabricantes para criar uma lista de todas as possíveis combinações.
SELECT m.nome AS Nome, f.nome_fantasia AS Fabricante
FROM medicamento AS m
CROSS JOIN fabricante AS f;

-- SELF JOIN:
-- 20) Liste todos os cpfs dos clientes que residem na mesma cidade.
SELECT ce1.cpf_cliente AS CPF, ce1.cidade AS Cidade
FROM cliente_endereco AS ce1
INNER JOIN cliente_endereco AS ce2 ON ce1.cidade = ce2.cidade
WHERE ce1.cpf_cliente < ce2.cpf_cliente;
