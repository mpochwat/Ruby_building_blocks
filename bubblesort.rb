def bubble_sort(arr)
	n = arr.length
	times = n-2
	# Counter for how many #s swapped in an iteration. If 0, no more iterations.
	count = 0

	while times > -1
		for i in (0..times)
			if arr[i] > arr[i+1]
				arr[i], arr[i+1] = arr[i+1], arr[i]
				count += 1
			end
		end
		if count == 0
			break
		end
		times -= 1
		count = 0
	end

	arr

end

p bubble_sort([5,4,3,2,1])
p bubble_sort([1,1,3,5,4])
p bubble_sort([10,9,8,7,6,5,4,3,2,1])

def bubble_sort_by(arr)
	n = arr.length
	times = n-2
	count = 0

	while times > -1
		for i in (0..times)
			if yield(arr[i], arr[i+1]) < 0
				arr[i], arr[i+1] = arr[i+1], arr[i]
				count += 1
			end
		end
		if count == 0
			break
		end
		times -= 1
		count = 0
	end

	arr

end

x = ["hi","hello","hey"]
bubble_sort_by(x) do |left, right|
	right.length - left.length
end
p x