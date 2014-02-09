require 'tetris/block_definitions'
require 'tetris/stateful_block'

module Tetris
  module DecomposeBlock
    def self.call
    end

    def decompose_block(stateful_block)
      x, y = stateful_block.xy
      stateful_block.block_definition
                    .rotation(stateful_block.rotation)
                    .each_with_index
                    .with_object([]) { |(row, y_offset), decomposed|
                      row.each_with_index do |colour, x_offset|
                        dot_block = BlockDefinitions::DotBlocks[colour]
                        stateful_dot_block = StatefulBlock.new block_definition: dot_block,
                                                               rotation:         0,
                                                               x:                x + x_offset,
                                                               y:                y - y_offset
                        decomposed << stateful_dot_block
                      end
                    }
    end
  end
end
