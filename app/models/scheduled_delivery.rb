class ScheduledDelivery < ActiveHash::Base
  include ActiveHash::Associations
  has_one :item

  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '1~2日で発送' },
    { id: 2, name: '2~3日で発送' },
    { id: 3, name: '4~7日で発送' }
  ]
  include ActiveHash::Associations
  has_many :item
end