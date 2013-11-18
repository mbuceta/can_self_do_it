$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require "can_do_it/version"
require "can_do_it/known"
require "can_do_it/unknown"

module CanDoIt
  # Your code goes here...
end

Module.class_eval do
  def acts_as_can_do_it(options={})
    can_do_it_module = case options[:as].to_s
                            when 'known' then CanDoIt::Known
                            when 'unknown' then CanDoIt::Unknown
                            else CanDoIt::Base
                       end
    self.send(:include,  can_do_it_module)
    define_method(:auto_can_do_it_method?){true} if options[:auto]
  end
end
