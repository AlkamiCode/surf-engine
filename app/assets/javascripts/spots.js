$(document).ready(function () {

$('#spot_filter_name').on('keyup', function () {
    var currentName = this.value.toLowerCase();

    $('.spot').each(function (index, spot) {
      $spot = $(spot);
      if ($spot.data('name').toString().toLowerCase().indexOf(currentName) !== -1) {
        $spot.show();
      } else {
        $spot.hide();
      }
    });
  });

});
