defmodule Brokelinks.PageController do
  use Brokelinks.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def analyze(conn, params) do
    render conn, "analyze.html"
  end
end
