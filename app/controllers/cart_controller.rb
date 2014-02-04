class CartController < ApplicationController
  def index
    @total_price = 0
    current_cart.line_items.each { |line_item| @total_price += line_item.quantity*line_item.price }
  end
end
