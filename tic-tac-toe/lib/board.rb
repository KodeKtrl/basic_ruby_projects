# frozen_string_literal: true

class MyBoard # rubocop:disable Style/Documentation
  attr_accessor :arr

  def initialize(arr)
    @arr = arr
  end

  def create_board(arr = @arr)
    arr.each_with_index do |num, index|
      print " #{num}"
      print ' |' unless ((index + 1) % 3).zero?

      if ((index + 1) % 3).zero?
        puts ''
        puts '___|___|___' unless index == arr.length - 1
      end
    end
  end

  def game_over(combinations, player, computer, board) # rubocop:disable Metrics/CyclomaticComplexity
    combinations.each do |combination|
      return 'Player wins!' if combination.all? { |num| player.include?(num) }
      return 'Computer wins!' if combination.all? { |num| computer.include?(num) }
    end

    return "It's a draw!" if board.none? { |n| n.is_a?(Integer) }

    update_board
    'The game continues!'
  end

  def update_board
    create_board(@arr)
  end
end
