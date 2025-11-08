# frozen_string_literal: true

class Computer # rubocop:disable Style/Documentation
  def make_code(options)
    code = []
    4.times do |i|
      i = options.sample # rubocop:disable Lint/ShadowedArgument
      code.push(i)
    end
  end

  def guess_code(code, options)
    possible_codes = []
    validator = { correct: 0, close: 0 }
    all_codes = options.repeated_permutations(4).to_a # makes all possible combinations with all options
    computer_code = [0, 0, 1, 1]
  end
end
