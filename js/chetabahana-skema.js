window.find = document.querySelector.bind(document);
//window.addEventListener('load', jsSequence, false);
//find('.input').addEventListener('input', jsRailroad, false);

var url = "https://chetabahana.github.io";
$.urlR = url + "/diagrams/railroad-diagrams.js";
$.urlS = url + "/skema/js/sequence-diagram-snap-min.js";

// js-sequence diagram
function jsSequence() {

  $.getScript($.urlS, function( data, textStatus, jqxhr ) {

  $.printed = false;

  var editor = ace.edit($(".editor").get(0));
  editor.setTheme("ace/theme/crimson_editor");
  editor.getSession().setMode("ace/mode/asciidoc");
  editor.getSession().on('change', _.debounce(on_change, 100));

  function on_change() {
    var val = $(".theme").val();

    if ($.printed) {
    
    	jsSequence(); return false;

		} else if (val != 'printed') {

			var op = $(".theme").find('option');
      if (val == 'simple') op[2].disabled = false;
      else op[2].disabled = true;

      trydrawSVG(val);

    } else {
			
      var svgobj = $(".diagram").find('svg')[0].children;

      for (i = 0; i < svgobj.length; i++) {
        element = svgobj[i];
        element.style = "cursor: pointer;";

        $(element).mouseover(function(evt) {
          $(this).hide(100).show(100)
        });

        $(element).click(function(evt) {
          jsRailroad();
        });
      }

    }
  }

  function trydrawSVG(val) {
    try {
      var diagram = Diagram.parse(editor.getValue());
       console.log(diagram);
     editor.getSession().setAnnotations([]);

      // Clear out old diagram
      $(".diagram").html('');

      var options = {
        theme: val,
        'font-size': 12,
      };

      // Draw
      diagram.drawSVG($(".diagram").get(0), options);

    } catch (err) {
      var annotation = {
        type: "error", // also warning and information
        column: 0,
        row: 0,
        text: err.message
      };
      if (err instanceof Diagram.ParseError) {
        annotation.row = err.loc.first_line - 1;
        annotation.column = err.loc.first_column;
      }
      editor.getSession().setAnnotations([annotation]);
      throw err;
    }
  }

  // setup download link
  $('.download').click(function(ev) {
    var a = $(this);
    a.attr("download", "diagram.svg"); 
    a.attr("href", "data:image/svg+xml," + encodeURIComponent(xmlData(editor.getValue())));
  });

  // call main function
  $(".theme").change(on_change);
  on_change();
  
  });  
}


//rairoad-diagrams
function jsRailroad() {

  $.getScript($.urlR, function( data, textStatus, jqxhr ) {

    var input = find('.input').value;
    try {
      var result = eval(input).format();
  		$.printed = true;
    } catch (e) {
      console.log("Invalid input.\n" + e);
      return;
    }
	find('.diagram').innerHTML = '';
	result.addTo(find('.diagram'));
  
    // setup download link
  $('.download').click(function(ev) {
    var a = $(this);
    a.attr("download", "diagram.svg"); 
    a.attr("href", "data:image/svg+xml," + encodeURIComponent(xmlData(input)));
  });

  });  
}

//xml download variable
function xmlData(data) {
  var svg = $(".diagram").find('svg')[0];
	var width = parseInt(svg.width.baseVal.value);
  var height = parseInt(svg.height.baseVal.value);
  var xml = '<?xml version="1.0" encoding="utf-8" standalone="no"?><!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 20010904//EN" "http://www.w3.org/TR/2001/REC-SVG-20010904/DTD/svg10.dtd"><svg xmlns="http://www.w3.org/2000/svg" width="' + width + '" height="' + height + '" xmlns:xlink="http://www.w3.org/1999/xlink"><source><![CDATA[' + data + ']]></source>' + svg.innerHTML + '</svg>';
  return xml;
};
