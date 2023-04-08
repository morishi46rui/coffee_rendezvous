class CreateShops < ActiveRecord::Migration[7.0]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :phone
      t.string :url
      t.string :opening
      t.string :payment

      t.timestamps
    end
  end
end
