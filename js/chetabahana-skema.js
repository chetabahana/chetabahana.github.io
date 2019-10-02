$(window).load(function() {draw.diagram();});
$('.theme').change(function() {draw.tChange();});
$('.download').click(function(ev) {draw.xmlData();});

var editor = ace.edit("editor");
editor.setTheme("ace/theme/crimson_editor");
editor.getSession().setMode("ace/mode/asciidoc");
editor.getSession().on('change', _.debounce(function() {draw.diagram();}, 100) );

var draw = {

    'sequence' : 'sequence/js/sequence-diagram-snap-min.js',
    'flowchart': 'flowchart/flowchart-latest.js',
    'railroad' : 'railroad/railroad-diagrams.js',
    'jsonfeed' : 'assets/feed.json',

    diagram : function() {

        var diagram;
        var select = $(".theme").val();
        
        var type = (!draw.type)? 'sequence': draw.type;
        var js = '/' + this[type] + '?t=' + $.now();
        if (select=='hand' && type!='flowchart') type='sequence';

        $('#type').text(type);
        $('#type')[0].href = '/' + type;
        $('.diagram').html(''); $("#loadingImg").show();

        $.getScript(js, function( data, textStatus, jqxhr ) {

            try {

                if(type == 'sequence') {

                    if (select == 'hand') {

                        draw.skema = editor.getValue();
                        diagram = Diagram.parse(draw.skema);

                        draw.opt = {theme: select, "font-size": 12};
                        diagram.drawSVG($('.diagram').get(0), draw.opt);

                    } else {

                        diagram = Diagram.parse(draw.skema);
                        draw.opt = {theme: select, "font-size": 13};
                        diagram.drawSVG($('.diagram').get(0), draw.opt);

                    }

                } else if(type == 'flowchart'){

                    diagram = flowchart.parse(draw.skema);
                    diagram.drawSVG($('.diagram').get(0), obj.input);

                } else if(type == 'railroad'){

                    diagram = eval(draw.skema).format();
                    diagram.addTo($('.diagram').get(0));

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

            $('.chetabahana-skema').height($('.editor').height() + 200);
            $('.editor-wrapper').height($('.editor').height() + 3);
            $('.editor').height($('.diagram').height() - 94);
            $('#loadingImg').hide();

            editor.clearSelection();
            editor.gotoLine(1, 1);

            switch(draw.type) {

                case 'sequence':

                    $('svg g.title').each(function( index ) {
                        this.id = '00';
                    });

                    $('svg g.actor').each(function( index ) {
                        this.id = '1' + (Math.floor(index/2) + 1).toString();
                    });

                    $('svg g.signal').each(function( index ) {
                        this.id = '2' + (index + 1).toString();
                    });

                    draw.elements = $('svg g.title, svg g.actor, svg g.signal');
                    draw.elements.hover(function() {
                        
                        $(this).hide(100).show(100);

                    });

                break;

                case 'flowchart':

                    $(".theme").val("simple");

                    $('svg rect.start-element').each(function() {
                        this.id = draw.point;
                    });

                    $('svg rect.flowchart, svg path.flowchart').each(function( index ) {
                        this.id = draw.pad(index + 1, 2);
                    });

                    $('svg rect.end-element').each(function() {
                        this.id = draw.point;
                    });

                    draw.elements = $('svg rect.start-element, svg rect.flowchart, svg path.flowchart, svg rect.end-element');
                    draw.elements.css({'fill-opacity':'0.1'})
                               .mouseenter(function(){$(this).css('fill','teal')})
                               .mouseout(function(){$(this).css('fill','')});

                break;

                case 'railroad':

                    $('svg rect').each(function( index ) {
                     this.id = draw.pad('0' + index, 3);
                    });

                    draw.elements = $('svg rect');
                    draw.elements.css({'fill-opacity':'0.3'})
                               .mouseenter(function(){$(this).css('fill', 'cyan')})
                               .mouseout(function(){$(this).css('fill','')});

                break;

            }

            draw.elements.css({'cursor':'pointer'})

            .each(function() {

                this.parentNode.appendChild(this);

            })

            .click(function() {

                if (draw.type != 'railroad') {

                    draw.type = (draw.type == 'sequence')? 'flowchart': 'railroad';

                } else {

                    draw.type = 'sequence';

                }

                var jsonfile = '/' + this['jsonfeed'] + '?t=' + $.now();
                jsonfile = jsonfile.replace('assets', this.id);
                $("#json").attr("href", jsonfile);
                
                $.getJSON(jsonfile).done(function(result){

                    var obj = result.items[4].items[2];
                    draw.skema = draw.encode(obj.query);
                    editor.setValue(draw.skema);

                });

            });

        } 
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

    tChange : function() {

        var regex = /[?&]([^=#]+)=([^&#]*)/g, url = window.location.href, params = {}, match;
        while(match = regex.exec(url)) {params[match[1]] = match[2];}
        draw.params = params; console.log(draw.params);

        var select = $('.theme').val();
        draw.type = (select == 'hand')? 'sequence': draw.type;
        if (draw.type != 'railroad') $('.contact_left').show();
        draw.diagram();

    },

    pad : function(data, size) {

        var s = String(data);
        while (s.length < (size || 2)) {s = "0" + s;}
        return s;

    }

}
