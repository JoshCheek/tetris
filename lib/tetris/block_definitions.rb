require 'tetris/block_definition'

module Tetris
  module BlockDefinitions

    def i_block() IBlock end
    def j_block() JBlock end
    def o_block() OBlock end


    IBlock = BlockDefinition.new do |block|
      block.name = 'I Block'
      block.rotations = [
        [ [:cyan, :cyan, :cyan, :cyan]
        ],
        [ [:cyan],
          [:cyan],
          [:cyan],
          [:cyan],
        ]
      ]
    end

    JBlock = BlockDefinition.new do |block|
      block.name = 'J Block'
      block.rotations = [
        [ [:blue],
          [:blue, :blue, :blue],
        ],
        [ [:blue, :blue],
          [:blue],
          [:blue],
        ],
        [ [:blue,  :blue,  :blue],
          [nil,    nil,    :blue],
        ],
        [ [nil,   :blue],
          [nil,   :blue],
          [:blue, :blue],
        ]
      ]
    end

    OBlock = BlockDefinition.new do |block|
      block.name = 'O Block'
      block.rotations = [
        [:yellow, :yellow],
        [:yellow, :yellow],
      ]
    end
  end
end

