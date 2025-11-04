def stock_picker(array)
  #debugger
  highest_value = 0
  current_high = 0
  lowest_value = 0
  array.each_with_index do |current_value, index|
    if index == 0
      lowest_value = current_value
    elsif (current_value < lowest_value)
      lowest_value = current_value
    elsif current_value > highest_value
      highest_value = current_value
      current_high = current_value
    end
  end and (current_high == highest_value)
  result = [array.index(lowest_value), array.index(highest_value)]
  return result
end

p stock_picker([17,3,6,9,15,8,6,1,10])

#[17,3,6,9,15,8,6,1,10]