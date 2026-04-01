# LeadFlow

O **LeadFlow** é um aplicativo desenvolvido em Flutter com o objetivo de simular um sistema de autenticação de usuários, utilizando dados mockados em memória.

---

## Objetivo

O projeto foi desenvolvido como atividade P1 com foco em:

- Navegação entre telas  
- Uso de formulários  
- Validação de dados  
- Organização arquitetural  
- Manipulação de dados em memória (mock)  

---

## Funcionalidades

- Splash Screen inicial  
- Tela de Login com validação  
- Tela de Cadastro de usuário  
- Armazenamento de dados em memória  
- Autenticação simulada  
- Navegação para tela Home após login  
- Tela Home com ícone e mensagem de boas-vindas  

---

## Arquitetura

O projeto segue uma organização baseada em separação de responsabilidades:

lib/
├── main.dart
├── app/
│ ├── models/
│ ├── viewmodels/
│ ├── data/
│ └── views/


- **Models** → representam os dados (ex: usuário)  
- **ViewModels** → lógica da aplicação  
- **Views** → interface (telas)  
- **Data** → armazenamento mockado em memória  

---

## Model utilizado

O projeto utiliza um model de usuário contendo:

- Nome  
- Email/Login  
- Senha  

---

## Dados Mockados

Os dados são armazenados em memória utilizando `List<UsuarioModel>`.  
Não é utilizado banco de dados ou API externa, conforme requisito da atividade.

---

## Fluxo do Aplicativo

1. Splash Screen  
2. Tela de Login  
3. Tela de Cadastro  
4. Retorno ao Login  
5. Autenticação  
6. Acesso à Home  

---

## Tecnologias

- Flutter  
- Dart  
- Android Studio  

---

## Equipe

- Pollyana Caso - 25001334  
- Murilo Colli Barbosa - 25000458  
- Luis Felipe Coelho - 25001003  
- Pedro Ignácio de Oliveira Bortolon - 25000137  

---

## Observações

Este projeto não possui autenticação real, sendo apenas uma simulação para fins acadêmicos.
