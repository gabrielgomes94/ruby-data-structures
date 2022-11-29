require 'minitest/autorun'
require 'data_structures/lists/queue'
require 'data_structures/nodes/node'

describe Queue do
  before do
    @queue = DataStructures::Queue.new
  end

  describe 'when asked to enqueue an item on an empty queue' do
    it 'must enqueue' do
      @queue.enqueue 10

      assert_equal 1, @queue.size
      assert_equal 10, @queue.head.value
    end
  end

  describe 'when asked to enqueue an item on a queue' do
    it 'must enqueue' do
      @queue.enqueue 10
      @queue.enqueue 20
      @queue.enqueue 50

      assert_equal 3, @queue.size
      assert_equal 50, @queue.head.value
    end
  end

  describe 'when asked to dequeue an item on a queue' do
    it 'must dequeue last enqueued item' do
      @queue.enqueue 10
      @queue.enqueue 20
      @queue.enqueue 50

      item = @queue.dequeue

      assert_equal 2, @queue.size
      assert_equal 50, item.value
    end
  end

  describe 'when asked to dequeue an item on a queue with only one item' do
    it 'must dequeue the only item' do
      @queue.enqueue 10

      item = @queue.dequeue

      assert_equal 0, @queue.size
      assert_equal 10, item.value
      assert_nil @queue.head
    end
  end

  describe 'when asked to clear a queue' do
    it 'must clear the list' do
      @queue.enqueue 10
      @queue.enqueue 20
      @queue.enqueue 50

      @queue.clear

      assert_equal 0, @queue.size
      assert_nil @queue.head
    end
  end
end