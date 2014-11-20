module GameOfLife

  class Board
    include Enumerable

    def initialize (*coordinates)
      @coordinates = coordinates
    end

    def each(&block)
      @coordinates.each(&block)
    end

    def [](x, y)
      include? [x, y]
    end

    def neighbours(x, y)
      [x-1, x, x+1].product([y-1, y, y+1]) - [[x, y]]
    end

    def life_neighbours(x, y)
      @coordinates & neighbours(x, y)
    end

    def next_generation
      Board.new *( is_life + revives )
    end

    def is_life
      select{ |living| [2, 3].include? life_neighbours(living[0], living[1]).count }
    end

    def revives
      dead_neighbours = []
      each { |member| dead_neighbours |= neighbours(member[0], member[1]) }
      dead_neighbours -= @coordinates
      dead_neighbours.select { |member| life_neighbours(member[0], member[1]).count == 3 }
    end
  end
end

game = GameOfLife::Board.new [1, 2], [1, 3], [5, 6], [2, 3], [2, 1], [2, 2], [1, 1]

p new_game = game.next_generation