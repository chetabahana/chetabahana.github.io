window.find = document.querySelector.bind(document);
// Setup the editor diagram
function setup_editor(div) {
	
	var editor_div = div.find(".editor");
	var diagram_div = div.find(".diagram");
	var theme_div = div.find(".theme");
	var download_link = div.find('.download');
	
	//editor_div.replace(/\t/g, '');
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

	
var highlightedItems = document.querySelectorAll("g");
//alert(highlightedItems.length);
highlightedItems.forEach(function(userItem) {

		//userItem.css('cursor','pointer');
});		  
	
	
	
	function on_change() {
	  try {
		var diagram = Diagram.parse(editor.getValue());

		editor.getSession().setAnnotations([]);

		// Clear out old diagram
		diagram_div.html('');

		var options = {
		  theme: theme_div.val(),
		  'font-size': 12,
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
