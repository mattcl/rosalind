# Problem: Mendels First Law

k, m, n = File.read('dataset.txt').strip.split(' ').map(&:to_i)

genotypes = {'k' => [1,1], 'm' => [1, 0], 'n' => [0, 0]}
data = {'k' => k, 'm' => m, 'n' => n}

punnet_indicies = [0, 1].repeated_permutation(2)

groups = data.keys.repeated_permutation(2)

total = (k + m + n).to_f

p = groups.inject(0) do |sum, group|
  working_set = data.clone
  mom = group.first
  dad = group.last

  p_mom = working_set[mom] / total
  working_set[mom] -= 1

  p_dad = working_set[dad] / (total - 1)
  p_pair = p_mom * p_dad

  # I could have hard coded the genotype probabilities
  possible_genotypes = punnet_indicies.collect do |combination|
    genotypes[mom][combination[0]] + genotypes[dad][combination[1]]
  end

  # since we used ints, any genotype that is less than 1 does not have a
  # dominant gene
  p_dom = possible_genotypes.reject { |v| v < 1 }.count / possible_genotypes.count.to_f

  p = p_pair * p_dom

  sum + p
end

puts p
