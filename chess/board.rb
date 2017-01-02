require_relative "pieces"

class Board

  attr_reader :rows

  def initialize
    make_starting_grid
    populate_pieces
  end

  def make_starting_grid
    @rows = Array.new(8) { Array.new(8, nil) }
  end

  def []pos
    row, col = pos
    @rows[row][col]
  end

  def []=(pos, piece)
    row, col = pos
    @rows[row][col] = piece
  end

  def populate_pieces
    @rows.each_index do |i|
      @rows[i].each_index do |j|
        if i == 0
          self[[i,j]] = 1 # 1 = piece
        elsif i == 7
          self[[i,j]] = 1
        elsif i == 1
          self[[i,j]] = 0 # 0 = pawn
        elsif i == 6
          self[[i,j]] = 0
        end
      end
    end
  end


  def move_piece(start_pos, end_pos)
    piece = self[start_pos]
    raise "No piece there." if piece == nil
    self[end_pos] = piece
    self[start_pos] = nil
  end

end
