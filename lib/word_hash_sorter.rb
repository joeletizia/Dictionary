class WordHashSorter
  def initialize(hash)
    @hash = hash
  end

  def sort
    sorted_keys = hash.keys.sort
    new_hash = {}
    sorted_keys.each do |key|
      new_hash[key] = hash[key]
    end

    new_hash
  end

  private

  attr_reader :hash
end

