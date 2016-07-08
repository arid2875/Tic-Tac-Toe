class Board
  attr_accessor :spaces 
  attr_reader 	:sample 

  #initialize the board
  def initialize
  	@spaces = 
  			{ :space_1 => " ", :space_2 => " ", :space_3 => " ", 
  	  		  :space_4 => " ", :space_5 => " ", :space_6 => " ", 
  	  		  :space_7 => " ", :space_8 => " ", :space_9 => " " }
  	@sample = 
  			{ :space_1 => 1, :space_2 => 2, :space_3 => 3, 
  	  		  :space_4 => 4, :space_5 => 5, :space_6 => 6, 
  	  		  :space_7 => 7, :space_8 => 8, :space_9 => 9 }
  end

  #see if anyone has won or if the board is full(cat game)
  def check_for_winner
  	collect_winning_positions.each do |position|  		
  		if position == "OOO"
  		  return 2  		
  		elsif position == "XXX" 
  	      return 1  		 
  		end 	
  	end
  	cat_game? == true ? 0 : -1
  end

  #collect the possible winning positions
  def collect_winning_positions
  	winning_positions = [ @spaces[:space_1] + @spaces[:space_2] + @spaces[:space_3],
  						  @spaces[:space_4] + @spaces[:space_5] + @spaces[:space_6],
  						  @spaces[:space_7] + @spaces[:space_8] + @spaces[:space_9],
  						  @spaces[:space_1] + @spaces[:space_4] + @spaces[:space_7],
  						  @spaces[:space_2] + @spaces[:space_5] + @spaces[:space_8],
  						  @spaces[:space_3] + @spaces[:space_6] + @spaces[:space_9],
  						  @spaces[:space_1] + @spaces[:space_5] + @spaces[:space_9],
  						  @spaces[:space_3] + @spaces[:space_5] + @spaces[:space_7] ]
  	winning_positions
  end

  #see if there is a cat game
  def cat_game?
  	@spaces.has_value?(" ") ? false : true
  end

  #place an 'X' in the selected space
  def place_x(space)
  	choice = to_space_sym(space)
  	@spaces[choice] = "X"
  end

  #place an 'O' in the selected space
  def place_o(space)
  	choice = to_space_sym(space)
  	@spaces[choice] = "O"
  end

  #check to see that the selected space is available
  def space_available?(space)
  	@spaces[to_space_sym(space)] == " " ? true : false
  end

  #take a number and return the respective space symbol
  def to_space_sym(num)
  	space = "space_#{num}".to_sym
  end 

  #draw the board with the players moves on it
  def draw_current  	 
  	"    #{@spaces[:space_1]}  |  #{@spaces[:space_2]}  |  #{@spaces[:space_3]}\n" +
  					 "  _____|_____|____\n" +
  	"    #{@spaces[:space_4]}  |  #{@spaces[:space_5]}  |  #{@spaces[:space_6]}\n" +
  					 "  _____|_____|____\n" +
  	"    #{@spaces[:space_7]}  |  #{@spaces[:space_8]}  |  #{@spaces[:space_9]}\n" +
  						  "       |     |  \n\n"
  end

  #draw the board with the positions listed
  def draw_sample
  	"    #{@sample[:space_1]}  |  #{@sample[:space_2]}  |  #{@sample[:space_3]}\n" +
  					 "  _____|_____|____\n" +
  	"    #{@sample[:space_4]}  |  #{@sample[:space_5]}  |  #{@sample[:space_6]}\n" +
  					 "  _____|_____|____\n" +
  	"    #{@sample[:space_7]}  |  #{@sample[:space_8]}  |  #{@sample[:space_9]}\n" +
  						  "       |     |  \n\n"

  end

  #draw both the current and sample board
  def draw_both
  	"    #{@spaces[:space_1]}  |  #{@spaces[:space_2]}  |  #{@spaces[:space_3]}\t\t" +
  	"    #{@sample[:space_1]}  |  #{@sample[:space_2]}  |  #{@sample[:space_3]}\n" +
  					   "  _____|_____|____\t\t" + "  _____|_____|____\n" +  	
  	"    #{@spaces[:space_4]}  |  #{@spaces[:space_5]}  |  #{@spaces[:space_6]}\t\t" +
  	"    #{@sample[:space_4]}  |  #{@sample[:space_5]}  |  #{@sample[:space_6]}\n" +
  					   "  _____|_____|____\t\t" + "  _____|_____|____\n" +
  	"    #{@spaces[:space_7]}  |  #{@spaces[:space_8]}  |  #{@spaces[:space_9]}\t\t" +
  	"    #{@sample[:space_7]}  |  #{@sample[:space_8]}  |  #{@sample[:space_9]}\n" +
  					   "       |     |  \t\t" + "       |     |  \n\n"
  end

end

