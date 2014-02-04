require 'spec_helper'

describe SudokuGrid do
  include_context "shared grids"

  context 'valid' do

    it 'complete valid sudoku is identified as valid' do
      sudoku_grid = SudokuGrid.new(valid_complete_sudoku)
      expect(sudoku_grid.valid?).to be_true
    end

    it 'incomplete valid sudoku is identified as valid' do
      sudoku_grid = SudokuGrid.new(valid_incomplete_sudoku)
      expect(sudoku_grid.valid?).to be_true
    end

    it 'complete invalid sudoku is identified as invalid' do
      sudoku_grid = SudokuGrid.new(invalid_complete_sudoku)
      expect(sudoku_grid.valid?).to be_false
    end

    it 'incomplete invalid sudoku is identified as invalid' do
      sudoku_grid = SudokuGrid.new(invalid_incomplete_sudoku)
      expect(sudoku_grid.valid?).to be_false
    end

  end

  context 'incomplete' do

    it 'complete valid sudoku is identified as complete' do
      sudoku_grid = SudokuGrid.new(valid_complete_sudoku)
      expect(sudoku_grid.incomplete?).to be_false
    end

    it 'incomplete valid sudoku is identified as incomplete' do
      sudoku_grid = SudokuGrid.new(valid_incomplete_sudoku)
      expect(sudoku_grid.incomplete?).to be_true
    end

    it 'complete invalid sudoku is identified as complete' do
      sudoku_grid = SudokuGrid.new(invalid_complete_sudoku)
      expect(sudoku_grid.incomplete?).to be_false
    end

    it 'incomplete invalid sudoku is identified as incomplete' do
      sudoku_grid = SudokuGrid.new(invalid_incomplete_sudoku)
      expect(sudoku_grid.incomplete?).to be_true
    end

  end

end