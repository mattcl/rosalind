# Problem: Calculating Expected Offspring

counts = File.read('dataset.txt').strip.split(' ').map(&:to_i)

probabilities = [1, 1, 1, 0.75, 0.5, 0]

sum = 0
counts.each_with_index do |num, i|
  sum += probabilities[i] * num * 2
end

puts sum
