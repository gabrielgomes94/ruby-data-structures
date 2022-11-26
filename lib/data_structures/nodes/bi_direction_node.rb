module DataStructures
  class BiDirectionNode
    attr_reader :value
    attr_accessor :next_node
    attr_accessor :previous_node

    def initialize(value, next_node = nil, previous_node = nil)
      @value = value
      @next_node = next_node
      @previous_node = previous_node
    end
  end
end
