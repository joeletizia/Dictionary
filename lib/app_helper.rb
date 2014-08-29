module AppHelper
  def self.run_default
    word_count = SentenceParser.new(default_text).word_count
    puts word_count
  end

  def self.run_custom(file_path)
    word_count = SentenceParser.new(custom_text(file_path)).word_count
    puts word_count
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
