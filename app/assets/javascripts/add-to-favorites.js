function add_like_handler(spot) {
  spot.find('.glyphicon').on("click", function(){
    $(this).toggleClass('glyphicon-heart-empty').toggleClass('glyphicon-heart');
  })
};
