require 'graphviz'

module Rosalind
  class UNode
    attr_accessor :label
    attr_reader :children

    def initialize(label)
      @children = Hash.new { |h, k| h[k] = self.class.new(k) }
    end

    def is_leaf?
      children.empty?
    end

    def graph(g = nil)
      g = GraphViz.new(:G, type: :digraph) if g.nil?
      children.each do |_, child|
      end
    end
  end
end
