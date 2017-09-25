class CreateSongs < ActiveRecord::Migration[5.0]
  def change
    create_table :songs do |t|
      t.string :Nombre
      t.integer :Duracion
      t.references :artist, foreign_key: true
      t.references :album, foreign_key: true

      t.timestamps
    end
  end
end
