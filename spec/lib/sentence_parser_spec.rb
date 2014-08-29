require 'spec_helper'

describe SentenceParser do
  let(:sentence_parser) { SentenceParser.new(text) }
  let(:text) { "Hello, Joe! Where are we i.e. where is this?" }
  let(:hash_sorter) { double(:hash_sorter) }

  describe "#occurance_count_with_sentence_location" do
    let(:words) { ['hello', 'where'] }

    it "returns a hash with keys of the words and values of the count, and the sentences containing the word" do
      result = {
        'hello' => [1, [1]],
        'where' => [2, [2]],
        'joe' => [1,[1]],
        'are' => [1,[2]],
        'we' => [1,[2]],
        'is' => [1,[2]],
        'this' => [1,[2]],
        'i.e.' => [1,[2]]
      }

      expect(sentence_parser.occurance_count_with_sentence_location).to eq(result)
    end
  end

  describe "#sentences_containing_words" do
    let(:words) { ['hello', 'where'] }

    it "returns a hash with the sentences each word is in" do
      result = {
        'hello' => [1],
        'where' => [2],
        'joe' => [1],
        'are' => [2],
        'we' => [2],
        'is' => [2],
        'this' => [2],
        'i.e.' => [2]
      }
      expect(sentence_parser.sentences_containing_words).to eq(result)
    end
  end

  describe "#word_count" do
    let(:result) do
      {
        'hello' => 1,
        'joe' => 1,
        'where' => 2,
        'are' => 1,
        'we' => 1,
        'is' => 1,
        'this' => 1,
        'i.e.' => 1
      }
    end

    before do
      WordHashSorter.stub(:new).with(result) { hash_sorter }
      hash_sorter.stub(:sort) { result }
    end

    it "returns a hash of words with their count" do
      expect(sentence_parser.word_count).to eq(result)
    end

    it "sorts the hash" do
      sentence_parser.word_count
      expect(hash_sorter).to have_received(:sort)
    end
  end

end
