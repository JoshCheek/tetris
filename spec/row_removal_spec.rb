require 'spec_helper'

# not really happy with this
# should be named RemoveRow, but
# identifying rows to remove and removing them should be split
describe Tetris::RowRemoval do
  it 'identifies rows that are completely filled'
  it 'identifies 4 adjacent row removals as a tetris'
  specify 'rows beyond 4 are not part of the tetris'
end
