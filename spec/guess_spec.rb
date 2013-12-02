require File.dirname(__FILE__) + '/spec_helper.rb'

describe Guess do

  before(:all) do

    class GuessActsAsCanSelfDoIt < Guess
      acts_as_can_self_do_it(:as => CanSelfDoIt::Unknown, :auto => false)
    end

    @guess = GuessActsAsCanSelfDoIt.instance

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
    @guess.can_see?(@blog_admin).should == true
    @guess.can_see?(@blog_user).should  == true
  end

  it "can see any Post" do
    @guess.can_see?(@post_admin).should == true
    @guess.can_see?(@post_user).should  == true
  end

  it "can't edit Blogs" do
    @guess.can_edit?(@blog_admin).should == false
    @guess.can_edit?(@blog_user).should  == false
  end

  it "can't edit Posts" do
    @guess.can_edit?(@post_admin).should == false
    @guess.can_edit?(@post_user).should  == false
  end

  it "can't delete Blogs" do
    @guess.can_delete?(@blog_admin).should == false
    @guess.can_delete?(@blog_user).should  == false
  end

  it "can't delete Posts" do
    @guess.can_delete?(@post_admin).should == false
    @guess.can_delete?(@post_user).should  == false
  end

  it "can't see user comments" do
    @guess.can_see?(@comment_user).should == false
  end

  it "can see admin comments" do
    @guess.can_see?(@comment_admin).should == true
  end



end
