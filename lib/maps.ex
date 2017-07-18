defmodule JapaneseZenhan.Maps do

  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end

  def maps do
    quote do
      @map_digit_z2h %{
        "０" => "0",
        "１" => "1",
        "２" => "2",
        "３" => "3",
        "４" => "4",
        "５" => "5",
        "６" => "6",
        "７" => "7",
        "８" => "8",
        "９" => "9",
      }

      @map_alpha_z2h %{
        "ａ" => "a",
        "ｂ" => "b",
        "ｃ" => "c",
        "ｄ" => "d",
        "ｅ" => "e",
        "ｆ" => "f",
        "ｇ" => "g",
        "ｈ" => "h",
        "ｉ" => "i",
        "ｊ" => "j",
        "ｋ" => "k",
        "ｌ" => "l",
        "ｍ" => "m",
        "ｎ" => "n",
        "ｏ" => "o",
        "ｐ" => "p",
        "ｑ" => "q",
        "ｒ" => "r",
        "ｓ" => "s",
        "ｔ" => "t",
        "ｕ" => "u",
        "ｖ" => "v",
        "ｗ" => "w",
        "ｘ" => "x",
        "ｙ" => "y",
        "ｚ" => "z",
        "Ａ" => "A",
        "Ｂ" => "B",
        "Ｃ" => "C",
        "Ｄ" => "D",
        "Ｅ" => "E",
        "Ｆ" => "F",
        "Ｇ" => "G",
        "Ｈ" => "H",
        "Ｉ" => "I",
        "Ｊ" => "J",
        "Ｋ" => "K",
        "Ｌ" => "L",
        "Ｍ" => "M",
        "Ｎ" => "N",
        "Ｏ" => "O",
        "Ｐ" => "P",
        "Ｑ" => "Q",
        "Ｒ" => "R",
        "Ｓ" => "S",
        "Ｔ" => "T",
        "Ｕ" => "U",
        "Ｖ" => "V",
        "Ｗ" => "W",
        "Ｘ" => "X",
        "Ｙ" => "Y",
        "Ｚ" => "Z",
      }


      ### build hankaku -> zenkaku
      # digit
      map = @map_digit_z2h
      keys = Map.keys(map)
      @map_digit_h2z Enum.reduce(map, %{}, fn(x, acc) ->
        {key, value} = x
        Map.put(acc, value, key)
      end)

      # alpha
      map = @map_alpha_z2h
      keys = Map.keys(map)
      @map_alpha_h2z Enum.reduce(map, %{}, fn(x, acc) ->
        {key, value} = x
        Map.put(acc, value, key)
      end)
    end
  end
end
