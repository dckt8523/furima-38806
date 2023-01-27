class OrderDestination 
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :address, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :municipality, :address, :user_id, :item_id, :token
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end
  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
  validates :phone_number, length: { minimum: 10, maximum: 11 }

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Destination.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building: building, phone_number: phone_number, order_id: order.id)
  end
end