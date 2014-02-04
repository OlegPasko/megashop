class LineItemsController < ApplicationController
  def create
    if current_cart.line_items.where(product_id: params[:product_id]).any?
      line_item = current_cart.line_items.where(product_id: params[:product_id]).first
      line_item.quantity += 1
    else
      line_item = LineItem.new
      line_item.cart = current_cart
      product = Product.find(params[:product_id])
      line_item.product = product
      line_item.quantity = 1
      line_item.price = product.price
    end

    if line_item.save
      redirect_to cart_path, notice: 'Product was added to cart'
    else
      redirect_to cart_path, alert: 'Mystic error'
    end
  end
  def destroy
    LineItem.find(params[:id]).destroy
    redirect_to :back
  end
end
