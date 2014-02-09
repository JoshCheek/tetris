require 'tetris/stateful_block'
module Tetris
  module AddBlock
    extend self

    def self.call(board, block_def, x, y=nil)
      add_block board, block_def, x, y
    end

    def add_block(board, block_def, x, y=nil)
      board_bounds = 0...board.width
      unless board_bounds.include? x
        raise ArgumentError, "#{x.inspect} not in board bounds: #{board_bounds.inspect}"
      end

      block_height = block_def.height_for_rotation(0)
      y ||= board.height + block_height
      if (y - block_height + 1) < 0
        raise ArgumentError, "#{y.inspect} for block of height #{block_height} goes below the bottom of the board."
      end

      block_on_board = StatefulBlock.new do |block|
        block.block_definition = block_def
        block.rotation         = 0
        block.x                = x
        block.y                = y
      end

      board.dup do |new_board|
        new_board.current_block = block_on_board
      end
    end
  end
end
