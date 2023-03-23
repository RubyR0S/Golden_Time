class ApplicationController < ActionController::Base
  include ApplicationHelper
  # protect_from_forgery with: :exception

  private

  def current_cart
    Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[:cart_id] = cart.id
    cart
  end

  def current_order
    # @current_order ||= Order.find_by_id(session[:order_id]).presence || Order.new
    Order.find(session[:order_id])
  rescue ActiveRecord::RecordNotFound
    order = Order.create
    session[:order_id] = order.id
    order
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id].present?
  end

  def user_signed_in?
    current_user.present?
  end

  def require_current_user
    return if user_signed_in?

    flash[:warning] = 'You are not signed in!'
    redirect_to root_path
  end

  def require_no_current_user
    return if !user_signed_in? 

    flash[:warning] = 'You are already signed in!'
    redirect_to root_path
  end

  def sign_in(user)
    session[:user_id] = user.id
  end

  def sign_out
    session.delete :user_id
  end

  helper_method :current_user, :user_signed_in?, :current_order, :current_cart
end
