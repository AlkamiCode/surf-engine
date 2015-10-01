function add_like_handler(spot) {
  spot.find('.glyphicon').on("click", function(){
    event.stopImmediatePropagation(this)
    $(this).toggleClass('glyphicon-heart-empty').toggleClass('glyphicon-heart');
  })
};
