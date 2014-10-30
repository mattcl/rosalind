# Problem: Mortal Fibonacci Rabbits

dataset = File.read('dataset.txt')

# Fn = Fn-2 * k + Fn - 1 - (Fn-3)

n, m = dataset.split(' ').collect { |e| e.to_i }

generations = []
n.times do |i|
  if i < 2
    generations[i] = [[1, 1]]
  else
    breeding_pairs = generations[i - 2]
    new_pairs = breeding_pairs.inject(0) { |sum, e| e[0] + sum }
    generations[i] = generations[i - 1].reject { |e| e[1] <= i - (m - 1) }.push([new_pairs, i])
  end
end

puts generations.last.inject(0) { |sum, e| e[0] + sum}
