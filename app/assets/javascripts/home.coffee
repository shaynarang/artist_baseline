# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $('button.hamburger').click ->
    $(this).toggleClass('is-active')
    $('nav ul').slideToggle('medium')

  $('nav ul a').click ->
    $('button.hamburger').toggleClass('is-active')
    $('nav ul').slideToggle('medium')
