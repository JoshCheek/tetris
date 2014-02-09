module Tetris
  module Random
    extend self

    def call(n)
      random n
    end

    def random(n)
      ::Random.rand n
    end
  end
end
