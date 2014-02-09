require 'tetris/stateful_block'
module Tetris
  module AddBlock
    extend self

    def self.call(board, block_def, x)
      add_block board, block_def, x
    end

    def add_block(board, block_def, x)
      board_bounds = 0...board.width
      raise ArgumentError, "#{x.inspect} not in board bounds: #{board_bounds.inspect}" unless board_bounds.include? x
      new_board      = board.dup
      block_on_board = StatefulBlock.new do |block|
        block.block_definition = block_def
        block.rotation         = 0
        block.x                = x
        block.y                = board.height + block.height # can get height since we have already set rotation
      end
      new_board.current_block = block_on_board
      new_board
    end
  end
end
