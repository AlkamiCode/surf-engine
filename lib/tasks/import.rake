require 'nokogiri'
require 'pry'

desc "Import HTML files into an ActiveRecord tables"
task :import => :environment do
  @count = 0
  Dir.glob("/Users/Dmitry/turing3/nokiparse/north_america/*").sample(5).each do |html_file|

    doc = Nokogiri::HTML(File.open(html_file))
    puts @count+=1
    # puts "Region:       #{doc.css("#wanna-item-2columns-left > h2 > a").text.split(", ")[1]}"
    puts "Spot Name:    #{doc.css("#wanna-item-2columns-left > h1 > a").text}"
    puts "Country:      #{doc.css("#wanna-item-2columns-left > h2 > a").text.split(", ")[0]}"
    puts "Zone:         #{doc.css("#wanna-item-2columns-left > h2 > a").text.split(", ")[1]}"
    if doc.css("#wanna-item-2columns-left > h2 > a").text.split(", ")[2]
      puts "Sub-Zone:   #{doc.css("#wanna-item-2columns-left > h2 > a").text.split(", ")[2]}"
    end

    puts "-----------------------------"
    spot_quality = doc.xpath("//*[@id='wanna-item-specific-2columns-left']").text.split("\n").last(11).reject!(&:empty?)
     # => ["Wave qualityRegional Classic", "ExperienceExperienced surfers", "FrequencyVery consistent (150 day/year)", "Wave", "TypeBeach-break", "DirectionRight and left", "BottomSandy", "PowerHollow, Fast, Powerful", "Normal lengthNormal (50 to 150m)", "Good day lengthNormal (50 to 150m)"]
    tide_swell_wind = doc.xpath("//*[@id='wanna-item-specific-2columns-right']").text.split("\n").reject!(&:empty?)
     # => ["Tide, Swell and Wind", "Good swell directionNorthWest", "Good wind direction", "Swell sizeStarts working at 1.0m-1.5m / 3ft-5ft and holds up to 3m+ / 10ft+", "Best tide positionMid tide", "Best tide movementRising and falling tides", "More details", "Week crowdFew surfers", "Week-end crowdFew surfers", "Webcam url ", "Dangers", "- Rips / undertow- Sharks"]
    if spot_quality
      puts "Wave-Quality: #{spot_quality[0][12..-1]}"
      puts "Experience:   #{spot_quality[1][10..-1]}"
      puts "Frequency:    #{spot_quality[2][9..-1]}"
      puts "Type:         #{spot_quality[4][4..-1]}"
      puts "Direction:    #{spot_quality[5][9..-1]}"
      puts "Bottom:       #{spot_quality[6][6..-1]}"
      puts "Power:        #{spot_quality[7][5..-1]}"
      puts "Usual Length: #{spot_quality[8][13..-1]}"
      puts "Epic Length:  #{spot_quality[9][15..-1]}"

      puts "Ideal Swell Direction: #{tide_swell_wind[1][20..-1]}"
      puts "Ideal Wind Direction:  #{tide_swell_wind[2][19..-1]}"
      puts "Swell Size:            #{tide_swell_wind[3][10..-1]}"
      puts "Ideal Tide:            #{tide_swell_wind[4][18..-1]}"
      puts "Ideal Tide Movement:   #{tide_swell_wind[5][18..-1]}"
      puts "Weeday Crowd:          #{tide_swell_wind[7][10..-1]}"
      puts "Weekend Crowd:         #{tide_swell_wind[8][14..-1]}"
      puts "Dangers:               #{tide_swell_wind[11]}"
    end


    if doc.xpath("//*[@id='wanna-item-2columns-left']").children[11].text.match(/\Latitude.*/)
      latitude = doc.xpath("//*[@id='wanna-item-2columns-left']").children[11].text.match(/\Latitude..*/)[0].split("Longitude: ").first[9..-1]
      lat_split = latitude[0..-4].split("°")
      puts "Lat: #{lat_split[0].to_f+(((lat_split[1].to_f*60))/3600)}"

      longitude = doc.xpath("//*[@id='wanna-item-2columns-left']").children[11].text.match(/\Longitude.*/)[0][11..-1]
      lon_split = longitude[0..-4].split("°")
      puts "Lon: #{-(lon_split[0].to_f+(((lon_split[1].to_f*60))/3600))}"


      puts "Latitude: #{doc.xpath("//*[@id='wanna-item-2columns-left']").children[11].text.match(/\Latitude..*/)[0].split("Longitude: ").first[9..-1]}"
      puts "Longitude: #{doc.xpath("//*[@id='wanna-item-2columns-left']").children[11].text.match(/\Longitude.*/)[0][11..-1]}"
    else
      puts html_file + " has missing data"
    end
    puts "##################################################################"
  end
end
