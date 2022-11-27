module DataStructures
  class BinaryTree
    attr_reader :root
    attr_accessor :size # Testar se da pra declarar isso como reader

    def initialize(root)
      @root = root
      @size = 1
    end

    def insert_left(node, data)
      return unless node
      raise "Can't override nodes" if node.left_node

      @size += 1
      node.left_node = TreeNode.new data: data, parent_node: node
    end

    def insert_right(node, data)
      return unless node
      raise "Can't override nodes" if node.right_node

      @size += 1
      node.right_node = TreeNode.new data: data, parent_node: node
    end

    def remove_left(node)
      return unless node&.left_node

      remove_left(node.left_node)
      remove_right(node.left_node)
      node.left_node = nil
      @size -= 1
    end

    def remove_right(node)
      return unless node&.right_node

      remove_left(node.right_node)
      remove_right(node.right_node)
      node.right_node = nil
      @size -= 1
    end

    def print
      print_recursive self.root
    end

    def self.merge(left_tree, right_tree, data = nil)
      raise "Can't merge nil trees." unless left_tree && right_tree

      root = TreeNode.new(data: data)
      tree = DataStructures::BinaryTree.new root
      tree.root.left_node  = left_tree.root
      tree.root.right_node = right_tree.root
      tree.size = left_tree.size + right_tree.size
      tree
    end

    private

    def print_recursive(node, indent = 0)
      print_node node, indent
      print_recursive node.left_node, indent + 1 if node&.left_node
      print_recursive node.right_node, indent + 1 if node&.right_node
    end

    def print_node(node, indent)
      data = node&.data&.to_s || "nil"
      puts data.rjust indent * 4, " "
    end
  end
end
