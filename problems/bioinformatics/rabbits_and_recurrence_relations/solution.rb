# Problem: Rabbits and Recurrence Relations

dataset = File.read('dataset.txt')

n, k = dataset.split(' ').collect { |e| e.to_i }

generations = [1, 1]

(n - 2).times do |i|
  generations[i + 2] = generations[i] * k + generations[i + 1]
end

puts generations.last

