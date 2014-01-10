class Cell
  attr_reader :col, :row, :color

  def initialize(col = 0, row = 0, color = :white)
    @col, @row = col, row
    @color = [0, false, 'black', :black].include?(color) ? :black : :white
  end

  def equal?(cell)
    @col == cell.col && @row == cell.row
  end

  def show
    "(#{@col}, #{@row})"
  end
end

class Board
  attr_reader :matrix, :empty_cell, :filled_cell

  def initialize(size = 8, empty_cell = -2, filled_cell = -1)
    @matrix = (0..size * 2).map { |i| i = (0..size * 2).map {empty_cell} }
    @empty_cell, @filled_cell = empty_cell, filled_cell
  end

  def change_board(new_size, empty_cell = -2, filled_cell = -1)
    @matrix = (0..new_size).map { |i| i = (0..new_size).map {empty_cell} }
    @empty_cell, @filled_cell = empty_cell, filled_cell
  end

  def size
    @matrix.size
  end
end

class Figure
  @name, @moves = "", []
end

class Knight < Figure
  attr_reader   :moves, :color
  attr_accessor :position

  def initialize(position = Cell.new(2, 1), color = :white)
    @moves = [[-2, -1], [-2, 1], [-1, -2], [-1, 2], [1, -2], [1, 2], [2, -1], [2, 1]]
    @position = position
    @color = [0, false, 'black', :black].include?(color) ? :black : :white
  end

  def make_move(n)
    @moves[n - 1] if n.between? 1, 8
  end
end

class Move
  def initialize(start_cell = Cell.new(2,1), target_cell = Cell.new(2, 8), board_size = 8)
    @start_cell, @target_cell, @board = start_cell, target_cell, Board.new(board_size)
    @figure, @path = Knight.new, []
  end

  def wave_algorithm
    dx, dy = [], []
    @figure.moves.each { |i| dx << i[0]; dy << i[1] }
    board = @board.matrix
    counter, ay, ax = 0, @start_cell.row, @start_cell.col
    by, bx =  @target_cell.row, @target_cell.col
    board[ay][ax] = 0
    begin
      stop = true
      for y in 0...@board.size
        for x in 0...@board.size
          if board[y][x] == counter
            for k in 0...dx.length
              if (y + dy[k]).between?(1, @board.size) && (x + dx[k]).between?(1, @board.size) && 
                  board[y + dy[k]][x + dx[k]] == @board.empty_cell
                stop = false
                board[y + dy[k]][x + dx[k]] = counter + 1
              end
            end
          end
        end
      end
      counter += 1
    end while !stop && board[by][bx] == @board.empty_cell

    return false if board[by][bx] == @board.empty_cell

    counter, x, y, px, py = board[by][bx], bx, by, [], []
    while counter > 0
      px[counter], py[counter] = x, y
      counter -= 1
      for k in 0..dx.length
        if board[y + dy[k]][x + dx[k]] == counter
          x += dx[k]
          y += dy[k]
          break
        end
      end
    end
    px[0], py[0] = ax, ay
    px.size.times do |i|
      @path << Cell.new(px[i], py[i])
    end
    self
  end

  def show_path
    puts "The fastest path from #{@start_cell.show} to #{@target_cell.show} is"
    @path.each { |cell| puts cell.show }
  end
end

Move.new(Cell.new(2, 3), Cell.new(5, 7)).wave_algorithm.show_path


