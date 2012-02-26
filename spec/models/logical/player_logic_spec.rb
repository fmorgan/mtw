require 'spec_helper'

describe PlayerLogic do
  
  it "should allow a record to be saved with full-name, position and team" do
    h = Hash.new

    h[:full_name] = "Alex Smith"    
    h[:position] = "QB"
    h[:team] = "SF"
    
    lambda{ PlayerLogic.create_player( h ) }.should_not raise_error
  end

  it "should allow a record to be saved with first name, last name, position and team" do
    h = Hash.new

    h[:first_name] = "Alex"    
    h[:last_name] = "Smith"    
    h[:position] = "QB"
    h[:team] = "SF"
    
    lambda{ PlayerLogic.create_player( h ) }.should_not raise_error
  end

  it "should allow a record to be saved with a new attribute" do
    h = Hash.new

    h[:first_name] = "Alex"    
    h[:last_name] = "Smith"    
    h[:position] = "QB"
    h[:team] = "SF"
    
    lambda{ PlayerLogic.create_player( h ) }.should_not raise_error
    
    # snarky: the raiders could only wish!
    h[:team] = "OAK"
    
    lambda{ PlayerLogic.update_player( h ) }.should_not raise_error     
  end

  it "should succeed after a record is saved with first and last name" do
    h = Hash.new

    h[:first_name] = "Alex"    
    h[:last_name] = "Smith"    
    h[:position] = "QB"
    h[:team] = "SF"
    
    lambda{ PlayerLogic.create_player( h ) }.should_not raise_error

    h = Hash.new
    
    h[:full_name] = "Alex Smith"    
    h[:position] = "QB"
    h[:team] = "SF"
    
    p = PlayerLogic.find_player( h )
    p.should_not == nil
  end
  
  it "should succeed after a record is saved with full name" do
    h = Hash.new

    h[:full_name] = "Alex Smith"    
    h[:position] = "QB"
    h[:team] = "SF"
    
    lambda{ PlayerLogic.create_player( h ) }.should_not raise_error

    h = Hash.new
    
    h[:first_name] = "Alex"    
    h[:last_name] = "Smith"    
    h[:position] = "QB"
    h[:team] = "SF"
    
    p = PlayerLogic.find_player( h )
    p.should_not == nil
  end  
end
