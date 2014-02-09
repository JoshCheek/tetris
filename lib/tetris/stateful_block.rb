module Tetris
  class StatefulBlock
    attr_accessor :block_definition, :rotation, :x, :y

    def initialize
      yield self if block_given?
    end

    def height
      current_appearance.size
    end

    def xy
      [x, y]
    end

    private

    def current_appearance
      block_definition.rotations[
        rotation % block_definition.rotations.size
      ]
    end
  end
end
