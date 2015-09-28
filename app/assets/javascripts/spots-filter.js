$(document).ready(function () {

  $('.spot_experience').on('click', function () {
    var currentExperience = this.text;

    $('.spot').each(function (index, spot) {
      $spot = $(spot);
      if ($spot.data('experience') === currentExperience) {
        $spot.show();
        $spot.nextAll().show();
      } else {
        $spot.hide();
        $spot.nextAll().hide();
      }
    });
  });

  $('#spot_filter_name').on('keyup', function () {
    var currentName = this.value.toLowerCase();

    $('.spot').each(function (index, spot) {
      $spot = $(spot);
      if ($spot.data('name').toString().toLowerCase().indexOf(currentName) !== -1) {
        $spot.show();
        $spot.nextAll().show();
      } else {
        $spot.hide();
        $spot.nextAll().hide();
      }
    });
  });

});
