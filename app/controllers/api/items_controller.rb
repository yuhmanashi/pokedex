class Api::ItemsController < ApplicationController
    def index
        # @items = Item.all.select { |item| item.exists?(pokemon_id: params[:id]) }
        @items = Item.all.where(pokemon_id: params[:pokemon_id])
        # @items = Item.all.where(pokemon_id: params[:id])
        render :index
    end

    def create

    end

    def update

    end

    def destroy

    end
end
