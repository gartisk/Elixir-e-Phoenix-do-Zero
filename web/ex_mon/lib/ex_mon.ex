defmodule ExMon do
  alias ExMon.Trainer

  defdelegate create_trainer(params), to: Trainer.Create, as: :call
end
