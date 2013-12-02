describe CanSelfDoIt::Known do

  it "must implement can_see_default?" do
    CanSelfDoIt::Known.protected_method_defined?(:can_see_default?).should  == true
  end

  it "must implement can_edit_default?" do
    CanSelfDoIt::Known.protected_method_defined?(:can_edit_default?).should  == true
  end

  it "must implement can_create_default?" do
    CanSelfDoIt::Known.protected_method_defined?(:can_create_default?).should  == true
  end

  it "must implement can_delete_default?" do
    CanSelfDoIt::Known.protected_method_defined?(:can_delete_default?).should  == true
  end

  it "must implement can_modify_default?" do
    CanSelfDoIt::Known.protected_method_defined?(:can_modify_default?).should  == true
  end

  it "must implement owner_method_names" do
    CanSelfDoIt::Known.protected_method_defined?(:owner_method_names).should  == true
  end

  it "must implement admin_method_name" do
    CanSelfDoIt::Known.protected_method_defined?(:admin_method_name).should  == true
  end

end
