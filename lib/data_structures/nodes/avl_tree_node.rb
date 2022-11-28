module DataStructures
  class AVLTreeNode
    attr_reader :key
    attr_accessor :data
    attr_accessor :height
    attr_accessor :left_node
    attr_accessor :right_node

    def initialize(key, data)
      @key = key
      @data = data
      @height = nil
      @left_node = nil
      @right_node = nil
    end
  end
end
