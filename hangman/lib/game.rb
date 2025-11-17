require 'yaml'
require_relative 'player'

class Game
  attr_reader :player, :word, :guesses, :lives

  SAVE_FILE = "save.yml".freeze

  def initialize(player, word, guesses = [], lives = 6)
    @player  = player
    @word    = word
    @guesses = guesses
    @lives   = lives
  end

  def display_progress
    @word.chars.map { |ch| @guesses.include?(ch) ? ch : "_" }.join(" ")
  end

  def guess_letter(letter)
    return puts "Already guessed!" if @guesses.include?(letter)

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


  def save
    data = {
      player_name: @player.name,
      word: @word,
      guesses: @guesses,
      lives: @lives
    }

    File.write(SAVE_FILE, data.to_yaml)
    puts "\nGame saved!"
  end

  def self.load
    return unless File.exist?(SAVE_FILE)

    data = YAML.load_file(SAVE_FILE)
    player = Player.new(data[:player_name])

    new(player, data[:word], data[:guesses], data[:lives])
  end
end
