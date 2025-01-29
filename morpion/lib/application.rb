class Application
    def initialize
      @running = true
    end
  
    def start
      while @running
        puts "Enter the name of Player 1:"
        player1_name = gets.chomp
        puts "Enter the name of Player 2:"
        player2_name = gets.chomp
  
        player1 = Player.new(player1_name, 'X')
        player2 = Player.new(player2_name, 'O')
        game = Game.new(player1, player2)
  
        while true
          break if game.play_turn
        end
  
        puts "Do you want to play again? (yes/no)"
        @running = gets.chomp.downcase == 'yes'
      end
    end
  end  