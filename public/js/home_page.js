jQuery(document).ready(function($){
if ($.browser.msie && $.browser.version.substr(0,1)<9) {
      $('#slider').anythingSlider({
    hashTags : false,
    expand		: true,
    autoPlay	: true,
    resizeContents  : false,
    pauseOnHover    : true,
    buildArrows     : false,
    buildNavigation : false,
    delay		: 7500,
    resumeDelay	: 0,
    animationTime	: 800,
    delayBeforeAnimate:0,
    easing : 'easeInOutQuint',

    onSlideBegin    : function(e, slider) {
        $('.nextbutton').fadeOut();
        $('.prevbutton').fadeOut();

    },
    onSlideComplete    : function(slider) {


      var height = $('.activePage').find('.check').height();
      var heightIframe = $('.activePage').find('iframe').height();
      var currheight = $('.anythingSlider').height();
      if(height != null){
        height = currheight/2-20;

        $('.nextbutton').css('top',''+height+'px');
        $('.prevbutton').css('top',''+height+'px')
        }
      if(heightIframe != null){
        heightIframe = currheight/2 -20;
        $('.nextbutton').css('top',''+heightIframe+'px');
        $('.prevbutton').css('top',''+heightIframe+'px');
        }
      $('.nextbutton').fadeIn();
      $('.prevbutton').fadeIn();

    }


      })

 }
  else{
       $('#slider').anythingSlider({
    hashTags : false,
    expand		: true,
    autoPlay	: true,
    resizeContents  : false,
    pauseOnHover    : true,
    buildArrows     : false,
    buildNavigation : false,
    delay		: 7500,
    resumeDelay	: 0,
    animationTime	: 800,
    delayBeforeAnimate:0,
    easing : 'easeInOutQuint',
    onBeforeInitialize   : function(e, slider) {
      $('.textSlide h1, .textSlide li, .textSlide img, .textSlide h2, .textSlide li.button').css('opacity','0');
    },

    onSlideBegin    : function(e, slider) {
        $('.nextbutton').fadeOut();
        $('.prevbutton').fadeOut();

    },
    onSlideComplete    : function(slider) {


      var height = $('.activePage').find('.check').height();
      var heightIframe = $('.activePage').find('iframe').height();
      var currheight = $('.anythingSlider').height();
      if(height != null){
        height = currheight/2-20;

        $('.nextbutton').css('top',''+height+'px');
        $('.prevbutton').css('top',''+height+'px')
        }
      if(heightIframe != null){
        heightIframe = currheight/2 -20;
        $('.nextbutton').css('top',''+heightIframe+'px');
        $('.prevbutton').css('top',''+heightIframe+'px');
        }
      $('.nextbutton').fadeIn();
      $('.prevbutton').fadeIn();
       $('.textSlide li.top,.textSlide li.top1,.textSlide li.top2,.textSlide li.top3,.textSlide li.bounceBall1, .textSlide li.bounceBall2, .textSlide li.bounceBall3, .textSlide li.bounceBall4,.textSlide li.bounceBall5,.textSlide li.bounceBall6').css('top','-900px');
    }


      })

  .anythingSliderFx({

   // base FX definitions can be mixed and matched in here too.
   '.fade' : [ 'fade' ],

   // for more precise control, use the "inFx" and "outFx" definitions
   // inFx = the animation that occurs when you slide "in" to a panel
   inFx : {
    '.textSlide h1'  : { opacity: 1, top  : 0, duration: 500, easing : 'linear' },
  '.textSlide h2'  : { opacity: 1, top  : 0, duration: 500, easing : 'linear' },
  '.textSlide li.object1'  : { opacity: 1, top  : 0, duration: 500, easing : 'linear' },
    '.textSlide li.left, .textSlide li.right'  : { opacity: 1, left : 0,  duration: 2000 ,easing : 'easeOutQuint'},
    '.textSlide li.top' : { opacity: 1,  top : 0,  duration: 1500 ,easing : 'easeOutQuint'}	,
    '.textSlide li.top1' : { opacity: 1,  top : 0, duration: 1500 ,  easing : 'easeOutQuint'}	,
    '.textSlide li.top2' : { opacity: 1,  top : 0, duration: 1500 ,easing : 'easeOutQuint'}	,
    '.textSlide li.top3' : { opacity: 1,  top : 0, duration: 1500 ,easing : 'easeOutQuint'}	,
  '.textSlide li.bottom'  : { opacity: 1,  bottom : 0, duration: 3000 ,easing : 'easeOutQuint'}	,
  '.textSlide li.bottom2'  : { opacity: 1,  top : 0, duration: 2500 ,easing : 'easeOutQuint'}	,
  '.textSlide li.button'  : { opacity: 1,  top : 0, duration: 2500,easing : 'easeOutQuint'}	,
  '.textSlide li.salePrice1'  : { opacity: 1,  top : 0, duration: 500,easing : 'easeOutQuint'}	,
  '.textSlide li.salePrice2'  : { opacity: 1,  top : 0, duration: 500,easing : 'easeOutQuint'}	,
  '.textSlide li.salePrice3'  : { opacity: 1,  top : 0, duration: 500,easing : 'easeOutQuint'}	,
  '.textSlide li.bounceBall1'  : { opacity: 1,  top : 0, duration: 2500,easing : 'easeOutBounce'}	,
  '.textSlide li.bounceBall2'  : { opacity: 1,  top : 0, duration: 1800,easing : 'easeOutBounce'}	,
  '.textSlide li.bounceBall3'  : { opacity: 1,  top : 0, duration: 3500,easing : 'easeOutBounce'}	,
  '.textSlide li.bounceBall4'  : { opacity: 1,  top : 0, duration: 2200,easing : 'easeOutBounce'}	,
  '.textSlide li.bounceBall5'  : { opacity: 1,  top : 0, duration: 1900,easing : 'easeOutBounce'}	,
  '.textSlide li.bounceBall6'  : { opacity: 1,  top : 0, duration: 2700,easing : 'easeOutBounce'}	,
  '.textSlide li.quote'  : { opacity: 1,  top : 0, duration: 5600 ,easing : 'easeOutQuad'}
   },
   // out = the animation that occurs when you slide "out" of a panel
   // (it also occurs before the "in" animation)
   outFx : {
    '.textSlide h1'      : { opacity: 0, top  : '0px', duration: 500 },
  '.textSlide li.object1'      : { opacity: 0, top  : '0px', duration: 500 },
    '.textSlide li.right'  : { opacity: 0, left : '-600px', duration: 350 },
    '.textSlide li.left' : { opacity: 0, left : '200px',  duration: 350 },
    '.textSlide li.bottom' : { opacity: 0, top : '500px',  duration: 350 },
  '.textSlide li.bottom2' : { opacity: 0, top : '500px',  duration: 350 },
    '.textSlide li.top,.textSlide li.top2,.textSlide li.top3' : { opacity: 0, top : '-900px',  duration: 1200 },
  '.textSlide li.top1' : { opacity: 0, top : '-900px',  duration: 2400},
  '.textSlide li.top2' : { opacity: 0, top : '-900px',  duration: 3600},
  '.textSlide li.top3' : { opacity: 0, top : '-900px',  duration: 4800},
   '.textSlide li.button' : { opacity: 0, top : '500px',  duration: 0 },
   '.textSlide li.salePrice1' : { opacity: 0, top : '500px',  duration: 5000 },
   '.textSlide li.salePrice2' : { opacity: 0, top : '500px',  duration: 5250 },
   '.textSlide li.salePrice3' : { opacity: 0, top : '500px',  duration: 5500 },
    '.textSlide li.quote' : { opacity: 0, top : '700px',  duration: 350 },
    '.textSlide img' : { opacity: 1, top : '0px',  duration: 600 },

   }

  });

  }

      $('#slider-wrapper').hover(function() {
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
    $('#slider').data('AnythingSlider').startStop(true);  // start the slideshow
      });
      $(".slideforward").click(function(){
    $('#slider').data('AnythingSlider').goForward();
      });
      $(".slidebackward").click(function(){
    $('#slider').data('AnythingSlider').goBack();
      });
});
