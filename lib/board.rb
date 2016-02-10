require 'pry'

class Board

  attr_accessor :cells

  def initialize(cells = Array.new(9, " "))
    @cells = cells
  end  

  def reset!
    self.cells = Array.new(9, " ")
  end

  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-" * 11
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-" * 11
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end

  def position(input)
    position = self.cells[input.to_i-1]
    #binding.pry
  end

  def full?
   self.cells.none?{|x| x == " "} 
   #   !(cells.include?(" "))
  end

  def turn_count #(refactor)
    #counter = 0
    #self.cells.each do |position|
      #if position == "X" || position == "O"
        #counter += 1
      #else
        #counter = counter
      #end
    #end
    #counter
    #############################
    #empty_cells = cells.select {|cell| cell == " "}
    #turns_completed = (9 - empty_cells.length)
    #############################
    turn_count = 9 - (cells.count(" ")) 
      #bindin.pry

  end

  def taken?(input)
  self.cells[input.to_i-1] == "X" || self.cells[input.to_i-1] == "O"
  end

  def valid_move?(input)
    input.to_i.between?(1,9) && self.taken?(input) == false
  end

  def update(input,player)
    self.cells[input.to_i-1] = player.token
  end

end
