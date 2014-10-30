# Problem: Counting DNA Nucleotides

dataset = File.read('dataset.txt')

stats = Hash.new { |h, k| h[k] = 0 }

dataset.each_char { |c| stats[c.downcase] += 1 }

puts %w{a c g t}.collect { |c| stats[c] }.join(' ')
