$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require "can_self_do_it/version"
require "can_self_do_it/base"
require "can_self_do_it/auto"
require "can_self_do_it/known"
require "can_self_do_it/unknown"

module CanSelfDoIt
  # Your code goes here...
end

Module.class_eval do
  def acts_as_can_self_do_it(options={})
    self.send(:include,  CanSelfDoIt::Base)
    self.send(:include,  CanSelfDoIt::Auto) if options[:auto]
    as = options[:as] || []
    as = [as] unless as.respond_to?(:each)
    as.each{|m| self.send(:include,  m)}
  end
end
