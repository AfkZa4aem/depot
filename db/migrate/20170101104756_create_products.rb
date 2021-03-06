class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.string :image_url
      # change price type: 01234567.89
      t.decimal :price, precision: 8, scale: 2

      t.timestamps null: false
    end
  end
end
