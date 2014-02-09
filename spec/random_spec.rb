require 'tetris/random'

describe Tetris::Random do
  it 'gives a random integer between 0 and the number given' do
    nums = 300.times.map { described_class.call 3 }.uniq.sort
    expect(nums).to eq [0, 1, 2]
  end
end
