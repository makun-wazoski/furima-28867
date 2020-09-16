class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :postal_code  
      t.integer    :prefecture_id
      t.string     :city
      t.string     :house_number
      t.string     :building
      t.string     :phone_number
      t.references :purchase,null: false,foreign_key: true
      t.timestamps
    end
  end
end
