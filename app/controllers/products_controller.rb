class ProductsController < ApplicationController
before_action :find_product, only: [:edit,:update,:destroy]
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = 'The product have been saved'
      redirect_to products_path
    else
      render :new
    end
  end

  def index
    @products = Product.all
  end

  def update
    if @product.update(product_params)
      flash[:notice] = "Product was successfully updated"
      redirect_to products_path
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    flash[:notice] = "Product was successfully removed"
    redirect_to products_path
  end

  private

  def find_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name,:price,category_ids:[])
  end
end
