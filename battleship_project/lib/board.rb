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
        new_grid = []

        @grid.each do |arr|
            arr.each do |ele|
                if ele == :S
                    new_grid << :N 
                else
                    new_grid << ele
                end
            end
            new_grid
        end

    end

  
end
