json.array!(@catalogs) do |catalog|
  json.extract! catalog, :id, :name, :sum
  json.url catalog_url(catalog, format: :json)
end
