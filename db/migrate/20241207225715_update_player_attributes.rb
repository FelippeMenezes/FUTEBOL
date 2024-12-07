class UpdatePlayerAttributes < ActiveRecord::Migration[7.1]
  def change
    rename_column :players, :accuracy, :level
    rename_column :players, :strength, :yellow_card
    rename_column :players, :speed, :red_card
    rename_column :players, :balance, :goal_scored
    remove_column :players, :agility, :integer
  end
end
