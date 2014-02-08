require 'spec_helper'

describe Tetris::AnchorBlock do
  it 'decomposes the current piece and adds its components to the board'
  it 'moves the upcoming piece to the new current piece'
  it 'takes a piece from the queue for the new upcoming piece'
end
