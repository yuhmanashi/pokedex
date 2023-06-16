class Api::PokemonController < ApplicationController
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

    end


    def update
        
    end
end
