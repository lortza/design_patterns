design_patterns = [
          'Abstract Factory Method',
          'Adapter',
          'Builder',
          'Command',
          'Composite',
          'Decorator',
          'Factory Method',
          'Interpreter',
          'Iterator',
          'Observer',
          'Proxy',
          'Template Method',
          'Singleton',
          'Strategy'
        ]

def snake_cased(name)
  name.downcase.gsub(/ /, '_')
end

design_patterns.each do |pattern|
  dir_name = snake_cased(pattern)
  Dir.mkdir(dir_name)
  Dir.chdir(dir_name)
  File.new('.keep', 'w').close
  puts(Dir.pwd)
  Dir.chdir('..')
end
