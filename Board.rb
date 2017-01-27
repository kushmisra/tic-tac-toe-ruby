class Board
	
	def initialize n 
		
		@dimension=n
		@board_array=[]

		for i in 0..(@dimension*@dimension-1)
			@board_array[i]='*'
		end

	end

	def Check i,j
		
		if  @board_array[i*@dimension+j]=='*'
			return true
		else
			return false
		end
	end


	def drawBoard
		system("clear")
		for	i in 0..(@dimension*@dimension-1)

			print "||"+@board_array[i]+"||"+"     "
			if 	(i+1) % @dimension==0
				puts " "
				puts " "
				puts " "

				#puts @board_array.class
			end
		end

	end

	def IsDone 
		
		for i in 0..(@dimension*@dimension-1)
			if @board_array[i]=='*'
				return false
			end
		end

		return true

	end

	def check_winner
		
		for i in 0...@dimension
			
			flag=1
			for j in 1...@dimension
				if @board_array[i*@dimension+j-1]!=@board_array[i*@dimension+j] || @board_array[i*@dimension+j]=='*' || @board_array[i*@dimension+j-1]=='*'
					flag=0
				end
			end
			if flag==1
				return true
			end
		end
		
		for i in 0...@dimension
			
			flag=1
			for j in 1...@dimension
				if @board_array[(j-1)*@dimension+i]!=@board_array[j*@dimension+i] || @board_array[(j-1)*@dimension+i]=='*' || @board_array[j*@dimension+i]=='*'
					flag=0
				end
			end
			if flag==1
				return true
			end
		end


		flag=1
		for i in 1...@dimension
			if @board_array[(i-1)*@dimension+i-1]!=@board_array[(i)*@dimension+i] || @board_array[(i)*@dimension+i] == '*' || @board_array[(i-1)*@dimension+i-1]=='*'
				flag = 0
			end
		end

		if flag==1
			return true
		end


		flag=1
		i=@dimension-1
		j=0
		while j<@dimension-1
			if @board_array[i*@dimension+j]!=@board_array[(i-1)*@dimension+j+1] || @board_array[i*@dimension+j]=='*' || @board_array[(i-1)*@dimension+j+1]== '*' 
				flag=0
			end
			j=j+1
			i=i-1
		end
		if flag==1
			return true
		end

		return false
	
	end


	def Mark i,j,symbol
		
		@board_array[i*@dimension+j]=symbol
		return check_winner
	end


end
