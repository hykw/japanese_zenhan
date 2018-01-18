defmodule JapaneseZenhanTest do
  use ExUnit.Case
  doctest JapaneseZenhan

  test "the truth" do
    assert 1 + 1 == 2
  end

  @digit_zenkaku "０１２３４５６７８９"
  @digit_hankaku "0123456789"

  @alpha_hankaku_U "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
  @alpha_hankaku_L "abcdefghijklmnopqrstuvwxyz"

  @alpha_zenkaku_U "ＡＢＣＤＥＦＧＨＩＪＫＬＭＮＯＰＱＲＳＴＵＶＷＸＹＺ"
  @alpha_zenkaku_L "ａｂｃｄｅｆｇｈｉｊｋｌｍｎｏｐｑｒｓｔｕｖｗｘｙｚ"

  defp get_concat_str(:digit) do
    @digit_zenkaku <> @digit_hankaku
  end

  defp get_concat_str(:alpha) do
    @alpha_hankaku_U <> @alpha_hankaku_L <> @alpha_zenkaku_U <> @alpha_zenkaku_L
  end

  describe "zenkaku to hankaku" do
    test "digit" do
      expects = @digit_hankaku <> @digit_hankaku
      src = get_concat_str(:digit)
      assert expects == JapaneseZenhan.z2h(src)
    end

    test "alpha" do
      expects = @alpha_hankaku_U <> @alpha_hankaku_L <> @alpha_hankaku_U <> @alpha_hankaku_L
      src = get_concat_str(:alpha)
      assert expects == JapaneseZenhan.z2h(src)
    end

    test "digit + alpha" do
      expects =
        @digit_hankaku <>
          @digit_hankaku <>
          @alpha_hankaku_U <> @alpha_hankaku_L <> @alpha_hankaku_U <> @alpha_hankaku_L

      src = get_concat_str(:digit) <> get_concat_str(:alpha)
      assert expects == JapaneseZenhan.z2h(src)
    end

    test "only digit" do
      alphas = get_concat_str(:alpha)
      expects = @digit_hankaku <> @digit_hankaku <> alphas
      src = get_concat_str(:digit) <> alphas
      assert expects == JapaneseZenhan.z2h(src, [:digit])
    end

    test "only alpha" do
      expects =
        get_concat_str(:digit) <>
          @alpha_hankaku_U <> @alpha_hankaku_L <> @alpha_hankaku_U <> @alpha_hankaku_L

      src = get_concat_str(:digit) <> get_concat_str(:alpha)
      assert expects == JapaneseZenhan.z2h(src, [:alpha])
    end
  end

  describe "hankaku to zenkaku" do
    test "digit" do
      expects = @digit_zenkaku <> @digit_zenkaku
      src = get_concat_str(:digit)
      assert expects == JapaneseZenhan.h2z(src)
    end

    test "alpha" do
      expects = @alpha_zenkaku_U <> @alpha_zenkaku_L <> @alpha_zenkaku_U <> @alpha_zenkaku_L
      src = get_concat_str(:alpha)
      assert expects == JapaneseZenhan.h2z(src)
    end

    test "digit + alpha" do
      expects =
        @digit_zenkaku <>
          @digit_zenkaku <>
          @alpha_zenkaku_U <> @alpha_zenkaku_L <> @alpha_zenkaku_U <> @alpha_zenkaku_L

      src = get_concat_str(:digit) <> get_concat_str(:alpha)
      assert expects == JapaneseZenhan.h2z(src)
    end

    test "only digit" do
      alphas = get_concat_str(:alpha)
      expects = @digit_zenkaku <> @digit_zenkaku <> alphas
      src = get_concat_str(:digit) <> alphas
      assert expects == JapaneseZenhan.h2z(src, [:digit])
    end

    test "only alpha" do
      expects =
        get_concat_str(:digit) <>
          @alpha_zenkaku_U <> @alpha_zenkaku_L <> @alpha_zenkaku_U <> @alpha_zenkaku_L

      src = get_concat_str(:digit) <> get_concat_str(:alpha)
      assert expects == JapaneseZenhan.h2z(src, [:alpha])
    end
  end
end
