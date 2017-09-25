class CreatePlaylists < ActiveRecord::Migration[5.0]
  def change
    create_table :playlists do |t|
      t.string :Nombre
      t.text :Descripcion
      t.integer :Duracion
      t.integer :Calificacion
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
