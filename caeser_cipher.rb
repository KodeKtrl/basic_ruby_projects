def caesar_ciper(word, value = 0)
   result = []
   word = word.split("")
   word.map! {|element| element.ord}
   
   value = value % 26

   word.each do |element|
    if element.between?(65, 90)
      diff = element + value
      diff -=26 if diff > 90
      result.push(diff)
    elsif element.between?(97,122)
        diff = element + value
        diff -=26 if diff > 122
        result.push(diff)
    else
        result.push(element)
    end
   end
   result.map! {|c| c.chr}
   result.join
end

p caesar_ciper("Hello World z!", 5)