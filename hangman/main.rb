
require_relative "game"

def new_game
  print "Enter your name: "
  name = gets.chomp

  words = ["ruby", "oop", "hangman", "coding"]
  player = Player.new(name)
  Game.new(player, words.sample)
end

def load_game
  game = Game.load
  if game
    puts "Loaded game for #{game.player.name}!"
    game
  else
    puts "No save file found."
    new_game
  end
end

puts "1. New Game"
puts "2. Load Game"
print "> "
choice = gets.chomp

game = choice == "2" ? load_game : new_game

until game.won? || game.lost?
  puts "\nWord:    #{game.display_progress}"
  puts "Lives:   #{game.lives}"
  puts "Guesses: #{game.guesses.join(', ')}"

  print "\nEnter a letter or 'save': "
  input = gets.chomp.downcase

  if input == "save"
    game.save
    next
  end

  game.guess_letter(input)
end

if game.won?
  puts "\nYou won! The word was #{game.word}."
else
  puts "\nYou lost! The word was #{game.word}."
end
