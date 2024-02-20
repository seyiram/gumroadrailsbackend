class ProductsController < ApplicationController
    before_action :set_product, only: [:show, :update, :destroy]
    before_action :authorized

    # GET /products
    def index
      @products = logged_in_user.products
      render json: @products
    end

    # GET /products/1
    def show
        @product = logged_in_user.products.find_by(user_product_number: params[:id])
        if @product
        render json: @product
        else
        render json: { error: "Product not found" }, status: :not_found
      end
    end

    # POST /products
    def create
      @product = logged_in_user.products.new(product_params)
      @product.user_product_number = logged_in_user.products.maximum(:user_product_number).to_i + 1

      if @product.save
        render json: @product, status: :created, location: @product
      else
        render json: { errors: @product.errors.full_messages}, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /products/1
    def update
      if @product.update(product_params)
        render json: @product
      else
        render json: @product.errors, status: :unprocessable_entity
      end
    end

    # DELETE /products/1
    def destroy
     if @product.destroy
      head :no_content
     else
      render json: { error: "Product could not be deleted" }, status: :unprocessable_entity
     end
    end

    private
      def set_product
        @product = logged_in_user.products.find_by(user_product_number: params[:id])
      end

      def product_params
        params.require(:product).permit(:name, :description, :url, :custom_domain, :cover_image, :thumbnail_image, :type, :call_to_action, :price, :currency)
      end

      def generate_url_product_url(input)
        base_url = logged_in_user.url
        "#{base_url}#{user_input}"
      end
end
