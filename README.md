# Concordance Generator

The concordance generator will generate a hash of all words in the given hash. The hash will have a key of the word, and a value of an array containing the occurance count of the word, and a collection of sentences in which the word appears represented by the number of the sentence.

To run the application, use `ruby main.rb`. This command will use the given `sample.txt` file which contains a long lorem text file. To supply your own file, run `ruby main.rb /path/to/file.txt`

There is a full test suite written in rspec. Make sure you have rspec installed via `gem install rspec` and then run the `rspec` command.

## Useage

The application is written in Ruby. I used the MRI interpretter. You can install ruby on your machine and run `ruby main.rb` to run with the default `sample.txt`. If you wish to operate on another text file, simply use `ruby main.rb /path/to/file`.

The application does not consider words like 'etc. e.g. i.e.' because they are not really words. This simplifies the solution greatly due to the fact that there is little to no ambiguity in sentence partitioning with the removal of these words. It is possible I missed a few words due to not being an scholar of the english language. 

I have two hesitations in this solution. The first is the fact that it takes multiple iterations through the given text to come up with a solution. There are at least two iterations: the first for the word count, the second for determining what sentences the words appear in. Perhaps we could optimize this by getting both pieces of information in a single iteration. However, considering big-O notation, a constant multiplier of a linear running-time algorithm is still linear, so perhaps there are better optimizations to possibly bring this down to a linearithmic time. The second is memory efficiency. Considering the document I used as a sample is relatively small, we can fit the entire thing in memory. However, for large documents, that may not be possible. In that case, we would have to use some kind of partitioning scheme to break the document up into pages and process each page. From there, we could possible paralellize that work to be done across multiple processes/machines, and then persist to a single shared resource like a database or shared flat file.


