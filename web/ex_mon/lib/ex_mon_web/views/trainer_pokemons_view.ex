defmodule ExMonWeb.TrainerPokemonsView do
  use ExMonWeb, :view

  alias ExMon.Trainer.Pokemon

  def render("create.json", %{
        pokemon: %Pokemon{
          id: id,
          name: name,
          inserted_at: inserted_at,
          nickname: nickname,
          types: types,
          trainer_id: %{id: trainer_id, name: trainer_name},
          weight: weight
        }
      }) do
    %{
      message: "Pokemon created!",
      pokemon: %{
        id: id,
        name: name,
        inserted_at: inserted_at,
        nickname: nickname,
        types: types,
        trainer_id: %{id: trainer_id, name: trainer_name},
        weight: weight
      }
    }
  end

  def render("show.json", %{
    pokemon: %Pokemon{
      id: id,
      name: name,
      inserted_at: inserted_at,
      nickname: nickname,
      types: types,
      trainer: %{id: trainer_id, name: trainer},
      weight: weight
    }
  }) do
  %{
    pokemon: %{
      id: id,
      name: name,
      inserted_at: inserted_at,
      nickname: nickname,
      types: types,
      trainer: %{id: trainer_id, name: trainer},
      weight: weight
    }
  }
  end

end
