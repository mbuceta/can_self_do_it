require File.dirname(__FILE__) + '/spec_helper.rb'

describe Admin do

  before(:all) do
   # Admin Blogs and Posts
   class AdminActsAsCanSelfDoIt < Admin
     acts_as_can_self_do_it(:as => CanSelfDoIt::Known, :auto => false)
   end
   @admin      = AdminActsAsCanSelfDoIt.new
   @blog_admin = Blog.new(@admin)
   @post_admin = Post.new(@blog_admin)
   # User Blogs and Posts
   @user      = User.new
   @blog_user = Blog.new(@user)
   @post_user = Post.new(@blog_user)
  end

  it "can see any Blog" do
    @admin.can_see?(@blog_admin).should == true
    @admin.can_see?(@blog_user).should  == true
  end

  it "can see any Post" do
    @admin.can_see?(@post_admin).should == true
    @admin.can_see?(@post_user).should  == true
  end


  it "can edit any Blog" do
    @admin.can_edit?(@blog_admin).should == true
    @admin.can_edit?(@blog_user).should  == true
  end

  it "can edit any Post" do
    @admin.can_edit?(@post_admin).should == true
    @admin.can_edit?(@post_user).should  == true
  end

  it "can comment any Post" do
    @admin.can_create?(Comment, @post_admin).should == true
    @admin.can_create?(Comment, @post_user).should  == true
  end

  it "can delete any Blog" do
    @admin.can_delete?(@blog_admin).should == true
    @admin.can_delete?(@blog_user).should  == true
  end

  it "can delete any Post" do
    @admin.can_delete?(@post_admin).should == true
    @admin.can_delete?(@post_user).should  == true
  end

end
