def sub_strings(word, dict)
  hash = Hash.new(0)
  word = word.downcase.split(" ")
  dict.each do |element|
    word.each do |w|
      if w.include?(element)
          hash[element] += 1
      end
    end
  end
  hash
end

list = ["below", "low", "thunder", "under", "low", "ow", "LoW"]

p sub_strings("below", list)
