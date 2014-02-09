require 'spec_helper'

describe Tetris::DecomposeBlock do
  context 'for each coloured position in the current rotation' do
    it 'breaks that into an individual block of the same colour in the same position' do
      block = Tetris::StatefulBlock.new block_definition: j_block, rotation: 0, x: 10, y: 100
      expect(decompose_block block).to eq [
        Tetris::StatefulBlock.new(block_definition: dot_block(:blue), rotation: 0, x: 10, y: 100),
        Tetris::StatefulBlock.new(block_definition: dot_block(:blue), rotation: 0, x: 10, y: 99),
        Tetris::StatefulBlock.new(block_definition: dot_block(:blue), rotation: 0, x: 11, y: 99),
        Tetris::StatefulBlock.new(block_definition: dot_block(:blue), rotation: 0, x: 12, y: 99),
      ]
    end
  end
end
