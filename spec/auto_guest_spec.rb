require File.dirname(__FILE__) + '/spec_helper.rb'

describe Guest do

  before(:all) do

    class GuestActsAsCanSelfDoIt < Guest
      acts_as_can_self_do_it(:as => CanSelfDoIt::Unknown, :auto => true)
    end

    @guest = GuestActsAsCanSelfDoIt.instance

    # Admin Blogs and Posts
    @admin      = Admin.new
    @blog_admin = Blog.new(@admin)
    @post_admin = Post.new(@blog_admin)
    # User Blogs and Posts
    @user      = User.new
    @blog_user = Blog.new(@user)
    @post_user = Post.new(@blog_user)

    @comment_user  = Comment.new(@post_admin, @user)
    @comment_admin = Comment.new(@post_user, @admin)
  end

  it "can see any Blog" do
    @guest.can_see?(@blog_admin).should == true
    @guest.can_see?(@blog_user).should  == true
  end

  it "can see any Post" do
    @guest.can_see?(@post_admin).should == true
    @guest.can_see?(@post_user).should  == true
  end

  it "can't edit Blogs" do
    @guest.can_edit?(@blog_admin).should == false
    @guest.can_edit?(@blog_user).should  == false
  end

  it "can't edit Posts" do
    @guest.can_edit?(@post_admin).should == false
    @guest.can_edit?(@post_user).should  == false
  end

  it "can't delete Blogs" do
    @guest.can_delete?(@blog_admin).should == false
    @guest.can_delete?(@blog_user).should  == false
  end

  it "can't delete Posts" do
    @guest.can_delete?(@post_admin).should == false
    @guest.can_delete?(@post_user).should  == false
  end

  it "can't see user comments" do
    @guest.can_see?(@comment_user).should == false
  end

  it "can see admin comments" do
    @guest.can_see?(@comment_admin).should == true
  end

  it "can't share Posts" do
    @guest.can_share?(@post_admin).should == false
    @guest.can_share?(@post_user).should  == false
  end

  it "can't join to Blogs" do
    @guest.can_join?(@blog_admin).should == false
    @guest.can_join?(@blog_user).should  == false
  end

end
