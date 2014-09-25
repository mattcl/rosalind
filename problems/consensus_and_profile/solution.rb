# Problem: Consensus and Profile

require_relative '../../util/rosalind'

data = Rosalind::Fasta.import('dataset.txt')

profile = Hash.new { |h, k| h[k] = Array.new(data.values.first.size, 0) }

consensus = ''

data.values.first.size.times do |i|
  data.values.size.times do |j|
    profile[data.values[j][i]][i] += 1
  end

  max = -1
  max_key = nil
  %w{A C G T}.each do |j|
    if profile[j][i] > max
      max = profile[j][i]
      max_key = j
    end
  end
  consensus += max_key
end

puts consensus

%w{A C G T}.each do |k|
  puts "#{k}: #{profile[k].join(' ')}"
end
