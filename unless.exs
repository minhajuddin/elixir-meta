defmodule Mine do
  defmacro cool_unless(expr, blocks) do
    quote do
      if !unquote(expr) do
        unquote(blocks[:do])
      else
        unquote(blocks[:else])
      end
    end
  end
end

defmodule Test do
  import Mine, only: [cool_unless: 2]

  def test(cond) do
    cool_unless cond do
      IO.puts(:Hey)
    else
      IO.puts(Dang)
    end
  end
end

IO.inspect Test.test(true)
IO.inspect Test.test(false)
