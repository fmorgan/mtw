class PlayerLogic
  
  def self.find_player( attributes )
    p = p2 = nil
    
    p = _find_player_by_full_name( attributes )
    p2 = _find_player_by_first_and_last_name( attributes )
    
    raise "more than one player!" if !p.nil? and !p2.nil? and p.id != p2.id
        
    p || p2
  end
  
  def self._generate_full_name( first_name, last_name )
    "#{first_name} #{last_name}"
  end
  
  def self._generate_first_and_last_name( full_name )
    ss = full_name.split
        
    [ss[0], ss[1]]    
  end
  
  def self._find_player_by_full_name( attributes )
    as = attributes
    full_name = nil
    
    unless as[:full_name].nil?
      full_name = as[:full_name]
    else
      full_name = _generate_full_name( as[:first_name], as[:last_name] )
    end

    Player.find_by_full_name as[:full_name]
  end

  def self._find_player_by_first_and_last_name( attributes )
    as = attributes
    first_name = last_name = nil
    
    unless as[:first_name].nil? and as[:last_name].nil?      
      first_name = as[:first_name]
      last_name = as[:last_name]
    else
      ss = _generate_first_and_last_name( as[:full_name] )
      
      first_name = ss[0]
      last_name  = ss[1]
    end

    Player.find_by_first_name_and_last_name first_name, last_name        
  end
  
  # :full_name, :first_name, :last_name, :team, :position, :status
  def self.create_player( attributes )    
    as = attributes        
    p = Player.new

    as.each do |k, v|
      unless v.blank?
        p[k] = v
      end
    end
    
    if p.full_name.nil?
      p.full_name = _generate_full_name( as[:first_name], as[:last_name] )
    end
    
    if p.first_name.nil? and p.last_name.nil?
      ss = _generate_first_and_last_name( as[:full_name] )
      
      p.first_name = ss[0]
      p.last_name = ss[1]
    end
        
    if p.changed?
      changes = p.changes 
      
      p.save!    
      
      PlayerJournalLogic.create_player_event( p.id, changes )      
    end
        
    p.save!    
    
    p
  end
  
  def self.update_player( attributes )
    as = attributes
    p = nil
    
    p = find_player( as )
    raise "player not found! - #{p.to_yaml}" if p.nil?
    
    as.each do |k, v|
      unless v.blank?
        p[k] = v
      end
    end
    
    if p.changed?
      changes = p.changes 
      
      p.save!    
      
      PlayerJournalLogic.update_player_event( p.id, changes )
    end
    
    p
  end
  
  def self.delete_player( attributes )
    raise "not implemented!"
  end
  
  def self.create_or_update_player( attributes )
    as = attributes
    p = nil
    
    puts "c_or_u_player: #{as}"

    p = find_player( as )
    
    if p.nil?
      p = create_player( as )
    else
      p = update_player( as )  
    end
    
    p
  end
end