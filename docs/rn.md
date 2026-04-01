### Regras de Negócio (RN)

- **RN-01 – Status Inicial**  
  Todo lead cadastrado deve iniciar com o status “Novo”.

- **RN-02 – Conversão de Lead**  
  Um lead só pode ser marcado como “Fechado” após passar pelo status “Em contato”.

- **RN-03 – Exclusão de Lead**  
  Um lead só pode ser excluído se estiver com status “Perdido”.

- **RN-04 – Campos obrigatórios**
  O cadastro de um lead só pode ser realizado se todos os campos obrigatórios estiverem preenchidos corretamente.

- **RN-05 – Atualização de Status**
  O status de um lead deve seguir uma ordem lógica de progresso (Novo → Em contato → Fechado ou Perdido), não sendo permitido pular etapas.
  
---
