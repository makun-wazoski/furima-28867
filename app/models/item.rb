class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :cotegory
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_burden
  belongs_to_active_hash :shipping_erea
  belongs_to_active_hash :date_shipment
  

  with_options presence: true do
    validates :image
  end
end
