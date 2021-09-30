require_relative '../lib/board.rb'

describe Board do
    #initialize board with as a hash for each column?
    # {1 => nil
    #  2 => nil
    #  3 => nil etc}

    #method to update the board
    describe '#update_board' do

    end

    #method to check if there are four in a row"
    describe '#game_over?' do
        
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

    #method to check if a move is valid
    #(square is available and it's on the board)
    describe '#valid_move?' do

    end    
end