# Documentação do Controller de Cadastro

Este arquivo contém o código-fonte para o controller responsável pelo cadastro de usuários em um aplicativo Flutter utilizando Firebase Authentication.

### Classe: CadastroController

#### Variáveis:

- `email`: String - Armazena o endereço de e-mail fornecido pelo usuário durante o cadastro.
- `nome`: String - Armazena o nome fornecido pelo usuário durante o cadastro.
- `senha`: String - Armazena a senha fornecida pelo usuário durante o cadastro.
- `confirmarSenha`: String - Armazena a confirmação da senha fornecida pelo usuário durante o cadastro.
- `matriculaController`: TextEditingController - Controlador para o campo de entrada da matrícula do usuário.
- `nomeController`: TextEditingController - Controlador para o campo de entrada do nome do usuário.
- `emailController`: TextEditingController - Controlador para o campo de entrada do endereço de e-mail do usuário.
- `telefoneController`: TextEditingController - Controlador para o campo de entrada do telefone do usuário.
- `senhaController`: TextEditingController - Controlador para o campo de entrada da senha do usuário.
- `confirmarSenhaController`: TextEditingController - Controlador para o campo de confirmação de senha do usuário.

#### Métodos:

- `registerUser(BuildContext context)`: Método assíncrono que realiza o registro do usuário. Verifica se o nome e o e-mail fornecidos pelo usuário não estão vazios. Em caso afirmativo, tenta criar um usuário no Firebase Authentication com o e-mail e senha fornecidos. Se o registro for bem-sucedido, exibe uma mensagem de sucesso e redireciona o usuário para a tela de login. Caso contrário, trata possíveis exceções, como senha fraca ou e-mail já cadastrado, exibindo mensagens de erro apropriadas.

### Observações:

- O código utiliza o pacote `firebase_auth` para autenticação com o Firebase Authentication.
- O método `registerUser` faz uso do `BuildContext` para exibir SnackBars para fornecer feedback ao usuário durante o processo de cadastro.
- O código utiliza controladores de texto (`TextEditingController`) para acessar e manipular os valores dos campos de entrada do formulário de cadastro.
