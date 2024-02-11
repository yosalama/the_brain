defmodule TheBrain.Impl.Bumblebee do

  def get_model do
    {:ok, model_info} = Bumblebee.load_model({:hf, "bert-base-uncased"})
    {:ok, tokenizer} = Bumblebee.load_tokenizer({:hf, "bert-base-uncased"}) 
   
    serving = Bumblebee.Text.fill_mask(model_info, tokenizer)
    
    {:ok, serving}
  end
  
end
