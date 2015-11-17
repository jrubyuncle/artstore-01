class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_cart

  def admin_required
    if !current_user.is_admin?
      redirect_to root_path
    end
  end

  # a cart record, which is associated with the current user
  # return a cart instance
  def current_cart
    @current_cart ||= find_cart
  end

  private

  # find the cart, which is associated with the current user
  # if cart is allocated, session[:cart_id] = cart.id
  def find_cart

    cart = Cart.find_by(id: session[:cart_id])
    unless cart.present?
      cart = Cart.create
      session[:cart_id] = cart.id
    end

    cart
  end
end
