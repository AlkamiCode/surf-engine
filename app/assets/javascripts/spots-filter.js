$(document).ready(function () {

  $('.spot_experience').on('click', function () {
    $('#accordion').accordion('option', {active: false});

    var currentExperience = this.text;

    $('.spot').each(function (index, spot) {
      $spot = $(spot);
      $spot.toggle($spot.data('experience') === currentExperience);
    });
  });

  $('#spot_filter_name').on('keyup', function () {
    clearMarkers();
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

  $('#search-hand').effect("bounce", { times:10 }, 6000);
});
