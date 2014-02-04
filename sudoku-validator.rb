#!/usr/bin/env ruby

require './lib/sudoku_grid'
require './lib/sudoku_reader'

matrix_rows = SudokuReader.new(ARGV[0]).sudoku_data
sudoku_grid = SudokuGrid.new(matrix_rows)

unless sudoku_grid.valid?
  puts 'This sudoku is invalid.'
else
  if sudoku_grid.incomplete?
    puts 'This sudoku is valid, but incomplete.'
  else
    puts 'This sudoku is valid.'
  end
end