defmodule Identicon do
  @moduledoc """
  Provides method for creating an identicon based on a string
  """

 def main(input) do
  input
  |> has_input
  |> pick_color
 end

 def pick_color(%Identicon.Image{hex: [r, g, b | _tail]} = image) do


  %Identicon.Image{image | color: {r, g, b}}
 end

 @doc """
  Hashes the provided input using the md5 algorithm and returns a list of 16 numbers
 """
 def has_input(input) do
  hex = :crypto.hash(:md5, input)
  |> :binary.bin_to_list

  %Identicon.Image{hex: hex}
 end
end
