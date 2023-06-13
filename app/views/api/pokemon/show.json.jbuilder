# {
#   "imageUrl": "/images/pokemon_snaps/1.svg",
#   "id": 1,
#   "number": 1,
#   "attack": 49,
#   "defense": 49,
#   "name": "Bulbasaur",
#   "type": "grass",
#   "moves": [
#     "tackle",
#     "vine whip"
#   ],
#   "captured": true,
#   "createdAt": "2020-12-16T01:17:24.119Z",
#   "updatedAt": "2020-12-16T01:17:24.119Z"
# }
json.extract! @pokemon, :image_url, :id, :number, :attack, :defense, :name, :poke_type, :moves, :captured, :created_at, :updated_at
# json.extract! @pokemon, :id, :number, :attack, :defense, :name, :poke_type, :captured, :created_at, :updated_at

moves_array = []
    
@pokemon.moves.each do |move|
    moves_array.push(move.name)
end
    
json.moves moves_array