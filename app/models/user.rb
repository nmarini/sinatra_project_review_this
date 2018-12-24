class User < ActiveRecord::Base
  has_many :reviews

  has_secure_password

  def slug
    self.username.downcase.gsub(" ", "-")

  end

  def self.find_by_slug(slug)
    self.all.find{|u| u.slug == slug }
  end
end
