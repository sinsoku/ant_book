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

    def dfs(a, k, i, sum)
      n = a.length
      if i == n
        sum == k
      elsif dfs(a, k, i + 1, sum)
        true
      elsif dfs(a, k, i + 1, sum + a[i])
        true
      else
        false
      end
    end
  end
end
