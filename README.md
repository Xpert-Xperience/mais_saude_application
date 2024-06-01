# Projeto Mais Saúde - Aplicação mobile

## Organização dos diretórios:

 - `lib/`: Contém o código-fonte do projeto.
  - `controller/`: Controllers responsáveis pela lógica de negócio.
    - `login_controller.dart`
    - `registration_controller.dart`

  - `model/`: Models representando a estrutura de dados.
    - `user_model.dart`: Modelo para usuário.

  - `views/`: Telas e componentes visuais.
    - `components/`:  Armazena todos os componentes reutilizáveis da sua aplicação.
      - `calendar/`: Calendário e utilitário utilizado na marcação de consultas.
        - `calendar.dart`
        - `utils.dart`
      - `custom_bottom_navigation_bar.dart`: Barra de navegação inferior.
    - `pages/`: Telas da aplicação.
      - `checkin_cancel_view.dart`: Permite sair da fila de espera da psicologia.
      - `checkin_confirmation_view.dart`: Permite entrar na fila de espera da psicologia.
      - `checkin_view.dart`: Apresenta a fila de espera da psicologia.
      - `forgot_password_view.dart`: Para inserir o email para qual será enviado o pedido de troca de senha.
      - `historic_schedule_information_view.dart`: Apresenta informações da consulta apartir de consulta pelo histórico.
      - `historic_view.dart`: Apresenta histórico de consultas, elas são apresentadas aqui apartir do instante que são marcadas.
      - `home_application_view.dart`: Principal da aplicação.
      - `initial_presentation_view.dart`: Inicial ao entrar na aplicação, apresenta curtas informações.
      - `login_view.dart`: Apresenta formulário de login.
      - `profile_view.dart`: Apresenta perfil do usuário, informações cadastradas.
      - `registration_view.dart`: Apresenta formulário de cadastro do usuário.
      - `schedule_appoiment_select_date_view.dart`: Apresenta o calendário para iniciar agendamento de consulta, permite escolher o dia.
      - `schedule_appoiment_select_time_view.dart`: Apresenta horários para agendar consulta, apresenta campo de texto para descrição e campo para atletas.
      - `schedule_cancel_view.dart`: Permite cancelar consulta agendada, através do histórico de consultas.
      - `schedule_confirmation_view.dart`: Apresenta aviso de envio de email para o email cadastrado pelo usuário.
- `firebase_options.dart`: Configurações de uso do firebasee
- `main.dart`: Arquivo principal do aplicativo.

## Padrão de código a ser utilizado: 
  - Todo texto (menos comentário) deverá ser escrito em inglês.
  - Os nomes de arquivos obrigatoriamente deverão ser escritos usando a convenção Snake case "minusculas_underline".
  - Os nomes de classes deverão, obrigatoriamente, ser escritos usando Pascal case "PrimeirasLetrasMaiusculas".
  - Os nomes de funções, métodos, variáveis ou constantes deverão ser escritos usando Camel case "primeiraPalavraPrimeiraLetraMinusculaORestanteNao".
  - Ao criar as funções, métodos, variáveis ou constantes, levar em consideração a funcionalidade para a escolha do nome, utilizar nomes que facilitem a compreensão.
