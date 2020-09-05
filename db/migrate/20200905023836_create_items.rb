class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :image,            null: false 
      t.string :item,             null: false
      t.text :text,               null: false
      t.integer :cotegory,        null: false
      t.integer :status,          null: false
      t.integer :shipping_burden, null: false
      t.integer :shipping_erea,   null: false
      t.integer :date_shipment,   null: false
      t.integer :price,           null: false 
      t.references :user,         foreign_key: true
      t.timestamps
    end
  end
end
