##🛠️ Sistema de Banco de Dados — Oficina Mecânica

Este projeto consiste na modelagem e implementação de um banco de dados relacional para uma oficina mecânica fictícia, utilizando MySQL.

O objetivo é simular o funcionamento de uma oficina real, controlando clientes, veículos, funcionários, serviços, peças e pagamentos, além de permitir consultas SQL de diferentes níveis de complexidade.
---

#📌 Objetivos do Projeto

Modelar entidades reais de uma oficina mecânica.

Criar relacionamentos entre tabelas.

Garantir integridade referencial com foreign keys.

Popular o banco com dados coerentes.

Desenvolver consultas SQL simples e avançadas.

Treinar JOIN, GROUP BY, CASE, HAVING, IN, NOT EXISTS, entre outros.
---

#🗂️ Estrutura do Banco

O banco se chama oficina e contém as seguintes tabelas:

cliente — Dados dos clientes.

veiculo — Veículos pertencentes aos clientes.

funcionario — Funcionários da oficina.

cliente_pagamento — Forma de pagamento dos clientes.

pagamento — Registros financeiros dos serviços.

peca — Peças utilizadas nos serviços.

servico — Serviços realizados nos veículos.

servico_funcionario — Relação N:N entre serviços e funcionários.

servico_peca — Relação N:N entre serviços e peças.
---

#🧱 Modelo Lógico (Resumo)

Um cliente pode ter vários veículos.

Um veículo pode possuir vários serviços.

Um serviço pode envolver vários funcionários e várias peças.

Um cliente possui uma forma de pagamento.

Cada serviço está associado a um pagamento.
