class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :categrory
  belongs_to_active_hash :quality
  belongs_to_active_hash :payment
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :cheduled_delivery
  validates :name, :price, :text, :explanation_id, :quality_id, :payment_id, :prefecture_id, :scheduled_delivery_id, presence: true
  validates :price, numericality: { less_than: 9_999_999, greater_than: 300 }

  with_options numericality: { other_than: 0 } do
    validates :explanation_id
    validates :quality_id
    validates :payment_id
    validates :prefecture_id
    validates :scheduled_delivery_id
  end

  belongs_to :user
  has_many :comments
  has_one :order, dependent: :destroy
  has_one_attached :image
end
