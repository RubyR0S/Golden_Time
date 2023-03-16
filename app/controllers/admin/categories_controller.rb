module Admin  
  class CategoriesController < ApplicationController
    before_action :set_category, only: %i[ show edit update destroy ]

    def index
      @categories = Category.all
    end

    def new
      @category = Category.new
    end

    def create 
      @category = Category.new category_params
      if @category.save
        flash[:success] = 'Products Category succsessfully created!'
        redirect_to admin_categories_path
      else
        render :new
      end
    end

    def edit
    end

    def update
      if @category.update category_params
        flash[:success] = 'Products Category succsessfully updated!'
        redirect_to admin_categories_path
      else
        render :edit
      end
    end

    def destroy
      @category.destroy
      flash[:success] = 'Products Category succsessfully deleted!'
      redirect_to admin_categories_path
    end

    private

      def set_category
        @category = Category.find(params[:id])
      end

      def category_params
        params.require(:category).permit(:category_name, :display)
      end
  end
end
