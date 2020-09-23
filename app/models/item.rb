class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image, dependent: :destroy
  has_one :purchase, dependent: :destroy
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
    validates :price, format: { with: /[3-9][0-9]{2}|[1-9][0-9]{3,6}/, message: 'Out of setting range, Price Half-width number' }
  end

  with_options numericality: { other_than: 0, message: 'Select' } do
    validates :cotegory_id
    validates :status_id
    validates :shipping_burden_id
    validates :shipping_erea_id
    validates :date_shipment_id
  end

  def self.search(search)
    if search != ""
      Item.where('text LIKE(?)', "%#{search}%")
    else
      Item.all
    end
  end

end
