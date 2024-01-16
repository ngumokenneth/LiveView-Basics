defmodule CounterWeb.ClockLive do
  use CounterWeb, :live_view

  def mount(_params, _session, socket) do
    if connected?(socket), do: :timer.send_interval(2000, self(), :tick)

    {:ok, assign(socket, :count, 0)}
  end

  def render(assigns) do
    ~H"""
    <h1 class="text-3xl font-bold">Clock: <span class="text-rose-900 font-bold "><%= @count %></span></h1>


    """
  end

  def handle_info(:tick, socket) do
    new_count = socket.assigns.count + 1
    {:noreply, assign(socket, :count, new_count)}
  end
end
