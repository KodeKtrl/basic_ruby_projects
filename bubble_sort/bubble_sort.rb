def bubble_sort(list)
  loop do
    sorted = false

    list.each_index do |i|
      break if i == list.length - 1
      next unless list[i] > list[i + 1]

      list[i], list[i+1] = list[i+1], list[i]
      sorted = true
    end
    break unless sorted
  end
  list
end

p bubble_sort([2,5,2,7,9, 1])