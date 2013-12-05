require 'can_self_do_it/helper'
module CanSelfDoIt
module Auto

  # Automatic method generation.
  # Everything defined as /can_.+\?/ that does not exists get name from param type
  # i.e methods like can_do_something?(project) => can_do_something_project
  def method_missing(symbol, *args, &block)
    if can_self_do_it_method?(symbol)
      raise ArgumentError, "wrong number of arguments(#{args.size}1 for 1)"  unless args.size == 1
      obj = args[0]
      new_symbol = "#{symbol.to_s[0..-2]}_#{CanSelfDoIt::Helper.class_2_method_sub_str(obj.class)}?".to_sym
      self.public_methods.include?(new_symbol) ? send(new_symbol, obj) : can_modify_default?(obj)
    else
      super
    end
  end

  def respond_to_missing?(symbol, include_all)
    can_self_do_it_method?(symbol) || super
  end

  protected

  def can_modify_default?(obj);  raise NotImplementedError.new("You must implement can_modify_default?.") ; end

  private

  def can_self_do_it_method?(symbol)
     !!(symbol.to_s =~ /^can_.+\?/ )
  end

end
end
