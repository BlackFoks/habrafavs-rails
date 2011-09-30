class AddStatusToHabrauser < ActiveRecord::Migration
  def change
    add_column :habrausers, :status, :string
  end
end
