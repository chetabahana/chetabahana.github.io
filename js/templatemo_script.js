jQuery(function($) {
    
    $(window).on('load', function(){        
        $('.external-link').unbind('click'); // unbind external link	    
    });
		
    $(document).ready( function() {
	    
        // to stick navbar on top and hash
        $('.templatemo-top-menu').stickUp(); 
        if( location.hash && location.hash.length ) {console.log(location.hash);
            scrollTo(location.hash);
            return false;
	}	    

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

// scroll animation 
var top_menu_height = 0;
function scrollTo(selectors)
{
    if(!$(selectors).length) return;
    var selector_top = $(selectors).offset().top - top_menu_height;
    $('html,body').animate({ scrollTop: selector_top }, 'slow');
}

//instafeed
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
     $('#loadmore').setAttribute('disabled', 'disabled');
    }
  }
});

/* bind the load more button*/
$('#loadmore').bind('click', function() {
  feed.next();
});

// run instafeed!
feed.run();

//juicer
function updateFilters() {

    $('.j-image>img').css({'height':'100px','width':'100px'}); 
    var feeds = $('.j-image');
    $('.juicer-feed').html('');

    $.each(feeds, function(key, value) {
	var pdiv = $("<li>").append(value );
	$('.juicer-feed').append(pdiv);  
    });

    $('.juicer-feed').slick({
	slidesToShow: 6,
	slidesToScroll: 1,
	autoplay: true,
	autoplaySpeed: 2000,
    });   
  }
		
/**
*  RECOMMENDED CONFIGURATION VARIABLES: EDIT AND UNCOMMENT THE SECTION BELOW TO INSERT DYNAMIC VALUES FROM YOUR PLATFORM OR CMS.
*  LEARN WHY DEFINING THESE VARIABLES IS IMPORTANT: https://disqus.com/admin/universalcode/#configuration-variables*/

var disqus_config = function () {
this.page.url = 'https://chetabahana.github.io/';  // Replace PAGE_URL with your page's canonical URL variable
this.page.identifier = ''; // Replace PAGE_IDENTIFIER with your page's unique identifier variable
};

(function() { // DON'T EDIT BELOW THIS LINE
var d = document, s = d.createElement('script');
s.src = 'https://chetabahana.disqus.com/embed.js';
s.setAttribute('data-timestamp', +new Date());
(d.head || d.body).appendChild(s);
})();

// Adds the onNewComment callback to the disqus_config of the embed code
// that sends 'New Comment' events over to Google Analytics.
// The callback can also be used for any other analytics service like Parse.ly, Chartbeat, Mixpanel
var disqus_config = function() {
	this.callbacks.onNewComment = [function(comment) {
		  ga('send', {
		'hitType': 'event',            // Required.
		'eventCategory': 'Comments',   // Required.
		'eventAction': 'New Comment',  // Required.
		'eventLabel': 'New Comment'
	});
}];
};		
</script>
<noscript>Please enable JavaScript to view the <a href="https://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>


