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
        return false if !(0...@grid.length).include?(row) || !(0...@grid.length).include?(col)
        true
    end

    def empty?(pos)
        self[pos] == "_"
    end

    def place_mark(pos, mark)
        row, col = pos
        if self.empty?(pos) && self.valid?(pos)
            self[pos] = mark
        else
            puts "invalid position, try again"
        end
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
        return true if win_row?(mark) == true || win_col?(mark) == true || win_diagonal?(mark) == true
        false
    end

    def empty_positions?
        @grid.each { |row| return true if row.include?("_") }
        false
    end


end

# b = Board.new
# b.print
# b.place_mark([0,0], :X)
# b.print
# b.place_mark([0,0], :O)
# b.place_mark([0,2], :X)
# b.place_mark([1,0], :X)
# b.place_mark([1,1], :X)
# b.place_mark([1,2], :X)
# b.place_mark([2,0], :O)
# b.place_mark([2,1], :O)
# b.place_mark([2,2], :O)
# b.print
# p b.empty_positions?
