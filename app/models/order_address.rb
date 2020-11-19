class OrderAddress

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_cord, :region_id, :municipality, :house_number, :building_name, :phone_number, :order_id

  with_options presence: true do
    validates :postal_cord, :region_id, :municipality, :house_number, :phone_number
  end

  validates :postal_cord, format: { with: /\A\d{3}[-]\d{4}\z/ } 
  validates :phone_number, format: {with: /\A\d{11}\z/}

  def save
   order = Order.create(item_id: item_id, user_id: user_id)
   Address.create(postal_cord: postal_cord, region_id: region_id, municipality: municipality, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end