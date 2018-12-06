class Array

#Sluggish Octopus implements bubble_sort
    def sluggish_octopus(&prc)
        prc = Proc.new { |x,y| x <=> y }
        sorted = false
        until sorted
            sorted = true
            (0...self.length-1).each do |i|
                case prc.call(self[i].length, self[i+1].length)
                when 1
                    sorted = false
                    self[i], self[i+1] = self[i+1], self[i]
                end
            end
        end

        self.last
    end

#Dominant Octopus uses merge sort
    def merge_sort(&prc)
        return self if length <= 1
        prc ||= Proc.new { |x,y| x.length <=> y.length }

        mid = count / 2
        sorted_left = self.take(mid).merge_sort(&prc)
        sorted_right = self.drop(mid).merge_sort(&prc)

        result = Array.merge(sorted_left, sorted_right, &prc)
    end

    def self.merge(left, right, &prc)
        merged = []

        until left.empty? || right.empty?
            case prc.call(left.first, right.first)
            when -1
                merged << left.shift
            when 0
                merged << right.shift
            when 1
                merged << right.shift
            end
        end

        merged + left + right
    end

    def dominant_octopus
        merge_sort.last
    end

#We can use reduce to reach the longest fish, just like finding the longest word problem.
    def clever_octopus
        self.reduce do |longest, fish|
            if fish.length > longest.length
                fish
            else
                longest
            end
        end
    end
end

def slow_dance(move, tiles_array)
    tiles_array.each_with_index do |tile, i|
        return i if tile == move
    end
end

#We can use a hash as the data structure with the keys as the moves and the values as the indices.
def fast_dance(move, new_tiles)
    new_tiles[moves]
end

p ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh'].sluggish_octopus
p ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh'].dominant_octopus
p ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh'].clever_octopus
tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
p slow_dance("up", tiles_array)
p slow_dance("right-down", tiles_array)