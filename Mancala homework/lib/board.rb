class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2    
    @cups = Array.new(14) { [] }
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup, i|
      next if i == 6 || i == 13
      4.times { cup.push(:stone) }
    end
  end

  def [](pos)
    @cups[pos]
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos < 0 || start_pos > 12
    raise "Starting cup is empty" if self.cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    self.cups[start_pos].length.times do |i|
      if current_player_name == @name1
        self.cups[start_pos +1 + i] << self.cups[start_pos].pop unless start_pos + 1 + i == 13
      elsif current_player_name == @name2
        self.cups[start_pos +1 + i] << self.cups[start_pos].pop unless start_pos + 1 + i == 6
      end
      self.render
      self.next_turn((self.cups[start_pos].length + start_pos) % 13)
    end
    # self.render

    # self.cups[start_pos-1]
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx

  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[0...6].all? { |cup| cup.empty? } || @cups[7..12].all? { |cup| cup.empty? }
  end

  def winner
    case @cups[6].length <=> @cups[13].length
    when -1
      return @name2
    when 0
      return :draw
    when 1
      return @name1
    end
  end
end
