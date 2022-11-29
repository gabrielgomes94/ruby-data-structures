module DataStructures
  class AVLTree
    attr_accessor :root

    def initialize(root)
      @root = root
    end

    def insert(key, data)
      @root = insert_and_balance(@root, key, data)
    end

    def remove
      # TODO
    end

    def search
    end

    def print
      print_recursive @root, 0
    end

    private

    def insert_and_balance(node, key, data)
      return AVLTreeNode.new key, data unless node

      if key < node.key
        node.left_node = insert_and_balance(node.left_node, key, data)
      elsif key > node.key
        node.right_node = insert_and_balance(node.right_node, key, data)
      else
        node.data = data
      end

      balance(node)
    end

    def balance(node)
      # set_height node

      if height(node.left_node) - height(node.right_node) == 2
        if height(node.left_node&.right_node) > height(node.left_node&.left_node)
          return rotate_left_right(node)
        end

        return rotate_right(node)
      elsif height(node.right_node) - height(node.left_node) == 2
        if height(node.right_node&.left_node) > height(node.right_node&.right_node)
          return rotate_right_left(node)
        end
        return rotate_left(node)
      end

      node
    end

    def set_height(node)

    end

    def height(node)
      temp = node
      left_height = 0

      while temp
        temp = temp.left_node
        left_height += 1
      end

      temp = node
      right_height = 0

      while temp
        temp = temp.right_node
        right_height += 1
      end

      right_height > left_height ? right_height : left_height
    end

    def rotate_right(node)
      aux_node = node.left_node
      node.left_node  = aux_node.right_node
      aux_node.right_node = node

      aux_node
    end

    def rotate_left(node)
      aux_node = node.right_node
      node.right_node = aux_node.left_node
      aux_node.left_node = node

      aux_node
    end

    def rotate_left_right(node)
      node.left_node = rotate_left(node.left_node)

      rotate_right(node)
    end

    def rotate_right_left(node)
      node.right_node = rotate_right(node.right_node)
      rotate_left(node)
    end

    def print_recursive(node, indent)
      unless node
        puts "x".rjust(indent * 4, " ")
        return
      end

      puts_key node, indent
      print_recursive node.left_node, indent + 1
      print_recursive node.right_node, indent + 1
    end

    def puts_key(node, indent)
      txt = node.key.to_s

      puts txt.rjust(indent * 4, " ")
    end
  end
end
