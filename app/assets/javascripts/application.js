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

document.addEventListener("turbolinks:load", () => {
  const textarea = document.querySelector("#user_bio")
  if(textarea){
    textarea.addEventListener("input", event => {
      const target = event.currentTarget;
      const maxLength = target.getAttribute('maxlength');
      const currentLength = target.value.length;
      let output = document.getElementById("characters");
      let charactersLeft = maxLength - currentLength;
  
      output.textContent = 'Characters left: ' + charactersLeft
      console.log(output.innerHTML)
    
      if (currentLength >= maxLength){
        return console.log('You have reached the maximum number of characters')
      };
    });
  };
});


document.addEventListener('turbolinks:load', () => {
  (document.querySelectorAll('.odin-test .notification') || []).forEach(($delete) => {
    let $notification = $delete.parentNode;

    $delete.addEventListener('click', () => {
      $notification.classList.add('hide-flash');
    });
  });
});


document.addEventListener("turbolinks:load", function (event) {
  let acc = document.getElementsByClassName("accordion");
  let panel = document.getElementsByClassName('panel');

  for (let i = 0; i < acc.length; i++) {
    acc[i].onclick = function () {
      let setClasses = !this.classList.contains('active');
      setClass(acc, 'active', 'remove');
      setClass(panel, 'show', 'remove');

      if (setClasses) {
        this.classList.toggle("active");
        this.nextElementSibling.classList.toggle("show");
      }
    }
  }

  function setClass(els, className, fnName) {
    for (let i = 0; i < els.length; i++) {
      els[i].classList[fnName](className);
    }
  }
});
  
document.addEventListener("turbolinks:load", function (event) {
  let acc2 = document.getElementsByClassName("accordion2");
  let panel2 = document.getElementsByClassName('panel2');

  for (let i = 0; i < acc2.length; i++) {
    acc2[i].onclick = function () {
      let setClasses = !this.classList.contains('active');
      setClass(acc2, 'active', 'remove');
      setClass(panel2, 'show', 'remove');

      if (setClasses) {
        this.classList.toggle("active");
        this.parentNode.nextElementSibling.classList.toggle("show");
        console.log(this.parentNode.nextElementSibling)
      }
    }
  }

  function setClass(els, className, fnName) {
    for (let i = 0; i < els.length; i++) {
      els[i].classList[fnName](className);
    }
  }

});

document.addEventListener("turbolinks:load", function (event) {
  let acc2 = document.getElementsByClassName("accordion6");
  let panel2 = document.getElementsByClassName('panel6');

  for (let i = 0; i < acc2.length; i++) {
    acc2[i].onclick = function () {
      let setClasses = !this.classList.contains('active');
      setClass(acc2, 'active', 'remove');
      setClass(panel2, 'show', 'remove');

      if (setClasses) {
        this.classList.toggle("active");
        this.parentNode.parentNode.nextElementSibling.classList.toggle("show");
      }
    }
  }

  function setClass(els, className, fnName) {
    for (let i = 0; i < els.length; i++) {
      els[i].classList[fnName](className);
    }
  }

});

document.addEventListener("turbolinks:load", function (event) {
  let acc2 = document.getElementsByClassName("accordion7");
  let panel2 = document.getElementsByClassName('panel7');

  for (let i = 0; i < acc2.length; i++) {
    acc2[i].onclick = function () {
      let setClasses = !this.classList.contains('active');
      setClass(acc2, 'active', 'remove');
      setClass(panel2, 'show', 'remove');

      if (setClasses) {
        this.classList.toggle("active");
        this.parentNode.parentNode.parentNode.nextElementSibling.classList.toggle("show");
      }
    }
  }

  function setClass(els, className, fnName) {
    for (let i = 0; i < els.length; i++) {
      els[i].classList[fnName](className);
    }
  }

});

document.addEventListener("turbolinks:load", function (event) {
  let acc = document.getElementsByClassName("accordion4");
  let panel = document.getElementsByClassName('panel4');

  for (let i = 0; i < acc.length; i++) {
    acc[i].onclick = function () {
      let setClasses = !this.classList.contains('active');
      setClass(acc, 'active', 'remove');
      setClass(panel, 'show', 'remove');

      if (setClasses) {
        this.classList.toggle("active");
        this.nextElementSibling.classList.toggle("show");
        console.log(this.nextElementSibling)
      }
    }
  }

  function setClass(els, className, fnName) {
    for (let i = 0; i < els.length; i++) {
      els[i].classList[fnName](className);
    }
  }

});

document.addEventListener("turbolinks:load", function (event) {
  let acc = document.getElementsByClassName("accordion5");
  let panel = document.getElementsByClassName('panel5');

  for (let i = 0; i < acc.length; i++) {
    acc[i].onclick = function () {
      let setClasses = !this.classList.contains('active');
      setClass(acc, 'active', 'remove');
      setClass(panel, 'show', 'remove');

      if (setClasses) {
        this.classList.toggle("active");
        this.parentNode.parentNode.nextElementSibling.nextElementSibling.classList.toggle("show");
        // console.log(this.parentNode.parentNode.children)
      }
    }
  }

  function setClass(els, className, fnName) {
    for (let i = 0; i < els.length; i++) {
      els[i].classList[fnName](className);
    }
  }

});


