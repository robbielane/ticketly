// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require autocomplete-rails
//= require materialize-sprockets
//= require underscore
//= require gmaps/google
//= require_tree .


$(document).ready(function() {
  $('.clickable').click(function() {
    window.document.location = $(this).data('link');
  });

  handler = Gmaps.build('Google');
  handler.buildMap({ internal: {id: 'map'}, zoom: 8}, function(){
    markers = handler.addMarkers([
      {
        "lat": 39.770863,
        "lng": -105
      }
    ]).setZoom(8);
    handler.bounds.extendWith(markers);
    handler.fitMapToBounds();
  });
});
