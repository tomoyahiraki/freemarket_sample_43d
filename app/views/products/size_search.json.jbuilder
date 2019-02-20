json.array! @sizes do |size|
  json.id    size.id
  json.name  size.name
  json.category_size_id  size.category_size_id
end