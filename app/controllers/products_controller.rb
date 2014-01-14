class ProductsController < ApplicationController
  def index
    if params[:category]
      @products = Product.where(category_id: params[:category])
    else
      @products = Product.all
    end
  end

  def show
    @product = Product.find(params[:id])
  end
end
