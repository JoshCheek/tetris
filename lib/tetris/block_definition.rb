module Tetris
  class BlockDefinition
    attr_accessor :name, :rotations

    def initialize(attributes={})
      self.name      = attributes[:name]
      self.rotations = attributes[:rotations]
      yield self if block_given?
    end

    def height_for_rotation(r)
      rotation(r).size
    end

    def rotation(r)
      rotations[r % rotations.size]
    end

  end
end
