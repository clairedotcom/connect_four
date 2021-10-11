require_relative '../lib/game.rb'
require_relative '../lib/player.rb'
require_relative '../lib/board.rb'

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
                user = game_first_player.instance_variable_get(:@user)
                expect { game_first_player.set_first_player}.to change {game_first_player.instance_variable_get(:@current_player)}.to(user)
            end
        end

        context 'when the user chooses not to go first' do
            before do
                allow(game_first_player).to receive(:user_first?).and_return(false)
            end

            it 'updates current player to computer' do
                computer = game_first_player.instance_variable_get(:@computer)
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
                invalid_input = "3"
                valid_input = "y"
                allow(game_first).to receive(:gets).and_return(invalid_input, valid_input)
            end
            
            it 'prints an error message' do
                error_message = "Invalid input. Please enter y or n."
                expect(game_first).to receive(:puts).with(error_message).once
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
            before do
                output = "3"
                allow(game_input).to receive(:gets).and_return(output)
            end

            it 'returns the number' do
                user_input = "3"
                expect(game_input.user_move).to eq(user_input)
            end    
        end

        context 'when the user enters an invalid input once' do
            before do
                letter = "r"
                valid_input = "5"
                allow(game_input).to receive(:gets).and_return(letter, valid_input)
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
                valid_number = "7"
                allow(game_input).to receive(:gets).and_return(invalid_char, invalid_letter, valid_number)
            end
            
            
            it 'returns an error message once' do
                error_message = "Invalid input. Please enter a number between 1 and 7: "
                expect(game_input).to receive(:puts).with(error_message).twice
                game_input.user_move
            end
        end
    end

    describe '#computer_move' do
        subject(:game_computer) { described_class.new}
        
        context 'when called' do
            it 'returns a number greater than 0' do
                expect(game_computer.computer_move).to be > 0
            end
        end
        
        context 'when called' do
            it 'returns a number less than 8' do
                expect(game_computer.computer_move).to be < 8
            end
        end
    end    

    describe '#add_move' do
        context 'when the a move has been selected' do
            subject(:game_update) { described_class.new}

            before do
                game_update.instance_variable_set(:@current_player, game_update.instance_variable_get(:@user))
            end    
            
            it 'sends value to board class' do
                move = "3"
                marker = "X"
                board_update = game_update.instance_variable_get(:@board)
                expect(board_update).to receive(:update_board).with(move, marker)
                game_update.add_move(move)
            end    
        end
    end    
    
    describe '#switch_players' do
        subject(:game_switch) { described_class.new}
        
        context 'when the current player is the user' do
            before do
                game_switch.instance_variable_set(:@current_player, game_switch.instance_variable_get(:@user))
            end

            it 'changes current player to the computer' do
                computer = game_switch.instance_variable_get(:@computer)
                game_switch.switch_players
                expect(game_switch.instance_variable_get(:@current_player)).to eq(computer)
                
            end
        end

        context 'when the current player is the computer' do
            before do
                game_switch.instance_variable_set(:@current_player, game_switch.instance_variable_get(:@computer))
            end
            
            it 'changes current player to the user' do
                user = game_switch.instance_variable_get(:@user)
                game_switch.switch_players
                expect(game_switch.instance_variable_get(:@current_player)).to eq(user)
            end
        end        
    end
end