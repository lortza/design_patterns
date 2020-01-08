This is the start of a DSL interpreter. It backs up our docs to an external drive every 60 minutes.

We'd run the program like this:
```
backup 'home/documents'
to 'external_drive/backups'
interval 60
```

```ruby
# packrat.rb
require 'finder'

def backup(dir, find_expression=All.new)
  puts "Backup called, source dir=#{dir} find expr=#{find_expression}"
end

def to(backup_directory)
  puts "To called, backup dir=#{backup_directory}"
end

def interval(minutes)
  puts "Interval called, interval=#{minutes} min"
end

# This last line says to run the contents of the file as Ruby program text
eval(File.read('backup.pr'))
```

This idea of pulling in the DSL and interpreting it as Ruby makes it an Internal DSL.
