describe CanDoIt::Unknown do

  it "must implement can_see_default?" do
    CanDoIt::Unknown.protected_method_defined?(:can_see_default?).should  == true
  end

  it "must implement can_edit_default?" do
    CanDoIt::Unknown.protected_method_defined?(:can_edit_default?).should  == true
  end

  it "must implement can_create_default?" do
    CanDoIt::Unknown.protected_method_defined?(:can_create_default?).should  == true
  end

  it "must implement can_delete_default?" do
    CanDoIt::Unknown.protected_method_defined?(:can_delete_default?).should  == true
  end

  it "must implement can_modify_default?" do
    CanDoIt::Unknown.protected_method_defined?(:can_modify_default?).should  == true
  end


end
