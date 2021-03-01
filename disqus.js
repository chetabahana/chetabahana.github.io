/**
*  RECOMMENDED CONFIGURATION VARIABLES: EDIT AND UNCOMMENT THE SECTION BELOW TO INSERT DYNAMIC VALUES FROM YOUR PLATFORM OR CMS.
*  LEARN WHY DEFINING THESE VARIABLES IS IMPORTANT: https://disqus.com/admin/universalcode/#configuration-variables*/

var disqus_config = function () {
this.page.url = 'https://chetabahana.github.io/';  // Replace PAGE_URL with your page's canonical URL variable
this.page.identifier = '123456'; // Replace PAGE_IDENTIFIER with your page's unique identifier variable
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