class PlayerJournal < ActiveRecord::Base
  serialize :details, Hash
  
  validates :event, :player_id, :details, :presence => true
end
