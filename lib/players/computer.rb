require 'pry'

class Computer < Player
##### Logic 1: take random spot for every play.
=begin
  def move(board)
    input = rand(1..9).to_s
  end 
=end        

##### Logic 2: choose 5, then corners, then middles.
=begin
  def move(board)
    input = "5" 
      if board.valid_move?(input)
        input
      elsif board.valid_move?("1")
        input = "1" 
      elsif board.valid_move?("3")
        input = "3"
      elsif board.valid_move?("7")
        input = "7"
      elsif board.valid_move?("9")
        input = "9"
      elsif board.valid_move?("2")
        input = "2"
      elsif board.valid_move?("8")
        input = "8"
      elsif board.valid_move?("4")
        input = "4"
      elsif board.valid_move?("6")
        input = "6"
      end
  end 
=end         

##### Logic 3: take 5, or corners in order, then random spots that are left.
=begin
  def move(board)
    input = "5" 
      if board.valid_move?(input)
        input
      elsif board.valid_move?("1")
        input = "1" 
      elsif board.valid_move?("3")
        input = "3"
      elsif board.valid_move?("7")
        input = "7"
      elsif board.valid_move?("9")
        input = "9"
      elsif board.valid_move?(random_spot)
        random_spot  
      end
  end 
  
  def random_spot
    input = rand(1..9).to_s
  end
=end
##### Logic 4: take center or a corner, take adjecent corner, take an opposite middle, or random spot that is left.
##### Logic 5: take center or a corner, block or take adjecent corner, block or take an opposite middle, or random spot that is left.
##### Final logic: take center, take a win, block opponents doubles, take a corner, take whatever spot is left.


end #class end



   




   
