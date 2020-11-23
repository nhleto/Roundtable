"use strict";

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
//= require bulma-extensions
// import bulmaCollapsible from '@creativebulma/dist/js/bulma-collapsible.min.js';
document.addEventListener('DOMContentLoaded', function () {
  (document.querySelectorAll('.container .notification .delete') || []).forEach(function ($delete) {
    var $notification = $delete.parentNode.parentNode;
    $delete.addEventListener('click', function () {
      $notification.parentNode.removeChild($notification);
    });
  });
});

function enlarge() {
  var post = document.querySelector("#input-style");
  var background = document.querySelector(".fader");
  var cardHeader = document.querySelector("#delete");
  var button = document.querySelector("#post-submit");

  if (cardHeader.style.display === 'block' && button.style.display === 'block') {
    cardHeader.style.display = 'none';
    button.style.display = 'none';
  } else {
    cardHeader.style.display = 'block';
    button.style.display = 'block';
  }

  post.classList.toggle("bigger");
  background.classList.toggle("post-feed");
}

function postEnlarge(element) {
  element.classList.toggle("big-post");
} // To bounce off of that, you could turn main element EventListener off,
// and turn on another one on the subelement you use to collapse it. 
// (inside the function up there) And on the function attached to the EventListener on the subelement, 
// the eventListener for the main element gets turned back on


function hideComments(elem) {
  var comment = elem.getElementsByClassName("comments")[0];

  if (comment.style.display === 'none') {
    comment.style.display = 'block';
  } else {
    comment.style.display = 'none';
  }
}

function hideOptions() {
  var options = document.querySelector(".fa fa-ellipsis-h");
  options.addEventListener;
}

document.addEventListener('DOMContentLoaded', function () {
  // Get all "navbar-burger" elements
  var $navbarBurgers = Array.prototype.slice.call(document.querySelectorAll('.navbar-burger'), 0); // Check if there are any navbar burgers

  if ($navbarBurgers.length > 0) {
    // Add a click event on each of them
    $navbarBurgers.forEach(function (el) {
      el.addEventListener('click', function () {
        // Get the target from the "data-target" attribute
        var target = el.dataset.target;
        var $target = document.getElementById(target); // Toggle the "is-active" class on both the "navbar-burger" and the "navbar-menu"

        el.classList.toggle('is-active');
        $target.classList.toggle('is-active');
      });
    });
  }
});