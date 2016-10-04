defmodule Serve do
  # use Cauldron
  #
  # def handle("GET", %URI{path: "/"}, req) do
  # req |> Request.reply(200, "Hello, World")
  # end

  import Plug.Conn

  def init(options) do
    # initialize options

    options
  end

  def call(conn, _opts) do
    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(200, "Hello world")
  end
end
