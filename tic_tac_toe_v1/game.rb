require_relative "board"
require_relative "human_player"

class Game

    attr_accessor :current_player
    attr_reader :p1_mark, :p2_mark

    def initialize(p1_mark, p2_mark)
        @p1_mark = p1_mark
        @p2_mark = p2_mark
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
        @board.print
        
        while @board.empty_positions?
            attempt = @current_player.get_position
            if attempt != false
                @board.place_mark(attempt, self.current_player.mark)
                if @board.win?(self.current_player.mark)
                    return "VICTORY! #{current_player.mark} wins!"
                    @board.print
                else
                    self.switch_turn
                    @board.print
                end
            else
                "invalid position, try again"
                break
            end
        end
        return "draw"
    end

end