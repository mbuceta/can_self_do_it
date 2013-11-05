require 'can_do_it/helper'
module CanDoIt
module Base

  def can_see?(obj)
    method = "can_see_#{CanDoIt::Helper.class_2_method_sub_str(obj.class)}?"
    self.respond_to?(method) ?  self.send(method,obj) : can_see_default?(obj)
  end

  # parent: parent of the object created
  # Examples:
  # - session_user.can_create?(Proposal, project)
  # - session_user.can_create?(Project)
  def can_create?(obj_class, parent = self)
    method = "can_create_#{CanDoIt::Helper.class_2_method_sub_str(obj_class)}?"
    respond_to?(method) ?  send(method,parent) : can_create_default?(parent)
  end

  def can_edit?(obj)
    method = "can_edit_#{CanDoIt::Helper.class_2_method_sub_str(obj.class)}?"
    respond_to?(method) ?  send(method,obj) : can_modify_default?(obj)
  end

  def can_delete?(obj)
    method = "can_delete_#{CanDoIt::Helper.class_2_method_sub_str(obj.class)}?"
    respond_to?(method) ?  send(method,obj) : can_modify_default?(obj)
  end

  # Automatic method generation.
  # Everything defined as /can_.+\?/ that does not exists get name from param type
  # i.e methods like can_do_something?(project) => can_do_something_project
  #def method_missing(symbol, *args, &block)
  #  if can_do_it_method?(symbol) && obj = args[0]
  #    new_symbol = "#{symbol.to_s[0..-2]}_#{CanDoIt::Helper.class_2_method_sub_str(obj.class)}?"
  #    respond_to?(new_symbol) ? send(new_symbol, obj) : super
  #  else
  #    super
  #  end
  #end



protected

  def can_do_it_method?(symbol)
    !!(symbol.to_s =~ /can_.+\?/ )
  end


end
end
