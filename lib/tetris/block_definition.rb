module Tetris
  class BlockDefinition
    attr_accessor :name, :rotations

    def initialize
      yield self if block_given?
    end

    def height_for_rotation(r)
      rotations[rotaiton r].size
    end

    private

    def rotaiton(r)
      r % rotations.size
    end
  end
end
