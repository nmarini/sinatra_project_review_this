class User < ActiveRecord::Base
  has_many :reviews

  has_secure_password

  def slug
    self.username.gsub(" ","-").downcase
  end

  def self.find_by_slug(slug)
    self.all.find{|i| i.slug == slug}
  end
end
