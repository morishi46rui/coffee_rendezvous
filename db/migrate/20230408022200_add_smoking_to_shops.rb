class AddSmokingToShops < ActiveRecord::Migration[7.0]
  def change
    add_column :shops, :smoking, :string
  end
end
