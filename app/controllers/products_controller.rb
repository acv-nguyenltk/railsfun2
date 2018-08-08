class ProductsController < ApplicationController
  before_action :get_product, only: [:show, :edit, :update, :destroy]
  def index
    @products = Product.published.includes(:category)
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    return redirect_to product_path, notice: 'Created' if @product.save
      flash[:notice] = 'Not yet'
      render :new
  end
  def edit
    render :new
  end

  def update
    return redirect_to product_path, notice: 'Updated' if @product.update(product_params)
      flash[:notice] = 'Not yet'
      render :new
  end

  def destroy
    msg = @product.destroy ? 'Deleted' : 'Not yet'
    redirect_to products_url, notice: msg
  end

  private def product_params
    params.require(:product).permit( :title,
    :desciption, :level, :category_id, :price, :country, :published)
  end

  private def get_product
    @product = Product.find(params[:id])
  end

end
