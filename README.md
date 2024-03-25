# Projeto Mais Saúde

## Organização dos diretórios:

 - `lib/`: Contém o código-fonte do seu projeto.
  - `controller/`: Controllers responsáveis pela lógica de negócio.
    - `cadastro/`: Contém o controller para cadastro.
      - `cadastro_controller.dart`
    - `login/`: Contém o controller para login.
      - `login_controller.dart`

  - `model/`: Models representando a estrutura de dados.
    - `usuario.dart`: Modelo para usuário.

  - `services/`: Serviços utilizados no projeto.
    - `auth_service.dart`: Serviço de autenticação.
    - `database_service.dart`: Serviço de acesso ao banco de dados.

  - `views/`: Telas e componentes visuais.
    - `cadastro/`: Telas relacionadas ao cadastro.
      - `cadastro_view.dart`: View para cadastro.
    - `esqueceu_senha/`: Telas relacionadas à recuperação de senha.
      - `confcheck.dart`: Componente para confirmação.
      - `confirmar_esqueceu_senha_view.dart`: View para confirmar esqueceu a senha.
      - `novaSenha.dart`: View para nova senha.
    - `inicio/`: Telas relacionadas à tela inicial.
      - `inicio_view.dart`: View para a tela inicial.
    - `login/`: Telas relacionadas ao login.
      - `login_view.dart`: View para o login.
    - `perfil/`: Telas relacionadas ao perfil do usuário.
      - `perfil.dart`: View para o perfil do usuário.
    - `principal/`: Telas principais do aplicativo.
      - `principal_view.dart`: View principal.

- `main.dart`: Arquivo principal do aplicativo.

## Sobre o funcionamento do projeto:
  Ficamos acordados de criar uma branch para cada tela a ser implementada.
  Essa decisão vem para que possamos trabalhar de forma assíncrona sem causar-mos erros nos trabalhos dos outros

## Sobre as funcionalidades já implementadas:

  ### Cadastro

  - [x] Página de cadastro com formulário.
  - [x] Integração com o serviço de autenticação para criar novos usuários.

  ### Login

  - [x] Página de login com campos de usuário e senha.
  - [x] Autenticação de usuário com o serviço de autenticação.

  ### Recuperação de senha
  
  - [x] Página de "esqueci minha senha"
  - [x] Página de "criar nova senha"

  ### Principal
  
  - [x] Página principal da aplicação com botões
  - [x] Página principal com botão de página de perfil