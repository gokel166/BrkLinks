defmodule Brokelinks.PageController do
  use Brokelinks.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
