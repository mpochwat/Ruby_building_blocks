# Implement a method #stock_picker that takes in an array of stock prices, 
# one for each hypothetical day. It should return a pair of days representing 
# the best day to buy and the best day to sell. Days start at 0.

def stock_picker(arr)
	#Calculates initial max & min stock prices
	max_digit = -1
	min_digit = 0
	max = arr.sort[max_digit]
	min = arr.sort[min_digit]
	#Diff stores differences and buy/sell days for those differences.
	diff = Hash.new

	#If max price = min price, then answer is to buy & sell stock on same day
	if max == min
		diff[0] = [arr.index(min), arr.index(min)]
	end

	while max != min
		#If max price day is before min price day, find next highest price day
		while arr.index(max) < arr.index(min)
			max_digit -= 1
			max = arr.sort[max_digit]	
		end
		#If max = min, then answer is to buy & sell stock on same day
		if arr.index(min) == arr.index(max)
			diff[max-min] = [arr.index(min), arr.index(min)]
		#If max price day is after min price day, buy on min day & sell on max day
		elsif arr.index(max) > arr.index(min)
			diff[max-min] = [arr.index(min), arr.index(max)]
		#If lowest day is last day, buy & sell on last day.
		elsif min == arr.last
			diff[max-min] = [arr.index(min), arr.index(min)]
		end
		#Reset max day and repeat loop for next lowest day.
		max_digit = -1
		min_digit += 1
		max = arr.sort[max_digit]
		min = arr.sort[min_digit]
	end

	#Search array of differences. Select the dates where difference is greatest.
	highest = diff.keys.sort.last
	diff[highest]

end	

p stock_picker([17,3,6,9,15,8,6,1,10]) # => [1,4]
p stock_picker([17,7,7,9,15,8,6,1,10]) # => [7,8]
p stock_picker([3,3,3]) # => [0,0]
p stock_picker([4,3,1]) # => [2,2]
p stock_picker([4,2,3]) # => [1,2]