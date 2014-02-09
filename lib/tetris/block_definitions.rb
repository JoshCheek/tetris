require 'tetris/block_definition'

module Tetris
  module BlockDefinitions
    extend self

    def main_blocks
      @_main_blocks ||= [ i_block,
                          j_block,
                          l_block,
                          o_block,
                          s_block,
                          t_block,
                          z_block,
                        ]
    end

    def i_block() IBlock end
    def j_block() JBlock end
    def l_block() LBlock end
    def o_block() OBlock end
    def s_block() SBlock end
    def t_block() TBlock end
    def z_block() ZBlock end

    def dot_block(colour) DotBlocks.fetch colour end


    IBlock = BlockDefinition.new do |block|
      block.name      = 'I Block'
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
      block.name      = 'J Block'
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

    LBlock = BlockDefinition.new do |block|
      block.name      = 'L Block'
      block.rotations = [
        [ [nil,     nil,     :orange],
          [:orange, :orange, :orange],
        ],
        [ [:orange],
          [:orange],
          [:orange, :orange],
        ],
        [ [:orange, :orange, :orange],
          [:orange],
        ],
        [ [:orange, :orange],
          [nil,     :orange],
          [nil,     :orange]
        ]
      ]
    end

    OBlock = BlockDefinition.new do |block|
      block.name      = 'O Block'
      block.rotations = [
        [:yellow, :yellow],
        [:yellow, :yellow],
      ]
    end

    SBlock = BlockDefinition.new do |block|
      block.name      = 'S Block'
      block.rotations = [
        [ [nil,    :green, :green],
          [:green, :green]
        ],
        [ [:green],
          [:green, :green],
          [nil,    :green]
        ]
      ]
    end

    TBlock = BlockDefinition.new do |block|
      block.name      = 'T Block'
      block.rotations = [
        [ [nil,     :purple],
          [:purple, :purple, :purple]
        ],
        [ [:purple],
          [:purple, :purple],
          [:purple]
        ],
        [ [:purple, :purple, :purple],
          [nil,     :purple]
        ],
        [ [nil,     :purple],
          [:purple, :purple],
          [nil,     :purple]
        ]
      ]
    end

    ZBlock = BlockDefinition.new do |block|
      block.name      = 'Z Block'
      block.rotations = [
        [ [:red, :red],
          [nil,  :red, :red]
        ],
        [ [nil,  :red],
          [:red, :red],
          [:red]
        ]
      ]
    end

    DotBlocks = {
      blue: BlockDefinition.new(name: 'Blue Dot Block', rotations: [[:blue]]),
    }
  end
end

