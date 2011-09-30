class CreateFavs < ActiveRecord::Migration
  def change
    create_table :favs do |t|
      t.references :habrauser
      t.references :post

      t.timestamps
    end
    add_index :favs, :habrauser_id
    add_index :favs, :post_id
  end
end
