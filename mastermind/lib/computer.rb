# frozen_string_literal: true

class Computer # rubocop:disable Style/Documentation
  def make_code(options)
    options.sample(4)
  end

  def guess_code(secret_code)
    numbers = [1, 2, 3, 4, 5, 6]
    all_codes = numbers.repeated_permutation(4).to_a
    guess = [1, 1, 2, 2]
    possible_codes = all_codes.dup

    12.times do |round|
      result = validator(secret_code, guess)

      return puts "Victory #{guess} is the right answer. You took #{round + 1} guesses" if result[:correct] == 4

      possible_codes.select! { |code| validator(code, guess) == result }

      puts " #{guess} incorrect! #{12 - round} guesses left."
      puts "Black pegs: #{result[:correct]}, White pegs: #{result[:close]}"
      guess = possible_codes[0]
    end
    puts 'You failed to guess...'
  end

  def validator(code, guess) # rubocop:disable Metrics/MethodLength,Metrics/AbcSize
    checker = { correct: 0, close: 0 }
    code_copy = code.dup
    guess_copy = guess.dup

    code_copy.each_with_index do |_num, index|
      if code_copy[index] == guess_copy[index]
        checker[:correct] += 1
        code_copy[index] = guess_copy[index] = nil
      end
    end
    guess_copy.compact.each do |num|
      if (ind = code_copy.index(num))
        checker[:close] += 1
        code_copy[ind] = nil
      end
    end
    checker
  end
end
