class CaseConverter
  def self.convert(string)
    tokens = string.split(' ')
    tokens = yield.call(tokens)
  end
end

string = 'Convert my words into a New Case'
pascal = lambda { |arr| arr.map(&:capitalize).join }
snake = lambda { |arr| arr.map(&:downcase).join('_') }
kebab = lambda { |arr| arr.map(&:downcase).join('-') }
# camel = lambda { |arr| arr.map(&:downcase).join }

puts CaseConverter.convert(string) { snake }
