require 'nokogiri'
require 'pry'

desc "Import HTML files into an ActiveRecord tables"
task :import => :environment do

  Dir.glob("/Users/Dmitry/turing3/nokiparse/north_america/*").last(5).each do |html_file|

    doc = Nokogiri::HTML(File.open(html_file))

    puts "Spot Name:  #{doc.css("#wanna-item-2columns-left > h1 > a").text}"
    puts "Country:    #{doc.css("#wanna-item-2columns-left > h2 > a").text.split(", ")[0]}"
    puts "Region:     #{doc.css("#wanna-item-2columns-left > h2 > a").text.split(", ")[1]}"
    puts "Sub-Region: #{doc.css("#wanna-item-2columns-left > h2 > a").text.split(", ")[2]}"

    # puts "Experience: #{doc.xpath("//*[@id='wanna-item-specific-2columns-left']/p[2]/text()").text}"
    # puts "Frequency:  #{doc.xpath("//*[@id='wanna-item-specific-2columns-left']/p[3]/text()").text}"

    spot_quality = doc.xpath("//*[@id='wanna-item-specific-2columns-left']").text.split("\n").last(11).reject!(&:empty?)
     # => ["Wave qualityRegional Classic", "ExperienceExperienced surfers", "FrequencyVery consistent (150 day/year)", "Wave", "TypeBeach-break", "DirectionRight and left", "BottomSandy", "PowerHollow, Fast, Powerful", "Normal lengthNormal (50 to 150m)", "Good day lengthNormal (50 to 150m)"]
    puts "Wave-Quality: #{spot_quality[0][12..-1]}"
    puts "Experience:   #{spot_quality[1][10..-1]}"
    puts "Frequency:    #{spot_quality[2][9..-1]}"
    puts "Type:         #{spot_quality[4][4..-1]}"
    puts "Direction:    #{spot_quality[5][9..-1]}"
    puts "Bottom:       #{spot_quality[6][6..-1]}"
    puts "Power:        #{spot_quality[7][5..-1]}"
    puts "Usual Length: #{spot_quality[8][13..-1]}"
    puts "Epic Length:  #{spot_quality[9][15..-1]}"



    if doc.xpath("//*[@id='wanna-item-2columns-left']").children[11].text.match(/\Latitude.*/)
      puts "Latitude: #{doc.xpath("//*[@id='wanna-item-2columns-left']").children[11].text.match(/\Latitude..*/)[0].split("Longitude: ").first[9..-1]}"
      puts "Longitude: #{doc.xpath("//*[@id='wanna-item-2columns-left']").children[11].text.match(/\Longitude.*/)[0][11..-1]}"
    else
      puts html_file + " has missing data"
    end
    puts "##################################################################"
  end
end
