defmodule CounterWeb.MessageLive do
  use CounterWeb, :live_view
  alias CounterWeb.HooksLive

  on_mount HooksLive

  def render(assigns) do
    ~H"""
    <p><%= @message %></p>
    """
  end

  def mount(_params, _session, socket) do
    {:ok, first_message(socket)}
  end

  def first_message(socket) do
    message = "Hello first mount message"
    assign(socket, :message, message)
  end
end
