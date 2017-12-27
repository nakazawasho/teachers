$(document).on('turbolinks:load', function() {
  $(function(){
    $(".menu-open").css("display","none");
    $("#menu-open-icon").on("click", function() {
      $('.menu-open').slideToggle();
    });
  });
});
