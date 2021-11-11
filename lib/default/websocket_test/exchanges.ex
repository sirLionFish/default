defmodule Websocket.Exchanges do
   alias Websocket.{Product}

    @clients [
    Websocket.Exchanges.CoinbaseClient
    ]

  @available_products (for client <- @clients, pair <- client.available_currency_pairs() do
  Product.new(client.exchange_name(), pair)
  end)

  def clients, do: @clients

  def available_products(), do: @available_products

  def subscribe(product) do
    Phoenix.PubSub.subscribe(Default.PubSub, topic(product))
  end

  def unsubscribe(product) do
    Phoenix.PubSub.unsubscribe(Default.PubSub, topic(product))
  end

  def broadcast(trade) do
    Phoenix.PubSub.broadcast(Default.PubSub, topic(trade.product), {:new_trade, trade})
  end

  defp topic(product) do
    to_string(product)
  end
end
