# Problem: Translating RNA into Protein
require_relative '../../util/protein'

dataset = File.read('dataset.txt')

protein = ''
dataset.strip.chars.each_slice(3).each do |codon|
  val = Rosalind::Protein.amino_acid(codon.join)
  break if val == 'Stop'
  protein += val
end

puts protein
