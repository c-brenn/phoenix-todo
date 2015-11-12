defmodule CsTodo.TodoController do
  use CsTodo.Web, :controller

  def index(conn, _parrams) do
    date = Ecto.DateTime.from_erl(:calendar.universal_time())
    query = from t in CsTodo.Todo,
            where: t.due_date >= ^date,
            select: t
    todos = Repo.all query
    render(conn, "index.html", todos: todos)
  end
end
