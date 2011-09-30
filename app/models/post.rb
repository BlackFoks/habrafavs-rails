class Post < ActiveRecord::Base
  belongs_to :blog
  belongs_to :author, :class_name => "Habrauser", :foreign_key => "author_id"
end
