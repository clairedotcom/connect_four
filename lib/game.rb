require_relative './board.rb'
require_relative './player.rb'

class Game
    def initialize
        @board = Board.new
        @user = Player.new("user", "X")
        @computer = Player.new("computer", "O")
        @current_player = nil
    end
    
    def play
        intro
        set_first_player
        @board.display_board
        turn until @board.game_over? || @board.board_full?
        draw if @board.board_full?
    end

    def set_first_player
        return @current_player = @user if user_first?
        @current_player = @computer
    end

    def user_first?
        loop do
            input = gets.chomp
            return true if input == 'y'
            return false if input == 'n'

            puts "Invalid input. Please enter y or n."
        end
    end    
    
    def turn
        move = user_move if @current_player == @user
        move = computer_move if @current_player == @computer
        add_move(move)
        @board.display_board
        winner if @board.game_over?
        switch_players
    end
    
    def user_move
        puts "Please enter your move: "
        
        loop do
            input = gets.chomp
            return input if input.to_i < 8 && input.to_i > 0

            puts "Invalid input. Please enter a number between 1 and 7: "
        end
    end
    
    def computer_move
        rand(1..7)
    end

    def add_move(move)
        @board.update_board(move, @current_player.marker)
    end    
    
    def switch_players
        @current_player == @user ? @current_player = @computer : @current_player = @user
    end 
    
    private

    def intro
        puts 'C O N N E C T  F O U R'
        puts 'Play against the computer to get four in a row'
        puts 'Would you like to go first? Enter y or n: '
    end
    
    def draw
        puts "It's a draw! Please play again."
    end
    
    def winner
        puts "#{@current_player.name} wins! Game over."
    end    
end    