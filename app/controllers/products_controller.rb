class ProductsController < ApplicationController
  before_action :find_variant, only: :send_gift
  before_action :authenticate_user!
  # http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

  def new
    @product = Product.new
    @product.variants.build
    system("/bin/echo","*****HELLO FROM RUBY ON RAILS*********;")
  end

  def send_gift
    @variant.send_gift(params[:email])
  end

  def show
    @product = Product.where("name = '#{params[:name]}'")
  end

  def index
    @products = Product.all
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else
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
