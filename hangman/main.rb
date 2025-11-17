require_relative 'player'
require_relative 'game'

puts '1. New Game'
puts '2. Load Game'
print '> '
choice = gets.chomp

if choice == '2' && File.exist?('save.json')
  game = Game.load_game
  puts "Loaded game for #{game.player.name}!"
else
  print 'Enter your name: '
  name = gets.chomp
  player = Player.new(name)

  words = %w[ruby hangman coding simple]
  game = Game.new(player, words.sample)
end

until game.won? || game.lost?
  puts "\nWord: #{game.display_progress}"
  puts "Lives: #{game.lives}"
  puts "Guesses: #{game.guesses.join(', ')}"

  puts "\nEnter a letter or type 'save':"
  print '> '
  input = gets.chomp.downcase

  if input == 'save'
    game.save_game
    next
  end

  game.guess_letter(input)
end

if game.won?
  puts "\nYou won! The word was #{game.word}."
else
  puts "\nYou lost! The word was #{game.word}."
end
