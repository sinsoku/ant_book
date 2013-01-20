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

    def bfs(maze)
      distances = {}
      n = maze[0].length
      m = maze.length
      maze = maze.transpose
      start = nil
      goal = nil

      n.times do |x|
        m.times do |y|
          if maze[x][y] == 'S'
            start = [x, y]
            distances[start] = 0
          elsif maze[x][y] == 'G'
            goal = [x, y]
          end
        end
      end

      is_move = lambda do |pos|
        x = pos[0]
        y = pos[1]
        char = maze[x][y] if maze[x]
        char != nil && char != '#'
      end

      fanc = lambda do |fanc, pos|
        if pos != goal
          r_pos = [pos[0] + 1, pos[1]]
          l_pos = [pos[0] - 1, pos[1]]
          d_pos = [pos[0], pos[1] + 1]
          u_pos = [pos[0], pos[1] - 1]

          [r_pos, l_pos, d_pos, u_pos].each do |n_pos|
            if is_move.call(n_pos) && !distances.key?(n_pos)
              distances[n_pos] = distances[pos] + 1
              fanc.call(fanc, n_pos)
            end
          end
        end
      end
      fanc.call(fanc, start)

      distances[goal]
    end
  end
end
