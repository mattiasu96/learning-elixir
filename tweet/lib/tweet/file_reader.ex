defmodule Tweet.FileReader do
  def get_strings_to_tweet(path) do
    File.read!(path) # The difference between read and read! is that read! returns just the read element, raise error if fails, read returns {:ok, data}
    |> String.split("\n")
    |> Enum.map(&String.trim/1)
    |> Enum.filter(&String.length(&1) <= 140) # equivalent to Enum.filter(fn str -> String.length(str) <= 140 end)
  end

end
