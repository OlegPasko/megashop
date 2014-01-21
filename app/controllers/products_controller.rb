class ProductsController < ApplicationController
  def index
    if params[:sort].present?
      column = params[:sort].split('_').first
      order = params[:sort].split('_').last.upcase
    else
      column = 'name'
      order = 'ASC'
    end

    @products = if params[:category].present?
                  Product.where(category_id: params[:category]).order("#{column} #{order}").paginate(:page => params[:page], :per_page => 16)
                elsif params[:search].present?
                  Product.where("name LIKE ? OR description LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%").order("#{column} #{order}").paginate(:page => params[:page], :per_page => 16)
                else
                  Product.order("#{column} #{order}").paginate(:page => params[:page], :per_page => 16)
                end
  end
  #@posts = Post.paginate(:page => params[:page])


  def show
    @product = Product.find(params[:id])
  end
end
