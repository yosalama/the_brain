defmodule TheBrain.Impl.Bumblebee do

  def get_model do
    models_dir_path = "/home/youssif/Documents/muntik/playground/prototype/models"
    model_name = "bert-base-uncased"
    path = Path.join(models_dir_path, model_name)

    {:ok, model_info} = Bumblebee.load_model({:local, path})
    {:ok, tokenizer} = Bumblebee.load_tokenizer({:local, path}) 
   
    serving = Bumblebee.Text.fill_mask(model_info, tokenizer)
    
    {:ok, serving}
  end

  def get_predictions(serving, query) do
    predictions = Nx.Serving.run(serving, query)
    {:ok, predictions}
  end

  def get_top_prediction(serving, query) do
    {:ok, predictions} = get_predictions(serving, query)
    top_prediction = 
      predictions[:predictions] 
        |> List.first()
    {:ok, top_prediction}
  end
end
