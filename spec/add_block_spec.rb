require 'spec_helper'

describe Tetris::AddBlock do
  attr_writer :board
  let(:width)  { 10 }
  let(:height) { 10 }

  def board
    @board ||= Tetris::Board.new width: width, height:height
  end

  def call(board, block, x, y=nil)
    self.board = described_class.call(board, block, x, y)
  end

  it 'places the current block on the board' do
    expect(board.current_block).to eq nil
    call(board, i_block, 0)
    expect(board.current_block.block_definition).to eq i_block
  end

  it 'it is placed at the specified x location' do
    call(board, i_block, 0)
    expect(board.current_block.x).to eq 0
  end

  context 'when given a y location' do
    it 'is placed where stated' do
      call(board, o_block, 0, 1)
      expect(board.current_block.y).to eq 1
    end

    it 'raises an exception if given a position that would cause any part of the block to be below the board' do
      expect { call board, o_block, 0, 0 }.to raise_error ArgumentError
    end

    it 'does not raise an exception if given a position above the board' do
      expect { call board, o_block, 0, 100 }.to_not raise_error
    end
  end

  context 'when not given a y location' do
    it 'is placed just above line of sight' do
      call(board, i_block, 0)
      expect(board.current_block.y).to eq 11

      call(board, o_block, 5)
      expect(board.current_block.y).to eq 12
    end
  end

  it 'starts with no rotation' do
    call(board, i_block, 0)
    expect(board.current_block.rotation).to be 0
  end

  it 'raises an error if given a position out of bounds of the board' do
    expect { call board, i_block,  0      }.to_not raise_error
    expect { call board, i_block, -1      }.to     raise_error ArgumentError
    expect { call board, i_block, width-1 }.to_not raise_error
    expect { call board, i_block, width   }.to     raise_error ArgumentError
  end
end
