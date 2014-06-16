# Problem: Complementing a Strand of DNA

dataset = File.read('dataset.txt')

complements = {
  'A' => 'T',
  'T' => 'A',
  'C' => 'G',
  'G' => 'C'
}

puts dataset.reverse.chars.collect { |c| complements[c] }.join
