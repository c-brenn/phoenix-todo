defmodule CsTodo.PageController do
  use CsTodo.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
