require 'can_self_do_it/helper'
module CanSelfDoIt
module Base

  def can_see?(obj)
    method = "can_see_#{CanSelfDoIt::Helper.class_2_method_sub_str(obj.class)}?"
    self.public_methods.include?(method.to_sym) ?  self.send(method,obj) : can_see_default?(obj)
  end

  def can_edit?(obj)
    method = "can_edit_#{CanSelfDoIt::Helper.class_2_method_sub_str(obj.class)}?"
    self.public_methods.include?(method.to_sym) ? send(method,obj) : can_edit_default?(obj)
  end

  # parent: parent of the object created
  # Examples:
  # - session_user.can_create?(Proposal, project)
  # - session_user.can_create?(Project)
  def can_create?(obj_class, parent = self)
    method = "can_create_#{CanSelfDoIt::Helper.class_2_method_sub_str(obj_class)}?"
    self.public_methods.include?(method.to_sym) ?  send(method,parent) : can_create_default?(parent)
  end

  def can_delete?(obj)
    method = "can_delete_#{CanSelfDoIt::Helper.class_2_method_sub_str(obj.class)}?"
    self.public_methods.include?(method.to_sym) ?  send(method,obj) : can_delete_default?(obj)
  end

  def respond_to_without_can_self_do_it_method?(sym)
    self.public_methods.include?(sym.to_sym)
  end

protected

  def can_see_default?(obj);           raise NotImplementedError.new("You must implement can_see_default?.")    ; end
  def can_edit_default?(obj);          raise NotImplementedError.new("You must implement can_edit_default?.")   ; end
  def can_create_default?(parent);     raise NotImplementedError.new("You must implement can_create_default?.") ; end
  def can_delete_default?(obj);        raise NotImplementedError.new("You must implement can_delete_default?.") ; end

end
end
