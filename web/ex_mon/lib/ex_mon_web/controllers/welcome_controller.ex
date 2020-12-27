defmodule ExMonWeb.WelcomeController do
  use ExMonWeb, :controller

  def index(conn, _params) do
    IO.inspect(conn)
    text(conn, "Welcome to the ExMon API!")
  end
end
