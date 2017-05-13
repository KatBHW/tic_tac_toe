=begin
need methods for:
- not overriding existing entry
- validating entries
- exiting game as soon as game over rather than requesting another move
=end

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
    @board_hash[@grid_ref] = @current_player.sign
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
    row_achieved = false 
    if 
      @board_hash[:a1] && @board_hash[:a2] && @board_hash[:a3] == "X"
      @board_hash[:b1] && @board_hash[:b2] && @board_hash[:b3] == "X"
      @board_hash[:c1] && @board_hash[:c2] && @board_hash[:c3] == "X"
      @board_hash[:a1] && @board_hash[:b1] && @board_hash[:c1] == "X"
      @board_hash[:a2] && @board_hash[:b2] && @board_hash[:c2] == "X"
      @board_hash[:a3] && @board_hash[:b3] && @board_hash[:c3] == "X"
      @board_hash[:a1] && @board_hash[:b2] && @board_hash[:c3] == "X"
      @board_hash[:a3] && @board_hash[:b2] && @board_hash[:c1] == "X"
      @board_hash[:a1] && @board_hash[:a2] && @board_hash[:a3] == "O"
      @board_hash[:b1] && @board_hash[:b2] && @board_hash[:b3] == "O"
      @board_hash[:c1] && @board_hash[:c2] && @board_hash[:c3] == "O"
      @board_hash[:a1] && @board_hash[:b1] && @board_hash[:c1] == "O"
      @board_hash[:a2] && @board_hash[:b2] && @board_hash[:c2] == "O"
      @board_hash[:a3] && @board_hash[:b3] && @board_hash[:c3] == "O"
      @board_hash[:a1] && @board_hash[:b2] && @board_hash[:c3] == "O"
      @board_hash[:a3] && @board_hash[:b2] && @board_hash[:c1] == "O"
      row_achieved = true
    end
  end 
  
  def game_over?
    @game_over = false
    if counter > 9 || row_achieved?
      @game_over = true 
    end
  end
  
  def play_game
    @current_player = @player1
    until game_over?
      display_board
      puts "Please type the grid reference of the cell where you wish to place your mark"
      puts "e.g. 'a1', 'b2', 'c3'"
      @grid_ref = gets.chomp.to_sym
      place_mark
      @counter +=1 
      switch_players
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





