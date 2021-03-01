defmodule Identicon do
  @moduledoc """
  Provides method for creating an identicon based on a string
  """

 def main(input) do
  input
  |> has_input
 end

 @doc """
  Hashes the provided input using the md5 algorithm and returns a list of 16 numbers
 """
 def has_input(input) do
  :crypto.hash(:md5, input)
  |> :binary.bin_to_list
 end
end
