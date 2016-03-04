window.App ||= {}

App.init = ->
  $("#website-menu > li").removeClass("active")
  menu_item = $('#website-menu').data('page')
  $("#" + menu_item).addClass("active")

$(document).on "page:change", ->
  App.init()
