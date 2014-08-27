require 'spec_helper'

describe WordParser do
  subject(:word_parser) { WordParser.new(text) }
  let(:text) { "Hello! Hello, Joe!" }

  describe "#words" do
    it "returns a collection of unique words" do
      expect(word_parser.words).to eq(['hello', 'joe'])
    end
  end

  describe "#count_hash" do
    it "returns a hash of words pointing to their counts" do
      expect(word_parser.count_hash).to eq({'hello' => 2, 'joe' => 1})
    end
  end
end
