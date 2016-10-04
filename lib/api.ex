defmodule HexVersion.Api do
  use Application

  def start() do
    start(nil, nil)
  end

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(HexVersion.Web, [])
    ]

    opts = [strategy: :one_for_one, name: HexVersion.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
