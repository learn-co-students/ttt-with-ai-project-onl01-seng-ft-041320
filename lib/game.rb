class Game
    attr_accessor :board, :player_1, :player_2, :winner, :user_input

    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6] ]

        def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
            @player_1 = player_1
            @player_2 = player_2
            @board = board
            @board.display
          end

          def current_player
            @board.turn_count % 2 == 0 ? player_1 : player_2
         end

         def won?
            WIN_COMBINATIONS.each do  |combo|
                if @board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[1]] == @board.cells[combo[2]] && @board.taken?(combo[0] + 1)
                    return combo
                end
            end
            return false
            # WIN_COMBINATIONS.any? do |combo|
                # if board.taken?(combo[0]) && board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]]
                    # return combo
                # end
            # end
        end

         def draw?
            !won? && board.full?
         end
        
         def over?
            won? || draw?
         end

         def winner
            if won?
                combo = won?
                @board.cells[combo[0]]
            end
            # if over? && !draw?
                # return (current_player == "X") ? "O" : "X"
            # else
                # return nil
            # end
         end

         def turn
            puts "Please enter a number 1-9:"
            @user_input = current_player.move(@board)
            if @board.valid_move?(@user_input)
                @board.update(@user_input, current_player)
            else puts "Please enter a number 1-9:"
                @board.display
                turn
            end
            @board.display 
         end
            # puts "Enter a number between 1-9: "
            # user_entry = gets.strip
            # index = input_to_index(user_entry)
            # valid_move_response = valid_move?(index)
            # token = current_player
    # 
            # if valid_move_response
                # move(index, token)
                # display_board
            # else 
                # turn
            # end
        # end

        def play 
            turn until over?
            if won?
                puts "Congratulations #{winner}!"
            elsif draw?
                puts "Cat's Game!"
            end
        end
    end