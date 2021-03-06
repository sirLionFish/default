defmodule Websocket.Product do
  defstruct [:exchange_name, :currency_pair]


  def new(exchange_name, currency_pair) do
    %__MODULE__{
      exchange_name: exchange_name,
      currency_pair: currency_pair
    }
  end

  defimpl String.Chars do
    def to_string(product) do
      product.exchange_name <> ":" <> product.currency_pair
    end
  end
end
