function add_handler(spot) {
  spot.on("click", function(){
    console.log(spot.data('lat'))
    console.log(spot.data('lon'))
    position = {lat: spot.data('lat'), lng: spot.data('lon')}
    clearMarkers();
    addMarkerWithTimeout(position, 500)
  });
}

var neighborhoods = [
];

var markers = [];
var map;

function initMap() {
  var minZoomLevel = 2;
  map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: 0, lng: 0},
    zoom: minZoomLevel,
    mapTypeControl: false
  });
}

// function drop() {
//   clearMarkers();
//   for (var i = 0; i < neighborhoods.length; i++) {
//     addMarkerWithTimeout(neighborhoods[i], i * 200);
//   }
// }

function addMarkerWithTimeout(position, timeout) {
  window.setTimeout(function() {
    markers.push(new google.maps.Marker({
      position: position,
      map: map,
      animation: google.maps.Animation.DROP
    }));
  }, timeout);
}

function clearMarkers() {
  for (var i = 0; i < markers.length; i++) {
    markers[i].setMap(null);
  }
  markers = [];
}


$(document).ready(function(){
  // $('#accordion').append("<h3><a href='#'>NEW TAB</a></h3><div><p>Check Out This Data</p></div>");
  $.ajax({
    type: "GET",
    url:  "http://localhost:3000/spots",
    // url:  "https://surfiesta.herokuapp.com/spots",
    success: function(spots){
      dom_spots = $(".spots");
      $.each(spots, function(index, spot){
        // var raw_dom_spot = "<h3><a href='#'>NEW TAB</a></h3><div><p>Check Out This Data</p></div>"
        // var raw_dom_spot = "<h3 class='spot' data-name='"+spot.name+"'>"+spot.name+"</h3><div class='spot' id='"+spot.id+"' data-name='"+spot.name+"'><p>Check Out This Data</p></div>"
        var raw_dom_spot = "<h6 class='spot' data-lat="+spot.latitude+" data-lon="+spot.longitude+" data-name='"+spot.name+"'>"+spot.name+"</h6><div><table class='table table-condensed'><tr><td>Wave Quality</td><td>"+spot.wave_quality+"</td></tr><tr><td>Experience Level</td><td>"+spot.experience_level+"</td></tr><tr><td>Frequency</td><td>"+spot.frequency+"</td></tr><tr><td>Break Type</td><td>"+spot.break_type+"</td></tr><tr><td>Direction</td><td>"+spot.direction+"</td></tr><tr><td>Sea Floor</td><td>"+spot.sea_floor+"</td></tr><tr><td>Power</td><td>"+spot.power+"</td></tr><tr><td>Usual Length</td><td>"+spot.usual_length+"</td></tr><tr><td>Epic Length</td><td>"+spot.epic_length+"</td></tr><tr><td>Ideal Swell Direction</td><td>"+spot.ideal_swell_direction+"</td></tr><tr><td>Ideal Wind Direction</td><td>"+spot.ideal_wind_direction+"</td></tr><tr><td>Swell Size</td><td>"+spot.swell_size+"</td></tr><tr><td>Ideal Tide</td><td>"+spot.ideal_tide+"</td></tr><tr><td>Ideal Tide Movement</td><td>"+spot.ideal_tide_movement+"</td></tr><tr><td>Weekday Crowd</td><td>"+spot.weekday_crowd+"</td></tr><tr><td>WeekEnd Crowd</td><td>"+spot.weekend_crowd+"</td></tr><tr><td>Dangers</td><td>"+spot.dangers+"</td></tr><tr><td>Sub Zone</td><td>"+spot.sub_zone+"</td></tr></table></div>"
        dom_spots.append(raw_dom_spot)
        var dom_spot = dom_spots.children().last().prev()
        add_handler(dom_spot)
      })
      dom_spots.accordion("refresh");
    }
  })
  // add_handler($(".spot"))
});
