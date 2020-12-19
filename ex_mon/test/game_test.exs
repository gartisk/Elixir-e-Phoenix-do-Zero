defmodule ExMon.GameTest do
  use ExUnit.Case

  alias ExMon.{Game, Player}

  describe "start/2" do
    test "starts the game state" do
      player = Player.build("Gui", :voadora, :cabecada, :cura)
      computer = Player.build("Robotiniki", :chute, :soco, :cura)

      assert {:ok, _pid} = Game.start(computer, player)
    end
  end

  describe "info/0" do
    test "returns the current game state" do
      player = Player.build("Gui", :voadora, :cabecada, :cura)
      computer = Player.build("Robotiniki", :chute, :soco, :cura)

      expected_response = %{
        computer: %Player{
          life: 100,
          moves: %{move_avg: :chute, move_heal: :cura, move_rnd: :soco},
          name: "Robotiniki"
        },
        player: %Player{
          life: 100,
          moves: %{move_avg: :voadora, move_heal: :cura, move_rnd: :cabecada},
          name: "Gui"
        },
        status: :started,
        turn: :player
      }

      Game.start(computer, player)

      assert expected_response == Game.info()
    end
  end

  describe "update/1" do
    test "returns the game state updated" do
      # inicia jogo com esta configuração
      player = Player.build("Gui", :voadora, :cabecada, :cura)
      computer = Player.build("Robotiniki", :chute, :soco, :cura)

      expected_response = %{
        computer: %Player{
          life: 100,
          moves: %{move_avg: :chute, move_heal: :cura, move_rnd: :soco},
          name: "Robotiniki"
        },
        player: %Player{
          life: 100,
          moves: %{move_avg: :voadora, move_heal: :cura, move_rnd: :cabecada},
          name: "Gui"
        },
        status: :started,
        turn: :player
      }

      Game.start(computer, player)

      assert expected_response == Game.info()

      # Inicia jogo com novo estado.
      new_state = %{
        computer: %Player{
          life: 85,                                                           # Modificado apenas a titulo de exemplo
          moves: %{move_avg: :chute, move_heal: :cura, move_rnd: :soco},
          name: "Robotiniki"
        },
        player: %Player{
          life: 50,                                                           # Modificado apenas a titulo de exemplo
          moves: %{move_avg: :voadora, move_heal: :cura, move_rnd: :cabecada},
          name: "Gui"
        },
        status: :started,
        turn: :player
      }

      Game.update(new_state)

      expected_response = %{new_state | turn: :computer, status: :continue}
      assert expected_response == Game.info()
    end
  end

end
