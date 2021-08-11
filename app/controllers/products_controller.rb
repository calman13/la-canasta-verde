class ProductsController < ApplicationController
    def index
     @productos = Product.all
    end
    
    def show
     @product = Product.find(params[:id])
    end
    
    def search
    
    end
end
