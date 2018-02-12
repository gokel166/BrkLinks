defmodule BrokenLinks.PageAnalyzer do
    # returns a list of broken urls
    #1. Allow user to enter a url
    #2. Parse out the links from (1)
    #3. Try to download html for the links from (2)
    #   if it fails for a link, it means that the link is broken
    def analyze(url) do
        #Download html of url
        case HTTPoison.get(url, [], [ ssl: [{:versions, [:'tlsv1.2']}] ]) do
            {:ok, %HTTPoison.Response{body: body}} ->
                #2. Parse out links from (1)
              links = parse_links(body)
              {:ok, links}
            oops ->
                {:error, inspect(oops)}
        end
        [%{text: "Random", href: "random.com"}]
    end

    defp parse_links(html) do
        Floki.find(html, "a")
        |> Enum.map(fn {_, attrs, [text]} ->
            {_ , href} = Enum.find(attrs, fn {k, v} k == "href" end)
        end)
    end
end