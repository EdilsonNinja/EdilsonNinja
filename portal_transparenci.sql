CREATE DATABASE portal_transparencia;
USE portal_transparencia;

-- ================================
-- TABELA SERVIDOR
-- ================================
CREATE TABLE servidor (
    id_Servidor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    cargo VARCHAR(50),
    salario DECIMAL(10,2)
);

-- ================================
-- TABELA NOTA FISCAL
-- ================================
CREATE TABLE nota_fiscal (
    idNota INT AUTO_INCREMENT PRIMARY KEY,
    data DATE NOT NULL,
    valor DECIMAL(12,2),
    fornecedor VARCHAR(100),
    tipo VARCHAR(50),
    idServidor INT,
    FOREIGN KEY (idServidor) REFERENCES servidor(idServidor)
);

-- ================================
-- TABELA PAGAMENTO
-- ================================
CREATE TABLE pagamento (
    idPagamento INT AUTO_INCREMENT PRIMARY KEY,
    data DATE NOT NULL,
    valor DECIMAL(12,2),
    beneficiario VARCHAR(100),
    metodo_pagamento VARCHAR(50),
    idNota INT,
    FOREIGN KEY (idNota) REFERENCES nota_fiscal(idNota)
);

-- ================================
-- TABELA LICITACAO
-- ================================
CREATE TABLE licitacao (
    idLicitacao INT AUTO_INCREMENT PRIMARY KEY,
    numero VARCHAR(50),
    data DATE,
    valor DECIMAL(12,2),
    participacao VARCHAR(200),
    idNota INT,
    FOREIGN KEY (idNota) REFERENCES nota_fiscal(idNota)
);

-- ================================
-- TABELA OBRA
-- ================================
CREATE TABLE obra (
    idObra INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(200),
    status VARCHAR(50),
    data_inicio DATE,
    data_conclusao DATE,
    idLicitacao INT,
    FOREIGN KEY (idLicitacao) REFERENCES licitacao(idLicitacao)
);
