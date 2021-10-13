class Board

    attr_reader :size

    def initialize(n)
        @grid = Array.new(n) {Array.new(n, :N)}
        @size = n*n
    end

    def [](arr)
        row, col = arr
        @grid[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @grid[row][col] = val
    end

    def num_ships
        @grid.flatten.count { |ele| ele == :S }
    end

    def attack(pos)
        if self[pos] == :S 
            puts "you sunk my battleship!"
            self[pos]= :H
            return true
        else
            self[pos]= :X 
            false
        end
    end

    def place_random_ships
        while self.num_ships < (size / 4)
            pos = [rand(@grid.length), rand(@grid.length)]
            self[pos] = :S  
        end
    end

    def hidden_ships_grid
        n = @grid.length
        new_grid = Array.new(n) {Array.new(n)}

        @grid.each.with_index do |arr, idx_1|
            arr.each.with_index do |ele, idx_2|
                if ele == :S
                    new_grid[idx_1][idx_2] = :N 
                else
                    new_grid[idx_1][idx_2] = ele
                end
            end
        end
        new_grid
    end

    def self.print_grid(arr)
        arr.each do |row|
           puts row.join(" ")
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(hidden_ships_grid)
    end
    
end
