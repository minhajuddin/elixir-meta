defmodule Math do
  defmacro say({:+, _, [lhs, rhs]}) do
    quote do
      lhs = unquote(lhs)
      rhs = unquote(rhs)
      result = lhs + rhs

      IO.puts("#{lhs} plus #{rhs} is #{result}")

      result
    end
  end
end

defmodule Test do
  require Math
  def test do
    Math.say(5 + 3)
  end
end

Test.test
