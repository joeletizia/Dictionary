class SentenceParser
  def initialize(text)
    @text = text.downcase
  end

  def words
    word_parser.words
  end

  def word_hash
    word_parser.word_hash
  end

  private 

  attr_reader :text

  def word_parser
    @word_parser ||= WordParser.new(text)
  end
end
