json.array! @reviews do |review|
  json.extract! review, :content
end
