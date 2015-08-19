# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'click', "a[data-target=#defaultModal]", (ev) ->
    ev.preventDefault
    target = $(this).attr("href")

    $("#defaultModal .modal-content").load target, ->
         $("#defaultModal").modal("show")
