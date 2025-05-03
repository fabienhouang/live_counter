defmodule LiveCounterWeb.MarkdownLive do
  use LiveCounterWeb, :live_view
  import Phoenix.HTML

  def mount(_params, _session, socket) do
    {:ok, assign(socket, markdown: "", rendered: "")}
  end

  def handle_event("update_markdown", %{"markdown" => markdown}, socket) do
    IO.inspect(markdown, label: ">>> received markdown")
    html = Earmark.as_html!(markdown)
    {:noreply, assign(socket, markdown: markdown, rendered: html)}
  end
end
