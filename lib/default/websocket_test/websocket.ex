defmodule Websocket do
  defdelegate available_products(), to: Websocket.Exchanges
  defdelegate subscribe_to_trades(product),
    to: Websocket.Exchanges, as: :subscribe

  defdelegate unscribe_from_trades(product),
  to: Websocket.Exchanges, as: :unsubscribe

  defdelegate get_last_trade(product), to: Websocket.Historical
  defdelegate get_last_trades(product), to: Websocket.Historical
end
