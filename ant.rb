class Ant
  class << self
    def fact(n)
      if n.zero?
        1
      else
        n * fact(n - 1)
      end
    end

    def fib(n)
      if n.zero?
        0
      elsif n == 1
        1
      else
        fib(n - 1) + fib(n - 2)
      end
    end
  end
end
