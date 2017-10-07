class CreateArtists < ActiveRecord::Migration[5.0]
  def change
    create_table :artists do |t|
      t.string :Nombre
      t.text :Descripcion
      t.string :Genero
      t.string :Origen
      t.date :Actividad
      t.string :Integrantes

      t.timestamps
    end
  end
end
