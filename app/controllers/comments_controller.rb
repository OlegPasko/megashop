class CommentsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @comment = Comment.new(params.require(:comment).permit(:name, :mark, :content))
    @comment.product = @product
    if @comment.save
      redirect_to product_path(@product), notice: 'Ok!'
    else
      redirect_to product_path(@product), alert: 'Ne ok!'
    end
  end
end
