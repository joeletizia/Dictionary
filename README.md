# Concordance Generator

The concordance generator will generate a hash of all words in the given hash. The hash will have a key of the word, and a value of an array containing the occurance count of the word, and a collection of sentences in which the word appears represented by the number of the sentence.

To run the application, use `ruby main.rb`. This command will use the given `sample.txt` file which contains a long lorem text file. To supply your own file, run `ruby main.rb /path/to/file.txt`

The application does not consider words like 'etc. e.g. i.e.' because they are not really words. 

There is a full test suite written in rspec. Make sure you have rspec installed via `gem install rspec` and then run the `rspec` command.
