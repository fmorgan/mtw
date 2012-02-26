class AddDetailsToPlayerJournals < ActiveRecord::Migration
  def change
    add_column :player_journals, :details, :text    
  end
end
