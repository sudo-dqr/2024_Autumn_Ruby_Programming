# lab3:对于一个正整数n 输出其二进制有多少个1

def count_ones(n)
  binary = []
  binary << (n % 2) && (n /= 2) while n > 0
  binary.count(1)
end

puts count_ones(100)
puts count_ones(1234567890)