# Problem: Finding a Protein Motif

require_relative '../../../util/rosalind'

search = /^N[^P][ST][^P]/

ids = File.readlines('dataset.txt').map(&:strip)

data = {}
ids.each do |id|
  data[id] = Rosalind::Fasta.fetch_from_uniprot(id)
end

data.each do |key, haystack|

  positions = []
  (haystack.length - 4).times do |i|
    sample = haystack[i, 4]
    positions << i + 1 if sample.match(search)
  end

  next if positions.empty?

  puts key
  puts positions.join(' ')
end
