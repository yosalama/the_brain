defmodule TheBrain.Benchmark do
  alias TheBrain.Impl.Bumblebee

  # This will be run once before the benchmarks to set up the environment
  def setup_env do
    {:ok, serving} = Bumblebee.get_model()
    {serving, "Paris is the capital of [MASK]"}
  end

  def run_benchmark do
    {serving, query} = setup_env()

    Benchee.run(%{
      "get_predictions" => fn -> Bumblebee.get_predictions(serving, query) end
    })
  end
end
