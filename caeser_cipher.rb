def caesar_ciper(word, value = 0)
   result = []
   word = word.split("")
   word.map! {|element| element.ord}
   word.map! {|element| element}
   for element in word do
       if element + value >= 90
        difference = 90 - element
        element = 64 - difference + value
        result.push(element)
       elsif element <= 64
        element = 64 + value
        result.push(element)
       else 
        result.push(element + value)
       end
   end
   result.map! {|element| element.chr}
   result
end

p caesar_ciper("Y", 4)
