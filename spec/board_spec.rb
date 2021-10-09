require_relative '../lib/board.rb'
require_relative '../lib/game.rb'

describe Board do
    #initialize board with as a hash for each column
    # {1 => nil
    #  2 => nil
    #  3 => nil etc}

    #method to update the board
    describe '#update_board' do
        context 'when a move is passed as an argument' do
            subject(:board_update) { described_class.new}

            it 'adds the marker to the value corresponding to the move key' do
                move = 3
                marker = "X"
                board = board_update.instance_variable_get(:@board)
                expect {board_update.update_board(move, marker)}.to change {board.values_at(3).length}.by(1)
            end    
        end

    end

    #method to check if there are four in a row"
    describe '#game_over?' do
        context 'when empty board is initialized' do
            subject(:board_win) { described_class.new}
            
            it 'returns false' do
                expect(board_win.game_over?).to be false
            end
        end 
        
        context 'when a player has four markers in the same column' do
            subject(:board_column) { described_class.new}

            before do
                board = {1 => ["X","X","X","X"]}
                board_column.instance_variable_set(@board,board)
            end

            it 'returns true' do
                expect(board_column.game_over?).to be true
            end
        end
        
        context 'when a player has four markers across four columns' do
            subject(:board_row) { described_class.new}

            before do
                board = {1 => ["X"], 2 => ["X"], 3 => ["X"], 4 => ["X"]}
                board_row.instance_variable_set(@board, board)
            end
            
            it 'returns true' do
                expect(board_row.game_over?).to be true
            end
        end
        
        context 'when a player has a diagonal four in a row' do
            subject(:board_diagonal) { described_class.new}

            before do
                board = {1 => ["X"], 2 => ["O", "X"], 3 => ["O","O","X"], 4 => ["O","O","O","X"]}
            end
            
            it 'returns true' do
                expect(board_diagonal.game_over?).to be true
            end
        end
    end 
    
    #method to check if board is full
    describe '#board_full?' do

        subject(:full_board) { described_class.new}

        context 'when all columns are full' do
            it 'returns true' do
                expect(full_board.board_full?).to be true
            end
        end
        
        subject(:not_full_board) { described_class.new}

        context 'when there are still moves available' do
            it 'returns false' do
                expect(not_full_board.board_full?).to be false
            end
        end
    end   
end