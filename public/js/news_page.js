jQuery(document).ready(function($){
      $('.slider').anythingSlider({
    hashTags : false,
    expand		: true,
    autoPlay	: true,
    resizeContents  : false,
    pauseOnHover    : true,
    buildArrows     : false,
    buildNavigation : false,
    delay		: 4000,
    resumeDelay	: 0,
    animationTime	: 800,
    delayBeforeAnimate:0,
    easing : 'easeInOutQuint',
      })


      $('.slider-wrapper').hover(function() {
    $(".slideforward").stop(true, true).fadeIn();
    $(".slidebackward").stop(true, true).fadeIn();
      }, function() {
    $(".slideforward").fadeOut();
    $(".slidebackward").fadeOut();
      });
      $(".pauseButton").toggle(function(){
    $(this).attr("class", "playButton");
    $('#slider').data('AnythingSlider').startStop(false); // stops the slideshow
      },function(){
    $(this).attr("class", "pauseButton");
    $('.slider').data('AnythingSlider').startStop(true);  // start the slideshow
      });
      $(".slideforward").click(function(){
    $('.slider').data('AnythingSlider').goForward();
      });
      $(".slidebackward").click(function(){
    $('.slider').data('AnythingSlider').goBack();
      });
  });
