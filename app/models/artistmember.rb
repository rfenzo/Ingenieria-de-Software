class Artistmember < ApplicationRecord
    belongs_to :artist
    belongs_to :member,:class_name => "Artist"
end
