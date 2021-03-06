defmodule Mix.Tasks.Katalyst.Server.Start do

  @shortdoc "Starts the main server and all the children"

  @moduledoc """
  Convenient task to start the main application.
  This is basically a wrapper around the `mix run` command.

  ## Command line options

  This task accepts the same command-line arguments as `run`.
  The `--no-halt` flag is automatically added to run the app indefinitely.
  For more informations, refer to [Mix.Tasks.Run
  Doc](https://hexdocs.pm/mix/Mix.Tasks.Run.html#module-command-line-options)
  
  ## Example
    $ mix katalyst.server.start

  """
  
  @recursive true

  use Mix.Task

  @doc false
  def run(args) do
    args = in_iex_context?() && args || ["--no-halt" | args] 
    Mix.Task.run "run", args
  end

  @spec in_iex_context?() :: boolean
  defp in_iex_context?, do: Code.ensure_loaded?(IEx) and IEx.started?
end