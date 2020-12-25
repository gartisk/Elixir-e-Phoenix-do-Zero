defmodule ExMonWeb.TrainersView do
  use ExMonWeb, :view

  def render("create.json", %{trainer: trainer}) do
    %{
      message: "Trainer created!"
    }
  end
end
