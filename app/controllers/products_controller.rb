class ProductsController < ApplicationController
  def index
    @products = Product.published.includes(:category)
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    product_params = params.require(:product).permit( :title,
      :desciption, :level, :category_id, :price, :country, :published)
      @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "You have sucessfully created the product"
      redirect_to products_url
    else
      flash[:notice] = "There is an error of the product"
      render :new
    end

  end

end
