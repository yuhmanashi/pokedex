# [
#   {
#     "id": 1,
#     "happiness": 86,
#     "imageUrl": "/images/pokemon_potion.svg",
#     "name": "Awesome Plastic Pizza",
#     "price": 27,
#     "pokemonId": 1
#   },
# ]
# json.array! @items, :id, :happiness, :image_url, :name, :price, :pokemon_id

# json.array! @items do |item|
#     next if item.pokemon_id != @id
#     json.extract! item, :id, :happiness, :image_url, :name, :price, :pokemon_id
# end

json.array! @items.each do |item|
    json.partial! 'api/items/item', item: item
end