class CreateFilms < ActiveRecord::Migration[5.2]
  def change
    create_table :films do |t|
      t.string :title
      t.boolean :oscar_nominated
      t.integer :oscar_wins
      t.integer :budget
      t.integer :revenue
      t.date :release_date

      t.timestamps
    end
  end
end
