defmodule ExMon do
  # Podemos encurtar ou modificar o path do namespace dos modulos que utilimos
  # utilizando o comando abaixo, caso queira renomear adicione ", as: Novo_Nome"
  alias ExMon.Player

  def create_player(name, move_avg, move_rnd, move_heal) do
    Player.build(name, move_avg, move_rnd, move_heal)
  end
end
