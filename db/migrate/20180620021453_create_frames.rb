class CreateFrames < ActiveRecord::Migration[5.2]
  def change
    create_table :frames do |t|
      t.integer :first
      t.integer :second
      t.integer :third
      t.integer :score
      t.references :game, foreign_key: true

      t.timestamps
    end
  end
end
