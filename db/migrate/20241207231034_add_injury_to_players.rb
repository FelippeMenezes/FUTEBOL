class AddInjuryToPlayers < ActiveRecord::Migration[7.1]
  def change
    add_column :players, :injury, :boolean, default: false
  end
end
