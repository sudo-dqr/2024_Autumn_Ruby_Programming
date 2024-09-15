# lab4: 报文包含字母A-Z 使用字母-数字映射进行编码加密(A->1 B->2 ...)
# 给一串数字加密报文(数字串) 求有多少种解码方式(原文)
# 
# 分析：长度为i的字符串解码方式依赖于i-1和i-2长度的子串 使用动态规划求解
#

def decode_ways(code)
  code = code.to_s
  length = code.length
  dp = Array.new(length + 1, 0)
  dp[0] = 1 
  dp[1] = code[0] != '0' ? 1 : 0
  (2..length).each do |i|
    dp[i] += dp[i - 1] if code[i - 1] != '0' # 当前字符单独解码
    dp[i] += dp[i - 2] if (10..26) === code[i-2..i-1].to_i # 前两位能够组成10-26 
  end
  dp[length]
end

puts decode_ways(12)
puts decode_ways(121212)
puts decode_ways(0)
