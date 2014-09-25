module Rosalind
  class DNA
    def self.to_rna(dna)
      dna.gsub('T', 'U')
    end

    def self.from_rna(rna)
      rna.gsub('U', 'T')
    end
  end
end
