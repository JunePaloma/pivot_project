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
//= require jquery
//= materialize-sprockets
//= require rails-ujs
//= require_tree .

/* When the user clicks on the button,
toggle between hiding and showing the dropdown content */

function openDropdown() {
    document.getElementById("UserMenu").classList.toggle("show");
}

// Close the dropdown menu if the user clicks outside of it
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

// Get the modal
var modal = document.getElementById('id01');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}

$.ajax({
  type: 'GET',
  url: 'https://localhost:3000/api/v1/merchants',
  headers: {'Authorization': 'Token token='},
  }).done(function(data) {
    console.log(data);
    data.forEach(function(store) {
      console.log(store);
      $('#jq_ajax').append(
      `<p>${store['name']}</p>
      <p>${store['description']}</p>`
  )})});
