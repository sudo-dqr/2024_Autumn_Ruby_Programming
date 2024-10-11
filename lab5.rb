key = gets.chomp.split
value = gets.chomp.split
hash = Hash[key.zip(value)]
puts hash.to_s