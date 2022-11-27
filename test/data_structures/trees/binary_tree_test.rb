require 'minitest/autorun'
require 'data_structures/trees/binary_tree'
require 'data_structures/nodes/tree_node'


class BinaryTreeTest < Minitest::Test
  def setup
    @root = DataStructures::TreeNode.new data: 10
    @binary_tree = DataStructures::BinaryTree.new @root
  end

  def test_should_insert_node_on_left_side
    @binary_tree.insert_left(@root, 8)

    assert_equal 2, @binary_tree.size
    assert_equal 8, @root.left_node.data
  end

  def test_should_insert_node_on_right_side
    @binary_tree.insert_right(@root, 15)

    assert_equal 2, @binary_tree.size
    assert_equal 15, @root.right_node.data
  end

  def test_should_insert_nodes_on_left_and_right_side
    @binary_tree.insert_left(@root, 8)
    node_on_right = @binary_tree.insert_right(@root, 15)
    @binary_tree.insert_left(node_on_right, 13)

    assert_equal 4, @binary_tree.size
    assert_equal 8, @root.left_node.data
    assert_equal 15, @root.right_node.data
    assert_equal 13, node_on_right.left_node.data
  end

  def test_should_remove_left_node
    @binary_tree.insert_left(@root, 8)

    @binary_tree.remove_left(@root)

    assert_equal 1, @binary_tree.size
    assert_nil @root.left_node
  end

  def test_should_not_remove_left_node_when_given_nil
    @binary_tree.insert_left(@root, 8)

    @binary_tree.remove_left(nil)

    assert_equal 2, @binary_tree.size
    assert_equal 8, @root.left_node.data
  end

  def test_should_remove_right_node
    @binary_tree.insert_right(@root, 8)

    @binary_tree.remove_right(@root)

    assert_equal 1, @binary_tree.size
    assert_nil @root.right_node
  end

  def test_should_not_remove_right_node_when_given_nil
    @binary_tree.insert_right(@root, 12)

    @binary_tree.remove_right(nil)

    assert_equal 2, @binary_tree.size
    assert_equal 12, @root.right_node.data
  end

  def test_should_print
    node_on_left = @binary_tree.insert_left(@root, 8)
    node_on_right = @binary_tree.insert_right(@root, 15)
    @binary_tree.insert_left(node_on_right, 13)
    @binary_tree.insert_left(node_on_left, 4)
    @binary_tree.insert_right(node_on_right, 18)

    result = @binary_tree.print

    assert_equal "", result
  end

  def test_should_merge
    @binary_tree.insert_left(@root, 8)
    @binary_tree.insert_right(@root, 15)

    result = DataStructures::BinaryTree.merge @binary_tree, @binary_tree

    assert_equal 6, result.size
  end
end
