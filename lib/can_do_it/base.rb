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
    method = "can_create_#{CanDoIt::Helper.class_2_method_sub_str(obj.class)}?"
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

end
end
