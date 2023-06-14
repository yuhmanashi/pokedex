class Api::ItemsController < ApplicationController
    def index
        # @items = Item.all.select { |item| item.exists?(pokemon_id: params[:id]) }
        @items = Item.all.where(pokemon_id: params[:pokemon_id])
        # @items = Item.all.where(pokemon_id: params[:id])
        render :index
    end

    def create
        @item = Item.new(item_params)

        if @item.save
            render :show
        else
            render json: @item.errors.messages, status: :unprocessable_entity
        end
    end

    def update

    end

    def destroy
        @item = Item.find(params[:id])
        
        if @item
            @item.destroy
            render json: params[:id]
        end
    end

    private

    def item_params
        params.require(:item).permit(:happiness, :price, :name)
    end
end
