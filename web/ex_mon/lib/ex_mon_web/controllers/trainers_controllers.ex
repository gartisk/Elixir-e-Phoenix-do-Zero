defmodule ExMonWeb.TrainersController do
  use ExMonWeb, :controller

  def create(conn, params) do
    params
    |> ExMon.create_trainer()
    |> handle_response(conn)
  end

  defp handle_response({:ok, trainer}, conn)
  conn
  |> put_status(:ok)                  # tanto faz usar 200 ou :ok
  |> render("create.json", trainer: trainer)
end
