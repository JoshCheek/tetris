module Tetris
  module AnchorBlock
    def anchor_block(board)
      board.dup do |new_board|
        new_board.anchored_blocks.concat(
          DecomposeBlock.call(new_board.current_block)
        )
        new_queue, new_block_def = new_board.block_queue.dequeue
        new_board.block_queue    = new_queue
        new_board.current_block  = Tetris::AddBlock.call(
          new_board, new_block_def, Random.call(new_board.width)
        ).current_block
      end
    end
  end
end
