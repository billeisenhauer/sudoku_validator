require 'matrix'

class SudokuGrid

  def initialize(data)
    @matrix = Matrix.rows(data)
  end

  def valid?
    validate_rows? && validate_columns? && validate_sub_grids?
  end

  def incomplete?
    @matrix.to_a.flatten.any?(&INCOMPLETE)
  end

  private

    INCOMPLETE = lambda { |num| num == '.' }
    UNIQUE = lambda { |arr| arr == arr.uniq }

    def rows
      @rows ||= @matrix.row_vectors.map(&:to_a).map do |row| 
        row.reject(&INCOMPLETE)
      end
    end

    def columns
      @columns ||= @matrix.column_vectors.map(&:to_a).map do |col| 
        col.reject(&INCOMPLETE)
      end
    end

    TOP = LEFT = 0..2
    MIDDLE = 3..5
    BOTTOM = RIGHT = 6..8

    def sub_grids
      @sub_grids ||= [
        @matrix.minor(TOP, LEFT).to_a.flatten.reject(&INCOMPLETE),
        @matrix.minor(TOP, MIDDLE).to_a.flatten.reject(&INCOMPLETE),
        @matrix.minor(TOP, RIGHT).to_a.flatten.reject(&INCOMPLETE),
        @matrix.minor(MIDDLE, LEFT).to_a.flatten.reject(&INCOMPLETE),
        @matrix.minor(MIDDLE, MIDDLE).to_a.flatten.reject(&INCOMPLETE),
        @matrix.minor(MIDDLE, RIGHT).to_a.flatten.reject(&INCOMPLETE),
        @matrix.minor(BOTTOM, LEFT).to_a.flatten.reject(&INCOMPLETE),
        @matrix.minor(BOTTOM, MIDDLE).to_a.flatten.reject(&INCOMPLETE),
        @matrix.minor(BOTTOM, RIGHT).to_a.flatten.reject(&INCOMPLETE)
      ]
    end

    def validate_rows?
      rows.all?(&UNIQUE)
    end

    def validate_columns?
      columns.all?(&UNIQUE)
    end

    def validate_sub_grids?
      sub_grids.all?(&UNIQUE)
    end

end