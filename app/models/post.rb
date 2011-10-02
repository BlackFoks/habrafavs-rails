class Post < ActiveRecord::Base
  belongs_to :blog
  belongs_to :author, :class_name => "Habrauser", :foreign_key => "author_id"
  has_many :favs

  # finds post by its habraid or loads post from habrahabr if requested post
  # can't be found in the database
  def self.find_or_fetch(habraid)
    post = Post.where(['habraid = ?', habraid]).first
    return post if post

    hpost = Habr::Post.find habraid
    Post.create(
      :habraid => hpost.id,
      :title => hpost.title,
      :content => hpost.content,
      :published_at => hpost.published_at,
      # find blog in db or save it with given data
      :blog => Blog.find_or_save(
        :slug => hpost.blog_slug,
        :name => hpost.blog_title
      ),
      # find habrauser in db or save it with given data
      :author => Habrauser.find_or_save(
        :name => hpost.author_name
      )
    )
  end
end
