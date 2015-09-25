$(document).ready(function () {

var $spots = $('.spot');

$('#spot_filter_name').on('keyup', function () {
    var currentName = this.value.toLowerCase();
    $spots.each(function (index, spot) {
      $spot = $(spot);
      // console.log($spot.data('name'));
      if ($spot.data('name').toString().toLowerCase().indexOf(currentName) !== -1) {
        $spot.show();
      } else {
        $spot.hide();
      }
    });
  });

});
