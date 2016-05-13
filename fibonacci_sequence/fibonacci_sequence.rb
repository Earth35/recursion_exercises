# generate a Fibonacci sequence of lenth n:
def fibs (n) # using an iterator
  result = [0, 1]
  return nil if n == 0
  return [result[0]] if n == 1
  return result if n == 2
  until result.length == n
    result << result[-2] + result[-1]
  end
  return result
end

def fibs_rec (n) # recursively
  case n
    when 0 then return nil
    when 1 then return [0]
    when 2 then return [0, 1]
  else
    previous = fibs_rec(n-1)
    previous << previous[-2] + previous[-1]
  end
end

def test (ary)
  ary.each do |n|
    print "I: #{fibs(n)}"
    puts
    print "R: #{fibs_rec(n)}"
    puts
  end
end

test([0,1,2,3,5,10,15])