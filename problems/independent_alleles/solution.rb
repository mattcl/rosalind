# Problem: Independent Alleles
require_relative '../../util/punnet'
require_relative '../../util/tree'

k, n = File.read('dataset.txt').strip.split(' ').map(&:to_i)

class PNode < Rosalind::UNode
  def edge_label(child)
    child.data[:prob]
  end
end

@p_map = Hash.new { |h, g| h[g] = Rosalind::Punnet.nhybrid(g, 'AaBb') }

def build(node, depth)
  # breed
end

# given a staring parent g, what is the probability p that the parent has at
# least n of k children with desired genotype d?
g = 'AaBb'
d = 'AaBb'

tree = PNode.new("0:#{g}", {genotype: g, prob: 1})

p_map[g].each do |genotype, p|
  child = PNode.new("1:#{genotype}", {genotype: genotype, prob: p})
  tree.insert(child)
end

tree.graph.output(png:'testing.png')
