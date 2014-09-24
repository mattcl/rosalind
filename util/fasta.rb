require 'rest_client'

module Rosalind
  module Fasta
    UNIPROT_URL = 'http://www.uniprot.org/uniprot/'

    def self.import(filename)
      data = Hash.new { |h, k| h[k] = '' }

      cur = nil
      File.readlines('dataset.txt').map(&:strip).each do |line|
        res = line.match(/^>(.*)/)
        if res
          cur = res[1]
        elsif cur
          data[cur] += line
        end
      end

      data
    end

    def self.fetch_from_uniprot(id)
      data = RestClient.get("#{UNIPROT_URL}#{id}.fasta").split("\n")
      data.shift
      data.join
    end
  end
end
