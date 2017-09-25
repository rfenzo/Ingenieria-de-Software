class Artist < ApplicationRecord
    validates :Nombre, uniqueness: {message: ': No pueden haber dos
     artistas con el mismo nombre'}
    has_many :albums, dependent: :destroy
    belongs_to :user

    has_many :artistmembers
    has_many :members, :through => :artistmembers, dependent: :destroy
    has_many :artists, :through => :artistmembers, dependent: :destroy
end
