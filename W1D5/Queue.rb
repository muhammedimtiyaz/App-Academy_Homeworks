class Queue
  attr_reader :queue_arr

  def initialize
    @queue_arr = []
  end

  def enqueue(el)
    queue_arr.push(el)
  end

  def dequeue
    queue_arr.shift
  end

  def peek
    queue_arr.first
  end
end

q = Queue.new
p q.enqueue(5)
p q.enqueue(3)
p q.dequeue
p q.peek

