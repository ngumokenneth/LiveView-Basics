defmodule CounterWeb.HooksLive do
  require Logger
  use CounterWeb, :live_view

  def render(assigns) do
    ~H"""
    just empty
    """
  end

  def on_mount(_, _params, _session, socket) do
    {:cont, log_before_mount(socket)}
  end

  def log_before_mount(socket) do
    Logger.info(
      """
      ============================ hello from mount ===========================
      """,
      ansi_color: :green
    )

    socket |> call_back()
  end

  def call_back(socket) do
    socket
    |> attach_hook(:handle_event_message, :handle_event, fn _event, _params, socket ->
      Logger.info(
        """

        ============================ hello from handle_event ===========================
        """,
        ansi_color: :green
      )

      {:cont, socket}
    end)
  end

  def handle_params_call_back(socket) do
    socket
    |> attach_hook(:handle_event_message, :handle_params, fn _event, _params, socket ->
      Logger.info(
        """

        ============================ hello from handle_params ===========================
        """,
        ansi_color: :green
      )

      {:cont, socket}
    end)
  end
end
