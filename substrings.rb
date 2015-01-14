def substrings(word, arr)
	ans = Hash.new(0)
	words = word.split("")
	
	match = ""

	arr.each do |dict|
		words.each do |text|
			if dict.include? text
				match = match + text
			end
		end
		arr.each do |word| 
			if match == word
				ans[match] += 1
			end
		end
		match = ""
	end

	ans

	#words.each do |text|
	#	if arr.include? text
	#	ans[text] += 1
	#	end
	#end

	#ans

end

dictionary = ["below","down","go","going","horn","how","howdy",
	"it","i","low","own","part","partner","sit"]

p substrings("below", dictionary)
p substrings("below down", dictionary)
#p substrings("Howdy partner, sit down! How's it going?", dictionary)