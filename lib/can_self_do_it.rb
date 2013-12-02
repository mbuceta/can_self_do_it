$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require "can_do_it/version"
require "can_do_it/base"
require "can_do_it/auto"
require "can_do_it/known"
require "can_do_it/unknown"

module CanDoIt
  # Your code goes here...
end

Module.class_eval do
  def acts_as_can_do_it(options={})
    can_do_it_module = case options[:as].to_s
                            when 'known'   then CanDoIt::Known
                            when 'unknown' then CanDoIt::Unknown
                       end
    self.send(:include,  CanDoIt::Base)
    self.send(:include,  CanDoIt::Auto) if options[:auto]
    self.send(:include,  can_do_it_module) if can_do_it_module
  end
end
