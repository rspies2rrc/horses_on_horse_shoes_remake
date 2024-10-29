class CreateHorses < ActiveRecord::Migration[7.2]
  def change
    create_table :horses do |t|
      t.string :name
      t.integer :age
      t.float :top_speed
      t.references :breed, null: false, foreign_key: true
      t.integer :number_of_legs

      t.timestamps
    end
  end
end
