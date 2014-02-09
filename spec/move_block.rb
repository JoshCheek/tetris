require 'spec_helper'

describe Tetris::MoveBlock do
  context 'when moving down' do
    context 'when the columns on the row beneath the current block are available' do
      it 'causes the current block to fall straight down one row'
    end

    context 'any of the columns on the row beneath the current block are occupied' do
      it 'anchors the block'
      it 'applies any row removals'
    end
  end

  context 'when moving left' do
    it 'moves the current block left one row if there are no blocks or wall to the left'
  end

  context 'when moving right' do
    it 'moves the current block right one row if there are no blocks or wall to the right'
  end
end
