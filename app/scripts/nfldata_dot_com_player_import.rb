# rails r app/scripts/nfldata_dot_com_player_import.rb 

# require 'faster_csv'
require 'csv'

begin  
    
  # PlayerID,Team,Number,FirstName,LastName,Position,Status,Height,Weight,BirthDate,College,Experience
  
  i = 0
    
  CSV.foreach( "wip/sample_data/Nfldata_player.2011 copy.csv" ) do |row|
    h = nil
    
    if i == 0
      i+=1
      next
    else
      i+=1
    end  
    # todo: make sure the header hasn't changed
    
    h = Hash.new
    
    puts "importing: #{row}..."
    
    h[:team] = row[1]
    h[:first_name] = row[3]
    h[:last_name] = row[4]
    h[:position] = row[5]
    h[:status] = row[6]

    begin
      PlayerLogic.create_or_update_player( h )
    rescue Exception => e
      $stderr.puts "exception with 'create_or_update_player': #{e}"
    end
  end  
rescue Exception => e
  $stderr.puts "exception: #{e}"
  
  raise
end