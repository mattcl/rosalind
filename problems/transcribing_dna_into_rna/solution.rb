# Problem: Transcribing DNA into RNA
require_relative '../../util/rosalind'

dataset = File.read('dataset.txt')

puts Rosalind::DNA.to_rna(dataset)
