class Api::V1::ProductsController < ApplicationController

  before_action :find_product, only: [ :like]
  before_action :find_user_product, only: [ :sort]
  before_action :authenticate_user!

  def like
    if current_user.liked?(@product)
      #移除喜歡
      current_user.liked_products.destroy(@product)
      render json: { id: params[:id], status: 'unlike'}
    else
      #加入喜歡
      current_user.liked_products << @product
      render json: { id: params[:id], status: 'liked'}
    end
  end

  def sort
    @product.insert_at(params[:newIndex]+1)
    render json: {id: @product.id}
  end

  private

  def find_product
    @product = Product.find(params[:id])
  end

  def find_user_product
    @product = current_user.products.find(params[:id])
  end
  
end
