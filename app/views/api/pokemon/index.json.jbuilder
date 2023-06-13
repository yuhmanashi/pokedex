# json.array! @pokemons, :id, :number, :name, :captured

unknown = '/images/unknown.png'

json.array! @pokemons do |pokemon|
    json.id pokemon.id
    json.number pokemon.number
    json.name pokemon.name
    json.captured pokemon.captured
    # json.set! pokemon.id do
    #     json.extract! pokemon, :id, :number, :name, :captured
    # end

    if pokemon.captured?
        json.imageUrl pokemon.image_url
    else
        json.imageUrl unknown
    end
end

# @pokemons.each do |pokemon|
#     if !pokemon.captured
#         json.imageUrl unknown
#     end
# end