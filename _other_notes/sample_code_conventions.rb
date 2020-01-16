def camel_case(string)
  tokens = string.split('.')
  tokens.map! {|t| t.capitalize}
  tokens.join('Dot')
end

to_host = 'fancydomain.com'
puts camel_case(to_host)
