# Problem: Computing GC Content
require_relative '../../util/fasta'

data = Rosalind::Fasta.import('dataset.txt')

max = 0
max_key = nil
data.each do |k, v|
  pct = v.gsub(/[AT]/, '').length.to_f / v.length.to_f * 100
  if pct > max
    max = pct
    max_key = k
  end
end

puts max_key
puts max
