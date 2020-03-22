class MyQueue

  def initialize
    @collection = []
  end

  def enqueue(x)
    # BACK of line
    @collection.unshift(x)
  end

  def dequeue
    # FRONT OF LINE
    @collection.pop
  end

  def get_back
    @collection[0]
  end

  def get_front
    @collection[-1]
  end

  def empty
    @collection.empty?
  end

  def size
    @collection.length
  end

end

# q = MyQueue.new
# q.enqueue(1)
# q.enqueue(2)
# q.enqueue(3)
# p q.dequeue == 1
# p q.get_front == 2
# p q.dequeue == 2


class MyStack

  def initialize()
    @queue = MyQueue.new
  end

  # def push(x)
  #   if @stack.length > 0
  #     i = @stack.length
  #     while (i > 0) do
  #       @stack[i] = @stack[i-1]
  #       i = i - 1
  #     end
  #   end
  #   @stack[0] = x
  #   return nil
  # end

  def push(x)
    @queue.enqueue(x)
  end

  def pop
    new_queue = MyQueue.new # [2,1]
    pop_value = nil
    orig_size = @queue.size
    i = 0
    while (i < orig_size) do # [3]
      # puts "#{i} < #{orig_size}"
      if i == orig_size - 1
        pop_value = @queue.dequeue
        # puts "Final #{pop_value}"
      else
        val = @queue.dequeue
        # puts "Putting #{val} into a new queue" # 1 -- 2
        new_queue.enqueue(val)
      end
      i += 1
    end
    @queue = new_queue
    pop_value
  end

  def top()
    @queue.get_back
  end

  def empty()
    @queue.empty
  end

end

# # Your MyStack object will be instantiated and called as such:
# obj = MyStack.new()
# obj.push(1)
# obj.push(2)
# obj.push(3)
# p obj.pop == 3
# p obj.top == 2 #=> 1
# p obj.empty == false #=> false


obj = MyStack.new()
obj.push(1)
obj.push(2)
p obj.top == 2 #=> 1
p obj.pop == 2
p obj.empty == false #=> false
