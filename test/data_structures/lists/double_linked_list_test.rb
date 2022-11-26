require 'minitest/autorun'
require 'data_structures/lists/double_linked_list'
require 'data_structures/nodes/bi_direction_node'
require 'data_structures/nodes/node'

class DoubleLinkedListTest < Minitest::Test
  def setup
    @double_linked_list = DataStructures::DoubleLinkedList.new
  end

  def test_should_initialize_double_linked_list
    assert_nil @double_linked_list.head
    assert_nil @double_linked_list.tail
    assert_equal @double_linked_list.count, 0
  end

  def test_should_insert_node_when_double_linked_list_is_empty
    node = DataStructures::BiDirectionNode.new(20)

    @double_linked_list.insert node

    assert_equal @double_linked_list.head, node
    assert_equal @double_linked_list.tail, node
    assert_equal @double_linked_list.count, 1
  end

  def test_should_insert_node_when_double_linked_list_already_have_nodes
    @double_linked_list.insert head = DataStructures::BiDirectionNode.new(20)
    @double_linked_list.insert second_node = DataStructures::BiDirectionNode.new(30)
    @double_linked_list.insert third_node = DataStructures::BiDirectionNode.new(50)

    assert_equal @double_linked_list.head, head
    assert_nil @double_linked_list.head.previous_node
    assert_equal @double_linked_list.head.next_node, second_node
    assert_equal @double_linked_list.tail, third_node
    assert_equal @double_linked_list.tail.previous_node, second_node
    assert_nil @double_linked_list.tail.next_node
  end

  def test_should_insert_node_using_append_opereator
    @double_linked_list << node = DataStructures::BiDirectionNode.new(20)

    assert_equal @double_linked_list.head, node
    assert_equal @double_linked_list.tail, node
    assert_equal @double_linked_list.count, 1
  end

  def test_should_not_insert_when_not_given_bi_direction_node
    assert_raises(RuntimeError, 'Argument error: node must be BiDirectionNode') do
      @double_linked_list.insert DataStructures::Node.new(20)
    end
  end

  def test_should_remove_node_when_double_linked_list_has_only_one
    @double_linked_list.insert head = DataStructures::BiDirectionNode.new(20)

    @double_linked_list.remove head

    assert_nil @double_linked_list.head
    assert_nil @double_linked_list.tail
    assert_equal @double_linked_list.count, 0
  end

  def test_should_remove_head_node_when_double_linked_list_has_many_nodes
    setup_double_linked_list

    @double_linked_list.remove @head

    assert_equal @double_linked_list.head, @second_node
    assert_equal @double_linked_list.head.next_node, @third_node
    assert_nil @double_linked_list.head.previous_node

    assert_equal @double_linked_list.tail, @third_node
    assert_nil @double_linked_list.tail.next_node
    assert_equal @double_linked_list.tail.previous_node, @second_node

    assert_equal @double_linked_list.count, 2
  end

  def test_should_remove_node_when_double_linked_list_has_many_nodes
    setup_double_linked_list

    @double_linked_list.remove @second_node

    assert_equal @double_linked_list.head, @head
    assert_equal @double_linked_list.head.next_node, @third_node
    assert_nil @double_linked_list.head.previous_node

    assert_equal @double_linked_list.tail, @third_node
    assert_nil @double_linked_list.tail.next_node
    assert_equal @double_linked_list.tail.previous_node, @head

    assert_equal @double_linked_list.count, 2
  end

  def test_should_remove_tail_node_from_double_linked_list
    setup_double_linked_list

    @double_linked_list.remove @third_node

    assert_equal @double_linked_list.head, @head
    assert_equal @double_linked_list.head.next_node, @second_node
    assert_nil @double_linked_list.head.previous_node

    assert_equal @double_linked_list.tail, @second_node
    assert_nil @double_linked_list.tail.next_node
    assert_equal @double_linked_list.tail.previous_node, @head

    assert_equal @double_linked_list.count, 2
  end

  def test_should_join_two_double_linked_lists
    setup_double_linked_list
    second_double_linked_list = DataStructures::DoubleLinkedList.new
    second_double_linked_list << DataStructures::BiDirectionNode.new(120)
    second_double_linked_list << DataStructures::BiDirectionNode.new(145)
    second_double_linked_list << DataStructures::BiDirectionNode.new(190)

    @double_linked_list.join second_double_linked_list

    assert_equal @double_linked_list.tail, second_double_linked_list.tail
    assert_equal @double_linked_list.count, 6
  end

  def test_should_not_join_when_not_given_a_double_linked_list
    setup_double_linked_list

    assert_raises(RuntimeError, 'Argument error: list must be DoubleLinkedList to join') do
      @double_linked_list.join [20, 25, 35]
    end
  end

  def test_should_find_last_item
    setup_double_linked_list

    result = @double_linked_list.find_last do |node|
      node.value == 30
    end

    assert_equal result, @second_node
  end

  def test_should_not_find_last_item
    setup_double_linked_list

    result = @double_linked_list.find_last do |node|
      node.value == 200
    end

    assert_nil result
  end

  def test_should_traverse_list_backwards_with_reserve_each
    setup_double_linked_list

    values = []
    @double_linked_list.reverse_each do |node|
      values << node.value
    end

    assert_equal values, [50, 30, 20]
  end

  def test_should_reverse_print
    setup_double_linked_list

    assert_equal @double_linked_list.reverse_print, '[50, 30, 20]'
  end

  private

  def setup_double_linked_list
    @double_linked_list.insert @head = DataStructures::BiDirectionNode.new(20)
    @double_linked_list.insert @second_node = DataStructures::BiDirectionNode.new(30)
    @double_linked_list.insert @third_node = DataStructures::BiDirectionNode.new(50)
  end
end
