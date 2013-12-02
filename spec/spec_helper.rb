require 'rubygems'
require 'singleton'
require 'rspec'
require 'can_self_do_it'
$LOAD_PATH.unshift File.expand_path("../lib", File.dirname(__FILE__))

RSpec.configure do |config|
 config.before :all do
 end
end

class Guess
 include Singleton
  # Custom
  # Guess only can see admin comments
 def can_see_comment?(comment); comment.user.admin?; end
end

class User
  attr_accessor :blogs
  def admin?; false;end
  def initialize
    @blogs = []
    self
  end

  # Custom
  # Users can comment any post
  def can_create_comment?(post); true; end

end

class Admin
  attr_accessor :blogs
  def admin?; true;end
  def initialize
    @blogs = []
    self
  end
end


class Blog
  attr_accessor :user, :posts
  def initialize(user)
    @user = user
    @posts = []
    @user.blogs << self
    self
  end
end

class Post
  attr_accessor :blog, :comments

  def owner
    @blog.user
  end

  def initialize(blog)
    @comments = []
    @blog = blog
    @blog.posts << self
    self
  end
end

class Comment
  attr_accessor :post, :user

  def initialize(post, user)
    @post = post
    @user = user
    @post.comments << self
    self
  end
end
