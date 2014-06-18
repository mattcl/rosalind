require 'graphviz'
require 'set'

module Rosalind
  class GeneralizedSuffixTree
    attr_reader :strings
    attr_reader :root
    def initialize(strs)
      @strings = strs
      @root = Node.new
      strs.each_with_index do |str, id|
        str = "#{str}$#{id}"
        str.length.times do |pos|
          break if str[pos] == '$'
          @root.insert(str[pos..-1], id, pos)
        end
      end
    end

    def graph
      root.graph(strings.inspect)
    end

    class Node
      attr_reader :children
      attr_accessor :id
      attr_accessor :pos
      attr_reader :ids

      def initialize
        @children = Hash.new { |h, k| h[k] = Node.new }
        @ids = Set.new
      end

      def insert(str, id, pos)
        ids.add(id)
        if str.empty?
          self.id = id
          self.pos = pos
        else
          match_key, match_chars = match_child(str)
          if match_key
            # we need to split the child key up to the match
            children[match_chars].insert(str.sub(match_chars, ''), id, pos)

            unless match_key == match_chars
              new_key = match_key.sub(match_chars, '')
              children[match_chars].children[new_key] = children[match_key]
              children[match_chars].ids.merge(children[match_key].ids)
              children.delete(match_key)
            end
          else
            children[str].insert('', id, pos)
          end
        end
      end

      def is_leaf?
        children.empty?
      end

      def graph(msg = '')
        Graph.new(self, msg)
      end

      protected

      def match_child(str)
        children.keys.each do |key|
          match_chars = ''
          key.length.times do |i|
            if key[i] == str[i] && key[i] != '$'
              match_chars += key[i]
            else
              break
            end
          end

          unless match_chars.empty?
            return key, match_chars
          end
        end
        return nil, nil
      end
    end

    class Graph
      attr_reader :g

      @@num = 0

      def initialize(tree, label)
        @g = GraphViz.new(:G, type: :digraph)
        @g[:label] = label
        root_graph_node = @g.add_node(tree.object_id.to_s)
        root_graph_node[:label] = "#{tree.ids.to_a.inspect}"
        add_node(tree, root_graph_node)
        @g.output(png: "output_#{@@num}.png")
        @@num += 1
      end

      def add_node(tree_node, graph_node)
        tree_node.children.each do |char, child|
          child_graph_node = g.add_node(child.object_id.to_s)
          if child.is_leaf?
            child_graph_node[:shape] = 'square'
            child_graph_node[:label] = "#{child.id}:#{child.pos}"
          else
            child_graph_node[:label] = "#{child.ids.to_a.inspect}"
          end

          edge = g.add_edge(graph_node, child_graph_node)
          edge[:label] = char

          add_node(child, child_graph_node)
        end
      end
    end
  end
end
