# Projeto Mais Saúde

## Organização dos diretórios:

 - lib
    ├── controller
    |   ├── cadastro
    |   |   └── cadastro_controller.dart
    |   └── login
    |       └── login_controller.dart
    ├── model
    |   └── usuario.dart   
    ├── services
    |   ├── auth_service.dart
    |   └── database_service.dart
    ├── views 
    |   ├── cadastro
    |   |   └── cadastro_view.dart
    |   ├── esqueceu_senha
    |   |   ├── confcheck.dart
    |   |   ├── confirmar_esqueceu_senha_view.dart
    |   |   └── novaSenha.dart
    |   ├── inicio
    |   |   └── inicio_view.dart
    |   ├── login
    |   |   └── login_view.dart
    |   ├── perfil
    |   |   └── perfil.dart
    |   └── principal
    |       └── principal_view.dart
    └── main.dart

    ## Sobre o funcionamento do projeto:
    Ficamos acordados de criar uma branch para cada tela a ser implementada.
    Essa decisão vem para que possamos trabalhar de forma assíncrona sem causar-mos erros nos trabalhos dos outros