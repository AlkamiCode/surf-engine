function add_handler(spot) {
  spot.on("click", function(){
    $("#spot-info-field").children().last().remove();
    $.ajax({
      type: "GET",
      url:  "http://localhost:3000/spot/" + this.id,
      // url:  "https://surfiesta.herokuapp.com/spot/" this.id,
      success: function(spot){
        $("#spot-info-field").append("")
      }
    })
  });
}

$(document).ready(function(){
  $.ajax({
    type: "GET",
    url:  "http://localhost:3000/spots",
    // url:  "https://surfiesta.herokuapp.com/spots",
    success: function(spots){
      dom_spots = $(".spots");

      $.each(spots, function(index, spot){
        // var raw_dom_spot = "<h3><a href='#'>NewParagraph</a></h3><div><p>Newdata</p></div>"
        var raw_dom_spot = "<div class='spot' id='"+spot.id+"' data-name='"+spot.name+"'><a class='spot-name'>"+spot.name+"</a></div>"
        // var raw_dom_spot = "<div class='spot' id='"+spot.id+"' data-name='"+spot.name+"'><h3>Section1</h3><div><p>Mauris mauris ante, blandit et, ultrices a, susceros. Nam mi. Proin viverra leo ut odio. Curabitur malesuada. Vestibulum a velit eu ante scelerisque vulputate.</p></div>"
        dom_spots.append(raw_dom_spot)
        var dom_spot = dom_spots.children().last()
        add_handler(dom_spot)
      })
      dom_spots.accordion("refresh");
    }
  })
  add_handler($(".spot"))
});
