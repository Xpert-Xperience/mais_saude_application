# Informações Branch

MODIFICAÇÕES A FAZER:


cadastro_view.dart:

```
 if (value == null || value.isEmpty) {
          return 'Por favor, preencha todos os dados';
        }
        return null;

```
- No código a cima a mesagem é apresentada em todos dos campos de texto, isso é problemático porque aumenta a quantidade de informações na tela, empurrando os elementos a baixo mais para baixo

- Adicionar opção de mostrar a senha digitada

novaSenha_view.dart:


```
 Padding(
              padding: const EdgeInsets.only(left: 0, right: 0),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Digite sua senha',
                  labelStyle: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                ),
              ),
            );
```

- TextField se repete, o mesmo pode ser reutilizado

historico_view.dart:
- O histórico deve ser referente às consultas agendadas pelo usuário

historico_view.dart, informacoes_view.dart, perfil_view.dart, marcacao1_view.dart, principal_view.dart:
- Reutilizar barra de navegacao inferior

perfil_view.dart:
- Não tem botão de retorno para a página anterior

## Notas para lembrar
- Estipular padrão para nome de classes
- Estipular linguagem padrão para variaveis, classes e metodos
- Teste nos botões de voltar, para não criar loop