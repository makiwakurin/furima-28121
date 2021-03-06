class Item < ApplicationRecord
  belongs_to :user

  has_one_attached :image
  has_one :order
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :charge
  belongs_to_active_hash :region
  belongs_to_active_hash :days_to_ship

  with_options presence: true do
    validates :name, :text, :image, :category, :status, :charge, :region, :days_to_ship, :price
  end

  # 選択が「--」の時は保存できないようにする
  with_options numericality: { other_than: 1 } do
    validates :category_id, :status_id, :charge_id, :region_id, :days_to_ship_id
  end

  validates :price, numericality: { with: /\A[0-9]+\z/, message: '半角数字で入力して下さい' }
  validates :price, numericality: { only_integer: true, greater_than: 300, less_than: 9_999_999 }
end
