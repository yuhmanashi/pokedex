class Api::ItemsController < ApplicationController
    wrap_parameters include: Item.attribute_names + ['imageUrl', 'pokemonId']

    def index
        # @items = Item.all.select { |item| item.exists?(pokemon_id: params[:id]) }
        @items = Item.all.where(pokemon_id: params[:pokemon_id])
        # @items = Item.all.where(pokemon_id: params[:id])
        render :index
    end

    def create
        @item = Item.new(item_params)
        @item.image_url ||= %w(pokemon_berry.svg pokemon_egg.svg pokemon_potion.svg pokemon_super_potion.svg).sample

        if @item.save
            render :show
        else
            render json: @item.errors.messages, status: :unprocessable_entity
        end
    end

    def update
        @item = Item.find(params[:id])

        if @item.update(item_params)
            render :show
        else
            render json: @item.errors.messages, status: :unprocessable_entity
        end
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
        params.require(:item).permit(:id, :happiness, :image_url, :name, :price, :pokemon_id)
    end
end
