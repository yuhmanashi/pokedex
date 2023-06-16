class Api::PokemonController < ApplicationController
    wrap_parameters include: Pokemon.attribute_names + ['imageUrl']
    alias_attribute :type, :poke_type
    
    def types
        render json: Pokemon::TYPES
    end

    def index
        @pokemons = Pokemon.all
        render :index
    end

    def show
        @pokemon = Pokemon.find(params[:id])
        render :show
    end

    def create
        @pokemon = Pokemon.new(pokemon_params)

        if @pokemon.save
            render :show
        else
            render json: @pokemon.errors.messages, status: :unprocessable_entity
        end
    end


    def update
        @pokemon = Pokemon.find(params[:id])
        
        if @pokemon.update(pokemon_params)
            render :show
        else
            render json: @pokemon.errors.messages, status: :unprocessable_entity
        end
    end

    private

    def pokemon_params
        params.require(:pokemon).permit(:id, :number, :name, :attack, :defense, :poke_type, :image_url, :captured)
    end
end
