module DataStructures
  class TreeNode
    attr_accessor :left_node
    attr_accessor :right_node
    attr_accessor :parent_node
    attr_reader :data

    def initialize(data:, parent_node: nil, left_node: nil, right_node: nil)
      @data = data
      self.parent_node = parent_node
      self.left_node = left_node
      self.right_node = right_node
    end

    def root?
      self.parent.nil?
    end
  end
end
