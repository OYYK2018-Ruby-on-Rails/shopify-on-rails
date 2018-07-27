class ProductsController < ApplicationController
  before_action :find_variant, only: :send_gift

  def new
    @product = Product.new
    @product.variants.build
  end

  def send_gift
    @variant.send_gift
  end

  def show
    @product = Product.find_by(name: params[:name])
  end

  def index
    @products = Product.all
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else
      flash.now[:error] = @product.errors.full_messages
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :description, variants_attributes: [:id, :stock, :name])
  end

  def find_variant
    @variant = Variant.find(params[:variant_id])
  end
end
