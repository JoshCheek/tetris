module Tetris
  class BlockQueue
    def initialize(seed)
      random           = ::Random.new seed
      self.seed        = seed
      self.next_seed   = random.rand
      self.block_index = random.rand main_blocks.size
    end

    def dequeue
      return self.class.new(next_seed), main_blocks[block_index]
    end

    private

    attr_accessor :seed, :next_seed, :block_index

    include BlockDefinitions
  end
end
