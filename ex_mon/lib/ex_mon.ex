defmodule ExMon do
  # Podemos encurtar ou modificar o path do namespace dos modulos que utilimos
  # utilizando o comando abaixo, caso queira renomear adicione ", as: Novo_Nome"
  alias ExMon.{Game, Player}
  alias ExMon.Game.{Actions, Status}

  @computer_name "Robotinik"

  def create_player(name, move_avg, move_rnd, move_heal) do
    Player.build(name, move_avg, move_rnd, move_heal)
  end

  def start_game(player) do
    @computer_name
    |> create_player(:punch, :kick, :heal)
    |> Game.start(player)

    Status.print_round_message()
  end

  def make_move(move) do
    move
    |> Actions.fetch_move
  end
end
