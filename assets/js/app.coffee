---
---
String::rot13 = ->
    this.replace /[a-zA-Z]/g, (c) ->
        String.fromCharCode (if ((if c <= "Z" then 90 else 122)) >= (c = c.charCodeAt(0) + 13) then c else c - 26)

include_email_link = ->
  a_tag = document.getElementById 'hello'
  fixed = a_tag.getAttribute 'href'
  a_tag.setAttribute 'href', fixed.rot13()

include_email_link_timer = ->
  setTimeout include_email_link, 7654

window.addEventListener 'DOMContentLoaded', include_email_link_timer, false
