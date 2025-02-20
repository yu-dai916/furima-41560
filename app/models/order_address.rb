class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code,:prefecture_id,:city,:house_number,:building_name,:phone_number,:order,:token,:user_id,:item_id
  validates :postal_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
  validates :user_id,presence: true 
  validates :item_id,presence: true
  validates :city,presence: true
  validates :prefecture_id,presence: true
  validates :token, presence: true
  validates :postal_code, presence: true, format: { with: /\A\d{3}-\d{4}\z/, message: 'must be in the format XXX-XXXX' }
  validates :phone_number, presence: true, format: { with:/\A\d{10,11}\z/, message: 'must be 10 or 11 digits' }

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end


end
