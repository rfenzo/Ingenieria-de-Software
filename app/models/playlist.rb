class Playlist < ApplicationRecord
  belongs_to :user
  has_many :playlistsongs
  has_many :songs, :through => :playlistsong, dependent: :destroy
end
