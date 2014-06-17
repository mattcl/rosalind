# Problem: Finding a Shared Motif
require 'set'
require_relative '../../util/fasta'

data = Rosalind::Fasta.import('dataset.txt')

sequences = data.values.sort_by { |s| s.length }

# find all common sub sequences for the shortest two sequences
common_seq = Set.new

s1 = sequences.shift
s2 = sequences.shift



puts sequences.inspect
