//juicer plugin
function updateFilters() {

  var feeds = document.getElementById("feeds");
  var obj = feeds.querySelectorAll('.j-image');

  document.getElementsByClassName('juicer-feed').remove();

  for(var index in obj) {
    if (obj[index].tagName == 'A') {
      var img = obj[index].getElementsByTagName('img')[0];
      img.style.widht = "100px"; img.style.height = "100px";
      var node = document.createElement('div');
      var pdiv = node.appendChild(obj[index]);
      feeds.appendChild(pdiv);  
      //console.log(pdiv);
    }
  };
}    
