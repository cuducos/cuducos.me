//
// Google Analytics: track clicks to external links
//

// Google Analytics: function to send info about external links
var trackOutboundLink = function (e) {
  var anchor = getAnchor(e.target);
  var url = anchor.href;

  if (typeof ga === 'function') {
    ga('send', 'event', 'outbound', 'click', url, {
      transport: 'beacon',
      hitCallback: function () {
        document.location = url;
      },
    });
    return false;
  }

  document.location = url;
  return true;
};

// Google Analytics: track all external links
var attachTrackOutboundLink  = function () {
  var hostname = new RegExp(location.hostname);
  var links = document.getElementsByTagName('a');
  Array.prototype.slice.call(links, 0).map(function (link) {
    if (!hostname.test(link.hostname)) link.onclick = trackOutboundLink;
  });
};

// Get <a /> if event/click is in a child (used by Google Analytics events)
var getAnchor = function (element) {
  if (element.nodeName === 'A') return element;
  return getAnchor(element.parentElement);
};

//
// Add images' `alt` as figcaption
//

var addFigCaption = function () {
  var images = document.querySelectorAll('img.media');
  Array.prototype.slice.call(images, 0).map(function (img) {

    // create figure and figcaption
    var figure = document.createElement('figure');
    var caption = document.createElement('figcaption');
    caption.innerHTML = img.getAttribute('alt');

    // reorganize the DOM
    figure.appendChild(caption);
    img.parentNode.appendChild(figure);
    figure.insertBefore(img.parentNode.removeChild(img), caption);

  });

};

//
// Decode email link after a few seconds
//

// Add rot13 as a String method
String.prototype.rot13 = function () {
  return this.replace(/[a-zA-Z]/g, function (c) {
    return String.fromCharCode(((c <= 'Z' ? 90 : 122) >= (c = c.charCodeAt(0) + 13) ? c : c - 26));
  });
};

// Decode email link
var includeEmailLink = function () {
  var anchor = document.getElementById('hello');
  var href = anchor.getAttribute('href');
  return anchor.setAttribute('href', href.rot13());
};

// Timer to call includeEmailLink
var includeEmailLinkTimer = function () {
  return setTimeout(includeEmailLink, 7654);
};

//
// Run, Forrest, run!
//

// Everthing that has to be run when DOM is loaded
var init = function () {
  addFigCaption();
  includeEmailLinkTimer();
  attachTrackOutboundLink();
};

window.addEventListener('DOMContentLoaded', init, false);
