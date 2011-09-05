class CreateHabrausers < ActiveRecord::Migration
  def change
    create_table :habrausers do |t|
      t.references :user
      t.string :name
      t.string :slug

      t.timestamps
    end
  end
end
