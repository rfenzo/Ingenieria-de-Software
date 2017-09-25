json.extract! album, :id, :Nombre, :Fecha, :artist_id, :created_at, :updated_at
json.url album_url(album, format: :json)
