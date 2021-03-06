module Rosalind
  class Protein
    MRNA_TO_AMINO_ACID = {
      'UUU' => 'F', 'CUU' => 'L', 'AUU' => 'I', 'GUU' => 'V', 'UUC' => 'F',
      'CUC' => 'L', 'AUC' => 'I', 'GUC' => 'V', 'UUA' => 'L', 'CUA' => 'L',
      'AUA' => 'I', 'GUA' => 'V', 'UUG' => 'L', 'CUG' => 'L', 'AUG' => 'M',
      'GUG' => 'V', 'UCU' => 'S', 'CCU' => 'P', 'ACU' => 'T', 'GCU' => 'A',
      'UCC' => 'S', 'CCC' => 'P', 'ACC' => 'T', 'GCC' => 'A', 'UCA' => 'S',
      'CCA' => 'P', 'ACA' => 'T', 'GCA' => 'A', 'UCG' => 'S', 'CCG' => 'P',
      'ACG' => 'T', 'GCG' => 'A', 'UAU' => 'Y', 'CAU' => 'H', 'AAU' => 'N',
      'GAU' => 'D', 'UAC' => 'Y', 'CAC' => 'H', 'AAC' => 'N', 'GAC' => 'D',
      'CAA' => 'Q', 'AAA' => 'K', 'GAA' => 'E', 'CAG' => 'Q', 'AAG' => 'K',
      'GAG' => 'E', 'UGU' => 'C', 'CGU' => 'R', 'AGU' => 'S', 'GGU' => 'G',
      'UGC' => 'C', 'CGC' => 'R', 'AGC' => 'S', 'GGC' => 'G', 'CGA' => 'R',
      'AGA' => 'R', 'GGA' => 'G', 'UGG' => 'W', 'CGG' => 'R', 'AGG' => 'R',
      'GGG' => 'G', 'UGA' => 'Stop', 'UAA' => 'Stop', 'UAG' => 'Stop',
    }

    START_CODON = 'AUG'

    def self.mRNA(amino_acid)
      unless @mrna_lookup
        @mrna_lookup = Hash.new { |h, k| h[k] = [] }
        MRNA_TO_AMINO_ACID.each { |k, v| @mrna_lookup[v] << k }
      end
      @mrna_lookup[amino_acid]
    end

    def self.amino_acid(codon)
      MRNA_TO_AMINO_ACID[codon]
    end

    def self.from_rna(rna)
      protein = ''
      rna.chars.each_slice(3).each do |codon|
        val = self.amino_acid(codon.join)
        break if val == 'Stop'
        protein += val
      end

      protein
    end
  end
end
