Curso [Elixir e Phoenix do zero! Crie sua primeira API Phoenix]([https://link](https://www.udemy.com/course/elixir-e-phoenix-do-zero/))

Baixar Depedências:

```
mix deps.get
```

#### Credo
A configuração do credo fica em ex_mon/.credo.exs
Executar Credo:

```
mix credo
```

### ExMon WEB

Para visualizar todas as rotas:

```
mix phx.routes
```

Visualizar todos os trainers:

```
ExMon.Repo.all(ExMon.Trainer)
```

Editar um trainer

```
params = %{"id" => "53d91561-e609-414c-a8a0-f05d0c074859", "name" => "Crazy", "password" => "789456"} 
ExMon.Trainer.Update.call(params)
```

Testar Poke Client API

```
ExMon.PokeApi.Client.get_pokemon("pikachu")
```

```
{:ok, pokemon} = "scyther" |> ExMon.PokeApi.Client.get_pokemon()
ExMon.Pokemon.build(pokemon)
```

```
ExMon.fetch_pokemon("pikachu") 
```

Inserindo um pokémon no banco

```
params = %{"name" => "pikachu", "nickname" => "Bigodin", "trainer_id" => "07071f4d-6582-4c87-bcd7-74f24713caee"}
ExMon.Trainer.Pokemon.Create.call(params)
```

Visualizar todos os pokémons

```
ExMon.Repo.all(ExMon.Trainer.Pokemon)
```

Para carregar o treinador e os pokemons associados a ele:

```
ExMon.Repo.get(ExMon.Trainer, "07071f4d-6582-4c87-bcd7-74f24713caee") |> ExMon.Repo.preload(:pokemon)
```

Para carregar o pokemon e seus respectivo treinador:

```
ExMon.Trainer.Pokemon.Get.call("80aff1df-bd10-440f-b6ed-c84a0980aaeb")
```

Para atualizar um pokemon

```
ExMon.Trainer.Pokemon.Update.call(%{"id" => "80aff1df-bd10-440f-b6ed-c84a0980aaeb", "nickname" => "orelhinha"}) 
```
### Anotações:

**put_view**: Quando queremos utilizar uma view que tem um nome diferente do controle, precisamos utilizar a função put_view.
*ref: fallback_controller.ex*

**import com only**: Quando queremos importar somente uma função de um modulo específico, utilizamos conforme abaixo, onde 2 é a aridade:
```
    import Ecto.Changeset, only:[traverse_erros: 2]
```
*ref: fallback_controller.ex*

**@enforce_keys**
força o uso de todas as chaves de um estrutura;
```
    @keys [:id, :name, :weight: :types]
    @enforce_keys @keys
```
*ref: pokemon.ex*

**@derive Jason.Encoder**
Essa diretiva permite que automaticamente a struct consegue ser encodada para JSON
*ref: pokemon.ex*

#### Outros

Para agilizar os testes via client HTTP salvei as entradas no arquivo **PostmanRequestsExported.json**