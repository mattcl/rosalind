require 'graphviz'

module Rosalind
  class UNode
    attr_accessor :label
    attr_reader :children
    attr_reader :data

    def initialize(label, data = {})
      @label = label
      @children = {}
      @data = data
    end

    def is_leaf?
      children.empty?
    end

    def insert(child)
      children[child.label] = child
    end

    def graph
      g = GraphViz.new(:G, type: :digraph)
      graph_recursive(g)
      g
    end

    def edge_label(child)
      ''
    end

    def node_label
      label
    end

    protected

    def graph_recursive(g)
      graph_node = g.add_node(self.object_id.to_s, {label: node_label})
      children.each do |_, child|
        child_graph_node = child.graph_recursive(g)
        g.add_edge(graph_node, child_graph_node, {label: edge_label(child)})
      end
      graph_node
    end
  end
end
