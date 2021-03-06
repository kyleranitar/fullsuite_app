class ProductsController < ApplicationController
  before_action :assign_product, only: %i[show edit update destroy]

  def index
    @products = Product.all
  end

  def show; end

  def edit; end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      flash.notice = "Successfully created a product."

      redirect_to product_path(@product)
    else
      render :new
    end
  end

  def update
    if @product.update(product_params)
      flash.notice = 'Successfully updated product.'

      redirect_to product_path(@product)
    else
      render :edit
    end
  end

  def destroy
    @product.destroy!

    flash.notice = 'Deleted product.'
    redirect_to products_path
  end


private

  def assign_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :sku, :price, :cost_of_goods)
  end
end
