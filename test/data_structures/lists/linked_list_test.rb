require 'minitest/autorun'
require 'data_structures/lists/linked_list'
require 'data_structures/nodes/node'
require 'data_structures/nodes/bi_direction_node'

class LinkedListTest < Minitest::Test
  def setup
    @linked_list = DataStructures::LinkedList.new
  end

  def test_should_initialize_linked_list
    assert_nil @linked_list.head, 'head should start as nil'
    assert_nil @linked_list.tail, 'tail should start as nil too'
    assert_equal @linked_list.count, 0
  end

  def test_should_insert_node_when_linked_list_is_empty
    node = DataStructures::Node.new(12)
    @linked_list.insert node

    assert_equal @linked_list.head, node
    assert_equal @linked_list.tail, node
    assert_equal @linked_list.count, 1
  end

  def test_should_insert_node_when_linked_list_already_have_nodes
    @linked_list.insert head = DataStructures::Node.new(12)
    @linked_list.insert second_node = DataStructures::Node.new(12)
    @linked_list.insert third_node = DataStructures::Node.new(20)

    assert_equal @linked_list.head, head
    assert_equal @linked_list.head.next_node, second_node
    assert_equal @linked_list.tail, third_node
    assert_equal @linked_list.count, 3
  end

  def test_should_insert_using_append_operator
    @linked_list << head = DataStructures::Node.new(12)
    @linked_list << second_node = DataStructures::Node.new(12)

    assert_equal @linked_list.head, head
    assert_equal @linked_list.head.next_node, second_node
    assert_equal @linked_list.tail, second_node
    assert_equal @linked_list.count, 2
  end

  def test_should_not_insert_when_node_is_not_given
    assert_raises(RuntimeError, 'Argument error: node must be Node') do
      @linked_list.insert DataStructures::BiDirectionNode.new(20)
    end
  end

  def test_should_remove_node
    setup_linked_list

    @linked_list.remove @second_node

    assert_equal @linked_list.head, @head_node
    assert_equal @linked_list.tail, @third_node
    assert_equal @linked_list.count, 2
  end

  def test_should_remove_head_node
    setup_linked_list

    @linked_list.remove @head_node

    assert_equal @linked_list.head, @second_node
    assert_equal @linked_list.tail, @third_node
    assert_equal @linked_list.count, 2
  end

  def test_should_remove_tail_node
    setup_linked_list

    @linked_list.remove @third_node

    assert_equal @linked_list.head, @head_node
    assert_equal @linked_list.tail, @second_node
    assert_equal @linked_list.count, 2
  end

  def test_should_remove_head_node_when_head_is_the_only_element
    @linked_list.insert head = DataStructures::Node.new(12)

    @linked_list.remove head

    assert_nil @linked_list.head
    assert_nil @linked_list.tail
    assert_equal @linked_list.count, 0
  end

  def test_should_not_remove_when_linked_list_is_empty
    # Act
    random_node = DataStructures::Node.new(12)

    assert_nil @linked_list.remove random_node
  end

  def test_should_not_remove_when_node_is_nil
    assert_nil @linked_list.remove nil
  end

  def test_should_join_linked_lists
    setup_linked_list
    second_list = DataStructures::LinkedList.new
    second_list.insert DataStructures::Node.new(90)
    second_list.insert DataStructures::Node.new(99)

    @linked_list.join second_list

    assert_equal @linked_list.head, @head_node
    assert_equal @linked_list.tail, second_list.tail
    assert_equal @linked_list.count, 5
  end

  def test_should_not_join_linked_lists_when_passing_nil
    setup_linked_list

    assert_nil @linked_list.join nil
  end

  def test_should_clear_linked_list
    setup_linked_list

    @linked_list.clear

    assert_nil @linked_list.head
    assert_nil @linked_list.tail
    assert_equal @linked_list.count, 0
  end

  def test_should_find_node_in_linked_list
    setup_linked_list

    result = @linked_list.find do |node|
      node.value == 15
    end

    assert_equal result, @second_node
  end

  def test_should_not_find_node_in_linked_list
    setup_linked_list

    result = @linked_list.find do |node|
      node == DataStructures::Node.new(50)
    end

    assert_nil result
  end

  def test_should_not_find_node_when_block_is_not_given
    setup_linked_list

    assert_nil @linked_list.find
  end

  def test_should_iterate_through_each_element_in_linked_list
    setup_linked_list

    values = []
    @linked_list.each do |node|
      values << node.value
    end

    assert_equal values, [12, 15, 20]
  end

  def test_should_not_iterate_through_each_element_when_block_is_not_given
    setup_linked_list

    assert_nil @linked_list.each
  end

  def test_should_print_node_values
    setup_linked_list

    assert_equal @linked_list.print, "[12, 15, 20]"
  end

  private

  def setup_linked_list
    @linked_list.insert @head_node = DataStructures::Node.new(12)
    @linked_list.insert @second_node = DataStructures::Node.new(15)
    @linked_list.insert @third_node = DataStructures::Node.new(20)
  end
end
