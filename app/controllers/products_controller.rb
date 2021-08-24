class ProductsController < ApplicationController
    before_action :set_shop, only: [:new, :create]
    def index
        if params[:query].present?
          @products = Product.where("lower(title)  LIKE ?", "%" + params[:query].downcase + "%")
        else
          @products = Product.all
        end
      end
    
    def show
     @product = Product.find(params[:id])
    end
    
    def new
        @product = Product.new
    end
    
    def create
        @product = Product.new(product_params)
        @product.shop = @shop
        if @product.save
            redirect_to root_path
        else
            render :new
        end
    end

    def edit
      @product = Product.find(params[:id])
    end
  
    def update
      @product = Product.find(params[:id])
      @product.update(product_params)
      redirect_to root_path
    end



    def destroy
      @product = Product.find(params[:id])
       @product.destroy
       redirect_to root_path
    end


    private

    def set_shop
    @shop = Shop.find(params[:shop_id])
    end

    def product_params
        params.require(:product).permit(:title, :description, :price, :amount, :image)
    end
    
end
