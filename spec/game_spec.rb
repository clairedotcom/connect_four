require_relative '../lib/game.rb'

describe Game do
    #initialize game with two players and a board
    
    #randomly choose which player goes first
    describe '#select_first_player' do

    end

    #get move from user and check that it's a number
    describe '#get_move' do

    end

    #generate move for computer
    describe '#computer_move' do

    end    

    #if it's a valid move add to board
    # send signal to board to update
    describe '#add_move' do
        context 'when the a move has been selected' do
            let(:board_update) { instance_double(Board)}
            let(:game_update) { described_class.new}

            before do
                allow(game_update).to receive(:get_move).with(3)
            end
            
            it 'sends value to board class' do
                expect(board_update).to receive(:update_board).with(3)
                game_update.add_move
            end    
        end
    end    
    
    #switch players
    describe '#switch_players' do

    end    
    
    #until a player has won or board is full
    # until board.game_over? || board.full? do
end