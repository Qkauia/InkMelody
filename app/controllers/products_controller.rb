class ProductsController < ApplicationController

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
      #借用app/view/products/new.html.erb
    end
  end


  # Strong Parameter
  def product_params
    params.require(:product).permit(:title, :description, :price)
  end
  
end
