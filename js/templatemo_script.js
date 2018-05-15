var top_menu_height = 0;
var loadButton = document.getElementById('load-more');
var feed = new Instafeed({
    get: 'user',
    limit: 11,
    sortBy:'most-recent',
    userId: 6982272811,
    resolution: 'standard_resolution',
    accessToken: '6982272811.1677ed0.b6dcfc26877b4ad3854d1a276fdf4de6',
    template: '<div><a href="{{link}}" target="_blank"><img src="{{image}}" /><div class="insta-likes"><div style="display: table; vertical-align: middle; height: 100%; width: 100%;"><span style="vertical-align: middle; height: 100%; width: 100%;">{{likes}} <i class="fa fa-heart"></i><br/>{{comments}} <i class="fa fa-comment"></i></span></div></div></a></div>',
  
  after: function() {
 
    // run slick for scrolling
    $('#instafeed').slick({
      slidesToShow: 6,
      slidesToScroll: 1,
      autoplay: true,
      autoplaySpeed: 2000,
    });
  
    // every time we load more, run this function
    if (!this.hasNext()) {
     // disable button if no more results to load
     loadButton.setAttribute('disabled', 'disabled');
    }
  }
});

// bind the load more button
loadButton.addEventListener('click', function() {
  feed.next();
});

// run instafeed!
feed.run();

// scroll animation 
function scrollTo(selectors)
{
    if(!$(selectors).length) return;
    var selector_top = $(selectors).offset().top - top_menu_height;
    $('html,body').animate({ scrollTop: selector_top }, 'slow');
}

jQuery(function($) {
    
    $(window).on('load', function(){        
        $('.external-link').unbind('click'); // unbind external link
        if( location.hash && location.hash.length ) {
           var content = decodeURIComponent(location.hash.substr(1));
           console.log('locatio hash'+location.hash);
	}	    
	    
	    
    });
		
    $(document).ready( function() {
	    
        // to stick navbar on top
        $('.templatemo-top-menu').stickUp(); 
	    
        // chetabahana-skema
        jsSequence();

        // chetabahana-portfolio https://stackoverflow.com/a/50299022/4058484
        $(".templatemo-project-gallery").simplyScroll(); 
	    
        // scroll spy to auto active the nav item
        top_menu_height = $('.templatemo-top-menu').height();
        $('body').scrollspy({ target: '#templatemo-nav-bar', offset: top_menu_height + 10 });

        // scroll to top
        $('#btn-back-to-top').click(function(e){
            e.preventDefault();
            scrollTo('#templatemo-top');
        });

        // scroll to specific id when click on link
	$('.internal-link, .carousel-inner a, .templatemo-service a').click(function(e){
            e.preventDefault(); 
            var linkId = $(this).attr('href');
            scrollTo(linkId);
            return false;
        });

        // scroll to specific id when click on menu
        $('.templatemo-top-menu .navbar-nav a').click(function(e){
            e.preventDefault(); 
            var linkId = $(this).attr('href');
            scrollTo(linkId);
            if($('.navbar-toggle').is(":visible") == true){
                $('.navbar-collapse').collapse('toggle');
            }
            $(this).blur();
            return false;
        });
        //gallery light box setup
        $('a.colorbox').colorbox({
            rel: function(){
                return $(this).data('group');
            }
        });

        // gallery category
        $('.templatemo-gallery-category a').click(function(e){
            e.preventDefault(); 
            $(this).parent().children('a').removeClass('active');
            $(this).addClass('active');
            var linkClass = $(this).attr('href');
            $('.gallery').each(function(){
                if($(this).is(":visible") == true){
                   $(this).hide();
                };
            });
            $(linkClass).fadeIn();  
        });
	    
    });
});

