defmodule ExMonTest do
  use ExUnit.Case
  # Utilizamos esse modulo para captarar textos impresso sno console
  import ExUnit.CaptureIO

  alias ExMon.Player

  describe "create_player/4" do
    test "returns a player" do
      expected_response = %Player{
        life: 100,
        moves: %{
          move_avg: :voadora,
          move_heal: :cura,
          move_rnd: :cabecada
        },
        name: "Gui"
      }

      assert expected_response == ExMon.create_player("Gui", :voadora, :cabecada, :cura)
    end
  end

  describe "start_game/1" do
    test "when the game is started, returns a message" do
      player = Player.build("Gui", :voadora, :cabecada, :cura)

      messages =
        capture_io(fn ->
          assert ExMon.start_game(player) == :ok
        end)

      # =~ : permite usar regex em comparações
      assert messages =~ "The game is started!"
      assert messages =~ "status: :started"
      assert messages =~ "turn: :player"
    end
  end

  describe "make_move/1" do
    # Todo código de setup é executado antes de cada teste
    setup do
      player = Player.build("Gui", :voadora, :cabecada, :cura)

      capture_io(fn ->
        ExMon.start_game(player)
      end)

      # o setup sempre exige o retorno de uma variável ou apenas um :ok como abaixo

      # caso fosse de interesse enviar as variaveis do setup para os tests, bastava retorna-las em uma tupla
      # como no caso: {:ok, player: player: a: 1, b: 2, etc: "etc"}
      # neste caso você poderia utilizar o pattern match para dessa forma para obter os campos
      # test "when the move is valid, do the move and the computer makes a move", %{player: player, b: b}
      :ok
    end

    test "when the move is valid, do the move and the computer makes a move" do
      messages =
        capture_io(fn ->
          ExMon.make_move(:voadora)
        end)

      # =~ : permite usar regex em comparações
      assert messages =~ "The Player attacked the computer dealing"
      assert messages =~ "It's computer turn"
      assert messages =~ "It's player turn"
      assert messages =~ "status: :continue"
    end

    test "when the move is invalid, returns an error message" do
      messages =
        capture_io(fn ->
          ExMon.make_move(:wrong)
        end)

      # =~ : permite usar regex em comparações
      assert messages =~ "Invalid move: wrong"
    end
  end
end
