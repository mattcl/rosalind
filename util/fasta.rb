module Rosalind
  module Fasta
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
  end
end
