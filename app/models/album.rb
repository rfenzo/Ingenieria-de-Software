class Album < ApplicationRecord
    validates :Nombre, uniqueness: {scope: :artist_id, message: ': No pueden haber dos
     albumes con el mismo nombre pertenecientes al mismo artista'}
    belongs_to :artist
    belongs_to :user
    has_many :songs, dependent: :destroy

    has_attached_file :image, styles: { medium: "300x300>", small: "200x200>",thumb: "100x100>" }, default_url: "/assets/missing.png"
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
