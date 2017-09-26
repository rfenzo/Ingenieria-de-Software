class Song < ApplicationRecord
    validates :Nombre, uniqueness: {scope: :album_id, message: ': No pueden haber dos
     canciones con el mismo nombre dentro del mismo album'}
    belongs_to :artist
    belongs_to :album
    belongs_to :user

    has_many :playlistsongs
    has_many :playlists, :through => :playlistsongs, dependent: :destroy
end
