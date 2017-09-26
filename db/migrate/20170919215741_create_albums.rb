class CreateAlbums < ActiveRecord::Migration[5.0]
  def change
    create_table :albums do |t|
      t.string :Nombre
      t.date :Fecha
      t.references :artist, foreign_key: true

      t.timestamps
    end
  end
end
