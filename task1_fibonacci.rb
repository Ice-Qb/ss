def fib(n)
  a, b = 1, 1
  n.times do
  	a, b = b, a + b
  	puts a
  end 
end

def fib_rec(n)
  n < 2 ? 1 : fib_rec(n - 1) + fib_rec(n - 2)	
end

def fib_range(n, m)
  a, b, i = 1, 1, 1
  while x = fib_rec(i) <= m ? fib_rec(i) : false
  	puts x if x >= n
  	i += 1
  end
end

# fib_range(5, 100)
fib(6)
# puts fib_rec(10)