require 'spec_helper'

describe SudokuReader do
  include_context "shared grids"

  it 'captures sudoku data from valid, complete file' do
    filepath = File.expand_path("files/valid_complete.sudoku", File.dirname(__FILE__))
    SudokuReader.new(filepath).sudoku_data.should == valid_complete_sudoku
  end

  it 'captures sudoku data from valid, incomplete file' do
    filepath = File.expand_path("files/valid_incomplete.sudoku", File.dirname(__FILE__))
    SudokuReader.new(filepath).sudoku_data.should == valid_incomplete_sudoku
  end

  it 'captures sudoku data from invalid, complete file' do
    filepath = File.expand_path("files/invalid_complete.sudoku", File.dirname(__FILE__))
    SudokuReader.new(filepath).sudoku_data.should == invalid_complete_sudoku
  end

  it 'captures sudoku data from invalid, incomplete file' do
    filepath = File.expand_path("files/invalid_incomplete.sudoku", File.dirname(__FILE__))
    SudokuReader.new(filepath).sudoku_data.should == invalid_incomplete_sudoku
  end

end