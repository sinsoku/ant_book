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

    def dfs(a, k)
      n = a.length

      dfs_fanc = lambda do |fanc, i, sum|
        if i == n
          sum == k
        elsif fanc.call(fanc, i + 1, sum)
          true
        elsif fanc.call(fanc, i + 1, sum + a[i])
          true
        else
          false
        end
      end

      dfs_fanc.call(dfs_fanc, 0, 0)
    end

    def count_pool(garden)
      n = garden.length
      m = garden[0].length

      garden = garden.transpose

      dfs = lambda do |fanc, x, y|
        garden[x][y] = '.'
        [x - 1, x, x + 1].each do |dx|
          next if dx < 0 or n <= dx

          [y - 1, y, y + 1].each do |dy|
            next if dy < 0 or m <= dy

            if garden[dx][dy] == 'W'
              fanc.call(fanc, dx, dy)
            end
          end
        end
      end

      res = 0
      n.times do |x|
        m.times do |y|
          if garden[x][y] == 'W'
            dfs.call(dfs, x, y)
            res += 1
          end
        end
      end
      res
    end
  end
end
