# LeadFlow AI

Sistema Inteligente de Captura de Leads desenvolvido com foco em automação de processos empresariais.

## Objetivo

Receber leads através de formulários, armazenar em banco de dados e automatizar todo o processo de tratamento utilizando n8n.

## Tecnologias

- n8n
- PostgreSQL
- Supabase
- Render
- GitHub

## Funcionalidades

- Cadastro automático de leads
- Identificação de leads existentes por e-mail
- Prevenção de duplicidade
- Atualização automática de dados
- Detecção de alterações nos dados do lead
- Registro de histórico de alterações
- Armazenamento dos valores antigos e novos
- Identificação do campo alterado
- API via Webhook

## Fluxo da Automação

O LeadFlow AI recebe os dados de um lead através de um Webhook e verifica se o e-mail já está cadastrado no banco de dados.

### Novo Lead

Quando o e-mail não existe:

Webhook → SELECT → IF → INSERT

O lead é cadastrado na tabela `leads`.

### Lead Existente

Quando o e-mail já existe:

Webhook → SELECT → IF → Code → INSERT lead_history → UPDATE

O sistema compara os dados recebidos com os dados armazenados.

Caso existam alterações nos campos `nome` ou `telefone`, o sistema registra:

- ID do lead
- Campo alterado
- Valor anterior
- Novo valor
- Data da alteração

Depois, o registro principal é atualizado na tabela `leads`.

### Sem Alterações

Quando os dados recebidos são exatamente iguais aos dados armazenados, nenhuma alteração é registrada e o fluxo não executa operações desnecessárias no banco.

## Estrutura do Banco de Dados

### Tabela `leads`

Armazena os dados atuais dos leads.

Principais campos:

- `id`
- `nome`
- `email`
- `telefone`
- `created_at`
- `updated_at`

### Tabela `lead_history`

Armazena o histórico de alterações realizadas nos leads.

Principais campos:

- `id`
- `lead_id`
- `campo_alterado`
- `valor_antigo`
- `valor_novo`
- `changed_at`

A coluna `lead_id` estabelece o relacionamento entre o histórico e o lead original por meio de uma chave estrangeira (`FOREIGN KEY`).

## Status

🚧 v0.1
Cadastro de leads
      ↓
v0.2
Prevenção de duplicidade
      ↓
v0.3
Atualização automática
      ↓
v0.4
Histórico de alterações

---

Projeto desenvolvido durante minha jornada de estudos em Automação, IA e Engenharia de Software.
