module Tetris
  class Board
    attr_accessor :width, :height, :current_block
    def initialize(attributes={})
      self.width         = attributes[:width]
      self.height        = attributes[:height]
      self.current_block = attributes[:current_block]
    end
  end
end
