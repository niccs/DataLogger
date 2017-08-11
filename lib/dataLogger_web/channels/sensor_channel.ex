defmodule DataLoggerWeb.SensorChannel do
  use Phoenix.Channel
  require Logger

  def join("sensor:1" ,_message, socket) do
    # Process.flag(:trap_exit, true)
    # :timer.send_interval(5000, :ping)
    # send(self, {:after_join, message})

    {:ok, socket}
  end

  # def join("rooms:" <> _private_subtopic, _message, _socket) do
  #   {:error, %{reason: "unauthorized"}}
  # end

  # def handle_info({:after_join, msg}, socket) do
  #   broadcast! socket, "user:entered", %{user: msg["user"]}
  #   push socket, "join", %{status: "connected"}
  #   {:noreply, socket}
  # end
  #
  # def handle_info(:ping, socket) do
  #   push socket, "new:msg", %{user: "SYSTEM", body: "ping"}
  #   {:noreply, socket}
  # end
  #
  # def terminate(reason, _socket) do
  #   Logger.debug"> leave #{inspect reason}"
  #   :ok
  # end

  # def handle_in("new_msg",  %{"data" => %{"type" => "message", "id" => message_id, "attributes" => %{"user-id" => user_id, "text" => text, "conversation-id" => conversation_id}}}, socket) do
  #   broadcast_from! socket, "new_msg",   %{"data" => %{"type" => "message", "id" => message_id, "attributes" => %{"user-id" => user_id, "text" => text, "conversation-id" => conversation_id}}}
  #   {:noreply, socket}
  # end

  def handle_in(_otherMessage, _otherParams, socket) do
    {:noreply, socket}
  end

end
