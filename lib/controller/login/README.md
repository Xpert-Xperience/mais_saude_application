# Documentação do Controller de Login

Este arquivo contém o código-fonte para o controller responsável pelo login de usuários em um aplicativo Flutter utilizando Firebase Authentication.

### Classe: LoginController

#### Variáveis:

- `email`: String - Armazena o endereço de e-mail fornecido pelo usuário durante o login.
- `password`: String - Armazena a senha fornecida pelo usuário durante o login.
- `emailController`: TextEditingController - Controlador para o campo de entrada do endereço de e-mail do usuário.
- `passwordController`: TextEditingController - Controlador para o campo de entrada da senha do usuário.

#### Métodos:

- `userLogin(BuildContext context)`: Método assíncrono que realiza o login do usuário. Tenta autenticar o usuário no Firebase Authentication com o e-mail e senha fornecidos. Se o login for bem-sucedido, redireciona o usuário para a tela principal do aplicativo. Caso contrário, trata possíveis exceções, como usuário não encontrado ou senha incorreta, exibindo mensagens de erro apropriadas.

### Observações:

- O código utiliza o pacote `firebase_auth` para autenticação com o Firebase Authentication.
- O método `userLogin` faz uso do `BuildContext` para exibir SnackBars para fornecer feedback ao usuário durante o processo de login.
- O código utiliza controladores de texto (`TextEditingController`) para acessar e manipular os valores dos campos de entrada do formulário de login.
