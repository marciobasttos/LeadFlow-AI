# Arquitetura - LeadFlow AI

## 1. Visão Geral

O LeadFlow AI é um sistema de automação para captura, armazenamento e tratamento de leads.

A arquitetura foi projetada utilizando ferramentas de automação, banco de dados PostgreSQL e serviços de hospedagem em nuvem.

O objetivo inicial do sistema é receber dados de leads através de um Webhook, processar as informações utilizando o n8n e armazenar os dados em uma tabela PostgreSQL hospedada no Supabase.

---

## 2. Arquitetura Atual

A arquitetura atual do LeadFlow AI é composta pelos seguintes serviços:

- GitHub
- Render
- n8n
- Supabase
- PostgreSQL

### Responsabilidade de cada componente

#### GitHub

Responsável pelo versionamento e documentação do projeto.

O repositório contém:

- Documentação da arquitetura.
- Requisitos do sistema.
- Estrutura do banco de dados.
- Workflows do n8n.
- README do projeto.

---

#### Render

Responsável pela hospedagem do n8n.

O n8n é executado em ambiente de nuvem através do Render, permitindo que os workflows sejam executados sem depender de um computador local.

---

#### n8n

Responsável pela orquestração e automação dos processos.

O n8n recebe os dados através de Webhooks, processa as informações e executa operações no banco de dados PostgreSQL.

---

#### Supabase

Plataforma utilizada para disponibilizar o banco de dados PostgreSQL utilizado pelo projeto.

O Supabase fornece a infraestrutura do banco de dados e ferramentas para gerenciamento e consulta dos dados.

---

#### PostgreSQL

Banco de dados relacional utilizado para armazenamento dos dados da aplicação.

A tabela principal da primeira versão do projeto é:

`leads`

---

## 3. Fluxo de Dados

O fluxo inicial do LeadFlow AI segue a seguinte arquitetura:

```text
┌──────────────────────┐
│   Formulário / API   │
│      / Sistema       │
└──────────┬───────────┘
           │
           │ Dados do Lead
           ▼
┌──────────────────────┐
│       Webhook        │
│        n8n           │
└──────────┬───────────┘
           │
           │ Processamento
           ▼
┌──────────────────────┐
│     Lógica de        │
│     Automação        │
│        n8n            │
└──────────┬───────────┘
           │
           │ Consulta / Inserção / Atualização
           ▼
┌──────────────────────┐
│      Supabase        │
│     PostgreSQL       │
└──────────┬───────────┘
           │
           ▼
┌──────────────────────┐
│       leads          │
│                      │
│  id                  │
│  nome                │
│  email               │
│  telefone            │
│  created_at          │
│  updated_at          │
└──────────────────────┘
