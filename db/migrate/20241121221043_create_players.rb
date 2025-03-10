class CreatePlayers < ActiveRecord::Migration[7.1]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :accuracy
      t.integer :strength
      t.integer :speed
      t.integer :balance
      t.integer :agility
      t.integer :price
      t.string :position
      t.references :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
