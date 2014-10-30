# Problem: Translating RNA into Protein
require_relative '../../../util/rosalind'

dataset = File.read('dataset.txt').strip

puts Rosalind::Protein.from_rna(dataset)
