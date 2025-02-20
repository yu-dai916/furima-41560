class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code,:prefecture_id,:city,:house_number,:building_name,:phone_number,:order,:token,:user_id,:item_id
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :city
    validates :prefecture_id
    validates :token
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'must be in the format XXX-XXXX' }
    validates :phone_number, format: { with:/\A\d{10,11}\z/, message: 'must be 10 or 11 digits' }
  end
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end


end
