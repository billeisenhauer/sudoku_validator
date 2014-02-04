class SudokuReader

  attr_reader :sudoku_data

  def initialize(filepath)
    @sudoku_data = read(filepath)
  end

  private

    NUM_ROWS = 9

    def read(filepath)
      row = 0
      data = Array.new(NUM_ROWS)
      File.open(filepath, "r").each_line do |line|
        next if invalid?(line)
        data[row] = data_from(line)
        row += 1
      end
      data
    end

    HORIZONTAL_SEPARATOR = '-'

    def invalid?(line)
      line[0] == HORIZONTAL_SEPARATOR
    end

    VERTICAL_SEPARATOR = '|'

    def data_from(line)
      line.dup.gsub(VERTICAL_SEPARATOR, '').split(' ')
    end

end