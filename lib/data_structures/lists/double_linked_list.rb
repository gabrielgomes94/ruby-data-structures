require 'data_structures/lists/linked_list'
require 'data_structures/helpers/type_checker'

module DataStructures
  class DoubleLinkedList < LinkedList
    include TypeChecker

    def insert(node)
      verify node, BiDirectionNode

      unless @head.nil?
        node.previous_node = @tail
        @tail.next_node = node
      end

      super
    end

    def remove(node)
      return nil unless node

      if node == @head
        if @head.next_node.nil?
          @head = @tail = nil
        else
          @head = @head.next_node
          @head.previous_node = nil
        end
      elsif node == @tail
        previous_node = node.previous_node
        previous_node.next_node = nil
        @tail = previous_node
      else
        previous_node = node.previous_node
        next_node = node.next_node

        previous_node&.next_node = next_node
        next_node&.previous_node = previous_node
      end

      @count -= 1
    end

    def join(linked_list)
      unless linked_list.kind_of?(DoubleLinkedList)
        raise 'Argument error: list must be DoubleLinkedList to join'
      end

      linked_list.head.previous_node = @tail
      @tail.next_node = linked_list.head
      @tail = linked_list.tail
      @count += linked_list.count
    end

    def find_last &predicate
      return nil unless block_given?

      current = self.tail

      while current
        return current if predicate.call(current)
        current = current.previous_node
      end
    end

    def reverse_each
      return nil unless block_given?

      current = self.tail

      while current
        yield current

        current = current.previous_node
      end
    end

    def reverse_print
      values = []
      self.reverse_each do |node|
        values << node.value
      end

      values.to_s
    end
  end
end
