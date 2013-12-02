require File.dirname(__FILE__) + '/spec_helper.rb'

describe User do

  before(:all) do
   # User
   class AutoUserActsAsCanSelfDoIt < User
     acts_as_can_self_do_it(:as => :known, :auto => true)
   end

   @user      = AutoUserActsAsCanSelfDoIt.new

   # User Blogs and Posts
   @blog_user = Blog.new(@user)
   @post_user = Post.new(@blog_user)

   # Other User Blogs and Posts
   @blog_other_user = Blog.new(User.new)
   @post_other_user = Post.new(@blog_other_user)

   # Admin Blogs and Posts
   @blog_admin = Blog.new(Admin.new)
   @post_admin = Post.new(@blog_admin)
  end

  it "can see any Blog" do
    @user.can_see?(@blog_admin).should      == true
    @user.can_see?(@blog_user).should       == true
    @user.can_see?(@blog_other_user).should  == true
  end

  it "can see any Post" do
    @user.can_see?(@post_admin).should      == true
    @user.can_see?(@post_user).should       == true
    @user.can_see?(@post_other_user).should  == true
  end


  it "can edit his Blogs" do
    @user.can_edit?(@blog_user).should == true
  end

  it "can edit his Posts" do
    @user.can_edit?(@post_user).should == true
  end


  it "can't edit other's Blogs" do
    @user.can_edit?(@blog_admin).should      == false
    @user.can_edit?(@blog_other_user).should == false
  end

  it "can't edit other's Posts" do
    @user.can_edit?(@post_admin).should      == false
    @user.can_edit?(@post_other_user).should == false
  end

  it "can comment his own posts" do
    @user.can_create?(Comment, @user_post).should  == true
  end

  it "can comment other user posts" do
    @user.can_create?(Comment, @other_user_post).should  == true
  end

  it "can comment admin posts" do
    @user.can_create?(Comment, @other_user_post).should  == true
  end

  it "can delete his Blogs" do
    @user.can_delete?(@blog_user).should == true
  end

  it "can delete his Posts" do
    @user.can_delete?(@post_user).should == true
  end

  it "can't delete other's Blogs" do
    @user.can_delete?(@blog_admin).should      == false
    @user.can_delete?(@blog_other_user).should == false
  end

  it "can't delete other's Posts" do
    @user.can_delete?(@post_admin).should      == false
    @user.can_delete?(@post_other_user).should == false
  end

  it "can share his Posts" do
    @user.can_share?(@post_user).should == true
  end

  it "can't share other's Blogs" do
    @user.can_share?(@blog_admin).should      == false
    @user.can_share?(@blog_other_user).should == false
  end

end
