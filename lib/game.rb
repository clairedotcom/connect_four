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
        #@current_player = @user if user_first?
    end

    def user_first?
        #method asks user if they want to go first
        #validates input
        #returns true if answer is 'y'
    end    
    
    def turn
        #user_move if user current
        #computer_move if computer is current player
        #update board
        #display board
        #switches players
    end
    
    def user_move
        #gets move from players
        #validates input
    end
    
    def computer_move
        #generates random number 
    end

    def add_move
        #updates board with a move (user or computer)
    end    
    
    def switch_players
        #update @current_player
    end   
    
    private

    def intro
        puts 'C O N N E C T  F O U R'
        puts 'Play against the computer to get four in a row'
        puts 'Would you like to go first? Enter y or n: '
    end    
end    