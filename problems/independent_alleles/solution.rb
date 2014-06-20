# Problem: Independent Alleles
require_relative '../../util/punnet'

k, n = File.read('dataset.txt').strip.split(' ').map(&:to_i)

# given a set of individuals in a generation, find the probability that they
# would produce at least N children of the desired genotype.
#
# need to know individual genotype x AaBb for probabilities
# need to trace all possible branches through the tree

p_map = Hash.new { |h, g| h[g] = Rosalind::Punnet.nhybrid(g, 'AaBb') }

puts p_map['AAbb']

# given a genotype g, what is the probability that a child is produced with
# desired genotype 'AaBb' when paired with a second parent of 'AaBb'?
desired = 'AaBb'
g = 'AAbb'
puts p_map[g][desired]

# given a staring parent g, what is the probability p that the parent has at
# least n of k children with desired genotype d?
g = 'AaBb'
d = 'AaBb'
