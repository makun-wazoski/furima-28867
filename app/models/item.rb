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
    validates :item
    validates :text
    validates :cotegory
    validates :status
    validates :shipping_burden
    validates :shipping_erea
    validates :date_shipment
    validates :price, format: { with: /\A[0-9]+\z/, message: 'Price Half-width number'}
    validates :price, format: { with: /[3-9][0-9]{2}|[1-9][0-9]{3,6}/, message: 'Price Out of setting range'}

  end
end
