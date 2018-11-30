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


class Map
  attr_reader :map_arr

  def initialize
    @map_arr = []
  end

  def set(key, value)
    pair_index = map_arr.index { |pair_arr| pair_arr[0] == key }
    if pair_index
      map_arr[pair_index][1] = value
    else
      map_arr.push([key, value])
    end
    value
  end

  def get(key)
    map_arr.each { |pair_arr| return pair_arr[1] if pair_arr[0] == key }
    nil
  end

  def delete(key)
    value = get(key)
    map_arr.reject! { |pair_arr| pair_arr[0] == key }
    value
  end

  def show
    map_arr.flatten
  end
end

m = Map.new
p m.set("a",1)
p m.set("b",2)
p m.set("a",5)
p m.get("b")
p m.delete("a")
p m.show