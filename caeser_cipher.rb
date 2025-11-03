def caesar_ciper(word, value = 0)
   result = []
   word = word.split("")
   word.map! {|element| element.ord}
   word.map! {|element| element}
    for element in word do
        if element >= 65 and element <= 90
            if element + value >= 90
                difference = 90 - element
                element = 65 - difference + (value - 1)
                result.push(element)
            elsif element + value >= 65
                element = element + value
                result.push(element)
            end
        end
        if element >= 97 and element <= 122
            if element + value >= 122
              difference = 122 - element
              element = 97 - difference + (value - 1)
              result.push(element)
            elsif element + value >=97
                element = element + value
                result.push(element)
            end
        end
        if element.between?(65, 97) == false and element.between?(97, 122) == false 
          result.push(element)
        end

    end
        result.map! {|element| element.chr}
        result.join
end

p caesar_ciper("What is up?", 4)
