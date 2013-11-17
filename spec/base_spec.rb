describe CanDoIt::Base do

  before(:all) do
    class CanDoItImp; include CanDoIt::Base; end
  end

  it "must respond to can_see?" do
    can_do_it_impl = CanDoItImp.new
    can_do_it_impl.respond_to?(:can_see?).should  == true
  end

  it "must respond to can_edit?" do
    can_do_it_impl = CanDoItImp.new
    can_do_it_impl.respond_to?(:can_edit?).should  == true
  end

  it "must respond to can_delete?" do
    can_do_it_impl = CanDoItImp.new
    can_do_it_impl.respond_to?(:can_delete?).should  == true
  end

  it "must respond to can_create?" do
    can_do_it_impl = CanDoItImp.new
    can_do_it_impl.respond_to?(:can_create?).should  == true
  end

  it "must raise NotImplementedError when call can_see?" do
    can_do_it_impl = CanDoItImp.new
    expect{can_do_it_impl.can_see?(nil)}.to raise_error(NotImplementedError)
  end

  it "must raise NotImplementedError when call can_edit?" do
    can_do_it_impl = CanDoItImp.new
    expect{can_do_it_impl.can_edit?(nil)}.to raise_error(NotImplementedError)
  end

  it "must raise NotImplementedError when call can_delete?" do
    can_do_it_impl = CanDoItImp.new
    expect{can_do_it_impl.can_delete?(nil)}.to raise_error(NotImplementedError)
  end

  it "must raise NotImplementedError when call  can_create?" do
    can_do_it_impl = CanDoItImp.new
    expect{can_do_it_impl.can_create?(nil,nil)}.to raise_error(NotImplementedError)
  end

end
