class Blog < ActiveRecord::Base
  has_many :posts

  # tries to find blog by its slug and if can't find then creates it
  def self.find_or_save(opts={})
    blog = Blog.where(["slug = ?", opts[:slug]]).first
    blog ||= Blog.create(opts)
  end
end
