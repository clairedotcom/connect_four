require_relative './board.rb'

class Game
    def initialize
        @board = Board.new
        @user = "X"
        @computer = "O"
        @current_player = nil
    end
    
    def play
        intro
        set_first_player
        turn until game_over?
    end

    def set_first_player

    end
    
    def turn

    end
    
    def game_over?

    end    
    
    private

    def intro
        puts 'C O N N E C T  F O U R'
        puts 'Play against the computer to get four in a row'
        puts 'Would you like to go first? Enter y or n: '
    end    
end    