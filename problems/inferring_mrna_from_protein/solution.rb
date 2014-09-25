# Problem: Inferring mRNA from Protein
require_relative '../../util/protein'

dataset = File.read('dataset.txt').strip

num_stop = Rosalind::Protein.mRNA('Stop').size

val = dataset.each_char.inject(1) do |comb, amino|
  comb * Rosalind::Protein.mRNA(amino).size
end

val = (val * num_stop) % 1000000

puts val
