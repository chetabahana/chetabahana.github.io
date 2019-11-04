jQuery(function($) {
$(window).load(function() {draw.getJSON();});

    $(window).on('beforeunload', function(){

        // to stick navbar on top and hash
        $('.templatemo-top-menu').stickUp();

    });

    $(window).on('load', function(){

        // open links which point outside
        $(document.links).filter(function() {
            return this.hostname != window.location.hostname;
        }).attr('target', '_blank'); 

        // do scroll and clear the hash anytime someone arrives with a hash tag
        if( typeof(location.hash) !== 'undefined' && location.hash.length ) {
            scrollTo(location.hash);
            history.replaceState(null, null, location.pathname); // https://stackoverflow.com/a/50688363/4058484
        }

    });

    $(document).ready( function() {

        // to stick navbar on top and hash
        $('.templatemo-top-menu').stickUp(); 

        // unbind external link
        $('.external-link').unbind('click');

        // scroll spy to auto active the nav item
        top_menu_height = $('.templatemo-top-menu').height();
        $('body').scrollspy({ target: '#templatemo-nav-bar', offset: top_menu_height + 10 });

        // scroll to top
        $('#btn-back-to-top').click(function(e){
            e.preventDefault();
            scrollTo('#templatemo-top');
        });

        // scroll to specific id when click on link
        $('.internal-link, .carousel-inner a').click(function(e){
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

        // chetabahana-portfolio https://stackoverflow.com/a/50299022/4058484
        $(".templatemo-project-gallery").simplyScroll(); 

    });

});

// scrollTo 
var top_menu_height = 0;
function scrollTo(selectors)
{
    if(!$(selectors).length) return;
    var selector_top = $(selectors).offset().top - top_menu_height;
    $('html,body').animate({scrollTop: selector_top }, 'slow');
}

/*juicerFeed
function juicerFeed() { 
    if (!$('#gfeeds').find('a')[0] || !$('#___community_0')) {
         window.requestAnimationFrame(juicerFeed);       
    } else {
       $('#___community_0').css({ 'margin-top': '-5px' });  
       $('#gfeeds').slick({slidesToShow: 10, slidesToScroll: 1, autoplay: true, autoplaySpeed: 2000});
    }    
  } 

instafeed
var feed = new Instafeed({
    get: 'user',
    limit: 100,
    sortBy:'most-recent',
    userId: 6982272811,
    resolution: 'standard_resolution',
    accessToken: '6982272811.1677ed0.b6dcfc26877b4ad3854d1a276fdf4de6',
    template: '<li><a href="{{link}}" target="_blank"><img src="{{image}}" /><div class="insta-likes"><div style="display: table; vertical-align: middle; height: 100%; width: 100%;"><span style="display: table-cell; vertical-align: middle; height: 100%; width: 100%;">{{likes}} <i class="fa fa-heart"></i><br/>{{comments}} <i class="fa fa-comment"></i></span></div></div></a></li>',

    after: function() {
        $('#instafeed').slick({slidesToShow: 5, slidesToScroll: 1, autoplay: true, arrows: true, autoplaySpeed: 2000});
        juicerFeed();	    
    }

});

feed.run();
*/