# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file.
#
# Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
# about supported directives.
#
#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require_tree .

$(document).on 'page:fetch', ->
  $('#page_loading').modal("show")
  return
$(document).on 'page:change', ->
  $('#page_loading').modal("hide")
  return

$(document).ready ->
  setInterval (->
    $(".main-time-portion").load "/time_portion"
    return
  ), 1000
  setInterval (->
    $("#users").load "/users"
    return
  ), 10000
  $(document.body).on 'mouseover', ".caption", (e) ->
    $(this).css({ opacity: 1 })
    return
  $(document.body).on("touchstart", ".caption", (e) ->
    $(this).css opacity: 1
    return
  )
  $(document.body).on 'mouseout', ".caption", (e) ->
    $(this).css({ opacity: 0 })
    return
  return
