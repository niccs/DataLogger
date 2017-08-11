defmodule DataLoggerWeb.PageController do
  use DataLoggerWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
