module Tetris
  class BlockDefinition
    attr_accessor :name, :rotations

    def initialize
      yield self if block_given?
    end
  end
end
