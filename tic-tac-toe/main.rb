# frozen_string_literal: true

require_relative 'lib/board'
require_relative 'lib/player'

options = [0, 1, 2, 3, 4, 5, 6, 7, 8]
combinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8],
                [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
player_choices = []
computer_choices = []

board = MyBoard.new(options)
player = Player.new

player_symbol = player.pick_symbol
computer_symbol = player_symbol == 'O' ? 'X' : 'O'

def computer_choose(options)
  loop do
    choice = options.sample
    return choice if choice.is_a?(Integer)
  end
end

board.create_board

loop do
  player_choice = player.make_choice(options)
  player_choices.push(player_choice)
  puts ''
  puts "Player chose #{player_choice}"
  puts ''
  board.update_board
  puts ''
  computer_choice = computer_choose(options)
  computer_choices.push(computer_choice)
  options[computer_choice] = computer_symbol
  puts "Computer chose #{computer_choice}"
  puts ''
  board.update_board
  puts ''
  result = board.game_over(combinations, player_choices, computer_choices, board)

  puts result
  break if result != 'The game continues!'
  break if options.none? { |n| n.is_a?(Integer) }
end
