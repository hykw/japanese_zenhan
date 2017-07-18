defmodule JapaneseZenhan do
  @moduledoc """
  Documentation for JapaneseZenhan.
  """

  @doc """
  ## Examples

      iex> JapaneseZenhan.z2h("０0aａあ0")
      "00aaあ0"

      iex> JapaneseZenhan.z2h("０0aａあ0", [:digit])
      "00aａあ0"

      iex> JapaneseZenhan.z2h("０0aａあ0", [:alpha])
      "０0aaあ0"

      iex> JapaneseZenhan.h2z("０0aａあ0")
      "００ａａあ０"

      iex> JapaneseZenhan.h2z("０0aａあ0", [:digit])
      "００aａあ０"
  """

  use JapaneseZenhan.Maps, :maps


  # zenkaku -> hankaku
  def z2h(str, opt \\ [:alpha, :digit]) when is_binary(str) do
    maps = get_map(:z2h, opt)
    do_conv(str, maps)
  end

  # hankaku -> zenkaku
  def h2z(str, opt \\ [:alpha, :digit]) when is_binary(str) do
    maps = get_map(:h2z, opt)
    do_conv(str, maps)
  end


  defp do_conv(str, maps) do
    str
    |> String.split("")
    |> Enum.map(fn(x) -> convert(maps, x) end)
    |> Enum.join("")
  end

  defp get_map(:z2h, :alpha), do: @map_alpha_z2h
  defp get_map(:z2h, :digit), do: @map_digit_z2h
  defp get_map(:h2z, :alpha), do: @map_alpha_h2z
  defp get_map(:h2z, :digit), do: @map_digit_h2z

  defp get_map(which, opt) do
    opt
    |> Enum.map(fn(key) -> get_map(which, key) end)
    |> Enum.reduce(fn(x, acc) -> Map.merge(acc, x) end)
  end

  defp convert(chars_map, char) do
    Map.get(chars_map, char, char)
  end

end
