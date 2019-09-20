class SimpleWriter
  attr_reader :file
  def initialize(path)
    @file = File.open("decorator/#{path}", 'w')
    puts "initialized #{self.class}"
  end

  def write_line(line)
    puts line
    file.print(line)
    file.print("\n")
  end

  # some other methods that we're not actually using
  def pos
    file.pos
  end

  def rewind
    file.rewind
  end

  def close
    file.close
  end
end


# Base Decorator Class
class WriterDecorator
  attr_reader :real_writer

  def initialize(real_writer)
    @real_writer = real_writer
    puts "initialized #{self.class}"
  end

  def write_line(line)
    real_writer.write_line(line)
  end

  def pos
    real_writer.pos
  end

  def rewind
    real_writer.rewind
  end

  def close
    real_writer.close
  end
end

class NumberingWriter < WriterDecorator
  def initialize(real_writer)
    super(real_writer)
    @line_number = 1
  end

  def write_line(line)
    real_writer.write_line("#{@line_number}: #{line}")
    @line_number += 1
  end
end

class CheckSummingWriter < WriterDecorator
  attr_reader :check_sum

  def initialize(real_writer)
    @real_writer = real_writer
    @check_sum = 0
  end

  def write_line(line)
    line.each_byte {|byte| @check_sum = (@check_sum + byte) % 256 }
    @real_writer.write_line("#{line} (#{@check_sum})")

  end
end

class TimeStampingWriter < WriterDecorator
  def write_line(line)
    @real_writer.write_line("#{Time.new}: #{line}")
  end
end

# Decorate a line with a line number!
simple_writer1 = SimpleWriter.new('output_file.txt')
numbering_writer1 = NumberingWriter.new(simple_writer1)
numbering_writer1.write_line('Gimme a line number!')

# Using 2 decorators at once:
simple_writer2 = SimpleWriter.new('output_file.txt')
numbering_writer2 = NumberingWriter.new(simple_writer2)
timestamping_writer2 = TimeStampingWriter.new(numbering_writer2)
checksumming_writer2 = CheckSummingWriter.new(timestamping_writer2)
checksumming_writer2.write_line("Write all the things!")
