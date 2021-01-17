/* toggle between hiding and showing the dropdown content */
function Click() {
    document.getElementById("langDropdown").classList.toggle("show");
  }

window.onclick = function(event) {
    if (!event.target.matches('.dropbtn')) {
        var dropdowns = document.getElementsByClassName("dropdown-content");
        var i;
        for (i = 0; i < dropdowns.length; i++) {
            var openDropdown = dropdowns[i];
            if (openDropdown.classList.contains('show')) {
                openDropdown.classList.remove('show');
            }
        }
    }
}
//
// Add site boundary to Duck Duck Go search box
//

const submitSearch = function () {
  fields = document.querySelectorAll(".ddg input[name=q]");
  Array.prototype.slice.call(fields).map(function (obj) {
    obj.value = obj.value + " site:cuducos.me";
  });
};

//
// Run, Forrest, run!
//

var forms = document.querySelectorAll(".ddg");
Array.prototype.slice.call(forms).map(function (obj) {
  obj.addEventListener("submit", submitSearch);
});
