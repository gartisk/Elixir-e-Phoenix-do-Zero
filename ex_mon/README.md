# ExMon

Para adicionar um player e iniciar a partida
ExMon.create_player("Gui", :voadora, :cabecada, :cura) |> ExMon.start_game

Para ver se movimento é válido
ExMon.make_move(:voadora)

Para verificar o estado
ExMon.Game.info