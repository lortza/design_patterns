class PhraseShouter
  def initialize(phrases)
    @phrases = phrases
  end

  def prepare_phrases
    @phrases.map { |phrase| "#{phrase.upcase}!" }
  end

  def read
    prepare_phrases.each do |phrase|
      puts phrase
    end
  end
end

class RandomPhraseGenerator
  def generate
    [
      'Do you ever walk alone',
      'Like a drifter in the dark',
      'Seeking out what isn\'t there',
      'Looking only for a spark'
    ].sample
  end
end

class StringPhraseAdapter
  def initialize(string_input)
    @string_input = string_input
  end

  def prepare_phrases
    [@string_input]
  end
end

# The PhraseShouter expects to receive an array of phrases.
# It works without a hitch when given an array. It doesn't
# work if you give it a string.
phrases_input = [
  'i like kitties',
  'you like kitties',
  'everybody in the whole wide world likes kitties'
]
reader = PhraseShouter.new(phrases_input) # yay this works!
reader.read # great success!
# Output:
# I LIKE KITTIES!
# YOU LIKE KITTIES!
# EVERYBODY IN THE WHOLE WIDE WORLD LIKES KITTIES!


reader = PhraseShouter.new('they call me mello yellow') # boo, this does not work!
reader.read # fail whale!
# Output:
# undefined method `map' for "they call me mello yellow":String


# Our RandomPhraseGenerator outputs a single string, but we want
# to pass it into our PhraseShouter. We can't do that successfully without
# an adapter.
phrase = RandomPhraseGenerator.new.generate # this is a string
phrases_input = StringPhraseAdapter.new(phrase).prepare_phrases # this converts the string into an array
reader = PhraseShouter.new(phrases_input) # this receives the array it is expecting
reader.read # great success!
# Output:
# LOOKING ONLY FOR A SPARK!
