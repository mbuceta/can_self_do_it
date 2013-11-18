require 'can_do_it/helper'
module CanDoIt
module Base

  def respond_to_with_can_do_it_method?(*args)
    can_do_it_method?(*args) || respond_to_without_can_do_it_method?(*args)
  end

  def can_see?(obj)
    method = "can_see_#{CanDoIt::Helper.class_2_method_sub_str(obj.class)}?"
    respond_to_without_can_do_it_method?(method) ?  self.send(method,obj) : can_see_default?(obj)
  end

  def can_edit?(obj)
    method = "can_edit_#{CanDoIt::Helper.class_2_method_sub_str(obj.class)}?"
    respond_to_without_can_do_it_method?(method) ?  send(method,obj) : can_edit_default?(obj)
  end

  # parent: parent of the object created
  # Examples:
  # - session_user.can_create?(Proposal, project)
  # - session_user.can_create?(Project)
  def can_create?(obj_class, parent = self)
    method = "can_create_#{CanDoIt::Helper.class_2_method_sub_str(obj_class)}?"
    respond_to_without_can_do_it_method?(method) ?  send(method,parent) : can_create_default?(parent)
  end

  def can_delete?(obj)
    method = "can_delete_#{CanDoIt::Helper.class_2_method_sub_str(obj.class)}?"
    respond_to_without_can_do_it_method?(method) ?  send(method,obj) : can_delete_default?(obj)
  end


  # Automatic method generation.
  # Everything defined as /can_.+\?/ that does not exists get name from param type
  # i.e methods like can_do_something?(project) => can_do_something_project
  def method_missing(symbol, *args, &block)
    if can_do_it_method?(symbol)
      raise ArgumentError, "wrong number of arguments(#{args.size}1 for 1)"  unless args.size == 1
      obj = args[0]
      new_symbol = "#{symbol.to_s[0..-2]}_#{CanDoIt::Helper.class_2_method_sub_str(obj.class)}?"
      respond_to_without_can_do_it_method?(new_symbol) ? send(new_symbol, obj) : can_modify_default?(obj)
    else
      super
    end
  end


  alias_method :respond_to_without_can_do_it_method?, :respond_to?
  alias_method :respond_to?, :respond_to_with_can_do_it_method?

protected

  def can_see_default?(obj);           raise NotImplementedError.new("You must implement can_see_default?.")    ; end
  def can_edit_default?(obj);          raise NotImplementedError.new("You must implement can_edit_default?.")   ; end
  def can_create_default?(parent);     raise NotImplementedError.new("You must implement can_create_default?.") ; end
  def can_delete_default?(obj);        raise NotImplementedError.new("You must implement can_delete_default?.") ; end
  def can_modify_default?(obj);        raise NotImplementedError.new("You must implement can_modify_default?.") ; end

private

  def auto_can_do_it_method?;  false; end

  def can_do_it_method?(symbol)
     auto_can_do_it_method? && !!(symbol.to_s =~ /^can_.+\?/ )
  end

end
end
