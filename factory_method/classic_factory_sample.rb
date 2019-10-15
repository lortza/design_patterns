class IOFactory
  def initialize(format)
    # take a string and get back the class object
    @reader_class = self.class.const_get("#{format}Reader")
    @writer_class = self.class.const_get("#{format}Writer")
  end

  def new_reader
    @reader_class.new
  end

  def new_writer
    @writer_class.new
  end

  html_factory = IOFactory.new('HTML')
  html_reader = html_factory.new_reader

  pdf_factory = IOFactory.new('PDF')
  pdf_writer = pdf_factory.new_writer
end