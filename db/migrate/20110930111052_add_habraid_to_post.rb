class AddHabraidToPost < ActiveRecord::Migration
  def change
    add_column :posts, :habraid, :integer
  end
end
