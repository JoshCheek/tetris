module Tetris
  class Board
    attr_accessor :width, :height, :current_block, :anchored_blocks, :block_queue

    def initialize(attributes={})
      self.width           = attributes[:width]
      self.height          = attributes[:height]
      self.current_block   = attributes[:current_block]
      self.anchored_blocks = attributes[:anchored_blocks] || []
      self.block_queue     = attributes.fetch(:block_queue) { BlockQueue.new ::Random.new_seed }
    end

    def dup
      super
      yield self if block_given?
      self
    end
  end
end
