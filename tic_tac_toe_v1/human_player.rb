class HumanPlayer

    attr_reader :mark

    def initialize(mark)
        @mark = mark
    end

    def get_position
        puts "--------------------------- \n #{mark} , choose a position (row and column seperated by a space) \n--------------------------- \n \n"
        input = gets.chomp
        row = input.split(" ")[0].to_s
        col = input.split(" ")[-1].to_s
        if !input.include?(" ") || input.split(" ").length != 2 || row.to_i.to_s != row || col.to_i.to_s != col
            raise 'sorry, that was invalid :('
        else
            return [row.to_i, col.to_i]
        end
    end

end