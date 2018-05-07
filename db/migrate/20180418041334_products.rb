class Products < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :product_id
      t.string :title
      t.string :vendor
      t.integer :sales
      t.references :shop, foreign_key: true
      t.timestamps
    end
  end
end
