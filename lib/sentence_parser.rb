class SentenceParser
  def initialize(text)
    @text = text.downcase
  end

  ABBREVIATED_NON_WORDS = ['e.g.', 'i.e.', 'etc.']

  def occurance_count_with_sentence_location
    sentences_with_words = sentences_containing_words

    word_count.inject({}) do |accumulator, key_value_pair|
      word = key_value_pair[0]
      count = key_value_pair[1]

      accumulator[word] = [count, sentences_with_words[word]]
      accumulator
    end
  end

  def word_count
    total_counts = word_parser.count_hash

    WordHashSorter.new(total_counts).sort
  end

  def sentences_containing_words
    word_count.keys.inject({}) do |accumulator, word|
      sentences_containing_word = []

      pipe_delimited_text.split("|").each_with_index do |sentence, index|
        sentences_containing_word << index + 1 if sentence.include? word
      end

      accumulator[word] = sentences_containing_word
      accumulator
    end
  end

  private

  attr_reader :text

  def pipe_delimited_text
    remove_special_words_from_text.gsub(/[.?!]/, "|")
  end

  def word_parser
    @word_parser ||= WordParser.new(remove_special_words_from_text)
  end

  def remove_special_words_from_text
    string_without_special_words = text.dup

    ABBREVIATED_NON_WORDS.each do |special_word|
      string_without_special_words.gsub!(special_word, '')
    end

    string_without_special_words
  end
end
