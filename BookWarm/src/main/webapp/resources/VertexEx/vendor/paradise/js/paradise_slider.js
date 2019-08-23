/*
	JavaScript For Paradise Slider

	Author: szthemes
	Item Name: Paradise Slider
	Author URI: http://codecanyon.net/user/szthemes
	Description: 110+ Pre-made layouts of Bootstrap Carousel

*/

;(function ($) {

    /*-----------------------------------------------------------------*/
    /* ANIMATE SLIDER CAPTION
    /* Demo Scripts for Bootstrap Carousel and Animate.css article on SitePoint by Maria Antonietta Perna
    /*-----------------------------------------------------------------*/
    "use strict";
    function doAnimations(elems) {
        //Cache the animationend event in a variable
        var animEndEv = 'webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend';
        elems.each(function () {
            var $this = $(this),
                $animationType = $this.data('animation');
            $this.addClass($animationType).one(animEndEv, function () {
                $this.removeClass($animationType);
            });
        });
    }
    //Variables on page load
    var $paradiseSlider = $('.carousel'),
        $firstAnimatingElems = $paradiseSlider.find('.item:first').find("[data-animation ^= 'animated']");
    //Initialize carousel
    $paradiseSlider.carousel();
    //Animate captions in first slide on page load
    doAnimations($firstAnimatingElems);
    //Other slides to be animated on carousel slide event
    $paradiseSlider.on('slide.bs.carousel', function (e) {
        var $animatingElems = $(e.relatedTarget).find("[data-animation ^= 'animated']");
        doAnimations($animatingElems);
    });

    /*-----------------------------------------------------------------*/
    /* CAROUSEL SLIDING DURATION
    /*-----------------------------------------------------------------*/
    var slideDurationValue = $(".carousel").attr("data-duration");

    if (isNaN(slideDurationValue) || slideDurationValue <= 0){
        $.fn.carousel.Constructor.TRANSITION_DURATION = 1000;
		$(".carousel-inner > .item").css({
		'-webkit-transition-duration': slideDurationValue + '1000ms',
		'-moz-transition-duration': slideDurationValue + '1000ms',
		'transition-duration': slideDurationValue + '1000ms'
		});
    }else{
        $.fn.carousel.Constructor.TRANSITION_DURATION = slideDurationValue;
		$(".carousel-inner > .item").css({
		'-webkit-transition-duration': slideDurationValue + 'ms',
		'-moz-transition-duration': slideDurationValue + 'ms',
		'transition-duration': slideDurationValue + 'ms'
		});
    }
	
    /*-----------------------------------------------------------------*/
    /* CAROUSEL MOUSE WHEEL
    /*-----------------------------------------------------------------*/
    var mouseWheelY = $(".carousel").find('[class=mouse_wheel_y]');
    var mouseWheelXY = $(".carousel").find('[class=mouse_wheel_xy]');

    if(mouseWheelXY){
        $('.mouse_wheel_xy').bind('mousewheel', function(e){
            if(e.originalEvent.wheelDelta /120 > 0) {
                $(this).carousel('prev');
            }else {
                $(this).carousel('next');
            }
        });
    }if(mouseWheelY){
        $('.mouse_wheel_y').bind('mousewheel', function(e){
            if(e.originalEvent.wheelDelta /120 > 0) {
                $(this).carousel('next');
            }
        });
    }

    /*-----------------------------------------------------------------*/
    /* MOBILE SWIPE
    /*-----------------------------------------------------------------*/
    //Enable swiping...
    var verticalSwipe = $(".carousel").find('[class=swipe_y]');
    var horizontalSwipe = $(".carousel").find('[class=swipe_x]');

    if(verticalSwipe){
      $(".swipe_y .carousel-inner").swipe({
        //Generic swipe handler for vertical directions
        swipeUp: function (event, direction, distance, duration, fingerCount) {
          $(this).parent().carousel('next');
        },
        swipeDown: function () {
          $(this).parent().carousel('prev');
        },
        //Default is 75px, set to 0 for demo so any distance triggers swipe
        threshold: 0
      });
    }if(horizontalSwipe){
      $(".swipe_x .carousel-inner").swipe({
        //Generic swipe handler for horizontal directions
        swipeLeft: function (event, direction, distance, duration, fingerCount) {
          $(this).parent().carousel('next');
        },
        swipeRight: function () {
          $(this).parent().carousel('prev');
        },
        //Default is 75px, set to 0 for demo so any distance triggers swipe
        threshold: 0
      });
    }

    /*-----------------------------------------------------------------*/
    /* Thumbnails Indicators Scroll
    /*-----------------------------------------------------------------*/
    "use strict";
    var indicatorPositionY = 0;
    var indicatorPositionX = 0;
    var thumbnailScrollY = $(".carousel").find('[class=thumb_scroll_y]');
    var thumbnailScrollX = $(".carousel").find('[class=thumb_scroll_x]');

    if(thumbnailScrollY){
      $('.thumb_scroll_y').on('slid.bs.carousel', function(){
        var heightEstimate = -1 * $(".thumb_scroll_y .carousel-indicators li:first").position().top + $(".thumb_scroll_y .carousel-indicators li:last").position().top + $(".thumb_scroll_y .carousel-indicators li:last").height();
        var newIndicatorPositionY = $(".thumb_scroll_y .carousel-indicators li.active").position().top + $(".thumb_scroll_y .carousel-indicators li.active").height() / 1;
        var toScrollY = newIndicatorPositionY + indicatorPositionY;
        var adjustedScrollY = toScrollY - ($(".thumb_scroll_y .carousel-indicators").height() / 1);
        if (adjustedScrollY < 0)
          adjustedScrollY = 0;
        if (adjustedScrollY > heightEstimate - $(".thumb_scroll_y .carousel-indicators").height())
          adjustedScrollY = heightEstimate - $(".thumb_scroll_y .carousel-indicators").height();
        $('.thumb_scroll_y .carousel-indicators').animate({ scrollTop: adjustedScrollY }, 800);
          indicatorPositionY = adjustedScrollY;
      });
    } if(thumbnailScrollX){
      $('.thumb_scroll_x').on('slid.bs.carousel', function(){
        var widthEstimate = -1 * $(".thumb_scroll_x .carousel-indicators li:first").position().left + $(".thumb_scroll_x .carousel-indicators li:last").position().left + $(".thumb_scroll_x .carousel-indicators li:last").width();
        var newIndicatorPositionX = $(".thumb_scroll_x .carousel-indicators li.active").position().left + $(".thumb_scroll_x .carousel-indicators li.active").width() / 1;
        var toScrollX = newIndicatorPositionX + indicatorPositionX;
        var adjustedScrollX = toScrollX - ($(".thumb_scroll_x .carousel-indicators").width() / 1);
        if (adjustedScrollX < 0)
          adjustedScrollX = 0;
        if (adjustedScrollX > widthEstimate - $(".thumb_scroll_x .carousel-indicators").width())
          adjustedScrollX = widthEstimate - $(".thumb_scroll_x .carousel-indicators").width();
        $('.thumb_scroll_x .carousel-indicators').animate({ scrollLeft: adjustedScrollX }, 800);
          indicatorPositionX = adjustedScrollX;
      });
    }

    /*-----------------------------------------------------------------*/
    /* SIX SHOWS ONE MOVE
    /*-----------------------------------------------------------------*/
    $('.six_coloumns .item').each(function(){
        var itemToClone = $(this);
        for (var i=1;i<6;i++) {
            itemToClone = itemToClone.next();
            // wrap around if at end of item collection
            if (!itemToClone.length) {
                itemToClone = $(this).siblings(':first');
            }
            // grab item, clone, add marker class, add to collection
            itemToClone.children(':first-child').clone()
            .addClass("cloneditem-"+(i))
            .appendTo($(this));
        }
    });

    /*-----------------------------------------------------------------*/
    /* FIVE SHOWS ONE MOVE
    /*-----------------------------------------------------------------*/
    $('.five_coloumns .item').each(function(){
        var itemToClone = $(this);
        for (var i=1;i<5;i++) {
            itemToClone = itemToClone.next();
            // wrap around if at end of item collection
            if (!itemToClone.length) {
                itemToClone = $(this).siblings(':first');
            }
            // grab item, clone, add marker class, add to collection
            itemToClone.children(':first-child').clone()
            .addClass("cloneditem-"+(i))
            .appendTo($(this));
        }
    });

    /*-----------------------------------------------------------------*/
    /* FOUR SHOWS ONE MOVE
    /*-----------------------------------------------------------------*/
    $('.four_coloumns .item').each(function(){
        var itemToClone = $(this);
        for (var i=1;i<4;i++) {
            itemToClone = itemToClone.next();
            // wrap around if at end of item collection
            if (!itemToClone.length) {
                itemToClone = $(this).siblings(':first');
            }
            // grab item, clone, add marker class, add to collection
            itemToClone.children(':first-child').clone()
            .addClass("cloneditem-"+(i))
            .appendTo($(this));
        }
    });

    /*-----------------------------------------------------------------*/
    /* THREE SHOWS ONE MOVE
    /*-----------------------------------------------------------------*/
    $('.three_coloumns .item').each(function(){
        var itemToClone = $(this);
        for (var i=1;i<3;i++) {
            itemToClone = itemToClone.next();
            // wrap around if at end of item collection
            if (!itemToClone.length) {
                itemToClone = $(this).siblings(':first');
            }
            // grab item, clone, add marker class, add to collection
            itemToClone.children(':first-child').clone()
            .addClass("cloneditem-"+(i))
            .appendTo($(this));
        }
    });

    /*-----------------------------------------------------------------*/
    /* TWO SHOWS ONE MOVE
    /*-----------------------------------------------------------------*/
    $('.two_coloumns .item').each(function(){
        var itemToClone = $(this);
        for (var i=1;i<2;i++) {
            itemToClone = itemToClone.next();
            // wrap around if at end of item collection
            if (!itemToClone.length) {
                itemToClone = $(this).siblings(':first');
            }
            // grab item, clone, add marker class, add to collection
            itemToClone.children(':first-child').clone()
            .addClass("cloneditem-"+(i))
            .appendTo($(this));
        }
    });
	
    /*-----------------------------------------------------------------*/
    /* VIDEO PAUSING ON SLIDE
    /*-----------------------------------------------------------------*/
    //It will work on .pauseVideo class only
    $(".pauseVideo").on('slide.bs.carousel', function () {
      $("video").each(function(){
        this.pause();
      });
    });

    /*-----------------------------------------------------------------*/
    /* YOUTUBE, VIMEO VIDEO PAUSING ON SLIDE
    /*-----------------------------------------------------------------*/
    //It will work on .onlinePauseVideo class only
    $(".onlinePauseVideo").on('slide.bs.carousel', function (e) {
      var $psiFrames = $(e.target).find("iframe");
      $psiFrames.each(function(index, iframe){
        $(iframe).attr("src", $(iframe).attr("src"));
      });
    });

})(jQuery);