require 'spec_helper'

describe Tetris::TickTock do
  it 'updates the time'

  context 'when the current block is in play' do
    context 'and the columns on the row beneath the current block are available' do
      it 'causes the current block to fall straight down one row'
    end

    context 'any of the columns on the row beneath the current block are occupied' do
      it 'anchors the block'
    end
  end

  context 'when the current block is not in play' do
    it 'adds the current block to the board and then continues as if it was always in play'
  end
end
