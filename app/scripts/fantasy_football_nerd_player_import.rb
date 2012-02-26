# rails r app/scripts/fantasy_football_nerd_player_import.rb 

require 'net/http'

FANTASY_FOOTBALL_NERDS_API_KEY = "2012021862651161"
FANTAY_FOOTBALL_NERDS_PLAYERS_URL = "http://api.fantasyfootballnerd.com/ffnPlayersXML.php?apiKey="

begin  
  
  # to use the api
  # u = URI( "#{FANTAY_FOOTBALL_NERDS_PLAYERS_URL}#{FANTASY_FOOTBALL_NERDS_API_KEY}" )
  # r = Net::HTTP.get u
  # x = Nokogiri::XML( r )
  
  # to read from a file
  f = File.open( "wip/sample_data/ffnPlayersXML.xml" )
  x = Nokogiri::XML( f )

  # puts x
  
  ns = x.xpath( "//Results/Player" )  
  ns.each do |n|
    as = n.attributes
    h = Hash.new
    
    puts "importing: #{as}..."
        
    h[:full_name] = as['Name'].text
    h[:team] = as['Team'].text
    h[:position] = as['Position'].text
        
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






