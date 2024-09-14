def mfp(m)
  sum = 0
  (1..m).each do |x|
    sum += x.to_s.chars.map(&:to_i).delete_if { |i| i == 0 }.inject(:*)
  end 

  # 考虑朴素遍历 对于N的一对因数 一个在[2,sqrt(N)]范围 一个在[sqrt(N)+1,N)范围
  # O(sqrt(N))复杂度 10^6 2s 可以忍受

  prime = nil
  (2..Math.sqrt(sum)).each do |i|
    prime = i if sum % i == 0;
    sum /= i while sum % i == 0;
  end
  prime = sum if prime.nil? && sum > 1
  prime.nil? ? 1 : prime
end

puts mfp(1)
puts mfp(9999)
puts mfp(10000)