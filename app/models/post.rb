class Post < ActiveRecord::Base
 
 belongs_to :user
 has_many :post_topics
 has_many :topics , through: :post_topics

  def slug
    self.title.downcase.gsub!(" ", "-")
  end

  def self.find_by_slug(name)
    Post.all.find{|user| user.slug == name}
  end

end