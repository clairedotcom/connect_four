require_relative '../lib/board.rb'
require_relative '../lib/game.rb'

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
        subject(:board_win) { described_class.new}

        context 'when empty board is initialized' do
            it 'returns false' do
                expect(board_win.game_over?).to be false
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