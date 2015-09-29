$(document).ready(function () {

  $('.spot_experience').on('click', function () {
    $('#accordion').accordion('option', {active: false});

    var currentExperience = this.text;

    $('.spot').each(function (index, spot) {
      $spot = $(spot);
      if ($spot.data('experience') === currentExperience) {
        $spot.show();
      } else {
        $spot.hide();
      }
    });
  });

  $('#spot_filter_name').on('keyup', function () {
    $('#accordion').accordion('option', {active: false});

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
