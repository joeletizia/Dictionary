class WordParser
  SPECIAL_CHARACTERS = [',', '.', ':', ';', '!', '@', '#', '$', '%', '^', '&', '*', '(', ')', '?']

  def initialize(text)
    @text = text.downcase
  end

  def words
    sanitize(text).split(" ").uniq
  end

  def count_hash
    word_hash = {}

    sanitize(text).split(" ").each do |word|
      if word_hash[word]
        word_hash[word] += 1
      else
        word_hash[word] = 1
      end
    end

    word_hash
  end

  private

  attr_reader :text

  def sanitize(text)
    dup_text = text.dup

    SPECIAL_CHARACTERS.each do |special_character|
      dup_text.delete!(special_character)
    end

    dup_text
  end
end
