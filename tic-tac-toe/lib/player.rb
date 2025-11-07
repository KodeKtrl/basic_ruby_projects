# frozen_string_literal: true

class Player # rubocop:disable Style/Documentation
  attr_accessor :symbol

  def pick_symbol
    puts 'Pick a symbol: 1 for O, 2 for X'
    answer = gets.chomp.to_i
    @symbol = answer == 1 ? 'O' : 'X'
    @symbol
  end

  def make_choice(arr)
    loop do
      puts 'Enter a number from 0 to 8: '
      num = gets.chomp.to_i
      if arr.include?(num)
        arr[num] = @symbol
        return num
      else
        puts 'Try a different answer.'
      end
    end
  end
end
