# Problem: Overlap Graphs

require 'set'
require_relative '../../util/fasta'

data = Rosalind::Fasta.import('dataset.txt')

edges = Set.new

data.each do |label, sequence|
  overlap = sequence[-3, 3]
  adjacency_list = data.select { |c_label, candidate| c_label != label && candidate.start_with?(overlap) }
  if adjacency_list.any?
    edges.merge(adjacency_list.keys.collect { |c_label| "#{label} #{c_label}" })
  end
end

puts edges.to_a
