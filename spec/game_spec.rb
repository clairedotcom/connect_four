require_relative '../lib/game.rb'

describe Game do
    describe '#initialize' do
        #test not needed, just creating instance variables
    end
    
    describe '#play' do
        #public script method.
        #test the methods it calls but not #play_game itself
    end    
    
    describe '#set_first_player' do
        subject(:game_first_player) { described_class.new}

        context 'when user chooses to go first' do
            it 'updates current player to user' do
                user = instance_variable_get(:@user)
                expect { game_first_player.set_first_player}.to change {game_first_player.instance_variable_get(:@current_player)}.to(user)
            end
        end

        context 'when the user chooses not to go first' do
            it 'updates current player to computer' do
                computer = instance_variable_get(:@computer)
                expect { game_first_player.set_first_player}.to change {game_first_player.instance_variable_get(:@current_player)}..to(computer)
            end
        end
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
                allow(game_update).to receive(:gets).with(3)
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