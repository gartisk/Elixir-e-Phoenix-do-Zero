# ExMon

### Comandos do Jogo

Criar Jogador e Iniciar Partida:
    
    ExMon.create_player("Gui", :voadora, :cabecada, :cura) |> ExMon.start_game

Ataque:

    ExMon.make_move(:voadora)
    ExMon.make_move(:cabecada)

Cura:
    
    ExMon.make_move(:cura)

Status da Partida:
    
    ExMon.Game.info