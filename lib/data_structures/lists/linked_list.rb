require 'data_structures/helpers/type_checker'

module DataStructures
  class LinkedList
    include TypeChecker

    attr_accessor :head
    attr_accessor :tail
    attr_accessor :count

    def initialize
      @head = nil
      @tail = nil
      @count = 0
    end

    def insert(node)
      verify node, Node

      if @head.nil?
        @head = node
      else
        @tail.next_node = node
      end

      @tail = node
      @count += 1
    end

    alias :<< :insert


    def remove(node)
      return nil unless node
      return nil unless @count > 0

      if node == @head
        remove_head
      else
        find_and_remove node
      end

      @count -= 1
    end

    def join(linked_list)
      return nil unless linked_list

      @tail.next_node = linked_list.head
      @tail = linked_list.tail
      @count += linked_list.count
    end

    def clear
      while @count > 0
        remove(@head)
      end
    end

    def find(&predicate)
      return nil unless block_given?

      current = self.head

      while current
        return current if predicate.call(current)
        current = current.next_node
      end
    end

    def each(&predicate)
      return nil unless block_given?

      current = self.head

      while current
        yield current

        current = current.next_node
      end
    end

    def print
      values = []
      self.each do |node|
        values << node.value
      end

      values.to_s
    end

    private

    def remove_head
      @head = @head.next_node

      if @count == 1
        @tail = nil
      end
    end

    def find_and_remove(node)
      target_node = @head

      while target_node && target_node.next_node != node
        target_node = target_node.next_node
      end

      if target_node
        target_node.next_node = node.next_node

        if target_node.next_node.nil?
          @tail = target_node
        end
      end
    end
  end
end