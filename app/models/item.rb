class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category 
  belongs_to_active_hash :status
  belongs_to_active_hash :charge
  belongs_to_active_hash :region
  belongs_to_active_hash :days_to_ship
  

  validates :name, :text, :category, :status, :charge, :region, :days_to_ship, presence: true

   #選択が「--」の時は保存できないようにする
  validates :category_id, :status_id, :charges_id, :region_id, :days_to_ship_id, numericality: { other_than: 1 }
end
