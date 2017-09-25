class CreatePlaylistsongs < ActiveRecord::Migration[5.0]
  def change
    create_table :playlistsongs do |t|
      t.integer :playlist_id ,:null => false
      t.integer :song_id ,:null => false

      t.timestamps
    end
  end
end
