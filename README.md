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

### Splash Screen
Tela inicial exibida ao abrir o aplicativo, responsável por apresentar rapidamente a identidade do app antes de redirecionar para o login.  
Essa tela tem como objetivo criar uma experiência inicial agradável e dar tempo para carregar os recursos necessários.

### Login
Permite que o usuário entre no sistema informando e-mail/login e senha.  
Os dados são validados com base nas informações cadastradas em memória. Caso os dados estejam incorretos, o sistema retorna mensagens de erro, garantindo a validação adequada.

### Cadastro de Usuário
Tela onde novos usuários podem se registrar.  
Os dados informados são validados (nome, e-mail/login e senha) e armazenados em uma lista mockada durante a execução do app.  
Após o cadastro, o usuário é redirecionado para a tela de login para realizar a autenticação.

### Armazenamento em Memória
Os dados dos usuários são mantidos temporariamente utilizando uma estrutura em memória (`List<UsuarioModel>`).  
Não há uso de banco de dados ou API externa, conforme requisito da atividade.

### Autenticação Simulada
O sistema verifica se o usuário existe e se a senha está correta para permitir o acesso à aplicação.  
Essa autenticação é apenas simulada, sem integração com serviços externos.

### Tela Home
Tela exibida após login bem-sucedido, contendo um ícone e uma mensagem de boas-vindas ao usuário.  
Essa tela representa o ponto final do fluxo de autenticação, confirmando que o login foi realizado com sucesso.

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
