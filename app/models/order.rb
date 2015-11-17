class Order < ActiveRecord::Base
  belongs_to :user

  has_one  :order_info
  has_many :order_items
end
