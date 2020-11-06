puts "Destroying everything..."
Cocktail.destroy_all
Ingredient.destroy_all

puts "Creating ingredients from the remote URL..."

response = RestClient.get('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list')
json = JSON.parse(response, symbolize_names: true)

# {
#   drinks: [
#   {
#     strIngredient1: "Light rum"
#   },
json[:drinks].each do |drink|
  name = drink[:strIngredient1]

  puts "+ #{name}"

  Ingredient.create!(name: name)
end

puts "Done"
