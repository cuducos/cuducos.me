String.prototype.rot13 = function () {
  return this.replace(/[a-zA-Z]/g, function (c) {
    return String.fromCharCode(((c <= 'Z' ? 90 : 122) >= (c = c.charCodeAt(0) + 13) ? c : c - 26));
  });
};

var includeEmailLink = function () {
  var anchor = document.getElementById('hello');
  var href = anchor.getAttribute('href');
  return anchor.setAttribute('href', href.rot13());
};

var includeEmailLinkTimer = function () {
  return setTimeout(includeEmailLink, 7654);
};

window.addEventListener('DOMContentLoaded', includeEmailLinkTimer, false);
