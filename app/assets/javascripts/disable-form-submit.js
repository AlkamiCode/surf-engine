$(document).ready(function (){
  $('.filter').on('keypress keydown keyup', function(e) {
    if (e.which == 13) {
      //alert(e.which);
      e.preventDefault();
      return false;
    }
  });
})
