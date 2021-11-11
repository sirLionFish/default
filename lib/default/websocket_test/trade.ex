defmodule Websocket.Trade do
  defstruct [:product, :traded_at, :price, :volume]

  def new(fields) do
    struct!(__MODULE__, fields)
  end
end
