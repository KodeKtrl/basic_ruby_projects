# frozen_string_literal: true

class Player # rubocop:disable Style/Documentation
  def make_code(options)
    code = []
    puts 'Enter the secret code(1-6)'
    (0...4).times do
      puts 'Enter a number between 1-6: '
      num = gets.chomp.to_i
      num = options[num] if options
      code.push(num)
    end
    code
  end

  def guess_code(code) # rubocop:disable Metrics/MethodLength
    player_code = []
    validator = { correct: 0, close: 0 }
    puts 'Time to guess! You have 12 guesses'
    guesses = 0
    while guesses < 12
      player_code = []
      validator[:correct] = 0
      validator[:close] = 0
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
      return "Player wins! The code was #{code}" if validator[:correct] == 4

      guesses += 1
    end
    puts "Player lost, code was: #{code}"
  end
end
