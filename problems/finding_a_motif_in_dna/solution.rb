# Problem: Finding a Motif in DNA

haystack, needle = File.readlines('dataset.txt').map(&:strip)

positions = []
(haystack.length - needle.length).times do |i|
  sample = haystack[i, needle.length]
  positions << i + 1 if sample == needle
end

puts positions.join(' ')

