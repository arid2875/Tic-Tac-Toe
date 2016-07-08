class Game
  require_relative 'Player.rb'
  require_relative 'Board.rb'
  attr_accessor :player_1
  attr_accessor :player_2
  attr_accessor :board
  attr_accessor :turn

  #initialize the Game
  def initialize
    @player_1 = Player.new("Player 1")
    @player_2 = Player.new("Player 2")
    @board = Board.new
    @turn = 1
    @game_over = false
  end

  #change the turn number to the number of the player whose turn it is to play
  def next_turn  	
    @turn = @turn == 1 ? 2 : 1
  end

  #update the player names with an array of the two players' names
  def player_setup(players)  	
  	@player_1.name = players[0] 	
  	@player_2.name = players[1]
  end

  #allow player to select the position the want to go in and make sure it's available
  def take_turn
  	current_player_name = @turn == 1 ? @player_1.name : @player_2.name
  	puts "#{current_player_name} please pick a space"
  	space = gets.chomp.to_i
  	if @board.space_available?(space)
  		if @turn == 1
  			@board.place_x(space)
  			next_turn
  		else 
  			@board.place_o(space)
  			next_turn
  		end
  	else
  		space_taken_error
  	end
  end

  #see if the players want to play again
  def again?
  	puts "Would you like to play again? 'Y' or 'N'"
  	answer = gets.chomp.to_i
  	answer == 'Y' ? true : false
  end

  #tell the player that the selected space is taken
  def space_taken_error
  	puts "That space has already been taken!"
  end

  #end the game if there is a winner or cat game
  def end_game(number)
  	if number == 1
  		puts "#{@player_1.name} wins!"
  	elsif number == 2
  		puts "#{@player_2.name} wins!"
  	else 
  		puts "Cat Game!"
  	end  	
  end

  #play until the game is over
  def play  	 
  	puts self.board.draw_both 
  	while !@game_over	
	  self.take_turn
	  puts self.board.draw_both
	  num = self.board.check_for_winner
	  if num >= 0
		self.end_game(num)
		@game_over = true		
	  end
    end
  end

  #as the players for their names
  def player_names
  	puts "Player 1, enter your name:"
	player_1 = gets.chomp
	puts "Player 2, enter your name:"
	player_2 = gets.chomp
	players = [player_1, player_2]
	players    
  end
end

game = Game.new
game.player_setup(game.player_names)
game.play



