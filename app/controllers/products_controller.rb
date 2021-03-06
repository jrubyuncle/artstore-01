class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  # /products/:id/add_to_cart(.:format)
  def add_to_cart
    @product = Product.find(params[:id])

    if current_cart.items.include?(@product)
      flash[:warning] = "你的購物車內已有此物品"
    else
      current_cart.add_product_to_me(@product)
      flash[:notice] = "你已成功將 #{@product.title} 加入購物車"
    end

    redirect_to :back
  end
end
