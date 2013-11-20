module CanDoIt
module Known

protected

  def can_see_default?(obj); true; end

  # Check for can_modify_default
  def can_edit_default?(obj); can_modify_default?(obj); end

  # Check the parent owner of the object to create
  def can_create_default?(parent); can_modify_default?(parent); end

  # Check for can_modify_default
  def can_delete_default?(obj); can_modify_default?(obj); end

  # Check if self is the administration or the obj owner
  def can_modify_default?(obj); administrator_or_object_owner?(obj); end


  def owner_method_names
    [:owner, :author, :user]
  end

  def admin_method_name
    :admin?
  end


private

  def administrator_or_object_owner?(obj)
    !! (
         (self.admin_method_name && self.respond_to?(admin_method_name) && self.send(admin_method_name)) || #Administrator
          self == owner_for(obj))
  end

  #we are finding object owner
  def owner_for(obj)
    (obj.is_a?(self.class) && obj) || (owner_method = owner_method_names.detect{|n| obj.respond_to?(n)}) && obj.send(owner_method)
  end

end
end
