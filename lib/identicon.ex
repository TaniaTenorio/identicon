defmodule Identicon do
  @moduledoc """
  Provides method for creating an identicon based on a string
  """

 def main(input) do
  input
  |> has_input
  |> pick_color
  |> build_grid
  |> filter_odd_squares
  |> build_pixel_map
 end

 def build_pixel_map(%Identicon.Image{grid: grid} = image) do
  pixel_map = Enum.map grid, fn({_code, index}) ->
    horizontal = rem(index, 5) *50
    vertical = div(index, 5) * 50

    top_left = {horizontal, vertical}
    bottom_right = {horizontal + 50, vertical + 50}

    {top_left, bottom_right}
  end

  %Identicon.Image{image | pixel_map: pixel_map}
 end

 @doc """
  Filters the odd values from the grid and updates the image structure
 """
 def filter_odd_squares(%Identicon.Image{grid: grid} = image) do
  grid = Enum.filter grid, fn({code, _index}) ->
    rem(code, 2) == 0
  end

  %Identicon.Image{image | grid: grid}
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
