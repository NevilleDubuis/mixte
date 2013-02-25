// =require jquery
// =require jquery-ui
// =require jquery.h5validate
// =require underscore
// =require jquery-placeholder

// Calcualte the home banner parallax scrolling
  function scrollBanner() {
    //Get the scoll position of the page
    scrollPos = jQuery(this).scrollTop();

    //Scroll and fade out the banner text
    $('#bannertext').css({
      'margin-top': -(scrollPos/4)+"px",
      'opacity': 1-(scrollPos/600)
    });

    //Scroll the background of the banner
    $('#banner').css({
      'background-position' : 'center ' + (-scrollPos/3)+"px"
    });
  }

jQuery(document).ready(function(){

  jQuery(window).scroll(function() {
       scrollBanner();
  });

});
