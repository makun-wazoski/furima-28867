class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item                , null: false
      t.text :text                  , null: false
      t.integer :cotegory_id        , null: false
      t.integer :status_id          , null: false
      t.integer :shipping_burden_id , null: false
      t.integer :shipping_erea_id   , null: false
      t.integer :date_shipment_id   , null: false
      t.integer :price
      t.references :user,         foreign_key: true
      t.timestamps
    end
  end
end
