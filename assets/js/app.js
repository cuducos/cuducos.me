//
// Add site boundary to Duck Duck Go search box
//

var submitSearch = function () {
  fields = document.querySelectorAll('.ddg input[name=q]');
  Array.prototype.slice.call(fields).map(function (obj) {
    obj.value = obj.value + ' site:cuducos.me';
  });
};

//
// Run, Forrest, run!
//

var forms = document.querySelectorAll('.ddg');
Array.prototype.slice.call(forms).map(function (obj) {
  obj.addEventListener('submit', submitSearch);
});
