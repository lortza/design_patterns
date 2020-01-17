def camel_case(string)
  tokens = string.split('.')
  tokens.map! {|t| t.capitalize}
  tokens.join('Dot')
end

to_host = 'fancydomain.com'
puts camel_case(to_host)

puts "===================="

class CaseConverter
  def self.camel(string)
    tokens = string.split(' ')
    tokens.map! {|t| t.capitalize}
    tokens.send.first.downcase!
    tokens.join
  end

  def self.pascal(string)
    tokens = string.split(' ')
    tokens.map! {|t| t.capitalize}
    tokens.join
  end

  def self.snake(string)
    tokens = string.split(' ')
    tokens.map! {|t| t.downcase}
    tokens.join('_')
  end

  def self.kebab(string)
    tokens = string.split(' ')
    tokens.map! {|t| t.downcase}
    tokens.join('-')
  end

end


string = 'convert my words into a new case'
puts "camel: #{CaseConverter.camel(string)}"
puts "pascal: #{CaseConverter.pascal(string)}"
puts "snake: #{CaseConverter.snake(string)}"
puts "kebab: #{CaseConverter.kebab(string)}"
