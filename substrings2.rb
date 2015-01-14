def substrings(str, arr)
	matches = Hash.new(0)
	str.downcase!
	#Create list of words
	words = str.split(" ")
	
	match = ""
	words.each do |word|
		#Split each word into array of individual characters
		word = word.split("")
		#For each word in dictionary
		arr.each do |dict|
			#Loop through characters
			word.each do |text|
				if dict.include? text
					match = match + text
					arr.each do |magic|
					if match == magic
						matches[match] += 1
					end
				end
			end
		end
		match = ""
		end
	end

	matches

end

dictionary = ["below","down","go","going","horn","how","howdy",
	"it","i","low","own","part","partner","sit"]

p substrings("below", dictionary)
p substrings("below down", dictionary)
p substrings("Howdy partner, sit down! How's it going?", dictionary)