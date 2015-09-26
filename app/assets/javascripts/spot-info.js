function add_handler(spot) {
  spot.on("click", function(){
    $("#spot-info-field").children().last().remove();

    $.ajax({
      type: "GET",
      url:  "http://localhost:3000/spot/" + this.id,
      success: function(spot){
        $("#spot-info-field").append("<h1>'"+spot.name+"'</h1>")
      }
    })
  });
}

$(document).ready(function(){
  $.ajax({
    type: "GET",
    url:  "http://localhost:3000/spots",
    success: function(spots){
      dom_spots = $(".spots");
      $.each(spots, function(index, spot){
        var raw_dom_spot = "<div class='spot' id='"+spot.id+"' data-name='"+spot.name+"'><a class='spot-name'>"+spot.name+"</a></div>"
        dom_spots.append(raw_dom_spot)
        var dom_spot = dom_spots.children().last()
        add_handler(dom_spot)
      })
    }
  })

  add_handler($(".spot"))
});
