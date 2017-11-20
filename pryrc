# https://github.com/pry/pry/wiki/FAQ

require 'rubygems'

begin
  require 'awesome_print'
  AwesomePrint.pry!
rescue LoadError
end

if defined?(Pry) && defined?(PryByebug)
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'f', 'finish'
end
