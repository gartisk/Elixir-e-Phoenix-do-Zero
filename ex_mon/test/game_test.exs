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

  describe "player/0" do
    test "returns the player" do
      player = Player.build("Gui", :voadora, :cabecada, :cura)
      computer = Player.build("Robotiniki", :chute, :soco, :cura)

      expected_response = %Player{life: 100, moves: %{move_avg: :voadora, move_heal: :cura, move_rnd: :cabecada}, name: "Gui"}

      Game.start(computer, player)

      assert expected_response == Game.player()
    end
  end

  describe "turn/0" do
    test "returns the turn" do
      player = Player.build("Gui", :voadora, :cabecada, :cura)
      computer = Player.build("Robotiniki", :chute, :soco, :cura)

      expected_response = :player

      Game.start(computer, player)

      assert expected_response == Game.turn()
    end
  end

  describe "fetch_player/0" do
    test "returns the fetch_player" do
      player = Player.build("Gui", :voadora, :cabecada, :cura)
      computer = Player.build("Robotiniki", :chute, :soco, :cura)

      expected_response_computer = %Player{
        life: 100,
        moves: %{
          move_avg: :chute,
          move_heal: :cura,
          move_rnd: :soco
        },
        name: "Robotiniki"
      }

      expected_response_player = %Player{
        life: 100,
        moves: %{
          move_avg: :voadora,
          move_heal: :cura,
          move_rnd: :cabecada
        },
        name: "Gui"
      }

      Game.start(computer, player)

      assert expected_response_computer == Game.fetch_player(:computer)

      assert expected_response_player == Game.fetch_player(:player)
    end
  end

end
