defmodule CounterWeb.GuessLive do
  @moduledoc """
  This live_view will create a number guessing game. The user will click on a number and
  the live view will send message back.
  """
  use CounterWeb, :live_view
  on_mount CounterWeb.HooksLive

  def mount(_params, _session, socket) do
    {:ok, assign(socket, score: 0, correct_guess: 5)}
  end

  def handle_event("guess", %{"number" => n}, socket) do
    score = socket.assigns.score
    correct_guess = socket.assigns.correct_guess

    if String.to_integer(n) == correct_guess do
      {:noreply, assign(socket, :score, score + 1)}
    else
      {:noreply, assign(socket, :score, score - 1)}
    end
  end
end
