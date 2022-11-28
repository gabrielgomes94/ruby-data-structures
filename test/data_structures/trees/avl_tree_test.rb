require 'minitest/autorun'
require 'data_structures/trees/avl_tree'
require 'data_structures/nodes/avl_tree_node'

class AVLTreeTest < Minitest::Test
  def setup
    root = DataStructures::AVLTreeNode.new 10, 'teste'
    @avl_tree = DataStructures::AVLTree.new root
  end

  def test_should_insert_into_avl_tree
    @avl_tree.insert 4, 'teste'
    @avl_tree.insert 3, 'teste'
    @avl_tree.insert 12, 'teste'

    result @avl_tree.print

    assert_equal '', result
  end
end
