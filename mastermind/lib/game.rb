# frozen_string_literal: true

require_relative 'computer'
require_relative 'player'

class Game # rubocop:disable Style/Documentation
  def initialize
    @player = Player.new
    @computer = Computer.new
  end

  def play_game
    puts 'Do you want to be the codemaker or the codebreaker?'
    puts 'Press 1 for codemaker and 2 for codebreaker'
    answer = gets.chomp.to_i
    if answer == 1
      code = @player.make_code
      @computer.guess_code(code)
    else
      code = @computer.make_code([1, 2, 3, 4, 5, 6])
      @player.guess_code(code)
    end
  end
end
