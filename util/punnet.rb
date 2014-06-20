# require 'terminal-table'
module Rosalind
  class Punnet
    MONO_MAP = [0, 1].repeated_permutation(2).to_a

    def self.monohybrid(p1, p2)
      distribution = Hash.new { |h, k| h[k] = 0 }
      MONO_MAP.each do |pick|
        distribution[[p1[pick[0]], p2[pick[1]]].sort.join] += 1
      end
      distribution.each { |k, v| distribution[k] = v.to_f / 4.0 }
      distribution
    end

    def self.nhybrid(parent1, parent2)
      # extract the individual monohybrid traits
      parent1 = parent1.chars.to_a.sort_by { |a| a.downcase }.each_slice(2).to_a
      parent2 = parent2.chars.to_a.sort_by { |a| a.downcase }.each_slice(2).to_a

      distributions = []
      parent1.size.times do |i|
        distributions << self.monohybrid(parent1[i], parent2[i])
      end

      distribution = distributions.reduce do |total_dist, dist|
        new_dist = Hash.new { |h, k| h[k] = 0.0 }
        total_dist.each do |gen1, p1|
          dist.each do |gen2, p2|
            new_dist[gen1 + gen2] = p1 * p2
          end
        end
        new_dist
      end

      distribution
    end
  end
end
