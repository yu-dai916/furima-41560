class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :quality
  belongs_to_active_hash :payment
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :scheduled_delivery
  
  validates :name, presence: true
  validates :price, numericality: { less_than_or_equal_to: 9_999_999, greater_than_or_equal_to: 300,  message: "can't be blank"}
  validates :image, presence: true
  validates :price, presence: true
  validates :explanation, presence: true  
  validates :category_id, presence: true
  validates :quality_id, presence: true
  validates :payment_id, presence: true
  validates :prefecture_id, presence: true  
  validates :scheduled_delivery_id, presence: true
    validates :category_id,numericality: { other_than: 0, message: "can't be blank" } 
    validates :quality_id,numericality: { other_than: 0, message: "can't be blank" } 
    validates :payment_id,numericality: { other_than: 0, message: "can't be blank" } 
    validates :prefecture_id,numericality: { other_than: 0, message: "can't be blank" } 
    validates :scheduled_delivery_id,numericality: { other_than: 0, message: "can't be blank" } 

  belongs_to :user
  has_many :comments
  has_one :order, dependent: :destroy
  has_one_attached :image
end
