require 'json'

class Game
  attr_accessor :word, :guesses, :lives, :player

  def initialize(player, word)
    @player = player
    @word = word
    @guesses = []
    @lives = 6
  end

  def display_progress
    @word.chars.map { |c| @guesses.include?(c) ? c : "_" }.join(" ")
  end

  def guess_letter(letter)
    if @guesses.include?(letter)
      puts "Already guessed!"
      return
    end

    @guesses << letter

    unless @word.include?(letter)
      @lives -= 1
      puts "Wrong guess!"
    end
  end

  def won?
    (@word.chars - @guesses).empty?
  end

  def lost?
    @lives <= 0
  end

  def save_game(filename = "save.json")
    data = {
      player: @player.name,
      word: @word,
      guesses: @guesses,
      lives: @lives
    }

    File.write(filename, JSON.dump(data))
    puts "Game saved!"
  end

  def self.load_game(filename = "save.json")
    data = JSON.parse(File.read(filename), symbolize_names: true)

    player = Player.new(data[:player])
    game = Game.new(player, data[:word])
    game.guesses = data[:guesses]
    game.lives = data[:lives]

    game
  end
end
