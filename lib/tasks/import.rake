require 'nokogiri'

desc "Import HTML files into an ActiveRecord tables"
task :import => :environment do
  count  = 0

  region = Region.create!(name: region)

  Dir.glob("db/north_america/*").each do |html_file|
    puts count+=1

    doc = Nokogiri::HTML(File.open(html_file))

    spot_name = doc.css("#wanna-item-2columns-left > h1 > a").text
    country   = doc.css("#wanna-item-2columns-left > h2 > a").text.split(", ")[0]
    zone      = doc.css("#wanna-item-2columns-left > h2 > a").text.split(", ")[1]
    # region    = doc.xpath("//*[@id='wanna-breadcrumbs']/a[3]").text
    # puts "Region        #{region}"
    puts "Spot Name:    #{spot_name}"
    puts "Country:      #{country}"
    puts "Zone:         #{zone}"
    if doc.css("#wanna-item-2columns-left > h2 > a").text.split(", ")[2]
      sub_zone = doc.css("#wanna-item-2columns-left > h2 > a").text.split(", ")[2]
      puts "Sub-Zone:   #{sub_zone}"
    end

    country  = Country.create!(name: country, region_id: region.id)
    zone     = Zone.create!(name: zone, country_id: country.id)
    sub_zone = SubZone.create!(name: sub_zone ||= "No sub zone", zone_id: zone.id)

    puts "-----------------------------"
    spot_quality = doc.xpath("//*[@id='wanna-item-specific-2columns-left']").text.split("\n").last(11).reject!(&:empty?)
     # => ["Wave qualityRegional Classic", "ExperienceExperienced surfers", "FrequencyVery consistent (150 day/year)", "Wave", "TypeBeach-break", "DirectionRight and left", "BottomSandy", "PowerHollow, Fast, Powerful", "Normal lengthNormal (50 to 150m)", "Good day lengthNormal (50 to 150m)"]
    tide_swell_wind = doc.xpath("//*[@id='wanna-item-specific-2columns-right']").text.split("\n").reject!(&:empty?)
     # => ["Tide, Swell and Wind", "Good swell directionNorthWest", "Good wind direction", "Swell sizeStarts working at 1.0m-1.5m / 3ft-5ft and holds up to 3m+ / 10ft+", "Best tide positionMid tide", "Best tide movementRising and falling tides", "More details", "Week crowdFew surfers", "Week-end crowdFew surfers", "Webcam url ", "Dangers", "- Rips / undertow- Sharks"]
    if spot_quality
      wave_quality = spot_quality[0][12..-1]
      puts "Wave-Quality:       #{wave_quality}"
      experience_level   = spot_quality[1][10..-1]
      puts "Experience:         #{experience_level}"
      frequency    = spot_quality[2][9..-1]
      puts "Frequency:          #{frequency}"
      break_type         = spot_quality[4][4..-1]
      puts "Type:               #{break_type}"
      direction    = spot_quality[5][9..-1]
      puts "Direction:          #{direction}"
      sea_floor   = spot_quality[6][6..-1]
      puts "Sea Bottom:         #{sea_floor}"
      power        = spot_quality[7][5..-1]
      puts "Power:              #{power}"
      usual_length = spot_quality[8][13..-1]
      puts "Usual Length:       #{usual_length}"
      epic_length  = spot_quality[9][15..-1]
      puts "Epic Length:        #{epic_length}"

      ideal_swell_direction = tide_swell_wind[1][20..-1]
      puts "Ideal Swell Direction: #{ideal_swell_direction}"
      ideal_wind_direction  = tide_swell_wind[2][19..-1]
      puts "Ideal Wind Direction:  #{ideal_wind_direction}"
      swell_size            = tide_swell_wind[3][10..-1]
      puts "Swell Size:            #{swell_size}"
      ideal_tide            = tide_swell_wind[4][18..-1]
      puts "Ideal Tide:            #{ideal_tide}"
      ideal_tide_movement   = tide_swell_wind[5][18..-1]
      puts "Ideal Tide Movement:   #{ideal_tide_movement}"
      weekday_crowd         = tide_swell_wind[7][10..-1]
      puts "Weeday Crowd:          #{weekday_crowd}"
      weekend_crowd         = tide_swell_wind[8][14..-1]
      puts "Weekend Crowd:         #{weekend_crowd}"
      dangers               = tide_swell_wind[11]
      puts "Dangers:               #{dangers}"
    end


    if doc.xpath("//*[@id='wanna-item-2columns-left']").children[11].text.match(/\Latitude.*/)
      latitude = doc.xpath("//*[@id='wanna-item-2columns-left']").children[11].text.match(/\Latitude..*/)[0].split("Longitude: ").first[9..-1]
      lat_split      = latitude[0..-4].split("°")
      lat_calculated = lat_split[0].to_f+(((lat_split[1].to_f*60))/3600)
      puts "Lat: #{lat_calculated}"

      longitude = doc.xpath("//*[@id='wanna-item-2columns-left']").children[11].text.match(/\Longitude.*/)[0][11..-1]
      lon_split = longitude[0..-4].split("°")
      long_calculated = -(lon_split[0].to_f+(((lon_split[1].to_f*60))/3600))
      puts "Lon: #{long_calculated}"


      puts "Latitude: #{doc.xpath("//*[@id='wanna-item-2columns-left']").children[11].text.match(/\Latitude..*/)[0].split("Longitude: ").first[9..-1]}"
      puts "Longitude: #{doc.xpath("//*[@id='wanna-item-2columns-left']").children[11].text.match(/\Longitude.*/)[0][11..-1]}"
    end

    Spot.create!(name: spot_name, wave_quality: wave_quality, experience_level: experience_level, frequency: frequency, break_type: break_type, direction: direction, sea_floor: sea_floor, power: power, usual_length: usual_length, epic_length: epic_length, ideal_swell_direction: ideal_swell_direction, ideal_wind_direction: ideal_wind_direction, swell_size: swell_size, ideal_tide: ideal_tide, ideal_tide_movement: ideal_tide_movement, weekday_crowd: weekday_crowd, weekend_crowd: weekend_crowd, dangers: dangers, latitude: lat_calculated, longitude: long_calculated, sub_zone_id: sub_zone.id)

    puts "##################################################################"
  end
end
