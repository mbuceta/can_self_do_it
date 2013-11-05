require 'rubygems'
require 'singleton'
require 'rspec'
require 'can_do_it'
$LOAD_PATH.unshift File.expand_path("../lib", File.dirname(__FILE__))

RSpec.configure do |config|
 config.before :all do
#   @admin, @user1, @user2, @guess = User.create(true), User.create, User.create, Guess.instance
#   # Admin Blogs and Posts
#   @blog_admin = Blog.create(@admin)
#   @post_admin = Post.create(@blog_admin)
#   # User1 Blogs and Posts
#   @blog_user1 = Blog.create(@user1)
#   @post_user1 = Post.create(@blog_user1)
#   # User2 Blogs
#   @blog_user2 = Blog.create(@user2)
#   @post_user2 = Post.create(@blog_user2)
#   # Guess has not Blog
 end
end

#module Holdeable
#  def all
#    @all ||= []
#  end
#
#  def create(*args)
#    newone = self.new(*args)
#    self.all << newone
#    newone
#  end
#end


class Guess
 include Singleton
 include CanDoIt::Unknown
end

class User
  include CanDoIt::Known
  attr_accessor :blogs
  def admin?; false;end
  def initialize
    @blogs = []
  end
end

class Admin
  include CanDoIt::Known
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
  attr_accessor :blog

  def owner
    @blog.user
  end

  def initialize(blog)
    @blog = blog
    @blog.posts << self
    self
  end
end
