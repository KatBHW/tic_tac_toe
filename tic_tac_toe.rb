class Game 
  attr_accessor :board_hash, :player1, :player2, :grid_ref, :current_player, :sign
  attr_reader :counter
  
  def initialize
   @player1 = Player.new("X")
   @player2 = Player.new("O")
   @board_hash = {:a1 => " ", :a2 => " ", :a3 => " ", :b1 => " ", :b2 => " ", :b3 => " ", :c1 => " ", :c2 => " ", :c3 => " "}
   @counter = 0
  end 
  
  def place_mark
    if board_hash[@grid_ref] == " "
      @board_hash[@grid_ref] = @current_player.sign
      display_board
    else
      puts "This square has already been taken."
      @counter -= 1
      switch_players
    end   
  end
  
  def switch_players
    @current_player == @player1 ? @current_player = @player2 : @current_player = @player1
  end
  
  def display_board
      puts "    1 " + " " + " 2 " + " " + " 3 "
      puts " a " + " #{board_hash[:a1]} " + "|" + " #{board_hash[:a2]} " + "|" + " #{board_hash[:a3]} "
      puts "   –––+–––+–––"
      puts " b " + " #{board_hash[:b1]} " + "|" + " #{board_hash[:b2]} " + "|" + " #{board_hash[:b3]} "
      puts "   –––+–––+–––"
      puts " c " + " #{board_hash[:c1]} " + "|" + " #{board_hash[:c2]} " + "|" + " #{board_hash[:c3]} "
      puts
    end 
    
  def row_achieved?
    if (@board_hash[:a1] == @board_hash[:a2] && @board_hash[:a2] == @board_hash[:a3] && @board_hash[:a3] != " ") ||
	  (@board_hash[:b1] == @board_hash[:b2] && @board_hash[:b2] == @board_hash[:b3] && @board_hash[:b3] != " ") ||
	  (@board_hash[:c1] == @board_hash[:c2] && @board_hash[:c2] == @board_hash[:c3] && @board_hash[:c3] != " ") ||
	  (@board_hash[:a1] == @board_hash[:b1] && @board_hash[:b1] == @board_hash[:c1] && @board_hash[:c1] != " ") ||
	  (@board_hash[:a2] == @board_hash[:b2] && @board_hash[:b2] == @board_hash[:c2] && @board_hash[:c2] != " ") ||
	  (@board_hash[:a3] == @board_hash[:b3] && @board_hash[:b3] == @board_hash[:c3] && @board_hash[:c3] != " ") ||
	  (@board_hash[:a1] == @board_hash[:b2] && @board_hash[:b2] == @board_hash[:c3] && @board_hash[:c3] != " ") ||
	  (@board_hash[:c1] == @board_hash[:b2] && @board_hash[:b2] == @board_hash[:a3] && @board_hash[:a3] != " ")
	  return true
	end
  end 

  def game_over?
    if counter == 9 
      puts "Game tied."
      return true 
    elsif
      row_achieved?
      switch_players
      puts "Well done. #{current_player.sign} has won the game."
      return true 
    end
  end

  def play_game
    @current_player = @player1
    display_board
    until game_over?
      puts "Please type the grid reference of the cell where you wish to place your mark"
      puts "e.g. 'a1', 'b2', 'c3'"
      @grid_ref = gets.chomp
      if (@grid_ref.length == 2) && (@grid_ref =~ /^[abc]/) && (@grid_ref =~ /[123]$/)
        @grid_ref = @grid_ref.to_sym
        place_mark 
        @counter +=1 
        switch_players
      else 
        puts "That grid reference is not valid."
      end 
    end
  end   
  
  class Player
    attr_accessor :sign
    
    def initialize(sign)
      @sign = sign
    end
  end
  
end 
new_game = Game.new
new_game.play_game
