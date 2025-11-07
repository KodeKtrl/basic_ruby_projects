# frozen_string_literal: true

class MyBoard # rubocop:disable Style/Documentation
  attr_accessor :arr

  def initialize(arr)
    @arr = arr
  end

  def create_board(arr) # rubocop:disable Metrics/MethodLength
    arr.each do |num|
      if ((num + 1) % 3).zero?
        print " #{num}"
      else
        print " #{num} |"
      end
      if num + 1 == arr.length
        puts ''
      else
        puts ''
        puts '___|___|___'
      end
    end
  end

  def game_over(combinations, player, computer, board)
    combinations.each do |combination|
      return 'Player wins!' if combination.all? { |num| player.include?(num) }
      return 'Computer wins!' if combination.all? { |num| computer.include?(num) }
    end

    return "It's a draw!" if board.none? { |n| n.is_a?(Integer) }

    update_board(board)
    'The game continues!'
  end

  def update_board(board)
    create_board(board)
  end
end
