def is_valid_dir(dir)
  Dir.exist?(dir) && ('a'..'z').to_a.include?(dir[0])
end

def build_new_file(dir_name)
  notes_file = File.new("#{dir_name}/sample.md", "a+")
  notes_file.puts("# #{dir_name.capitalize} Pattern\n\n## Uses\n\n## Pros\n\n## Cons")
  notes_file.close
end

def remove_keep_file(dir_name)
  File.delete("#{dir_name}/.keep") if File.exist?("#{dir_name}/.keep")
end

Dir.entries('.').each do |dir_item|
  if is_valid_dir(dir_item)
    build_new_file(dir_item)
    remove_keep_file(dir_item)
  end
end
