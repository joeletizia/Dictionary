class SentenceParser
  def initialize(text)
    @text = text.downcase
  end

  ABBREVIATED_NON_WORDS = ['e.g.', 'i.e.', 'etc.']
  SENTENCE_DEMARKATING_PUNCTUATION = /[.?!]/

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
      accumulator[word] = sentences_containing_word(word)
      accumulator
    end
  end

  private

  attr_reader :text

  def sentences_containing_word(word)
    pipe_delimited_text.split("|").each_with_index.inject([]) do |array, key_value_pair|
      sentence, index = key_value_pair[0], key_value_pair[1]
      array << index + 1 if sentence.include? word
      array
    end
  end

  def pipe_delimited_text
    remove_special_words_from_text.gsub(SENTENCE_DEMARKATING_PUNCTUATION, "|")
  end

  def word_parser
    @word_parser ||= WordParser.new(remove_special_words_from_text)
  end

  def remove_special_words_from_text
    ABBREVIATED_NON_WORDS.each.inject(text) do |new_text, special_word|
      new_text.gsub(special_word, '')
    end
  end
end
