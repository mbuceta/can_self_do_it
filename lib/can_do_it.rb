$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require "can_do_it/version"
require "can_do_it/known"
require "can_do_it/unknown"

module CanDoIt
  # Your code goes here...
end
