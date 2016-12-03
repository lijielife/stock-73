json.array!(@catalogs) do |catalog|
  json.extract! catalog, :id, :name, :sum, :group, :manufacturer_id, :use_by_date
  json.url catalog_url(catalog, format: :json)
end
