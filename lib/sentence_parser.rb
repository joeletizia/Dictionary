class SentenceParser
  def initialize(text)
    @text = text.downcase
  end

  SPECIAL_WORDS = ['e.g.', 'i.e.', 'etc.']

  def word_count
    counts = special_word_count
    total_counts = counts.merge(word_parser.count_hash)

    WordHashSorter.new(total_counts).sort
  end

  private

  attr_reader :text

  def word_parser
    @word_parser ||= WordParser.new(remove_special_words_from_text)
  end

  def special_word_count
    counts = {}
    SPECIAL_WORDS.each do |special_word|
      counts[special_word] = text.scan(special_word).count if text.include?(special_word)
    end

    counts
  end

  def remove_special_words_from_text
    string_without_special_words = text.dup

    SPECIAL_WORDS.each do |special_word|
      string_without_special_words.gsub!(special_word, '')
    end

    string_without_special_words
  end
end
