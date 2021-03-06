require 'pry'
class Board
  attr_accessor :cells, :board

  def reset!
    @cells = Array.new(9," ")
  end

  def initialize
    reset!
  end

  def display
      puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
      puts "-----------"
      puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
      puts "-----------"
      puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    @cells[input.to_i-1]
  end

  def full?
    @cells.all?{|token| token == "X" || token == "O"}
  end

  def turn_count
    @cells.count{|token| token == "X" || token == "O"}
  end

  def taken?(index)
    @cells[index.to_i - 1]== "X" || @cells[index.to_i - 1] == "O" #only way it passes
  end

  def valid_move?(index) #index = string 1-9
    move = index.to_i
    move.between?(1,9) && !taken?(move) && move.to_s == index
  end

  def update(index, player)
   @cells[index.to_i - 1] = player.token
 end

end
