defmodule CounterWeb.CounterLive do
  use CounterWeb, :live_view

  def render(assigns) do
    ~H"""
    <h1>Counter: <%= @count %></h1>
    <div>
      <button class="bg-indigo-500 px-6 rounded-lg text-white" phx-click="add">Increase</button>
      <button class="bg-rose-500 px-6 rounded-lg text-white" phx-click="subtract">Decrease</button>
    </div>
    """
  end

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :count, 0)}
  end


  def handle_event("add", _unsigned_params, socket) do
    new_count = socket.assigns.count + 1
    {:noreply, assign(socket, count: new_count)}
  end
  def handle_event("subtract", _unsigned_params, socket) do
    new_count = socket.assigns.count - 1
    {:noreply, assign(socket, count: new_count)}
  end
end
