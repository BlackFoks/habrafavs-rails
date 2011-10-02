class Fav < ActiveRecord::Base
  belongs_to :habrauser
  belongs_to :post

  # parses favs page
  def self.load_from_page(habrauser, page)
    page.each do |fav|
      post = Post.find_or_fetch(fav.post.id)
      Fav.create :habrauser => habrauser, :post => post
    end
  end
end
