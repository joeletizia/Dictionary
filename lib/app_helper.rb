module AppHelper
  def self.run_default
    parser = SentenceParser.new(default_text).occurance_count_with_sentence_location
    pp parser.occurance_count_with_sentence_location
  end

  def self.run_custom(file_path)
    parser = SentenceParser.new(custom_text(file_path))
    pp parser.occurance_count_with_sentence_location
  end

  def self.no_arguments_provided
    ARGV.empty?
  end

  private

  DEFAULT_FILE = './sample.txt'

  def self.default_text
    File.open(DEFAULT_FILE).read.chomp
  end

  def self.custom_text(file_path)
    File.open(file_path).read.chomp
  end
end
