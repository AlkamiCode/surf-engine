$(document).ready(function(){
  $.ajax({
    type: "GET",
    url:  "http://localhost:3000/spots.json",
    success: function(spots){
      // console.table(spots)
      $.each(spots, function(index, spot){
        $(".spots").append(
          "<div class='spot' data-name='"+spot.name+"'><a class='spot-name'>"+spot.name+"</a></div>"
        )
      })
    }
  })

  $(".spot").on("click", function(){
    var spotName = $(this).data('name')

    $('.spot').each(function(index, spot) {
      if(spot.data('name').toString() === spotName){
        // spot = $spot
        $("#spot-info-field").append("<div `class='spot-info'>"+$spot.data('id')+"</div>");
      };
    });
    // $(".spot-info").show();
  });
});
