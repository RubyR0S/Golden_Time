class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]
  before_action :set_cats
  
  # def search
  #   query = params[:search]

  #   results = Product.where('name LIKE ?', "%#{query}%")
  #   if params[:filter] == 'Select Category'
  #     @products = results
  #   else
  #     # 'Dairy Free' -> 'Dairy_Free' -> 'dairy_free' -> :dairy_free
  #     symbol = params[:filter].gsub(/ /, '_').downcase!.to_sym
  #     # @products = results.where(:dairy_free => true)
  #     @products = results.whegre(symbol => true)
  #   end

  # end

  # def search
  #   @products = Product.where('name LIKE ?', "%#{params[:query]}%")
  #   respond_to do |format|
  #     format.js { render 'search.js.erb' }
  #   end
  # end

  def search
    if params[:search].blank? && params[:price_from].blank? && params[:price_to].blank? && params[:category_id].blank?
      @products = Product.all
    else
      @products = Product.search(params)
    end

    # if params[:filter] == 'Select Category'
    #   @products = results
    # else
    #   # 'Dairy Free' -> 'Dairy_Free' -> 'dairy_free' -> :dairy_free
    #   symbol = params[:filter].gsub(/ /, '_').downcase!.to_sym
    #   # @products = results.where(:dairy_free => true)
    #   @products = results.whegre(symbol => true)
    # end

  end

  # def search
  #   query = params[:query]
  #   where("name LIKE ?", "%#{query}%")
  # end

  # GET /products or /products.json
  def index
    @products = Product.all
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

    def set_cats
      @cats = Category.all.where(dispiay: true)
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :description, :price, :category_id, :mens_watch, :womens_watch, :kids_watch, :mechanic_watch, :electronic_watch, :available)
    end
end
