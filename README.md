Material do curso Elixir e Phoenix do zero! Crie sua primeira API Phoenix.
https://www.udemy.com/course/elixir-e-phoenix-do-zero/


Para instalar alguma dependencia:

```
mix deps.get
```

Para executar o credo

```
mix credo
```

A configuração do credo fica em ex_mon/.credo.exs

Para visualizar todas as rotas:

```
mix phx.routes
```

### Anotações:

**put_view**: Quando queremos utilizar uma view que tem um nome diferente do controle, precisamos utilizar a função put_view.
*ref: fallback_controller.ex*

**import com only**: Quando queremos importar somente uma função de um modulo específico, utilizamos conforme abaixo, onde 2 é a aridade:
```
    import Ecto.Changeset, only:[traverse_erros: 2]
```
*ref: fallback_controller.ex*