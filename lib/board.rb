class Board
    attr_accessor :board

    def initialize
        @board = Array.new(7) {Array.new(6, " ")}
    end 
    
    def update_board(move, marker)
        column = @board[move.to_i - 1]

        column.each_with_index do |row, index|
            if row == " "
                column[index] = marker
                break
            end
        end
    end
    
    def game_over?
        return true if column_win? || row_win? || diagonal_win?
    end

    def column_win?
        win = false
        
        @board.each_with_index do |column, x|
            column.each_with_index do |square, y|
                if square != " "
                    win = true if square == @board[x][y+1] && square == @board[x][y+2] && square == @board[x][y+3]
                end
            end
            break if win
        end
        win
    end 
    
    def row_win?
        win = false

        @board.each_with_index do |column, x|
            column.each_with_index do |square, y|
                if square != " " && !(@board[x+1].nil?) && !(@board[x+2].nil?)
                    win = true if square == @board[x+1][y] && square == @board[x+2][y] && square == @board[x+3][y]
                end
            end
            break if win   
        end
        win
    end
    
    def diagonal_win?
        win = false

        @board.each_with_index do |column, x|
            column.each_with_index do |square, y|
                if square != " " && !(@board[x+1].nil?) && !(@board[x+2].nil?)
                    win = true if square == @board[x+1][y+1] && square == @board[x+2][y+2] && square == @board[x+3][y+3]
                    win = true if square == @board[x+1][y-1] && square == @board[x+2][y-2] && square == @board[x+3][y-3]
                end
            end
            break if win
        end
        win
    end
    
    def board_full?
        @board.each do |column|
            return false if column.include?(" ")
        end
        true     
    end    

    def display_board
        board = <<~BOARD

        | #{@board[0][5]} | #{@board[1][5]} | #{@board[2][5]} | #{@board[3][5]} | #{@board[4][5]} | #{@board[5][5]} | #{@board[6][5]} |
        | #{@board[0][4]} | #{@board[1][4]} | #{@board[2][4]} | #{@board[3][4]} | #{@board[4][4]} | #{@board[5][4]} | #{@board[6][4]} |
        | #{@board[0][3]} | #{@board[1][3]} | #{@board[2][3]} | #{@board[3][3]} | #{@board[4][3]} | #{@board[5][3]} | #{@board[6][3]} |
        | #{@board[0][2]} | #{@board[1][2]} | #{@board[2][2]} | #{@board[3][2]} | #{@board[4][2]} | #{@board[5][2]} | #{@board[6][2]} |
        | #{@board[0][1]} | #{@board[1][1]} | #{@board[2][1]} | #{@board[3][1]} | #{@board[4][1]} | #{@board[5][1]} | #{@board[6][1]} |
        | #{@board[0][0]} | #{@board[1][0]} | #{@board[2][0]} | #{@board[3][0]} | #{@board[4][0]} | #{@board[5][0]} | #{@board[6][0]} |
        -----------------------------
        | 1 | 2 | 3 | 4 | 5 | 6 | 7 |

        BOARD

        puts board
    end
end    