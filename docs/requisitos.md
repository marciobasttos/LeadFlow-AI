# Requisitos - Projeto LeadFlow AI

## Objetivo

Receber leads através de um Webhook e armazená-los em um banco PostgreSQL.

## Campos

- Nome
- Email
- Telefone

## Regras de Negócio

- O email identifica o lead.
- Não pode existir dois leads com o mesmo email.
- Se o email já existir:
    - Atualizar nome.
    - Atualizar telefone.
    - Atualizar updated_at.
- Registrar created_at automaticamente.
