// function initMap() {

//   var customMapType = new google.maps.StyledMapType([
//       {
//         stylers: [
//           {hue: '#70BBB5'},
//           {visibility: 'simplified'},
//           {gamma: 0.3},
//           {weight: 0.6}
//         ]
//       },
//       {
//         elementType: 'labels',
//         stylers: [{visibility: 'off'}]
//       },
//       {
//         // featureType: 'water',
//         featureType: "administrative",
//         stylers: [{color: '#70BBB5'}]
//       }
//     ], {
//       name: 'Custom Style'
//   });
//   var customMapTypeId = 'custom_style';

//   var minZoomLevel = 2;
//   var map = new google.maps.Map(document.getElementById('map'), {
//     center: {lat: 0, lng: 0},
//     zoom: minZoomLevel,
//     mapTypeControl: false
//   });

//   // Limit the zoom level
//   google.maps.event.addListener(map, 'zoom_changed', function() {
//      if (map.getZoom() < minZoomLevel) map.setZoom(minZoomLevel);
//    });



//   map.mapTypes.set(customMapTypeId, customMapType);
//   map.setMapTypeId(customMapTypeId);
// }
