class ProductsController < ApplicationController

    def index
        @products = Product.all.order("created_at DESC")
    end

    def new
        @product = Product.new
    end

    def create
        @Product = Product.new(product_params)

        if @Product.save
            redirect_to @Product
        else
            render 'new'
        end
    end

    def show
        @product = Product.find(params[:id])
    end

    private 

    def product_params
        params.require(:product).permit(:title, :price)
    end

end
