class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]
  before_action :set_cats
  # before_action :set_user

  
  # GET /products or /products.json
  def index
    @products = Product.all
    @order_item = current_order.order_items.new

    @products = @products.where(category_id: params[:category_id])                                                   if params[:category_id].present?
    @products = @products.where("name LIKE ? or description LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%") if params[:search].present?
    @products = @products.where("price >= ?", params[:price_from])                                                   if params[:price_from].present?
    @products = @products.where("price <= ?", params[:price_to])                                                     if params[:price_to].present?
    @price_from = params[:price_from]
    @price_to = params[:price_to]
    @search = params[:search]
    @category_id = params[:category_id]
    @products
  end

  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)
    @product.category = Category.find(params[:product][:category_id])

    respond_to do |format|
      if @product.save
        format.html { redirect_to product_url(@product), notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    @product.category = Category.find(params[:product][:category_id])
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to product_url(@product), notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    # def set_user
    #   @user_id = User.find(params[:id])
    # end

    def set_cats
      @cats = Category.all.where(dispiay: true)
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :description, :price, :category_id, :available)
    end
end
