class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item
      t.text :text
      t.integer :cotegory
      t.integer :status
      t.integer :shipping_burden
      t.integer :shipping_erea
      t.integer :date_shipment
      t.integer :price
      t.references :user,         foreign_key: true
      t.timestamps
    end
  end
end
