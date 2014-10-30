# Problem: Open Reading Frames

require_relative '../../../util/rosalind'

data = Rosalind::Fasta.import('dataset.txt').values.first

rna = Rosalind::DNA.to_rna(data)

start = Rosalind::Protein::START_CODON

proteins = []
(rna.length - start.length).times do |i|
  sample = rna[i..-1]
  proteins << Rosalind::Protein.from_rna(sample) if sample.start_with?(start)
end

rna = Rosalind::DNA.to_rna(Rosalind::DNA.complement(data))

(rna.length - start.length).times do |i|
  sample = rna[i..-1]
  proteins << Rosalind::Protein.from_rna(sample) if sample.start_with?(start)
end

puts proteins
