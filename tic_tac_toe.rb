class Game 
  attr_accessor :player1
  attr_accessor :player2

  def initialize
    @board = Board.new 
    create_players
  end 
  
  def create_players
    @player1 = Player.new("X")
    @player2 = Player.new("O")
    puts @player1
    puts @player2
  end
  
  class Board
    attr_accessor :board_array
  
    def initialize
      board_array = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
      self.create_board(board_array)
    end 
    
    def create_board(board_array)
      puts "#{board_array[0][0]} " + "|" + " #{board_array[0][1]} " + "|" + " #{board_array[0][2]} "
      puts "––+–––+––"
      puts "#{board_array[1][0]} " + "|" + " #{board_array[1][1]} " + "|" + " #{board_array[1][2]} "
      puts "––+–––+––"
      puts "#{board_array[2][0]} " + "|" + " #{board_array[2][1]} " + "|" + " #{board_array[2][2]} "
    end 
  end
  
  class Player
    attr_accessor :sign
    attr_reader :cell_no
    
    def initialize(sign)
      @sign = sign
    end
    
    def make_move(cell_no)
      puts "Please type the cell number"
    end   
  end

end 
new_game = Game.new