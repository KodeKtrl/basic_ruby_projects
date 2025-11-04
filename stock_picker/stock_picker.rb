def stock_picker(array)
  #debugger
  highest_value = 0
  lowest_value = 0
  difference = highest_value - lowest_value
  array.each_with_index do |current_value, index|
    if index == 0
      lowest_value = current_value
    elsif current_value < lowest_value and (difference > highest_value - current_value)
      lowest_value = current_value
    elsif current_value > highest_value
      highest_value = current_value
    end
  end 
  result = [array.index(lowest_value), array.index(highest_value)]
  return result
end

p stock_picker([17,3,6,9,15,8,6,1,10])

#[17,3,6,9,15,8,6,1,10]