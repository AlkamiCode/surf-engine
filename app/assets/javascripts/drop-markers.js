var image = 'assets/24-px-surf-icon.png';

function add_handler(spot) {
  spot.on("click", function(){
    // console.log(spot.data('lat'))
    // console.log(spot.data('lon'))
    position = {lat: spot.data('lat'), lng: spot.data('lon')}
    clearMarkers();
    addMarkerWithTimeout(position, 1000)
  });
}

function addMarkerWithTimeout(position, timeout) {
  window.setTimeout(function() {
    markers.push(new google.maps.Marker({
      position:  position,
      map:       map,
      animation: google.maps.Animation.DROP,
      icon:      image,
      // animation: google.maps.Animation.BOUNCE
    }));
  }, timeout);
}

function clearMarkers() {
  for (var i = 0; i < markers.length; i++) {
    markers[i].setMap(null);
  }
  markers = [];
}
