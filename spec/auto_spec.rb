describe CanSelfDoIt::Auto do

  before(:all) do
    class CanSelfDoItImpWithAuto; acts_as_can_self_do_it(:auto => true); end
  end

  it "must respond to can_see?" do
    can_self_do_it_impl = CanSelfDoItImpWithAuto.new
    can_self_do_it_impl.respond_to?(:can_see?).should  == true
  end

  it "must raise NotImplementedError when call can_see?" do
    can_self_do_it_impl = CanSelfDoItImpWithAuto.new
    expect{can_self_do_it_impl.can_see?(nil)}.to raise_error(NotImplementedError)
  end

  it "must respond to can_view?" do
    can_self_do_it_impl = CanSelfDoItImpWithAuto.new
    can_self_do_it_impl.respond_to?(:can_view?).should  == true
  end

  it "must raise NotImplementedError when call can_view?" do
    can_self_do_it_impl = CanSelfDoItImpWithAuto.new
    expect{can_self_do_it_impl.can_view?(nil)}.to raise_error(NotImplementedError)
  end

  it "must respond to can_eliminate?" do
    can_self_do_it_impl = CanSelfDoItImpWithAuto.new
    can_self_do_it_impl.respond_to?(:can_eliminate?).should  == true
  end

  it "must raise NotImplementedError when call can_eliminate?" do
    can_self_do_it_impl = CanSelfDoItImpWithAuto.new
    expect{can_self_do_it_impl.can_eliminate?(nil)}.to raise_error(NotImplementedError)
  end

  it "mustn't respond to eliminate?" do
    can_self_do_it_impl = CanSelfDoItImpWithAuto.new
    can_self_do_it_impl.respond_to?(:eliminate?).should  == false
  end

  it "must raise NoMethodError when call eliminate?" do
    can_self_do_it_impl = CanSelfDoItImpWithAuto.new
    expect{can_self_do_it_impl.eliminate?(nil)}.to raise_error(NoMethodError)
  end

  it "mustn't respond to can_eliminate" do
    can_self_do_it_impl = CanSelfDoItImpWithAuto.new
    can_self_do_it_impl.respond_to?(:can_eliminate).should  == false
  end

  it "must raise NoMethodError when call can_eliminate" do
    can_self_do_it_impl = CanSelfDoItImpWithAuto.new
    expect{can_self_do_it_impl.can_eliminate(nil)}.to raise_error(NoMethodError)
  end

end
