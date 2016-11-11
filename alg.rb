def result(array1, array2)
  counters = count_numbers(array2)
  cache = {}
  res = array1.map do |number|
    if(cache.key?(number) && cache[number])
      number
    else
      cache[number] = (!counters.key?(number) || !first?(counters[number]))
      number if cache[number]
    end
    
  end
  return res
  
end

def count_numbers(array)
  result = {}
  array.each do |number|
    if result.key?(number)
      result[number] += 1
    else
      result[number] = 1
    end
  end
  result
end

def first?(number)
  return false if number == 1
  sqrt = Math.sqrt(number)
  sqrt_round = sqrt.round
  if sqrt == sqrt.round
    return false
  end
  (2..sqrt.round).each do |n|
    div = number / n.to_f
    return false if div == div.round 
  end
  true
end   

A=[2,3,9,2,5,1,3,7,10]
B=[2,1,3,4,3,10,6,6,1,7,10,10,10]

# (1..100).each do |n|
#   puts "#{n} #{first?(n)}"

# end







puts result(A,B).compact.inspect