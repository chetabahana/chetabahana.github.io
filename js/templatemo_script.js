var top_menu_height = 0;

jQuery(function($) {

    $(window).load( function() {
        $('.external-link').unbind('click');	
    });
		
    $(document).ready( function() {

        /* load google map*/
        var script = document.createElement('script');
        script.type = 'text/javascript';
        script.src = 'https://cdnjs.cloudflare.com/ajax/libs/ace/1.2.5/ace.js?sensor=false&callback=initialize';
        document.body.appendChild(script);
	    
        //setup_editor($('#example1'));
	    
        top_menu_height = $('.templatemo-top-menu').height();
        // scroll spy to auto active the nav item
        $('body').scrollspy({ target: '#templatemo-nav-bar', offset: top_menu_height + 10 });
        $('.external-link').unbind('click');

        // scroll to top
        $('#btn-back-to-top').click(function(e){
            e.preventDefault();
            scrollTo('#templatemo-top');
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

        $('.carousel-inner a, .templatemo-service a').click(function(e){
            e.preventDefault(); 
            var linkId = $(this).attr('href');
            scrollTo(linkId);
            return false;
        });

        // to stick navbar on top
        $('.templatemo-top-menu ').stickUp();

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

        //gallery light box setup
        $('a.colorbox').colorbox({
            rel: function(){
                return $(this).data('group');
            }
        });
    });
});

function initialize() {
    //var mapOptions = {zoom: 12, center: new google.maps.LatLng(16.8451789,96.1439764)};
    //var map = new google.maps.Map(document.getElementById('map-canvas'),  mapOptions);
    document.getElementById('map-canvas').style.backgroundImage = "url('/images/diagram.png')";
}

// scroll animation 
function scrollTo(selectors)
{
    if(!$(selectors).size()) return;
    var selector_top = $(selectors).offset().top - top_menu_height;
    $('html,body').animate({ scrollTop: selector_top }, 'slow');
}

     function initialize() {
        var div = document.getElementById('example1');
        var editor_div = div.find(".editor");
        var diagram_div = div.find(".diagram");
        var theme_div = div.find(".theme");
        var download_link = div.find('.download');

        // Setup the editor diagram
        var editor = ace.edit(editor_div.get(0));
        editor.setTheme("ace/theme/crimson_editor");
        editor.getSession().setMode("ace/mode/asciidoc");
        editor.getSession().on('change', _.debounce(on_change, 100));

        download_link.click(function(ev) {
          var svg = diagram_div.find('svg')[0];
          var width = parseInt(svg.width.baseVal.value);
          var height = parseInt(svg.height.baseVal.value);
          var data = editor.getValue();
          var xml = '<?xml version="1.0" encoding="utf-8" standalone="no"?><!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 20010904//EN" "http://www.w3.org/TR/2001/REC-SVG-20010904/DTD/svg10.dtd"><svg xmlns="http://www.w3.org/2000/svg" width="' + width + '" height="' + height + '" xmlns:xlink="http://www.w3.org/1999/xlink"><source><![CDATA[' + data + ']]></source>' + svg.innerHTML + '</svg>';

          var a = $(this);
          a.attr("download", "diagram.svg"); // TODO I could put title here
          a.attr("href", "data:image/svg+xml," + encodeURIComponent(xml));
        });

        theme_div.change(on_change);
        on_change();

        function on_change() {
          try {
            var diagram = Diagram.parse(editor.getValue());

            editor.getSession().setAnnotations([]);

            // Clear out old diagram
            diagram_div.html('');

            var options = {
              theme: theme_div.val(),
              scale: 1
            };

            // Draw
            diagram.drawSVG(diagram_div.get(0), options);

          } catch(err) {
            var annotation = {
              type: "error", // also warning and information
              column: 0,
              row: 0,
              text: err.message
            };
            if (err instanceof Diagram.ParseError) {
              annotation.row    = err.loc.first_line - 1;
              annotation.column = err.loc.first_column;
            }
            editor.getSession().setAnnotations([annotation]);
            throw err;
          }
        }
      }
