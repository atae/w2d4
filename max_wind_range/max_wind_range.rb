def max_windowed_range(array, window_size)
  current_max_range = 0
  (0..array.size-window_size).each do |idx|
    sub_array = array[idx..idx+window_size-1]
    p sub_array
    max = sub_array.max
    min = sub_array.min
    current_max_range = max - min unless current_max_range > max - min
  end
  current_max_range
end


class MyQueue
  def initialize
    @store = []
  end

  def enqueue(val)
    @store.unshift(val)
  end

  def dequeue
    @store.pop
  end

  def peek
    @store.last
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end
end

class MyStack
  def initialize
    @store = []
    @max = []
    @min = []
  end

  def pop
    popped = @store.pop
    @max.pop if popped == @max.last
    @min.pop if popped == @min.last
    popped
  end

  def push(val)
    @store.push(val)
    @max << val if  @max.empty? || val > @max.last
    @min << val if  @min.empty? || val < @min.last
    val
  end

  def max
    @max.last
  end

  def min
    @min.last
  end

  def peek
    @store.last
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end
end

class StackQueue
  def initialize
    @inbox = MyStack.new
    @outbox = MyStack.new
  end

  def enqueue(val)
    @inbox.push(val)
  end

  def dequeue
    if @outbox.empty?
      until @inbox.empty?
        @outbox.push(@inbox.pop)
      end
    end
    @outbox.pop
  end

  def max
    return @inbox.max if @outbox.max.nil?
    return @outbox.max if @inbox.max.nil?
    @inbox.max > @outbox.max ? @inbox.max : @outbox.max
  end

  def min
    return @inbox.min if @outbox.min.nil?
    return @outbox.min if @inbox.min.nil?
    @inbox.min < @outbox.min ? @inbox.min : @outbox.min
  end

  def peek
    @outbox.last
  end

  def size
    @inbox.size + @outbox.size
  end

  def empty?
    @outbox.empty? && @inbox.empty?
  end
end

def windowed_max_range(array, window_size)
  stack = StackQueue.new
  current_max_range = 0
  arr = array.dup

  window_size.times do
    stack.enqueue(arr.shift)
  end

  unless current_max_range > stack.max - stack.min
    current_max_range = stack.max - stack.min
  end

  until arr.empty?

    stack.enqueue(arr.shift)
    stack.dequeue

    unless current_max_range > stack.max - stack.min
      current_max_range = stack.max - stack.min
    end
  end
  return current_max_range
end


if __FILE__ == $PROGRAM_NAME
  p [1, 0, 2, 5, 4, 8]
  p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
  p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
  p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
  p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8
end
