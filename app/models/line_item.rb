class LineItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :product

  validates_presence_of :product_id, :cart_id, :quantity, :price
end
