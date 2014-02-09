require 'spec_helper'

describe Tetris::BlockQueue do
  it 'returns a next queue and a block definition (it always dequeues the same value)' do
    queue = described_class.new 123
    _, block_definition = queue.dequeue
    100.times do
      expect(queue.dequeue.last).to eq block_definition
    end
  end

  it 'dequeues a random block definition from i,j,l,o,s,t,z' do
    pending 'IDK wtf is going on here, keep getting the same values for seeds' do
      queue  = described_class.new rand
      blocks = 1000.times
                   .map { queue, block_definition = queue.dequeue
                          block_definition.name
                   }
                   .uniq
                   .sort
      expect(blocks).to eq [
        i_block.name,
        j_block.name,
        l_block.name,
        o_block.name,
        s_block.name,
        t_block.name,
        z_block.name,
      ]
    end
  end

  it 'can be seeded so that its randomness is predictable' do
    queue1 = described_class.new 123
    queue2 = described_class.new 123
    100.times do
      block1 = queue1.dequeue.last
      block2 = queue2.dequeue.last
      expect(block1).to eq block2
    end
  end
end
