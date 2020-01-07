# The interpreter pattern has two main concepts:
#   1. creating a language of operations
#   2. building an interpreter so people can interface with it

# Step 1: creating a language of operations (incomplete sample example)
# Example of writing a class that handles the case of 'not'
class Not
  def initialize(expression)
    @expression = expression
  end

  def evaluate(some_data)
    # Assuming 'All' is defined elsewhere
    All.new.evaluate(some_data) - @expression.evaluate(some_data)
  end
end

# And then call it like:
unwritable_expression = Not.new(Writable.new)
unwritable_files = unwritable_expression.evaluate('sample_directory')

# or like these:
small_expression = Not.new(Bigger.new(1024))
small_files = small_expression.evaluate('sample_directory')

no_mp3s_allowed = Not.new(FileName.new('*.mp3'))
not_mp3s = no_mp3s_allowed.evaluate('sample_directory')

# Write a class to implement 'OR'
class Or
  def initialize(expression1, expression2)
    @expression1 = expression1
    @expression2 = expression2
  end

  def evaluate(some_data)
    result1 = @expression1.evaluate(some_data)
    result2 = @expression2.evaluate(some_data)
    (result1 + result2).sort.uniq
  end
end

# And run it with two args like:
big_or_mp3_expression = Or.new(Bigger.new(1024), FileName.new('*.mp3'))
big_or_mp3s = big_or_mp3_expression.evaluate('sample_directory')



# Step 2: building an interpreter so people can interface with it
# AKA, creating an AST

# We'd want the user to be able to type something like this to get
# files that are bigger than 1024 and are writable mp3s:
and (and(bigger 1024)(filename *.mp3)) writable

class Parser
  def initialize(text)
    @tokens = text.scan(/\(|) | [\w\.\*]+/)
  end

  def next_token
    @tokens.shift
  end

  def expression
    token = next_token

    if token == nil
      return nil

    elsif token == 'and'
      return And.new(expression1, expression2)

    elsif token == 'writable'
      return Writable.new

    elsif [and so on]
    else
      raise "Unexpected token #{token}"
    end
  end
end

# and call it like this:
parser = Parser.new "and (and(bigger 1024)(filename *.mp3)) writable"
ast = parser.expression
