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
  return setTimeout(includeEmailLink, 3456);
};

//
// Run, Forrest, run!
//

window.addEventListener('DOMContentLoaded', includeEmailLinkTimer, false);
