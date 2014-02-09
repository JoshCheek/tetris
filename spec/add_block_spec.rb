require 'spec_helper'

describe Tetris::AddBlock do
  attr_writer :board
  def board
    @board ||= Tetris::Board.new(width: 10, height:10)
  end

  def call(board, block, x)
    self.board = described_class.call(board, block, x)
  end

  it 'places the current block on the board' do
    expect(board.current_block).to eq nil
    call(board, i_block, 0)
    expect(board.current_block.block_definition).to eq i_block
  end

  it 'it is placed at the specified location, just above line of sight' do
    call(board, i_block, 0)
    expect(board.current_block.xy).to eq [0, 11]

    call(board, o_block, 5)
    expect(board.current_block.xy).to eq [5, 12]
  end

  it 'starts with no rotation' do
    call(board, i_block, 0)
    expect(board.current_block.rotation).to be 0
  end

  it 'raises an error if given a position out of bounds of the board' do
    expect { call(board, i_block,  0) }.to_not raise_error
    expect { call(board, i_block, -1) }.to     raise_error
    expect { call(board, i_block,  9) }.to_not raise_error
    expect { call(board, i_block, 10) }.to     raise_error
  end
end
