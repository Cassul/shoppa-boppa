class Orders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :order_id
      t.string :processed_at
      t.string :currency
      t.string :total_price
      t.string :total_price_usd
      t.string :token
      t.string :total_tax
      t.references :shop, foreign_key: true
      t.timestamps
    end
  end
end
