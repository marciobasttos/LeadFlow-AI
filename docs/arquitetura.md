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

## 4. Infraestrutura

A infraestrutura atual pode ser representada da seguinte forma:


                      LEADFLOW AI
                         │
          ┌──────────────┼──────────────┐
          │              │              │
          ▼              ▼              ▼
       GitHub          Render        Supabase
          │              │              │
          │              ▼              ▼
          │             n8n         PostgreSQL
          │                             │
          │                             ▼
          │                           leads
          │
          └──── Documentação
                e Versionamento


                5. Banco de Dados

O banco de dados utilizado pelo projeto é PostgreSQL, hospedado através do Supabase.

A primeira tabela de negócio do sistema é:

leads

Estrutura atual
Campo	Tipo	Obrigatório
id	integer	Sim
nome	varchar	Sim
email	varchar	Sim
telefone	varchar	Não
created_at	timestamp	Sim
updated_at	timestamp	Sim

O campo id é a chave primária da tabela.

O campo email é utilizado como identificador único de negócio do lead e possui restrição de unicidade.

O campo telefone é opcional, pois pode ser alterado posteriormente pelo próprio lead.

6. Regras de Negócio

O sistema deve seguir as seguintes regras:

O nome do lead é obrigatório.
O e-mail do lead é obrigatório.
O e-mail identifica unicamente o lead.
Não podem existir dois leads com o mesmo e-mail.
O telefone é opcional.
Se o e-mail recebido não existir no banco, um novo lead deve ser criado.
Se o e-mail recebido já existir, o cadastro deve ser atualizado.
Em uma atualização, o nome deve ser atualizado.
Em uma atualização, o telefone deve ser atualizado.
O campo created_at deve registrar a data de criação do registro.
O campo updated_at deve registrar a data da última atualização do registro.
7. Fluxo de Cadastro e Atualização

O comportamento esperado do workflow é:

Webhook
   │
   ▼
Receber dados do lead
   │
   ▼
Consultar lead pelo e-mail
   │
   ▼
O e-mail já existe?
   │
   ├─────────────── NÃO ───────────────┐
   │                                   │
   ▼                                   ▼
Criar novo lead                  Inserir registro
   │
   │
   └───────────────────────────────────┐
                                       │
                                      FIM

O e-mail já existe?
   │
   └────────────── SIM
                    │
                    ▼
              Atualizar lead
                    │
                    ├── Atualizar nome
                    ├── Atualizar telefone
                    └── Atualizar updated_at
                    │
                    ▼
                   FIM

8. Estado Atual do Projeto

O projeto encontra-se em desenvolvimento.

Componentes já configurados
 Repositório GitHub criado.
 Estrutura inicial do projeto criada.
 n8n configurado.
 n8n hospedado no Render.
 Supabase configurado.
 PostgreSQL configurado.
 Tabela leads criada.
 Webhook configurado para recebimento de dados.
 Conexão entre n8n e PostgreSQL configurada.
Próximas etapas
 Validar a restrição de unicidade do e-mail.
 Implementar lógica de consulta de lead por e-mail.
 Implementar criação de novos leads.
 Implementar atualização de leads existentes.
 Testar o fluxo completo.
 Exportar o workflow do n8n para o GitHub.
 Atualizar a documentação conforme novas funcionalidades forem implementadas.

 
9. Evolução da Arquitetura

A arquitetura do LeadFlow AI será evoluída gradualmente conforme novas necessidades forem identificadas.

Possíveis componentes futuros incluem:

Integração com formulários.
Integração com APIs externas.
Inteligência Artificial.
Agentes de IA.
Notificações automáticas.
Histórico de alterações dos leads.
Dashboard de acompanhamento.
Integração com sistemas de CRM.

Novos componentes somente serão adicionados à arquitetura quando forem efetivamente implementados no projeto.
