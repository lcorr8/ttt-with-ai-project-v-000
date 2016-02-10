class Computer < Player

  def move(board)
    
    input = rand(1..9).to_s
    #[*(1..10)].sample(5) #=>[3, 4, 1, 8, 9] 
    #no repeating inputs
    if board.valid_move?(input)
      input
    else
      self.move(board)
   end
 end

end
   