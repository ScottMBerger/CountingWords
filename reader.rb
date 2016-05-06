# Reader class that takes a file and displays the top
# most common words. Initilize class with a file.
class Reader
  def initialize(file)
    @word_hash = {}
    @file = file
  end

  def start
    File.foreach(@file) do|x|
      words = clean(x)
      parse(words)
      words.each do|word|
        @word_hash[word] = 1
      end
    end
    result
  end

  def clean(string)
    string.gsub(/[^0-9A-Za-z ]/, '').downcase.split
  end

  def parse(words)
    @word_hash.each do|key, _value|
      words.delete_if do |word|
        if key == word
          @word_hash[key] += 1
          true
        end
      end
    end
  end

  def sort_hash(hash)
    hash.sort_by { |_key, value| -value }.to_h
  end

  def result
    @word_hash = sort_hash(@word_hash)
    count = 0

    puts "Listing top #{@word_hash.length >= 10 ? 10 : @word_hash.length} most common words."

    @word_hash.each do|key, value|
      puts "#{key}: #{value}"
      count += 1
      break if count >= 10
    end
  end
end
