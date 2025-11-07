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

def computer_choose
  loop do
    choice = options.sample
    break if choice.is_a(integer)
  end
end

loop do
  player.pick_symbol
  board.create_board
  player_choice = player.make_choice
  player_choices.push(player_choice)
  computer_choice = computer_choose
  computer_choices.push(computer_choice)
  board.game_over(combinations, player_choices, computer_choices, board)

  break if options.none? { |n| n.is_a?(integer) }
end
