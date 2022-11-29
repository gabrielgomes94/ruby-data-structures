module DataStructures
  class Queue
    attr_accessor :head, :tail, :size

    def initialize
      @head = nil
      @tail = nil
      @size = 0
    end

    def enqueue(data)
      node = Node.new data

      if @size > 0
        node.next_node = @head
      end

      @head = node
      @size += 1
    end

    def dequeue
      return nil unless @size > 0

      dequeued_item = @head
      @head = dequeued_item.next_node
      @size -= 1

      dequeued_item
    end

    def clear
      while @size > 0
        self.dequeue
      end
    end

    def print

    end
  end
end
