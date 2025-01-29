class Board
    attr_accessor :cases
  
    def initialize
      @cases = {}
      ('A'..'C').each do |letter|
        (1..3).each do |number|
          @cases["#{letter}#{number}"] = BoardCase.new("#{letter}#{number}")
        end
      end
    end
  
    def display
      puts "  1 2 3"
      ('A'..'C').each do |letter|
        print "#{letter} "
        (1..3).each do |number|
          print "#{@cases["#{letter}#{number}"].content} "
        end
        puts
      end
    end
  
    def update_case(position, content)
      @cases[position].content = content
    end
  
    def full?
      @cases.values.all? { |board_case| board_case.content != ' ' }
    end
  
    def winner?
      winning_combinations = [
        ['A1', 'A2', 'A3'], ['B1', 'B2', 'B3'], ['C1', 'C2', 'C3'],
        ['A1', 'B1', 'C1'], ['A2', 'B2', 'C2'], ['A3', 'B3', 'C3'],
        ['A1', 'B2', 'C3'], ['A3', 'B2', 'C1']
      ]
  
      winning_combinations.each do |combination|
        return true if combination.all? { |pos| @cases[pos].content == 'X' } || combination.all? { |pos| @cases[pos].content == 'O' }
      end
      false
    end
  end  