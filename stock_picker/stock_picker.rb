def stock_picker(prices)
  #debugger
 sell_day = 0
 buy_day = 0
 highest_profit = 0

 lowest_day = 0
 lowest_price = prices[0]

 prices.each_with_index do |price, index|
   if price < lowest_price
     lowest_price = price
     lowest_day = index
   end

   profit = price - lowest_price
   if profit > highest_profit
     highest_profit = profit
     sell_day = index
     buy_day = lowest_day
   end
 end
 [buy_day, sell_day]
end

p stock_picker([17,3,6,9,15,8,6,1,10])
