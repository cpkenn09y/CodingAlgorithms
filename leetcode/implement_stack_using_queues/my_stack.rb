class MyStack

=begin
    Initialize your data structure here.
=end
    def initialize()
      @stack = [] # [1]
    end


=begin
    Push element x onto stack.
    :type x: Integer
    :rtype: Void
=end
    def push(x)
      @stack.unshift(x)
    end


=begin
    Removes the element on top of the stack and returns that element.
    :rtype: Integer
=end
    def pop()
      @stack.shift
    end


=begin
    Get the top element.
    :rtype: Integer
=end
    def top()
      @stack[0]
    end


=begin
    Returns whether the stack is empty.
    :rtype: Boolean
=end
    def empty()
      @stack.empty?
    end


end

# Your MyStack object will be instantiated and called as such:
obj = MyStack.new()
obj.push(1)
obj.push(2)
p param_2 = obj.pop() == 2 #=> 2
p param_3 = obj.top() == 1 #=> 1
p param_4 = obj.empty() == false #=> false
