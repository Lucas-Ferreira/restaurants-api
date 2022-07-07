json.extract! @restaurant, :id, :name, :address
json.reviews @restaurant.reviews do |review|
  json.extract! review, :id, :content
end
