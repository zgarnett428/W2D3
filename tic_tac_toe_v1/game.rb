require_relative "board"
require_relative "human_player"

class Game

    def initialize(p1_mark, p2_mark)
        @board = Board.new
        @player_1 = HumanPlayer.new(p1_mark)
        @player_2 = HumanPlayer.new(p2_mark)
        @current_player = @player_1
    end

    def switch_turn
        if @current_player == @player_1
            @current_player = @player_2 
        else
            @current_player = @player_1
        end
    end

    def play
        puts "\n"
        puts "---------------------------"
        
        while @board.empty_positions?      
            puts "\n"
            @board.print
            pos = @current_player.get_position
            if @board.place_mark(pos, @current_player.mark)
                if @board.win?(@current_player.mark)
                    puts "VICTORY! Player #{@current_player.mark} wins!"
                    return 
                else
                    switch_turn
                end
            else
                puts "\n--------------------------- \ninvalid position, try again\n---------------------------\n" 
            end
        end
        puts "draw"
    end

end