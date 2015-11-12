defmodule CsTodo.TodoController do
  use CsTodo.Web, :controller
  alias CsTodo.Todo

  def index(conn, _params) do
    date = Ecto.DateTime.from_erl(:calendar.universal_time())
    query = from t in Todo,
    where: t.due_date >= ^date,
    order_by: [asc: t.due_date],
    select: t
    todos = Repo.all query
    render(conn, "index.html", todos: todos)
  end

  def new(conn, _params) do
    changeset = Todo.changeset(%Todo{})
    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"todo" => todo_params}) do
    changeset = Todo.changeset(%Todo{}, todo_params)
    case Repo.insert(changeset) do
      {:ok, _todo} ->
        conn
        |> put_flash(:info, "Todo created successfully.")
        |> redirect(to: "/")
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
