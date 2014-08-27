require 'spec_helper'

# Given a paragraph, return sentences
#
describe SentenceParser do
  let(:sentence_parser) { SentenceParser.new(text) }
  let(:text) { "Hello, Joe! Where are we i.e. where is this?" }

  describe "#word_count" do
    it "returns a hash of words with their count" do
      result = {
        'hello' => 1,
        'joe' => 1,
        'where' => 2,
        'are' => 1,
        'we' => 1,
        'is' => 1,
        'this' => 1,
        'i.e.' => 1
      }
      expect(sentence_parser.word_count).to eq(result)
    end
  end
end
