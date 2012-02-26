class AddLockversionToPlayerJournals < ActiveRecord::Migration
  def change
    add_column :player_journals, :lock_version, :integer, :default=>0    
  end
end
