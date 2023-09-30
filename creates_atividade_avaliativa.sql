CREATE DATABASE meu_banco;

USE meu_banco;

-- Tabela cliente
CREATE TABLE cliente (
    cpf_cliente VARCHAR(11) PRIMARY KEY,
    nome_cliente VARCHAR(40) NOT NULL,
    email VARCHAR(25),
    data_de_nascimento DATE NOT NULL
);

-- Tabela fabricante
CREATE TABLE fabricante (
    codigo VARCHAR(15) PRIMARY KEY,
    razao_social VARCHAR(30) NOT NULL,
    nome_fantasia VARCHAR(30) NOT NULL,
    email VARCHAR(25)
);

-- Tabela cliente_endereco
CREATE TABLE cliente_endereco (
    cpf_cliente VARCHAR(11) PRIMARY KEY,
    estado VARCHAR(2) NOT NULL,
    cidade VARCHAR(20) NOT NULL,
    bairro VARCHAR(20) NOT NULL,
    rua VARCHAR(30) NOT NULL,
    numero INT NOT NULL CHECK(numero >= 0),
    cep VARCHAR(15) NOT NULL,
    FOREIGN KEY (cpf_cliente) REFERENCES cliente(cpf_cliente) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_cliente_endereco_cliente FOREIGN KEY (cpf_cliente) REFERENCES cliente(cpf_cliente) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Tabela cliente_telefone
CREATE TABLE cliente_telefone (
    cpf_cliente VARCHAR(15) PRIMARY KEY,
    telefone_celular VARCHAR(15) NOT NULL CHECK(telefone_celular >= 0),
    telefone_residencial VARCHAR(15) NOT NULL CHECK(telefone_residencial >= 0),
    telefone_comercial VARCHAR(15) NOT NULL CHECK(telefone_comercial >= 0),
    FOREIGN KEY (cpf_cliente) REFERENCES cliente(cpf_cliente) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_cliente_telefone_cliente FOREIGN KEY (cpf_cliente) REFERENCES cliente(cpf_cliente) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Tabela medicamento
CREATE TABLE medicamento (
    codigo VARCHAR(10) PRIMARY KEY,
    nome VARCHAR(20) NOT NULL,
    codigo_fabricante VARCHAR(10) NOT NULL,
    data_validade DATE NOT NULL,
    CONSTRAINT fk_medicamento_fabricante FOREIGN KEY (codigo_fabricante) REFERENCES fabricante(codigo) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Tabela venda
CREATE TABLE venda (
    codigo VARCHAR(10) PRIMARY KEY,
    data_venda DATE NOT NULL,
    cpf_cliente VARCHAR(11) NOT NULL,
    codigo_medicamento VARCHAR(10) NOT NULL,
    quantidade INT NOT NULL CHECK(quantidade >= 0),
    CONSTRAINT fk_venda_cliente FOREIGN KEY (cpf_cliente) REFERENCES cliente(cpf_cliente) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_venda_medicamento FOREIGN KEY (codigo_medicamento) REFERENCES medicamento(codigo) ON DELETE CASCADE ON UPDATE CASCADE
);
