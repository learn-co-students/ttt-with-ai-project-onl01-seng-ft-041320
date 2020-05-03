class Board
    attr_accessor :cells

    @@cells = []

    def reset!
        self.cells = Array.new(9, " ")
    end

    def initialize
        self.cells = Array.new(9, " ")
    end

    def display
        puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
    end

    def position(player_input)
        self.cells[player_input.to_i - 1]

        # player_input = player_input.to_i 
        # player_input = player_input - 1
    end

    def full?
        cells.none?{ |cell| cell == " " || cell = nil}
    end

    def turn_count
        cells.count{ |cell| cell == "X" || cell == "O"}
    end

    def taken?(index)
        self.cells[index.to_i - 1] == "X" || self.cells[index.to_i - 1] == "O"
    end

    def valid_move?(index)
        !taken?(index) && index.to_i > 0 && index.to_i <= 9
   ##      `!(taken?(index) && index.between?(0, 8))`
    end

    def update(index, player)
        self.cells[index.to_i - 1] = player.token
    end
end