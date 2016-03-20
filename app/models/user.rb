class User < ActiveRecord::Base

  extend SlugModule::ClassMethods
  include SlugModule::InstanceMethods
 
  has_secure_password

  validates_presence_of :name

 has_many :topics, through: :posts
 has_many :posts

#write find by slug and slug
#  def slug
#    self.name.downcase.gsub!(" ", "-")
#  end#

#  def self.find_by_slug(name)
#    User.all.find{|user| user.slug == name}
#  end
end