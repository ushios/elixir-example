defmodule Example do
  def main(args) do
    args |> parse_args |> process
  end

  def process([]) do
    IO.puts "No arguments given"
  end

  def process(options) do
    if options[:raise] do
      raise "Hello World from raise"
    end

    if options[:output] do
      IO.puts "Hello World"
    end

    if options[:serve] do
      IO.puts "Starting server.."
      HexVersion.Api.start
    end
  end

  defp parse_args(args) do
    {options, _, _} = OptionParser.parse(args,
      aliases: [o: :output, s: :serve, r: :raise],
      switches: [serve: :boolean, output: :boolean, raise: :boolean],
    )
    options
  end
end
