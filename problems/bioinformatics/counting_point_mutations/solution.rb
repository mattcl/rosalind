# Problem: Counting Point Mutations

dataset = File.readlines('dataset.txt').map(&:strip)

dist = 0
dataset[0].chars.each_with_index do |val, i|
  dist += 1 if val != dataset[1][i]
end

puts dist
