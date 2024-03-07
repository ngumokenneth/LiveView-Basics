defmodule CounterWeb.FormLive do
  use CounterWeb, :live_view
  alias Counter.Accounts.User

  def render(assigns) do
    ~H"""
    <.simple_form for={@form}>
      <.input field={@form[:email]} type="email" label="Email" />
      <:actions>
        <.button>Save</.button>
      </:actions>
    </.simple_form>
    """
  end

  def mount(_params, _session, socket) do
    {:ok, socket |> inital_socket}
  end

  def inital_socket(socket) do
    socket
    |> assign_user()
    |> assign_form()
  end

  def assign_user(socket) do
    assign(socket, :user, %User{})
  end

  def assign_form(socket) do
    form =
      socket.assigns.user
      |> User.change_user()
      |> to_form()

    assign(socket, :form, form)
  end
end
