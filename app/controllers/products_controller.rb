class ProductsController < ApplicationController
  before_action :find_product, only: [ :show, :like]
  before_action :authenticate_user!, except: [ :index , :show ]
  before_action :find_owned_product,only: [ :edit , :update, :destroy ]
  
  
  def index
    @products = Product.includes(:user).order(id: :desc)
  end

  def show
    @comment = Comment.new
    @comments = @product.comments
  end

  def edit
  end

  def destroy
    @product.destroy 
    # @product.update(deleted_at: Time.current)
    redirect_to root_path, alert: '商品已經刪除'
  end

  def update
    if @product.update(product_params)
      redirect_to product_path(@product), notice: '更新成功'
    else
      render :edit
    end
  end

  def new
    @product = Product.new
  end

  def create
    # @product = Product.new(product_params)
    # @product.user = current_user
    @product = current_user.products.new(product_params)
    if @product.save
      redirect_to root_path, notice: "新增商品成功"
    else
      render :new 
      #借用app/view/products/new.html.erb
    end
  end

  def like
    render json: { id: params[:id], status: 'liked'}
  end

  #這個controller專用method
  private#預設public
  # Strong Parameter
  def product_params
    params.require(:product).permit(:title, :description, :price, :onsale, :user_id )
  end

  def find_product
      @product = Product.find(params[:id])
  end
  
  def find_owned_product
    @product = current_user.products.find(params[:id])
  end
end
