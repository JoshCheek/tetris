module Tetris
  class StatefulBlock
    attr_accessor :block_definition, :rotation, :x, :y

    def initialize(attributes={})
      self.block_definition = attributes[:block_definition]
      self.rotation         = attributes[:rotation]
      self.x                = attributes[:x]
      self.y                = attributes[:y]
      yield self if block_given?
    end

    def height
      current_appearance.size
    end

    def xy
      [x, y]
    end

    def ==(other)
      block_definition == other.block_definition &&
        rotation       == other.rotation &&
        x              == other.x &&
        y              == other.y
    end

    private

    def current_appearance
      block_definition.rotations[
        rotation % block_definition.rotations.size
      ]
    end
  end
end
