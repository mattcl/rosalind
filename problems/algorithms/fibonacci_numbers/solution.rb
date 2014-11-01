# Problem: Fibonacci Numbers

num = File.read('dataset.txt').chomp.to_i

def fib(n)
  return 0 if n < 1
  return 1 if n == 1
  return fib(n - 1) + fib(n - 2)
end

puts fib(num)
