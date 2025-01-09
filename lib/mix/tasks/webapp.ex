defmodule Mix.Tasks.Webapp do
  @moduledoc """
  Astro compilation and building for production
  """
  use Mix.Task
  require Logger

  @public_path "./priv/static/webapp"
  @shortdoc "Compile and build Astro for production"

  def run(_) do
    Logger.info("Installing Yarn Packages")
    System.cmd("yarn", ["install", "--quiet"], cd: "./frontend")

    Logger.info("Compiling Astro")
    System.cmd("yarn", ["run", "build"], cd: "./frontend")

    Logger.info("Moving dist folder to Phoenix at #{@public_path}")
    System.cmd("rm", ["-rf", @public_path])
    System.cmd("cp", ["-R", "./frontend/dist", @public_path])

    Logger.info("Astro ready to blast off!")
  end
end
