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
   self.board.full? && !(self.won?) 
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
  input = self.current_player.move(self.board)
  #binding.pry
  if self.board.valid_move?(input)
    board.update(input,self.current_player)
      board.display

  else
    self.turn
  end
  #board.cells
end
=begin
  input = nil
  until self.board.valid_move?(input)
    puts "Please choose a valid spot"
    input= self.current_player.move(self.board.cells)
    break if self.board.valid_move?(input) #why does this not wor without a break?
      self.board.update(input,self.current_player)
      self.board.display
      binding.pry
  end
end
=end

 # puts "Your turn, choose a spot"
  #input= self.current_player.move(self.board.cells)
=begin
  if self.board.valid_move?(input)
    update(input,self.current_player)
    self.board.display
  else

    until self.board.valid_move?(input)
      puts "Please choose a valid spot"
      input= self.current_player.move(self.board.cells)
    end
    update(input,self.current_player)
    self.board.display
    binding.pry
  end
=end  
  
  #call move method comp/person

def play
  self.board.display
  until self.over? 
    self.turn
    end

   if won?
      puts "Congratulations #{self.winner}!"
    end
  if draw?
    puts "Cats Game!"
    end
  
    #binding.pry

  
end



end  