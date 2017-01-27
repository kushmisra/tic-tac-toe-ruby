require_relative 'player.rb'
require_relative 'Board.rb'

class GameManager < Board


	def enter
		if @board.IsDone
			puts "                      ITS A TIE                  "
			return 5
		end
		puts "enter coordinates"
		@coordinate_x=gets.chomp
		@coordinate_x=@coordinate_x.to_i
		@coordinate_y=gets.chomp
		@coordinate_y=@coordinate_y.to_i
		@CanMark=@board.Check @coordinate_x,@coordinate_y
		if(not @CanMark)
			puts " already existing please enter valid input"
			return enter
		else  
			if @turn
				return @board.Mark @coordinate_x,@coordinate_y,@P1.Symbol
			else

				return @board.Mark @coordinate_x,@coordinate_y,@P2.Symbol
			end
				
		end

	end 

	def start_game
		
		@game_over=enter
		
		if @game_over==5

			puts "                 BETTER LUCK NEXT TIME      "
			return

		elsif(@game_over)
			
			if @turn
				system("clear")
				puts "      CONGRATULATIONS PLAYER 1 WITH SYMBOL "+@P1.Symbol
			else
				system("clear")
				puts "      CONGRATULATIONS PLAYER 2 WITH SYMBOL "+@P2.Symbol
			end

			return 
		end

		if(@turn)
			@turn=false
		else
			@turn=true
		end

		system("clear")
		@board.drawBoard
		
		start_game 
	end


	def initialize
	  system("clear")
	  @turn =true
	  @P1=Player.new
	  @P2=Player.new	
	  system("clear")
	  puts "			    HELLO PPL WELCOME TO TIC TAC TOE                              " 
	  puts "                please enter dimensions of grid "
	  @dimension=gets.chomp
	  @dimension=@dimension.to_i
	  puts ""
	  @board=Board.new @dimension
	  system("clear")
	  @board.drawBoard
	  start_game

	end



end

game=GameManager.new