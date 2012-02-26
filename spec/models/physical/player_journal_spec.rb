require 'spec_helper'

describe PlayerJournal do
  
  it "should allow a record to be saved with player_id, event and details" do
    pj = PlayerJournal.new

    pj.player_id = 1
    pj.event = :update_player
    pj.details = { :team => ["SD","SF"] }
    
    lambda{ pj.save! }.should_not raise_error
  end
  
  it "should not allow a record to be saved with a nil player_id" do
    pj = PlayerJournal.new

    # pj.player_id = 1
    pj.event = :update_player
    pj.details = { :team => ["SD","SF"] }
    
    lambda{ pj.save! }.should raise_error
  end
  
  it "should not allow a record to be saved with a nil event" do
    pj = PlayerJournal.new

    pj.player_id = 1
    # pj.event = :update_player
    pj.details = { :team => ["SD","SF"] }
    
    lambda{ pj.save! }.should raise_error
  end
  
  it "should not allow a record to be saved nil details" do
    pj = PlayerJournal.new

    pj.player_id = 1
    pj.event = :update_player
    # pj.details = { :team => ["SD","SF"] }
    
    lambda{ pj.save! }.should raise_error
  end  
end
