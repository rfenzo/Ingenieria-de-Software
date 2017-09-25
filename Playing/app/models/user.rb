class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :artists, dependent: :destroy
  has_many :albums, dependent: :destroy
  has_many :songs, dependent: :destroy
  has_many :playlists, dependent: :destroy

  has_attached_file :avatar, styles: { medium: "300x300>", small: "150x150>", thumb: "100x100>" }, default_url: "/assets/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
