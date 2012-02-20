require 'spec_helper'

describe Player do
  
  before(:each) do
  end

  it "should allow a record to be saved with full-name, position and team" do
    p = Player.new

    p.full_name = "Alex Smith"    
    p.position = "QB"
    p.team = "SF"
    
    lambda{ p.save! }.should_not raise_error
  end

  it "should not allow a record to be saved with a nil 'full-name'" do
    p = Player.new

    # p.full_name = "Alex Smith"    
    p.position = "QB"
    p.team = "SF"
    
    lambda{ p.save! }.should raise_error
  end

  it "should not allow a record to be saved with a nil 'position'" do
    p = Player.new
    
    p.full_name = "Alex Smith"
    # p.position = "QB"
    p.team = "SF"
    
    lambda{ p.save! }.should raise_error
  end
  
  it "should not allow a record to be saved with a nil 'team'" do
    p = Player.new
    
    p.full_name = "Alex Smith"
    p.position = "QB"
    # p.team = "SF"
    
    lambda{ p.save! }.should raise_error
  end  
end