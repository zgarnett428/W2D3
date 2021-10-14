class Board

    def initialize
        @grid = Array.new(3) {Array.new(3, "_")}
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @grid[row][col] = val
    end

    def valid?(pos)
        row, col = pos
        pos.all? do |i|
            0 <= i && i < @grid.length
        end
    end

    def empty?(pos)
        self[pos] == "_"
    end

    def place_mark(pos, mark)
        if !empty?(pos) || !valid?(pos)
            return false
        end
        self[pos] = mark
        true
    end

    def print
        @grid.each do |row| 
            p row
            puts "\n"
        end
    end

    def win_row?(mark)
        @grid.each do |row|
            return true if row.all? { |ele| ele == mark}
        end
        false
    end

    def win_col?(mark)
        @grid.transpose.each do |col|
            return true if col.all? { |ele| ele == mark}
        end
        false
    end

    def win_diagonal?(mark)
        diagonal = []
        anti_diagonal = []
        (0...@grid.length).each.with_index { |ele, i| diagonal << @grid[i][i] }
        (0...@grid.length).each.with_index { |ele, i| anti_diagonal << @grid[i][-i - 1] }
        return true if diagonal.all? { |ele| ele == mark} || anti_diagonal.all? { |ele| ele == mark}
        false
    end

    def win?(mark)
        win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
    end

    def empty_positions?
        @grid.each { |row| return true if row.include?("_") }
        false
    end


end