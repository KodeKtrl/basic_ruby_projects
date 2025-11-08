# frozen_string_literal: true

class Game # rubocop:disable Style/Documentation
  options = ['🔴', '🔵', '🟢', '🟣', '⚫', '⚪'] # rubocop:disable Lint/UselessAssignment
  value = options.sample
  puts value
end
