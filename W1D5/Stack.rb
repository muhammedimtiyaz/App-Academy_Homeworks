class Stack
  attr_reader :stack

  def initialize
    @stack = []
  end

  def push(el)
    stack.push(el)
  end

  def pop
    stack.pop
  end

  def peek
    stack.last
  end
end

p s = Stack.new
p s.push(2)
p s.push(3)
p s.pop
p s.peek

