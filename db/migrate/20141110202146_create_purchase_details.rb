class CreatePurchaseDetails < ActiveRecord::Migration
  def change
    create_table :purchase_details do |t|
      t.string :purchaser_name
      t.text :item_description
      t.decimal :item_price
      t.integer :purchase_count
      t.text :merchant_address
      t.string :merchant_name

      t.timestamps
    end
  end
end
