# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

onEcoutableHover = ->
  $(@).css('cursor', 'pointer')
  $(@).find('span.glyphicon-volume-up').css('color', 'blue')

offEcoutableHover = ->
  $(@).css('cursor', 'default')
  $(@).find('.glyphicon-volume-up').css('color', 'black')

$(document).bind 'page:change', ->
  $(".ecoutable").hover(onEcoutableHover, offEcoutableHover)
  $(".ecoutable").click ->
    base_name = $(@).data().sound
    abs_path = "/audio_samples/misc/" + base_name + ".mp3"
    audio = new Audio(abs_path)
    audio.play()
    

