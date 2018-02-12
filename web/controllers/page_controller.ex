defmodule Brokelinks.PageController do
  use Brokelinks.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def analyze(conn, %{"url" => url}) do
    broken_links = BrokenLinks.PageAnalyzer.analyze(url)
    render conn, "analyze.html", url: url, broken_links: broken_links
  end
end
