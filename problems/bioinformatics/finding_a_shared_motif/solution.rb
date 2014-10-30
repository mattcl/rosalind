# Problem: Finding a Shared Motif
require_relative '../../../util/rosalind'
require_relative '../../../util/suffix_tree'

data = Rosalind::Fasta.import('dataset.txt')

tree = Rosalind::GeneralizedSuffixTree.new(data.values)

@common_substrings = Set.new

def search(bound, node, cur_str)
  return if node.ids.size < bound

  @common_substrings.add(cur_str)

  node.children.each do |char, child|
    search(bound, child, cur_str + char)
  end
end

cur_str = ''
search(data.size, tree.root, cur_str)

puts @common_substrings.to_a.sort_by(&:length).last
