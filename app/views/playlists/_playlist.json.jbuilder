json.extract! playlist, :id, :Nombre, :Descripcion, :Duracion, :Calificacion, :user_id, :song_id, :created_at, :updated_at
json.url playlist_url(playlist, format: :json)
