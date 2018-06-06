$(window).load(function() {draw.diagram();});
$('.theme').change(function() {draw.diagram();});
$('.download').click(function(ev) {draw.xmlData();});

var draw = {

  'jsonfeed' : 'https://chetabahana.github.io/feed.json',
  'sequence' : 'skema/js/sequence-diagram-snap-min.js',
  'flowchart': 'flowchart/flowchart-latest.js',
  'railroad' : 'diagrams/railroad-diagrams.js',

  diagram : function() {
  
    var type = (!draw.type)? 'sequence': draw.type;
    var js = 'https://chetabahana.github.io/' + this[type];
    $.getScript(js, function( data, textStatus, jqxhr ) {    
       
       // Clear old diagram
       $('.diagram').html('');
       var options = {theme: $(".theme").val(), "font-size": 12};
       var jsonfile = draw['jsonfeed'] + '?t=' + $.now();
        
       try {
       
         var diagram;
         if(type == 'sequence') {
           var editor = ace.edit($('.editor').get(0));
           editor.setTheme("ace/theme/crimson_editor");
           editor.getSession().setMode("ace/mode/asciidoc");
           editor.getSession().on('change', _.debounce(function() {draw.diagram();}, 100) );      
           
           draw.skema = editor.getValue();
           diagram = Diagram.parse(draw.skema);
           diagram.drawSVG($('.diagram').get(0), options);
           
         } else if(type == 'flowchart'){     
      
           $.getJSON(jsonfile, options).done(function(result){
              $('.editor').hide(); 
              var obj = result.items[3];
              var code = draw.encode(obj.content_html);
              diagram = flowchart.parse(code);      
              diagram.drawSVG($('.diagram').get(0), obj.options);
            });               
        
         } else if(type == 'railroad'){
         
            $.getJSON(jsonfile, options).done(function(result){
              var obj = result.items[2];
              var code = draw.encode(obj.content_html);             
              diagram = eval(code).format();
              diagram.addTo($('.diagram').get(0));
            });               
        
         }
         
       } finally {
          draw.type = type;
          draw.checkReady();
       }	
    });  
  },
  
  checkReady : function() {
    if (!$('.diagram').find('svg')[0]) {
      window.requestAnimationFrame(draw.checkReady);
    } else {
      $('svg g, svg path')
        .css('cursor','pointer')
        .hover(function() {
          $(this).hide(100).show(100);
      }).click(function() {
          draw.type = (draw.type == 'sequence')? 
            'flowchart': 'railroad';
          draw.point = $(this);
          draw.diagram();
      });    
    } 
  },
   
  encode : function(data) {  
    return data.replace(/&apos;/g, "'")
               .replace(/&quot;/g, '"')
               .replace(/&gt;/g, '>')
               .replace(/&lt;/g, '<')
               .replace(/&amp;/g, '&')
               .replace(/<p>/g, '')
               .replace(/<\/p>/g, '')
               .replace(/‘/g, "'")
               .replace(/’/g, "'")
    ;
  },               

  xmlData : function() {
    var a = $(this);
    var svg = $(".diagram").find('svg')[0];
    var width = parseInt(svg.width.baseVal.value);
    var height = parseInt(svg.height.baseVal.value);
    var xmldata = '<?xml version="1.0" encoding="utf-8" standalone="no"?><!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 20010904//EN" "http://www.w3.org/TR/2001/REC-SVG-20010904/DTD/svg10.dtd"><svg xmlns="http://www.w3.org/2000/svg" width="' + width + '" height="' + height + '" xmlns:xlink="http://www.w3.org/1999/xlink"><source><![CDATA[' + draw.skema + ']]></source>' + svg.innerHTML + '</svg>';
    a.attr("download", "diagram.svg"); 
    var xml = encodeURIComponent(xmldata);
    a.attr("href", "data:image/svg+xml," + xml);
  },  
}
