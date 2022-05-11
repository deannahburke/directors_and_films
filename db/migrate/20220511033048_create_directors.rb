class CreateDirectors < ActiveRecord::Migration[5.2]
  def change
    create_table :directors do |t|
      t.string :name
      t.date :birthdate
      t.string :hometown
      t.boolean :active
      t.integer :imdb_rating

      t.timestamps
    end
  end
end
