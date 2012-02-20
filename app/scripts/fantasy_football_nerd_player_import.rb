# rails r app/scripts/fantasy_football_nerd_slurp.rb 

require 'net/http'

FANTASY_FOOTBALL_NERDS_API_KEY = "2012021862651161"
FANTAY_FOOTBALL_NERDS_PLAYERS_URL = "http://api.fantasyfootballnerd.com/ffnPlayersXML.php?apiKey="

begin  
  
  # to use the api
  u = URI( "#{FANTAY_FOOTBALL_NERDS_PLAYERS_URL}#{FANTASY_FOOTBALL_NERDS_API_KEY}" )
  r = Net::HTTP.get u
  x = Nokogiri::XML( r )
  
  # to read from a file
  # f = File.open( "wip/ffnPlayersXML.xml" )
  # x = Nokogiri::XML( f )

  puts x
  
  ns = x.xpath( "//Results/Player" )  
  ns.each do |n|
    as = n.attributes
    
    p = Player.find_by_full_name as['Name'].text
    
    if p.nil?
      p = Player.new
      
      p.full_name = as['Name'].text
      p.team = as['Team'].text
      p.position = as['Position'].text
      
      p.save!
    else
      # todo: check for changes  
    end
    
  end  
rescue Exception => e
  $stderr.puts "exception: #{e}"
  
  raise
end






