require 'pry'
#require 'board.rb'

class Game

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  attr_accessor :board, :player_1, :player_2


 

  def initialize(player_1=Human.new("X"),player_2=Human.new("O"),board =Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    counter = self.board.turn_count
    #counter = 0
    #binding.pry
    #board.each do |cell|
      #if cell.include?("X") || cell.include?("O")
        #counter += 1
      #else
        #counter = counter
      #end
    #end
    #counter
    if counter %2 == 0
      player_1
    else
      player_2
    end
    #binding.pry
  end

  def over?
    self.draw? ||  self.won?

  end
=begin
  def won?
    win_array = WIN_COMBINATIONS.collect do |combo|
      combo.all? {|i| board.cells[i] == "X"} || combo.all? { |i| board.cells[i] == "O"}
      
    end
    win_array.include?(true) 

    #binding.pry
  end
=end  
      
  def draw?
    !(self.won?) && self.board.full?
    #binding.pry
  end    
=begin
  def winner
    if self.won?
      counter = self.board.turn_count
      if counter % 2 == 0
        player_2.token
      else
        player_1.token
      end
    else
      nil
    end
      binding.pry
  end
=end  

def won?
    WIN_COMBINATIONS.detect do |line|
      line.all?{|i| self.board.cells[i] == "X" } || line.all?{|i| self.board.cells[i] == "O"}

    end

  end

def winner
  if won?
    line = won?
    self.board.cells[line[0]]
  end
end

def turn
  puts ""
end


end  