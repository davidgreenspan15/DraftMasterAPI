class AddRowsToPlayers < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :tier, :string
    add_column :players, :rank, :integer
    add_column :players, :adp, :float
  end
end
