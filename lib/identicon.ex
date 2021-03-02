defmodule Identicon do
  @moduledoc """
  Provides method for creating an identicon based on a string
  """

 def main(input) do
  input
  |> has_input
  |> pick_color
  |> build_grid
 end

 @doc """
 Creates the whole grid, adding the index of every element in the list.
 Adds the grid element in the image structure
 """
 def build_grid(%Identicon.Image{hex: hex} = image) do
  grid = hex
  |> Enum.chunk_every(3, 3, :discard)
  |> Enum.map(&mirror_row/1)
  |> List.flatten
  |> Enum.with_index

  %Identicon.Image{image | grid: grid}
 end

 @doc """
 Creates a copy of the first and second elements of the provided array, in order to mirror the provided row
 """
 def mirror_row(row) do
  # [145, 46, 200]
  [first, second | _tail] = row

  #[145, 46, 200, 46, 145]
  row ++ [second, first]
 end

 @doc """
  Sets the color (rgb) for the identicon, using the first three elements of the hex list.
  Adds the color element in the image structure
 """
 def pick_color(%Identicon.Image{hex: [r, g, b | _tail]} = image) do
  %Identicon.Image{image | color: {r, g, b}}
 end

 @doc """
  Hashes the provided input using the md5 algorithm and returns a list of 16 numbers.
  Adds the hex element in the image structure
 """
 def has_input(input) do
  hex = :crypto.hash(:md5, input)
  |> :binary.bin_to_list

  %Identicon.Image{hex: hex}
 end
end
