# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
  # for google map
  center_latlng = new google.maps.LatLng(35.6878802, 139.757344)
  latlng = new google.maps.LatLng(35.607002, 139.749107)
  myOptions =
    zoom: 11
    center: center_latlng
    mapTypeId: google.maps.MapTypeId.ROADMAP
  map = new google.maps.Map(document.getElementById("map_canvas"), myOptions)

  marker = new google.maps.Marker(
    position: latlng
    title: "AIIT"
  )
  marker.setMap map
