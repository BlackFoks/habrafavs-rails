class Post < ActiveRecord::Base
  belongs_to :blog
  belongs_to :author, :class_name => "Habrauser", :foreign_key => "author_id"
  has_many :favs

  # returns the post if it already exists and otherwise fetches and creates it,
  # then returns it.
  def self.find_or_fetch(habraid)
    post = Post.find_by_habraid(habraid)
    return post if post

    hpost = Habr::Post.find habraid
    Post.create(
      :habraid => hpost.id,
      :title => hpost.title,
      :content => hpost.content,
      :published_at => hpost.published_at,
      :blog => Blog.find_or_create_by_slug(hpost.blog_slug, :name => hpost.blog_title),
      :author => Habrauser.find_or_create_by_slug(
        Habr::Helper.name_to_slug(hpost.author_name),
        :name => hpost.author_name
      )
    )
  end
end
