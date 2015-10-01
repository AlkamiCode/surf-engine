$(document).ready(function(){
  $(".region").on("click", function(){
    // var currentRegion = this.text;
    $('#search-hand').slideUp('fast');

    function spotElements (spot){
      return "<h3 class='spot' data-experience="+spot.experience_level+" data-lat="+spot.latitude+" data-lon="+spot.longitude+" data-name='"+spot.name+"'>"+spot.name+"<span class='glyphicon glyphicon-heart-empty' aria-hidden='true'></h3></span><div><table class='table table-condensed'><tr><td>Wave Quality</td><td>"+spot.wave_quality+"</td></tr><tr><td>Experience Level</td><td>"+spot.experience_level+"</td></tr><tr><td>Frequency</td><td>"+spot.frequency+"</td></tr><tr><td>Break Type</td><td>"+spot.break_type+"</td></tr><tr><td>Direction</td><td>"+spot.direction+"</td></tr><tr><td>Sea Floor</td><td>"+spot.sea_floor+"</td></tr><tr><td>Power</td><td>"+spot.power+"</td></tr><tr><td>Usual Length</td><td>"+spot.usual_length+"</td></tr><tr><td>Epic Length</td><td>"+spot.epic_length+"</td></tr><tr><td>Ideal Swell Direction</td><td>"+spot.ideal_swell_direction+"</td></tr><tr><td>Ideal Wind Direction</td><td>"+spot.ideal_wind_direction+"</td></tr><tr><td>Swell Size</td><td>"+spot.swell_size+"</td></tr><tr><td>Ideal Tide</td><td>"+spot.ideal_tide+"</td></tr><tr><td>Ideal Tide Movement</td><td>"+spot.ideal_tide_movement+"</td></tr><tr><td>Weekday Crowd</td><td>"+spot.weekday_crowd+"</td></tr><tr><td>WeekEnd Crowd</td><td>"+spot.weekend_crowd+"</td></tr><tr><td>Dangers</td><td>"+spot.dangers+"</td></tr></table></div>"
    }

    $.ajax({
      type: "GET",
      url:  "/spots/first",
      success: function(spots){
        dom_spots = $(".spots");
        console.log("Fetched all spots!")
        spots.forEach(function(spot){
          var raw_dom_spot = spotElements(spot)
          dom_spots.append(raw_dom_spot)
          var dom_spot = dom_spots.children().last().prev()
          add_handler(dom_spot)
          add_like_handler(dom_spot)
        })
        dom_spots.accordion("refresh");
      }
    })

    $.ajax({
      type: "GET",
      url:  "/spots/last",
      success: function(spots){
        dom_spots = $(".spots");
        console.log("Fetched all spots!")
        spots.forEach(function(spot){
          var raw_dom_spot = spotElements(spot)
          dom_spots.append(raw_dom_spot)
          var dom_spot = dom_spots.children().last().prev()
          add_handler(dom_spot)
          add_like_handler(dom_spot)
        })
        dom_spots.accordion("refresh");
      }
    })
  })
});
