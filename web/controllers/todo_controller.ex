defmodule CsTodo.TodoController do
  use CsTodo.Web, :controller

  def index(conn, _parrams) do
    render conn, "index.html"
  end
end
