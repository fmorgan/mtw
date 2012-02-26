class Player < ActiveRecord::Base
  validate :minimum_presence
  
  def minimum_presence
    unless full_name.blank?
      if position.blank?
        errors.add( :position, "position can't be blank" )
      end
      if team.blank?
        errors.add( :team, "team can't be blank" )
      end
      
      return
    end
    
    unless first_name.blank? && last_name.blank?
      if position.blank?
        errors.add( :position, "position can't be blank" )
      end
      if team.blank?
        errors.add( :team, "team can't be blank" )
      end
      
      return
    end
    
    errors.add( :full_name, "need a full name" )    
    errors.add( :first_name, "need a first name" )    
    errors.add( :first_name, "need a last name" )    
  end
end
