defmodule TestSchemaWeb.PageController do
  use TestSchemaWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
