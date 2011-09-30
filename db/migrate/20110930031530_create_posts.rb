class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :blog
      t.string :title
      t.string :content
      t.datetime :published_at
      t.references :author

      t.timestamps
    end
    add_index :posts, :blog_id
    add_index :posts, :author_id
  end
end
