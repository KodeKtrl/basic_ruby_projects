# frozen_string_literal: true

require_relative 'lib/game'

def game_options
  puts 'Do you want to play a game? (Y/N)'
  answer = gets.chomp
  if answer == ('Y' || 'y')
    Game.new.play_game
  end
end

game_options
