# Problem: Independent Alleles
require_relative '../../util/punnet'

k, n = File.read('dataset.txt').strip.split(' ').map(&:to_i)

p = Rosalind::Punnet.nhybrid('AaBb', 'AaBb')['AaBb']

@fac_map = Hash.new { |h, i| h[i] = (1..i).inject(:*) }

def comb(num, c)
  return 1 if c >= num
  @fac_map[num] / (@fac_map[c] * @fac_map[num - c])
end

total_children = 2**k

desired_p = (n..(total_children)).to_a.reduce(0) do |sum, i|
  sum + comb(total_children, i) * (p ** i) * (1 - p) ** (total_children - i)
end

puts desired_p
