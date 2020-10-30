class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  
  validates :name, :text, :category, :status, presence: true

   #選択が「--」の時は保存できないようにする
  validates :category_id, :status_id, numericality: { other_than: 1 }
end
