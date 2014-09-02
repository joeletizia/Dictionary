class WordHashSorter
  def initialize(hash)
    @hash = hash
  end

  def sort
    sorted_keys = hash.keys.sort

    sorted_keys.inject({}) do |accumulator, key|
      accumulator[key] = hash[key]
      accumulator
    end
  end

  private

  attr_reader :hash
end

