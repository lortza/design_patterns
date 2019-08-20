# Basic Implementation
class Button
  def initialize(command)
    @command = command
  end

  def on_button_push
    @command&.execute
  end
end

class SaveCommand
  def execute
    puts "holla! i'm up in your button saving your stuff!"
  end
end

class PdfExportCommand
  def execute
    puts "yo! i'm up in your button exporting your docs to pdf!"
  end
end

save_button = Button.new(SaveCommand.new)
save_button.on_button_push

pdf_export_button = Button.new(PdfExportCommand.new)
pdf_export_button.on_button_push


# Implementation Using Blocks
class ButtonWithBlock
  def initialize(&block)
    @command = block
  end

  def on_button_push
    @command&.call
  end
end

save_button_with_block = ButtonWithBlock.new do
  puts "holla! i'm up in your button saving your stuff via a block!"
end

save_button_with_block.on_button_push
