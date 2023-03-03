class UsersController < ApplicationController
  before_action :require_no_current_user, only: %i[new create]
  before_action :require_current_user, only: %i[edit update]
  before_action :find_user!, only: %i[edit update]

  def new
    @user = User.new
  end

  def create 
    @user = User.new user_params
    if @user.save
      sign_in @user
      flash[:success] = "Your profile succsessfully registred!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update user_params
      flash[:success] = 'Your profile succsessfully updated!'
      redirect_to edit_user_path(@user)
    else
      render 'edit'
    end
  end

  private

  def find_user!
    @user = User.find params[:id]
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
