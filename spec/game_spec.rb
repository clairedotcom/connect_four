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
            before do
                allow(game_first_player).to receive(:user_first?).and_return(true)
            end

            it 'updates current player to user' do
                user = instance_variable_get(:@user)
                expect { game_first_player.set_first_player}.to change {game_first_player.instance_variable_get(:@current_player)}.to(user)
            end
        end

        context 'when the user chooses not to go first' do
            before do
                allow(game_first_player).to receive(:user_first?).and_return(false)
            end

            it 'updates current player to computer' do
                computer = instance_variable_get(:@computer)
                expect { game_first_player.set_first_player}.to change {game_first_player.instance_variable_get(:@current_player)}.to(computer)
            end
        end
    end

    describe '#user_first?' do
        subject(:game_first) { described_class.new}

        context 'when the user enters "y" ' do
            before do
                user_input = "y"
                allow(game_first).to receive(:gets).and_return(user_input)
            end
            
            it 'returns true' do
                expect(game_first.user_first?).to be true
                game_first.user_first?
            end
        end

        context 'when the user enters invalid input' do
            before do
                invalid_input = 3
                allow(game_first).to receive(:gets).and_return(invalid_input)
            end
            
            it 'prints an error message' do
                error_message = "Invalid input. Please enter y or n."
                expect(game_first).to receive(:puts).with(error_message)
                game_first.user_first?
            end
        end
        
        context 'when the user enters "n"' do
            before do
                input_n = 'n'
                allow(game_first).to receive(:gets).and_return(input_n)
            end
            
            it 'returns false' do
                expect(game_first.user_first?).to be false
                game_first.user_first?
            end
        end
    end    
    
    describe '#user_move' do
        subject(:game_input) { described_class.new}

        context 'when the user enters a number between 1 and 7' do
            it 'returns the number' do
                user_input = "3"
                verified_output = game_input.user_move
                expect(verified_output).to eq(user_input)
            end    
        end

        context 'when the user enters an invalid input once' do
            before do
                letter = "r"
                allow(game_input).to receive(:gets).and_return(letter)
            end
            
            it 'returns an error message' do
                error_message = "Invalid input. Please enter a number between 1 and 7: "
                expect(game_input).to receive(:puts).with(error_message).once
                game_input.user_move
            end
        end 
        
        context 'when the user enters invalid input twice' do
            before do
                invalid_char = "!"
                invalid_letter = "n"
                allow(game_input).to receive(:gets).and_return(invalid_char, invalid_letter)
            end
            
            
            it 'returns an error message once' do
                error_message = "Invalid input. Please enter a number between 1 and 7: "
                expect(game_input).to receive(:puts).with(error_message).twice
                game_input.user_move
            end
        end
    end

    describe '#computer_move' do

    end    

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
    
    describe '#switch_players' do

    end
end