document.addEventListener("turbolinks:load", function (event) {
  let acc = document.getElementsByClassName("accordion1");
  let panel = document.getElementsByClassName('panel1');

  for (let i = 0; i < acc.length; i++) {
    acc[i].onclick = function () {
      let setClasses = !this.classList.contains('active');
      setClass(acc, 'active', 'remove');
      setClass(panel, 'show', 'remove');

      if (setClasses) {
        this.classList.toggle("active");
        this.parentNode.nextElementSibling.classList.toggle("show");
        console.log(this.parentNode.nextElementSibling)
      }
    }
  }

  function setClass(els, className, fnName) {
    for (let i = 0; i < els.length; i++) {
      els[i].classList[fnName](className);
    }
  }

});

document.addEventListener("turbolinks:load", function (event) {
  let acc = document.getElementsByClassName("accordion3");
  let panel = document.getElementsByClassName('panel3');

  for (let i = 0; i < acc.length; i++) {
    acc[i].onclick = function () {
      let setClasses = !this.classList.contains('active');
      setClass(acc, 'active', 'remove');
      setClass(panel, 'show', 'remove');

      if (setClasses) {
        this.classList.toggle("active");
        this.parentNode.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.classList.toggle("show");
      }
    }
  }

  function setClass(els, className, fnName) {
    for (let i = 0; i < els.length; i++) {
      els[i].classList[fnName](className);
    }
  }

});

document.addEventListener('turbolinks:load', () => {

  // Get all "navbar-burger" elements
  const $navbarBurgers = Array.prototype.slice.call(document.querySelectorAll('.navbar-burger'), 0);

  // Check if there are any navbar burgers
  console.log($navbarBurgers)
  if ($navbarBurgers.length > 0) {

    // Add a click event on each of them
    $navbarBurgers.forEach( el => {
      el.addEventListener('click', () => {

        // Get the target from the "data-target" attribute
        const target = el.dataset.target;
        const $target = document.getElementById(target);

        // Toggle the "is-active" class on both the "navbar-burger" and the "navbar-menu"
        el.classList.toggle('.is-active');
        $target.classList.toggle('.is-active');

      });
    });
  }
});

document.addEventListener('turbolinks:load', ()=>{
  console.log(document.querySelector("#mySidebar")) 
  document.querySelector('.openbtn').addEventListener('click', ()=>{
    document.getElementById("mySidebar").classList.add('reveal')
  })
  document.querySelector('.closebtn').addEventListener('click', ()=>{
    document.getElementById("mySidebar").classList.remove('reveal')
  })
})

document.addEventListener('turbolinks:load', ()=>{
  let cutText = document.querySelector('.cut-text')
  if (cutText.innerHTML.includes('&gt;') && screen.width < 1081){
    cutText.innerHTML = 'Roundtable'
  }
})

document.addEventListener('turbolinks:load', ()=>{
  let mover = document.querySelector('#group-description')
  if (screen.width < 1081){
    mover.style.marginLeft = '10px'
    document.querySelector('#move-beneath').insertAdjacentElement('beforebegin', mover)
  }
})

document.addEventListener('turbolinks:load', ()=>{
  let guestButton = document.querySelector('#guest-button')
  let inputForms = document.querySelectorAll('#user_email, #user_password')
  if (guestButton){
    guestButton.addEventListener('click', (e)=>{
      inputForms[0].value = 'guest@guest.com'
      inputForms[1].value = 'password'
    })    
  }
})

document.addEventListener('ajax:success', ()=>{
  let acc = document.getElementsByClassName("accordion");
  let panel = document.getElementsByClassName('panel');

  for (let i = 0; i < acc.length; i++) {
    acc[i].onclick = function () {
      let setClasses = !this.classList.contains('active');
      setClass(acc, 'active', 'remove');
      setClass(panel, 'show', 'remove');

      if (setClasses) {
        this.classList.toggle("active");
        this.nextElementSibling.classList.toggle("show");
      }
    }
  }

  let acc2 = document.getElementsByClassName("accordion2");
  let panel2 = document.getElementsByClassName('panel2');

  for (let i = 0; i < acc2.length; i++) {
    acc2[i].onclick = function () {
      let setClasses = !this.classList.contains('active');
      setClass(acc2, 'active', 'remove');
      setClass(panel2, 'show', 'remove');

      if (setClasses) {
        this.classList.toggle("active");
        this.parentNode.nextElementSibling.classList.toggle("show");
        console.log(this.parentNode.nextElementSibling)
      }
    }
  }


  function setClass(els, className, fnName) {
    for (let i = 0; i < els.length; i++) {
      els[i].classList[fnName](className);
    }
  }
})



document.addEventListener('turbolinks:load', ()=>{
  let submitter = document.querySelector('#submit-button')
  let input = document.querySelector('#input-style')
  submitter.addEventListener('click', ()=>{
    setTimeout(() => {
    input.value = ''
    }, 50);
  })
})

document.addEventListener('ajax:success', ()=>{
  (document.querySelectorAll('.odin-test .notification') || []).forEach(($delete) => {
    let $notification = $delete.parentNode;

    $delete.addEventListener('click', () => {
      $notification.classList.add('hide-flash');
    });
  });
})

document.addEventListener('ajax:success', ()=>{
  let allFlash = document.querySelectorAll('.odin-test')
  window.elements = allFlash
  allFlash.forEach(element => {
    if (allFlash.length > 1){
      allFlash[1].remove()
    }
  });
})
