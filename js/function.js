jQuery(function($)
{
    // jQuery document.ready will be executed just after html dom tree has been parsed out.
    // So it is far more earlier executed than window onload.
    $(document).ready( function()
    {
        // to stick navbar on top and hash
        top_menu_height = $('.templatemo-top-menu').height();
        $('html,body').scrollspy({target: '#templatemo-nav-bar', offset: top_menu_height + 10});

        // do scroll and clear the hash anytime someone arrives with a hash tag
        // https://stackoverflow.com/a/50688363/4058484
        if( typeof(location.hash) !== 'undefined' && location.hash.length ) 
        {
            var location_hash = location.hash.split('?')[0];
            history.replaceState(null, null, location.pathname);
            scrollTo(location_hash);
        }

        // set links which point outside
        $('.external-link').unbind('click');
        $(document.links).filter(function() {
            return this.hostname != window.location.hostname;
        }).attr('target', '_blank'); 

        // scroll to top
        $('#btn-back-to-top').click(function(e)
        {
            e.preventDefault();
            scrollTo('#templatemo-top');
        });

        // scroll to specific id when click on link
        $('.internal-link, .carousel-inner a').click(function(e)
        {
            e.preventDefault(); 
            var linkId = $(this).attr('href');
            scrollTo(linkId);
            return false;
        });

        // scroll to specific id when click on menu
        $('.templatemo-top-menu .navbar-nav a').click(function(e)
        {
            e.preventDefault(); 
            var linkId = $(this).attr('href');
            scrollTo(linkId);
            if($('.navbar-toggle').is(":visible") == true)
            {
                $('.navbar-collapse').collapse('toggle');
            }
            $(this).blur();
            return false;
        });

        // scrollspy to auto active the nav item
        $('.templatemo-top-menu').stickUp(); 

        // This API has been removed in jQuery 3.0; please use .on( "load", handler ) 
        // instead of .load( handler ) and .trigger( "load" ) instead of .load().
        // https://api.jquery.com/load-event/

        // load page in sequence with Jquery via  div loaded
        // https://stackoverflow.com/q/15674733/4058484
        /*$('#one').load("one.php", function() {  // first div loaded
            $('#two').load("two.php", function() { // second div loaded
                $('#three').load("three.php", function() { // third div loaded  });
            });
        });*/

        // gallery category
        $('.templatemo-gallery-category a').click(function(e)
        {
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

        //chetabahana-gallery
        $('a.colorbox').colorbox({
            rel: function(){
                return $(this).data('group');
            }
        });

        //chetabahana-skema
        $('.theme').change(function() {draw.change();});
        $('.download').click(function(ev) {draw.xmlData();});

        //chetabahana-portfolio
        $(".templatemo-project-gallery").simplyScroll();

    });

    // Window.onload event will be executed only when all page resources
    // ( images, audio, video etc ) has been downloaded in the page.
    $(window).on('load', function()
    {
        // unbind external link
        $('.external-link').unbind('click');

        var feed = new Instafeed(
        {
            get: 'user',
            limit: 100,
            sortBy:'most-recent',
            userId: 6982272811,
            resolution: 'standard_resolution',
            accessToken: '6982272811.1677ed0.b6dcfc26877b4ad3854d1a276fdf4de6',
            template: '<li><a href="{{link}}" target="_blank"><img src="{{image}}" /><div class="insta-likes"><div style="display: table; vertical-align: middle; height: 100%; width: 100%;"><span style="display: table-cell; vertical-align: middle; height: 100%; width: 100%;">{{likes}} <i class="fa fa-heart"></i><br/>{{comments}} <i class="fa fa-comment"></i></span></div></div></a></li>',

            after: function()
            {
                $('#instafeed').slick(
                {
                    slidesToShow: 5, slidesToScroll: 1, autoplay: true, arrows: true, autoplaySpeed: 2000
                });
                juicerFeed();
            }

        });

        $('.theme').val('hand');
        feed.run();

    });

    //catch scrollspy event prior running skema
    $(window).on('activate.bs.scrollspy', function (event) {
        //console.log('activate.bs.scrollspy', event);
        if (!$('#diagram svg') && $(".theme").val() == 'hand') draw.getJSON();
        else if ($('#diagram svg').width() < $('#diagram').width()) draw.change();
    })

});

// init scrollTo 
function scrollTo(selectors)
{
    if(!$(selectors).length) return;
    var selector_top = $(selectors).offset().top - top_menu_height;
    $('html,body').animate({scrollTop: selector_top }, 'slow');
}

// juicer Feed
function juicerFeed()
{
    if (!$('#gfeeds').find('a')[0] || !$('#___community_0')) {
         window.requestAnimationFrame(juicerFeed);       
    } else {
       $('#___community_0').css({ 'margin-top': '-5px' });  
       $('#gfeeds').slick({slidesToShow: 10, slidesToScroll: 1, autoplay: true, autoplaySpeed: 2000});
    }
}

//juicer plugin
function updateFilters() {

  var feeds = document.getElementById("feeds");
  var obj = feeds.querySelectorAll('.j-image');

  document.getElementsByClassName('juicer-feed').remove();

  for(var index in obj) {
    if (obj[index].tagName == 'A') {
      
      var img = obj[index].getElementsByTagName('img')[0];
      
      if(img && img.style) {
        
          if (obj[index].hostname == 'www.facebook.com') {
               img.style.height = '50px';
               img.style.width = '50px';               
          }
          else if (obj[index].hostname == 'plus.google.com') {
               img.style.height = '25px';
               img.style.width = '25px';               
          }
        
          img.style.float = 'left';
          img.style.padding = 0;
          img.style.margin = 0; 
      }
    }
    
    if (obj[index].hostname == 'www.facebook.com') {
          feeds.appendChild(obj[index]);
    } else if (obj[index].hostname == 'plus.google.com') {
          document.getElementById("gfeeds").appendChild(obj[index]);
    }
    
  }
  
}  

// get params 
var params, regex = /[?&]([^=#]+)=([^&#]*)/g, url = window.location.href, params = {}, match;
while(match = regex.exec(url)) {params[match[1]] = match[2];}
var top_menu_height = 0;
