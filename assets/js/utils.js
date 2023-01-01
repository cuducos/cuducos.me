// Toggle between hiding and showing the dropdown content
const i18nButton = function (obj) {
  if (obj === null) {
    return;
  }
  obj.addEventListener("click", function () {
    document.querySelector("#i18n-menu").classList.toggle("show");
  });

  window.addEventListener("click", function (btn) {
    if (!btn.target.matches(".dropbtn")) {
      const menus = document.querySelectorAll(".dropdown-content");
      Array.prototype.slice.call(menus).map(function (menu) {
        if (menu.classList.contains("show")) {
          menu.classList.remove("show");
        }
      });
    }
  });
};

const i18n = document.querySelector("button.dropbtn");
i18nButton(i18n);

// Add site boundary to Duck Duck Go search box
const submitSearch = function () {
  const fields = document.querySelectorAll(".ddg input[name=q]");
  Array.prototype.slice.call(fields).map(function (obj) {
    obj.value = obj.value + " site:cuducos.me";
  });
};

// Run, Forrest, run!
var forms = document.querySelectorAll(".ddg");
Array.prototype.slice.call(forms).map(function (obj) {
  obj.addEventListener("submit", submitSearch);
});
