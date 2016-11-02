json.array! @items do |item|
  json.name item.name
  json.description item.description
  json.image_url item.image_url
end
