class WordParser
  SPECIAL_CHARACTERS = [',', '.', ':', ';', '!', '@', '#', '$', '%', '^', '&', '*', '(', ')', '?']

  def initialize(text)
    @text = text.downcase
  end

  def words
    sanitize(text).split(" ").uniq
  end

  def count_hash
    sanitize(text).split(" ").inject({}) do |accumulator, word|
      if accumulator[word]
        accumulator[word] += 1
      else
        accumulator[word] = 1
      end

      accumulator
    end
  end

  private

  attr_reader :text

  def sanitize(text)
    SPECIAL_CHARACTERS.each.inject(text) do |word, special_character|
      word.gsub(special_character, '')
    end
  end
end
