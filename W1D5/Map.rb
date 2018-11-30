
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