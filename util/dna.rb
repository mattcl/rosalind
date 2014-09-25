module Rosalind
  class DNA
    COMPLEMENTS = {
      'A' => 'T',
      'T' => 'A',
      'C' => 'G',
      'G' => 'C'
    }

    def self.to_rna(dna)
      dna.gsub('T', 'U')
    end

    def self.from_rna(rna)
      rna.gsub('U', 'T')
    end

    def self.complement(dna)
      dna.reverse.chars.collect { |c| COMPLEMENTS[c] }.join
    end
  end
end
