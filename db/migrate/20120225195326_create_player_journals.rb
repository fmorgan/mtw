class CreatePlayerJournals < ActiveRecord::Migration
  def change
    create_table :player_journals do |t|
      t.column :player_id , :integer
      t.column :event, :string
      t.timestamps
    end
  end
end
