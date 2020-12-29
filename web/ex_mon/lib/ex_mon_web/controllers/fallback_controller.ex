defmodule ExMonWeb.FallbackController do
  use ExMonWeb, :controller

  def call(conn, {:error, :unauthoized}) do
    conn
    |> put_status(:unauthoized)
    |> put_view(ExMonWeb.ErrorView)
    |> render("401.json", message: "Trainer unauthorized")
  end

  def call(conn, {:error, result}) do
    conn
    |> put_status(:bad_request)
    |> put_view(ExMonWeb.ErrorView)
    |> render("400.json", result: result)
  end
end
