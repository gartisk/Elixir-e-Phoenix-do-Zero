defmodule ExMonWeb.TrainersController do
  use ExMonWeb, :controller

  action_fallback ExMonWeb.FallbackController

  def create(conn, params) do
    params
    |> ExMon.create_trainer()
    |> handle_response(conn)
  end

  defp handle_response({:ok, trainer}, conn) do
    conn
    |> put_status(:ok)                  # tanto faz usar 200 ou :ok
    |> render("create.json", trainer: trainer)
  end

  defp handle_response({:error, _changeset} = error, conn), do: error

end
