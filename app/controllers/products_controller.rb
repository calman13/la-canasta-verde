class ProductsController < ApplicationController
    def index
     @products = Product.all
    end
    
    def show
     #@product = Product.new   
     @product = Product.find(params[:id])
     #@product = Product.new(shop: @shop)
    end
    
    def search
    
    end
end
