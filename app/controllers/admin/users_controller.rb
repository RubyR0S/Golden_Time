module Admin
  class UsersController < ApplicationController
    before_action :set_user!, only: %i[edit update destroy]
    before_action :user_admin?

    def index
      @users = User.order(created_at: :desc)
    end

    def new
      @user = User.new
    end

    def create 
      @user = User.new user_params
      if @user.save
        flash[:success] = 'User succsessfully created!'
        redirect_to admin_users_path
      else
        render :new
      end
    end

    def edit
    end

    def update
      if @user.update user_params
        flash[:success] = 'User succsessfully updated!'
        redirect_to admin_users_path
      else
        render :edit
      end
    end

    def destroy
      @user.destroy
      flash[:success] = 'User succsessfully deleted!'
      redirect_to admin_users_path
    end

    private

    def set_user!
      @user = User.find params[:id]
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :address, :phone_number, :email, :password, :password_confirmation, :role)
    end
  end
end
