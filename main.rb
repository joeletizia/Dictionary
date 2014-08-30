require_relative './lib/word_parser'
require_relative './lib/sentence_parser'
require_relative './lib/app_helper'
require_relative './lib/word_hash_sorter'
require 'pp'

puts "Concordance:"

if AppHelper.no_arguments_provided
  AppHelper.run_default
else
  AppHelper.run_custom(ARGV[0])
end




