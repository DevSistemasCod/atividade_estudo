-- 1) Selecione os nomes dos clientes da tabela cliente que nasceram após 1990.
SELECT nome_cliente FROM cliente WHERE data_de_nascimento > '1990-12-31';

-- 2) Selecione os nomes dos medicamentos da tabela medicamento com data de validade em 2024.
SELECT nome FROM medicamento WHERE data_validade BETWEEN '2024-01-01' AND '2024-12-31';

-- 3) Selecione todos os clientes da tabela cliente que possuem "Pessoa" em seus nomes.
SELECT * FROM cliente WHERE nome_cliente LIKE '%Pessoa%';

-- 4) Conte quantos medicamentos cada fabricante produz  (identifique o fabricante pelo código).
SELECT codigo_fabricante, COUNT(*) AS quantidade_de_medicamentos
FROM medicamento GROUP BY codigo_fabricante;

-- 5) Selecione o nome e o e-mail dos clientes que nasceram após 2000, ordene-os por nome em ordem decrescente e limite o resultado a 5 registros.
SELECT nome_cliente, email FROM cliente
WHERE data_de_nascimento > '2000-12-31'
ORDER BY nome_cliente DESC LIMIT 5;

-- Subqueries
-- 6) Selecione o(s) nome(s) e o(s) cpf(s) do(s) cliente(s) que têm São Paulo como cidade em seu endereço.
SELECT nome_cliente AS Cliente , cpf_cliente AS CPF
FROM cliente
WHERE cpf_cliente IN (
    SELECT cpf_cliente FROM cliente_endereco
    WHERE cidade = 'São Paulo'
);

-- 7) Encontre o nome de todos os clientes que compraram o medicamento 'Paracetamol'.
SELECT nome_cliente FROM cliente 
WHERE cpf_cliente IN ( SELECT cpf_cliente FROM venda 
    WHERE codigo_medicamento IN ( SELECT codigo FROM medicamento 
        WHERE nome = 'Paracetamol'));

-- 8) Encontre o nome do medicamento mais antigo registrado no sistema.
SELECT nome AS Medicamento
FROM medicamento
WHERE data_validade = (
    SELECT MIN(data_validade) FROM medicamento
);

-- 9) Liste a quantidade de medicamentos diferentes estão registrados no sistema.
SELECT COUNT(nome) AS Quantidfade_de_Medicamentos_Diferentes
FROM (SELECT nome FROM medicamento) AS medicamentos_diferentes;

-- INNER JOIN
-- 10) Liste as datas das vendas e os nomes dos clientes.
SELECT v.data_venda AS Data_da_Venda, c.nome_cliente AS Cliente
FROM venda AS v
INNER JOIN cliente AS c ON v.cpf_cliente = c.cpf_cliente;

-- 11)  Liste os nomes clientes com seus nomes, endereços e números de telefone.
SELECT c.nome_cliente AS Cliente, ce.estado AS Estado, ct.telefone_celular AS Celular
FROM cliente AS c
INNER JOIN cliente_endereco AS ce ON C.cpf_cliente = ce.cpf_cliente
INNER JOIN cliente_telefone AS ct ON C.cpf_cliente = ct.cpf_cliente;

-- LEFT JOIN
-- 12) Liste o codigo, a nome fantasia e o email de todos os fabricantes inclusive os que não estão associados a nenhum medicamento ordene por codigo
SELECT f.codigo, f.nome_fantasia AS Fabricante, f.email
FROM fabricante AS f
LEFT JOIN medicamento AS m ON f.codigo = m.codigo_fabricante
ORDER BY f.codigo;

-- 13) Liste o nome e o cpf de todos os clientes inclusive os que não estão associados a tabela cliente_telefone e cliente_endereco, ordene por cpf.
SELECT c.cpf_cliente As CPF, c.nome_cliente AS Nome
FROM cliente AS c
LEFT JOIN cliente_telefone AS ct ON C.cpf_cliente = ct.cpf_cliente
LEFT JOIN cliente_endereco AS ce ON C.cpf_cliente = ce.cpf_cliente
ORDER BY c.cpf_cliente;

-- RIGHT JOIN:
-- 14)  Liste todos os medicamentos com seus nomes e os nomes de seus fabricantes. Inclua fabricantes sem medicamentos.
SELECT m.nome as Medicamento, f.nome_fantasia AS Fabricante
FROM medicamento AS m
RIGHT JOIN fabricante AS f ON m.codigo_fabricante = f.codigo;

-- 15) Liste os códigos das vendas e os clientes que as fizeram juntamente com os nomes dos clientes.
SELECT v.codigo AS Codigo, c.nome_cliente AS Cliente
FROM venda AS v
RIGHT JOIN cliente AS c ON v.cpf_cliente = c.cpf_cliente;

-- SELF JOIN:
-- 16) Liste todos os cpfs dos clientes que residem na mesma cidade.
SELECT ce1.cpf_cliente AS CPF, ce1.cidade AS Cidade
FROM cliente_endereco AS ce1
INNER JOIN cliente_endereco AS ce2 ON ce1.cidade = ce2.cidade
WHERE ce1.cpf_cliente < ce2.cpf_cliente;
