class SessionsController < ApplicationController
  before_action :require_no_current_user, only: %i[new create]
  before_action :require_current_user, only: :destroy

  def new
  end

  def create
    user = User.find_by email: params[:email]
    if user&.authenticate(params[:password])
      sign_in user
      flash[:success] = "Welcome back!"
      redirect_to root_path
    else
      flash[:warning] = "Incorrect email or password!"
      redirect_to :new
    end
  end
  

  def destroy
    sign_out
    flash[:success] = 'See you later!'
    redirect_to root_path
  end
end