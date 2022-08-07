# a game of tic-tac-toe
class Game
  attr_accessor :over, :current_player
  attr_reader :result, :board

  def initialize
    @board = GameBoard.new
    @player1 = 'x'
    @player2 = 'o'
    @current_player = @player1
    @result = ''
  end

  def play
    loop do
      play_round until over?
      display_end_screen
      break unless play_again?
    end
  end

  def play_round
    switch_player
    input_valid = false
    until input_valid
      system 'clear'
      @board.draw
      puts "#{current_player} make a move (field number 1 to 9)"
      input = gets.chomp
      input_valid = validate_input(input)
    end
    @board.update(input, @current_player)
  end

  def switch_player
    @current_player = if current_player == @player1
                        @player2
                      else
                        @player1
                      end
  end

  def validate_input(move)
    position = move.to_i - 1
    board.state[position] == ' ' && position.between?(0, 9)
  end

  def over?
    winning_combos = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    board = @board.state

    current_player_won = winning_combos.any? do |combo|
      part_of_board_to_check = board[combo[0]] + board[combo[1]] + board[combo[2]]
      part_of_board_to_check == current_player * 3
    end
    if current_player_won
      @result = "#{current_player} won!"
      return true
    end

    # board is full and current player hasn't won -> tie
    if @board.state.all? { |mark| mark != ' ' }
      @result = "it's a tie!"
      return true
    end

    false
  end

  def play_again?
    reset
    puts 'play again?'
    %w[y Y].include?(gets.chomp)
  end

  def display_end_screen
    system 'clear'
    @board.draw
    puts result
  end

  def reset
    @board = GameBoard.new
  end
end

class GameBoard
  attr_accessor :state

  def initialize
    @state = Array.new(9, ' ') # flat
  end

  def draw
    puts ' ┌───┬───┬───┐'
    state[0..2].each { |mark| print " │ #{mark}" }
    puts ' │'
    puts ' ├───┼───┼───┤'
    state[3..5].each { |mark| print " │ #{mark}" }
    puts ' │'
    puts ' ├───┼───┼───┤'
    state[6..8].each { |mark| print " │ #{mark}" }
    puts ' │'
    puts ' └───┴───┴───┘'
  end

  def update(move, current_player)
    position = move.to_i - 1 # 1 to 9
    state[position] = current_player
  end
end

# Game.new.play
