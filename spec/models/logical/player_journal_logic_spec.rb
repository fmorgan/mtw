require 'spec_helper'

describe PlayerJournalLogic do
  it "should write a 'create event' record when a player record is written" do
    h = Hash.new

    h[:full_name] = "Alex Smith"    
    h[:position] = "QB"
    h[:team] = "SF"
    h[:status] = "Not Active"    
    
    lambda{ PlayerLogic.create_player( h ) }.should_not raise_error
    
    c = PlayerJournal.count
    c.should == 1
    pj = PlayerJournal.find :first
    pj.event == :create_player
    d = pj.details
    d['full_name'][0].should == nil
    d['full_name'][1].should == h[:full_name]
  end

  it "should not write an event record when a player record is not written" do
    h = Hash.new
  
    # h[:first_name] = "Alex"    
    # h[:last_name] = "Smith"    
    h[:position] = "QB"
    h[:team] = "SF"
    h[:status] = "Active"
    
    lambda{ PlayerLogic.create_player( h ) }.should raise_error
    
    c = PlayerJournal.count
    c.should == 0
    pj = PlayerJournal.find :first    
    pj.should == nil
  end
  
  it "should write an 'update event' record when a player record is written" do
    h = Hash.new
    active = "Active"
    injured_reserve = "Injured Reserve"
  
    h[:first_name] = "Alex"    
    h[:last_name] = "Smith"    
    h[:position] = "QB"
    h[:team] = "SF"
    h[:status] = active
    
    lambda{ PlayerLogic.create_player( h ) }.should_not raise_error
    
    # snarky: the horror!
    h[:status] = injured_reserve
    
    lambda{ PlayerLogic.update_player( h ) }.should_not raise_error     
    
    c = PlayerJournal.count
    c.should == 2
    pj = PlayerJournal.find :last
    pj.event == :update_player
    d = pj.details
    d['status'][0].should == active
    d['status'][1].should == injured_reserve
  end
end
