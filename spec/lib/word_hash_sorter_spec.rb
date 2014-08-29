require 'spec_helper'

describe WordHashSorter do
  describe "#sort" do
    subject(:sorter) { WordHashSorter.new(hash) }
    let(:hash) do
      {
        z: '1',
        y: '2',
        x: '3',
        w: '4'

      }
    end

    it "sorts the hash" do
      expected_key_order = [
        :w,
        :x,
        :y,
        :z

      ]

      expect(sorter.sort.keys).to eq(expected_key_order)
    end

    it "returns a hash equal to the original" do
      expect(sorter.sort).to eq(hash)
    end
  end
end
