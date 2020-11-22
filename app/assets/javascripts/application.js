// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

document.addEventListener('DOMContentLoaded', () => {
  (document.querySelectorAll('.container .notification .delete') || []).forEach(($delete) => {
    let $notification = $delete.parentNode.parentNode;

    $delete.addEventListener('click', () => {
      $notification.parentNode.removeChild($notification);
    });
  });
});


function enlarge(){
  let post = document.querySelector("#input-style");
  let background = document.querySelector(".fader");
  let cardHeader = document.querySelector("#delete");
  let button = document.querySelector("#post-submit")

  if (cardHeader.style.display === 'block' && button.style.display === 'block'){
    cardHeader.style.display = 'none';
    button.style.display = 'none';
  } else {
    cardHeader.style.display = 'block';
    button.style.display = 'block';
  }

  post.classList.toggle("bigger")
  background.classList.toggle("post-feed")
}

function postEnlarge(element){
  element.classList.toggle("big-post")
}

function hideComments(elem){
  const comment = elem.getElementsByClassName("comments > div:not(.form-inputs)")[0];
  if (comment.style.display === 'none'){
    comment.style.display = 'block';
  } else {
    comment.style.display = 'none';
  }
}

document.addEventListener('DOMContentLoaded', () => {

  // Get all "navbar-burger" elements
  const $navbarBurgers = Array.prototype.slice.call(document.querySelectorAll('.navbar-burger'), 0);

  // Check if there are any navbar burgers
  if ($navbarBurgers.length > 0) {

    // Add a click event on each of them
    $navbarBurgers.forEach( el => {
      el.addEventListener('click', () => {

        // Get the target from the "data-target" attribute
        const target = el.dataset.target;
        const $target = document.getElementById(target);

        // Toggle the "is-active" class on both the "navbar-burger" and the "navbar-menu"
        el.classList.toggle('is-active');
        $target.classList.toggle('is-active');

      });
    });
  }
});