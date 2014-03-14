require 'spec_helper'

describe Tetris::AnchorBlock do
  attr_writer :board
  let(:width)  { 3 }
  let(:height) { 6 }

  def board
    @board ||= add_block Tetris::Board.new(width: width, height:height),
                         i_block,
                         1,
                         4
  end

  it 'decomposes the current piece and adds its components to the board' do
    self.board = anchor_block board
    expect(board.anchored_blocks).to eq decompose_block(board.current_block)
  end

  it 'moves the upcoming piece to the new current piece and adds it to the board' do

  end

  it 'takes a piece from the queue for the new upcoming piece'
end
