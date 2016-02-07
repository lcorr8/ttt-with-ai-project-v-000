require 'board.rb'

class Human < Player


  def move(board)
    puts "Your turn! choose a cell number:"
    input = gets.strip
    #token = self.token
    #if Board.valid_move?(input)
      #update(input,token)
    #else
      #until Board.valid_move?(input)
      #puts "Please select an empty cell in range 1-9"
      #input = gets.strip 
      #binding.pry
      #end
    #end 
    input
  end
  

end
  