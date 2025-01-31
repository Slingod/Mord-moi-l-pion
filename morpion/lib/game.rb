class Game
  attr_accessor :board, :players, :current_player

  def initialize(player1, player2)
    @board = Board.new
    @players = [player1, player2]
    @current_player = player1
  end

  def switch_player
    @current_player = @current_player == @players[0] ? @players[1] : @players[0]
  end

  def play_turn
    @board.display
    puts "#{@current_player.name}, choose a position (e.g., A1):"
    position = gets.chomp.upcase
    if @board.cases[position].content == ' '
      @board.update_case(position, @current_player.symbol)
      if @board.winner?
        @board.display
        puts "#{@current_player.name} wins!"
        return true
      elsif @board.full?
        @board.display
        puts "It's a draw!"
        return true
      end
      switch_player
    else
      puts 'Invalid move. Try again.'
    end
    false
  end
end
