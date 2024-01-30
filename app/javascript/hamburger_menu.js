// ハンバーガーメニューの表示切り替え関数
function toggleMenu() {
  var menu = document.querySelector('.menu');
  var navRight = document.querySelector('.nav__right');
  menu.classList.toggle('visible');
  navRight.classList.toggle('visible');
}

// DOMContentLoaded イベントリスナ
document.addEventListener('DOMContentLoaded', function () {
  var menuTrigger = document.querySelector('.menu-trigger');
  menuTrigger.addEventListener('click', toggleMenu);
});

// turbo:load イベントリスナ
window.addEventListener("turbo:load", function () {
  var menuTrigger = document.querySelector('.menu-trigger');
  menuTrigger.addEventListener('click', toggleMenu);
});

// turbo:render イベントリスナ
window.addEventListener("turbo:render", function () {
  var menuTrigger = document.querySelector('.menu-trigger');
  menuTrigger.addEventListener('click', toggleMenu);
});