class AddClosedToShops < ActiveRecord::Migration[7.0]
  def change
    add_column :shops, :closed, :string
  end
end
