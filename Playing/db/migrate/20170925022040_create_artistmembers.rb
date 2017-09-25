class CreateArtistmembers < ActiveRecord::Migration[5.0]
  def change
    create_table :artistmembers do |t|
      t.integer :artist_id , :null => false
      t.integer :member_id , :null => false

      t.timestamps
    end
  end
end
