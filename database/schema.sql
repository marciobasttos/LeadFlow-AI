-- Estrutura do banco de dados
-- =====================================================
-- Projeto: LeadFlow AI
-- Versão: 1.0
-- Banco: PostgreSQL
-- =====================================================

CREATE TABLE leads (

    id SERIAL PRIMARY KEY,

    nome VARCHAR(150) NOT NULL,

    email VARCHAR(255) NOT NULL UNIQUE,

    telefone VARCHAR(20),

    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP

);
