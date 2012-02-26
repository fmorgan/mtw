class AddLockversionToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :lock_version, :integer, :default=>0    
  end
end
