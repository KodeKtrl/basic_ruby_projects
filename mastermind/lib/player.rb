# frozen_string_literal: true

class Player # rubocop:disable Style/Documentation
  def make_code
    code = []
    puts 'Enter the secret code(1-6)'
    4.times do
      puts 'Enter a number between 1-6: '
      num = gets.chomp.to_i
      code.push(num)
    end
    code
  end

  def guess_code(code) # rubocop:disable Metrics/MethodLength,Metrics/AbcSize
    player_code = []
    validator = { correct: 0, close: 0 }
    puts 'Time to guess! You have 12 guesses'

    12.times do |round|
      player_code = []
      validator = { correct: 0, close: 0 }
      4.times do
        puts 'Guess a number!'
        guess = gets.chomp.to_i
        player_code.push(guess)
      end
      player_code.each_with_index do |element, index|
        if code.include?(element)
          if player_code[index] == code[index]
            validator[:correct] += 1
          else
            validator[:close] += 1
          end
        end
      end
      return "The code was #{code.join(' ')}, you took #{round + 1} guesses." if validator[:correct] == 4

      puts "#{player_code} is incorrect. Black pegs: #{validator[:correct]}, White pegs: #{validator[:close]}"
      puts "#{12 - round} guesses left"
    end
    puts "Player lost, code was: #{code.join(' ')}"
  end
end
