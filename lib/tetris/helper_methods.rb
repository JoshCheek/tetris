require 'tetris'
module Tetris
  module HelperMethods
    include BlockDefinitions
    include AddBlock
    include AnchorBlock
    include MoveBlock
    include TickTock
    include DecomposeBlock
    include Random
  end
end
