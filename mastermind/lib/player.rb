# frozen_string_literal: true

class Player # rubocop:disable Style/Documentation
  def make_code(options)
    code = []
    puts 'Enter the secret code(1-6): '
    (0...4).times do
      puts 'Enter a number: '
      num = gets.chomp
      num = options[num]
      code.push(num)
    end
  end

  def guess_code(correct, close)
    # pass
  end
end
