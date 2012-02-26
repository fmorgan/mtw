class PlayerJournalLogic

  def self.create_player_event( player_id, details )
    _new_event( player_id, :create_player, details )
  end
  
  def self.update_player_event( player_id, details )
    _new_event( player_id, :update_player, details )  
  end

  def self.delete_player_event( player_id, details )
    raise "not implemented!"
  end
  
  def self._new_event( player_id, event, details )
    pij = PlayerJournal.new
    
    pij.player_id = player_id
    pij.event = event
    pij.details = details    
    
    pij.save!
  end  
end