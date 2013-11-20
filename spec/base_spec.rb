describe CanDoIt::Base do

  before(:all) do
    class CanDoItImp; acts_as_can_do_it; end
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

  it "mustn't respond to can_view?" do
    can_do_it_impl = CanDoItImp.new
    can_do_it_impl.respond_to?(:can_view?).should  == false
  end

  it "must raise NoMethodError when call can_view?" do
    can_do_it_impl = CanDoItImp.new
    expect{can_do_it_impl.can_view?(nil)}.to raise_error(NoMethodError)
  end

  it "mustn't respond to can_eliminate?" do
    can_do_it_impl = CanDoItImp.new
    can_do_it_impl.respond_to?(:can_eliminate?).should  == false
  end

  it "must raise NoMethodError when call can_eliminate?" do
    can_do_it_impl = CanDoItImp.new
    expect{can_do_it_impl.can_eliminate?(nil)}.to raise_error(NoMethodError)
  end

end
