class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, :status, :charge

  validates :name, :text, :category, :status, :charge, presence: true

   #選択が「--」の時は保存できないようにする
  validates :category_id, :status_id, :charges_id, numericality: { other_than: 1 }
end
