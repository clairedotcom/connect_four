class Board
    attr_accessor :board

    def initialize
        @board = Array.new(7) {Array.new(6, " ")}
    end 
    
    def update_board(move, marker)
        column = @board[move - 1]

        column.each_with_index do |row, index|
            if row == " "
                column[index] = marker
                break
            end
        end
    end
    
    def game_over?
        true if column_win? || row_win? || diagonal_win?
    end

    def column_win?
        @board.each do |column|
            return true if column.include?(["X", "X", "X", "X"])
            return true if column.include?(["O", "O", "O", "O"])
        end

        return false
    end 
    
    def row_win?

    end
    
    def diagonal_win?

    end    

    def display_board
        board = <<~BOARD

        | #{@board[0][5]} | #{@board[1][5]} | #{@board[2][5]} | #{@board[3][5]} | #{@board[4][5]} | #{@board[5][5]} | #{@board[6][5]} |
        | #{@board[0][4]} | #{@board[1][4]} | #{@board[2][4]} | #{@board[3][4]} | #{@board[4][4]} | #{@board[5][4]} | #{@board[6][4]} |
        | #{@board[0][3]} | #{@board[1][3]} | #{@board[2][3]} | #{@board[3][3]} | #{@board[4][3]} | #{@board[5][3]} | #{@board[6][3]} |
        | #{@board[0][2]} | #{@board[1][2]} | #{@board[2][2]} | #{@board[3][2]} | #{@board[4][2]} | #{@board[5][2]} | #{@board[6][2]} |
        | #{@board[0][1]} | #{@board[1][1]} | #{@board[2][1]} | #{@board[3][1]} | #{@board[4][1]} | #{@board[5][1]} | #{@board[6][1]} |
        | #{@board[0][0]} | #{@board[1][0]} | #{@board[2][0]} | #{@board[3][0]} | #{@board[4][0]} | #{@board[5][0]} | #{@board[6][0]} |
        | 1 | 2 | 3 | 4 | 5 | 6 | 7 |

        BOARD

        puts board
    end
end    