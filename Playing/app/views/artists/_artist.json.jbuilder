json.extract! artist, :id, :Nombre, :Descripcion, :Genero, :Origen, :Actividad, :Integrantes, :created_at, :updated_at
json.url artist_url(artist, format: :json)
