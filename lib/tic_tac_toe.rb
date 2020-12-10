class TicTacToe

    WIN_COMBINATIONS = [
        [0,1,2], #Top row
        [3,4,5], #Middle row
        [6,7,8], #Bottom row
        [0,3,6], #First column
        [1,4,7], #Middle column
        [2,5,8], #Last column
        [0,4,8], #Diagonal 1
        [2,4,6], #Diagonal 2
    ]

    def initialize
        @board = Array.new(9, " ")
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end
    
    def input_to_index(input)
        input.to_i - 1
    end

    def move(index, token = "X")
        @board[index] = token
    end

    def position_taken?(index)
        @board[index] != " "
    end

    def valid_move?(index)
        valid = false

        if index <= 8 && index >= 0 && !position_taken?(index)
            valid = true
        end

        valid
    end

    def turn
        puts "Choose a position (1-9) to place your token."
        u_input = gets
        position = input_to_index(u_input)

        if valid_move?(position)
            move(position, current_player)
            display_board
        else
            puts "Choose a position (1-9) to place your token."
            u_input = gets
            position = input_to_index(u_input)

            if valid_move?(position)
                move(position, current_player)
                display_board
            end
        end
    end

    def turn_count
        @board.count - @board.count(" ")
    end

    def current_player
        cur = "O"
        if @board.count(" ") == 9 || @board.count("O") == @board.count("X")
            cur = "X"
        end
        cur
    end

    def won?
        won = nil
        WIN_COMBINATIONS.each do |combo|
            if @board[combo[0]] != " " && 
                @board[combo[0]] == @board[combo[1]] && 
                @board[combo[1]] == @board[combo[2]]

                won = combo
                break
            end
        end

        won
    end

    def full?
        @board.count(" ") == 0
    end

    def draw?
        full? && !won? ? true : false
    end

    def over?
        full? || won?
    end

    def winner
        won = won?

        won = @board[won?.first] if won != nil

        won
    end

    def play
        until over? || draw?
            turn
        end

        if won?
            puts "Congratulations #{winner}!"
        elsif draw?
            puts "Cat's Game!"
        end
    end

end