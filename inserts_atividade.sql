-- Inserts para Clientes
INSERT INTO cliente (cpf_cliente, nome_cliente, email, data_de_nascimento)
VALUES
    ('12345678901', 'Euclidis da Cunha', 'euclidis@email.com', '1980-05-15'),
    ('23456789012', 'Fernando Pessoa', 'fernando@email.com', '1982-02-28'),
    ('34567890123', 'Joana de Almeida', 'joana@email.com', '1985-09-10'),
    ('45678901234', 'Carlos da Silva', 'carlos@email.com', '2008-12-20'),
    ('56789012345', 'Bianca Nunes', 'bianca@email.com', '1995-04-05'),
    ('67890123456', 'Gilberto Pessoa', 'gilberto@email.com', '2000-07-12'),
    ('78901234567', 'Fabiana de Almeida', 'fabiana@email.com', '1999-11-30'),
    ('89012345678', 'Ana Pessoa', 'ana@email.com', '2007-03-25'),
	('11890023414', 'Daniel Abrantes', 'daniel@email.com', '1991-04-11'),
    ('33301034101', 'Fabio Cortes', 'fabio@email.com', '1989-01-30'),
    ('29022345222', 'Cleber Amaral', 'camaral@email.com', '1998-09-23');

-- Inserts para Fabricantes
INSERT INTO fabricante (codigo, nome_fantasia, razao_social, email)
VALUES
    ('F001', 'Nossa Farma Farmacêutica', 'FarmA', 'nossafarma@farma.com'),
    ('F002', 'Saúde Farmacêutica', 'FarmB', 'contatosaude@farma.com'),
    ('F003', 'Quimica Boa Farmacêutica', 'FarmC', 'quimicaboa@farma.com'),
    ('F004', 'Melhora Farmacêutica', 'FarmD', 'melhora@farma.com'),
    ('F005', 'CEMAC Farmacêutica', 'FarmE', 'cemac@farma.com'),
    ('F006', 'Quimio Farmacêutica', 'FarmF', 'quimeiofarma@farma.com'),
    ('F007', 'Quimera Farmacêutica', 'FarmG', 'quimerafarma@farma.com'),
	('F008', 'Cooperativa Farmacêutica', 'FarmH', 'coopfarma@farma.com'),
    ('F009', 'Vitta Farmacêutica', 'FarmI', 'vittafarma@farma.com'),
	('F010', 'Vital Medical Farmacêutica', 'FarmJ', 'vmedical@farma.com'),
	('F011', 'SANS Farmacêutica', 'FarmL', 'sansfarma@farma.com');

-- Inserts para Medicamentos
INSERT INTO medicamento (codigo, nome, codigo_fabricante, data_validade)
VALUES
    ('M001', 'Paracetamol', 'F001', '2025-12-31'),
    ('M002', 'Ibuprofeno', 'F002', '2024-06-30'),
    ('M003', 'Amoxicilina', 'F003', '2026-09-15'),
    ('M004', 'Dipirona', 'F004', '2023-12-20'),
    ('M005', 'Omeprazol', 'F005', '2024-11-30'),
    ('M006', 'Ranitidina', 'F006', '2026-08-25'),
    ('M007', 'Losartana', 'F001', '2024-07-10'),
    ('M008', 'Metformina', 'F001', '2025-11-05');


-- Inserts para Endereços (cliente_endereco)
INSERT INTO cliente_endereco (cpf_cliente, estado, cidade, bairro, rua, numero, cep)
VALUES
    ('12345678901', 'SP', 'São Paulo', 'Centro', 'Rua XV de Novembro', 123, '01234-567'),
    ('23456789012', 'RJ', 'Rio de Janeiro', 'Copacabana', 'Avenida Beira Rio', 456, '04567-890'),
    ('34567890123', 'MG', 'Belo Horizonte', 'Savassi', 'Avenida Tiradentes', 789, '05678-901'),
    ('45678901234', 'RS', 'Porto Alegre', 'Moinhos de Vento', 'Avenida Dom Pedro', 801, '06789-012'),
    ('56789012345', 'PR', 'Curitiba', 'Batel', 'Rua Emiliano Costa', 202, '07890-123'),
	('67890123456', 'SP', 'São Paulo', 'Vila Madalena', 'Rua Das Alamedas', 303, '08901-234'),
    ('78901234567', 'SP', 'São Paulo', 'Ipiranga', 'Avenida Getulio Vargas', 585, '09012-345'),
    ('89012345678', 'SP', 'São Paulo', 'Liberdade', 'Rua Coronel Leonidas', 757, '09123-456');

-- Inserts para Números de Telefone (cliente_telefone)
INSERT INTO cliente_telefone (cpf_cliente, telefone_celular, telefone_residencial, telefone_comercial)
VALUES
    ('12345678901', 1198765421, 1123456789, 1133334411),
    ('23456789012', 2199998881, 2145678901, 2112345678),
    ('34567890123', 3198800771, 3123456789, 3155556600),
    ('45678901234', 5199996662, 5123456789, 5133334488),
    ('56789012345', 4199811771, 4123456789, 4144499556),
    ('67890123456', 1199777662, 7123456789, 1133399441),
    ('78901234567', 1199622555, 8123456789, 1133300442),
    ('89012345678', 1199711440, 6123456789, 1133322443);

-- Inserts para Vendas
INSERT INTO venda (codigo, quantidade, data_venda, cpf_cliente, codigo_medicamento)
VALUES
    ('V001', 2, '2023-01-15', '12345678901', 'M001'),
    ('V002', 3, '2023-02-20', '23456789012', 'M002'),
    ('V003', 3, '2023-02-25', '34567890123', 'M003'),
    ('V004', 3, '2023-04-30', '45678901234', 'M004'),
    ('V005', 4, '2023-02-10', '56789012345', 'M005');


